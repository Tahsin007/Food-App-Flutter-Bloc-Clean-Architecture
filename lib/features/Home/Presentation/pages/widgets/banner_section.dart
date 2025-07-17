import 'dart:async';

import 'package:flutter/material.dart';

class MenuBannerSection extends StatefulWidget {
  final List<BannerItem> banners;
  final bool autoPlay;
  final Duration autoPlayDuration;

  const MenuBannerSection({
    Key? key,
    required this.banners,
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
    _pageController = PageController();
    
    if (widget.autoPlay && widget.banners.isNotEmpty) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayDuration, (timer) {
      if (_currentIndex < widget.banners.length - 1) {
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

  void _resumeAutoPlay() {
    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        Container(
          height: 160,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onPanStart: (_) => _stopAutoPlay(),
            onPanEnd: (_) => _resumeAutoPlay(),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.banners.length,
              itemBuilder: (context, index) {
                final banner = widget.banners[index];
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
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
                        banner.imageUrl.isNotEmpty
                            ? Image.network(
                                banner.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey[600],
                                    ),
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey[600],
                                ),
                              ),
                        
                        // Gradient Overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        
                        // Content Overlay
                        if (banner.title.isNotEmpty || banner.subtitle.isNotEmpty)
                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (banner.title.isNotEmpty)
                                  Text(
                                    banner.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.5),
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                if (banner.subtitle.isNotEmpty)
                                  SizedBox(height: 4),
                                if (banner.subtitle.isNotEmpty)
                                  Text(
                                    banner.subtitle,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.5),
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
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
        
        // Page Indicator
        if (widget.banners.length > 1)
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.banners.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.green
                        : Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// Data Models
class BannerItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? actionUrl;

  BannerItem({
    required this.imageUrl,
    this.title = '',
    this.subtitle = '',
    this.actionUrl,
  });
}