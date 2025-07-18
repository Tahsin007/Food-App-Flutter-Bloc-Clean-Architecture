import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_state.dart';

class MenuBannerSection extends StatefulWidget {
  final bool autoPlay;
  final Duration autoPlayDuration;

  const MenuBannerSection({
    Key? key,
    this.autoPlay = true,
    this.autoPlayDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  _MenuBannerSectionState createState() => _MenuBannerSectionState();
}

class _MenuBannerSectionState extends State<MenuBannerSection> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    context.read<BannerBloc>().add(FetchBanners());
    _pageController = PageController();

    // Autoplay will be started after banners are loaded in BlocBuilder
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay(List<dynamic> banners) {
    _autoPlayTimer = Timer.periodic(widget.autoPlayDuration, (timer) {
      if (_currentIndex < banners.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
  }

  void _resumeAutoPlay(List<dynamic> banners) {
    if (widget.autoPlay) {
      _startAutoPlay(banners);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BannerError) {
          return Center(child: Text(state.message));
        }
        if (state is BannerLoaded) {
          if (widget.autoPlay &&
              state.banners.isNotEmpty &&
              _autoPlayTimer == null) {
            _startAutoPlay(state.banners);
          }
          return Column(
            children: [
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onPanStart: (_) => _stopAutoPlay(),
                  onPanEnd: (_) => _resumeAutoPlay(state.banners),
                  child: Container(
                    height: 150,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: state.banners.length,
                      itemBuilder: (context, index) {
                        final banner = state.banners[index];
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppPallete.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Background Image
                                banner.image.isNotEmpty
                                    ? Image.network(
                                        banner.image,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                color: AppPallete.lightGray,
                                                child: Icon(
                                                  Icons.image_not_supported,
                                                  size: 50,
                                                  color: AppPallete.darkGray,
                                                ),
                                              );
                                            },
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Container(
                                            color: Colors.grey[300],
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Container(
                                        color: AppPallete.lightGray,
                                        child: Icon(
                                          Icons.image,
                                          size: 50,
                                          color: AppPallete.darkGray,
                                        ),
                                      ),

                                // Gradient Overlay
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppPallete.black.withValues(alpha: 0.3),
                                        Colors.transparent,
                                        AppPallete.black.withValues(alpha: 0.3),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Page Indicator
              if (state.banners.length > 1)
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      state.banners.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppPallete.primaryColor
                              : Colors.grey.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
