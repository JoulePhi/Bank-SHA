import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/ui/widgets/home_page_sections.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      bottomNavigationBar: const BnB(),
      floatingActionButton: const FaB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        children: const [
          ProfileSection(),
          CardSection(),
          LevelSection(),
          MenuItemSection(),
          LatestTransactionSection(),
          SendAgainSection(),
          FirendlyTipsSection(),
        ],
      ),
    );
  }
}
