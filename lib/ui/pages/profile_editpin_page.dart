import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class EditPinPage extends StatelessWidget {
  const EditPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Edit Pin', context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                AppFormField(
                  title: 'Old Pin',
                  controller: TextEditingController.fromValue(
                    const TextEditingValue(text: '123456'),
                  ),
                ),
                AppUtils.spaceV(16),
                AppFormField(
                  title: 'New Pin',
                  controller: TextEditingController.fromValue(
                    const TextEditingValue(text: '123444'),
                  ),
                ),
                AppUtils.spaceV(30),
                FilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamed(context, PagesName.editSuccessPage);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
