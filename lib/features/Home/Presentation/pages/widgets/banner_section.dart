import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_state.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  void initState() {
    super.initState();
    context.read<BannerBloc>().add(FetchBanners());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BannerLoaded) {
          return SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: state.banners.length,
              itemBuilder: (context, index) {
                final banner = state.banners[index];
                return Image.network(
                  banner.image,
                  fit: BoxFit.cover,
                );
              },
            ),
          );
        } else if (state is BannerError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}