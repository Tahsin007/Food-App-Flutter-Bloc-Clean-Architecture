import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/restaurent_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class RestaurentSection extends StatefulWidget {
  const RestaurentSection({super.key});

  @override
  State<RestaurentSection> createState() => _RestaurentSectionState();
}

class _RestaurentSectionState extends State<RestaurentSection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchRestaurents(offset: 1, limit: 10));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom && !context.read<HomeBloc>().state.isLoadingRestaurents) {
      final state = context.read<HomeBloc>().state;
      if (state.restaurents != null) {
        context.read<HomeBloc>().add(
          FetchRestaurents(
            offset: state.restaurents!.length ~/ 10 + 1,
            limit: 10,
          ),
        );
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingRestaurents) {
          return Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state.restaurents == null) {
          return Center(child: Text("No restaurants available"));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: 'Restaurants'),
            SizedBox(
              height: 400,
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: state.restaurents == null
                    ? 0
                    : state.hasReachedMax
                    ? state.restaurents!.length
                    : state.restaurents!.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.restaurents!.length) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return RestaurantCard(restaurant: state.restaurents![index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
