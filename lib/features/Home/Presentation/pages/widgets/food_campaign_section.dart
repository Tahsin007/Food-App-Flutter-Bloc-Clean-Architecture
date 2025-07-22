import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/campaign_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class FoodCampaignSection extends StatefulWidget {
  const FoodCampaignSection({super.key});

  @override
  State<FoodCampaignSection> createState() => _FoodCampaignSectionState();
}

class _FoodCampaignSectionState extends State<FoodCampaignSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchFoodCampaigns());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingFoodCampaigns) {
          return Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state.foodCampaigns != null &&
            state.foodCampaigns!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: 'Food Campaigns'),
              SizedBox(
                height: 130,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.foodCampaigns!.length,
                  itemBuilder: (context, index) {
                    final campaign = state.foodCampaigns![index];
                    return CampaignCard(campaign: campaign);
                  },
                ),
              ),
            ],
          );
        }
        return Center(child: Text("No Campaigns Available"));
      },
    );
  }
}
