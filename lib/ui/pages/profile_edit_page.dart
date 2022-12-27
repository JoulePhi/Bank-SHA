import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Edit Photo', context),
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
                  title: 'Username',
                  controller: TextEditingController.fromValue(
                    const TextEditingValue(text: 'Shaynahan'),
                  ),
                ),
                AppUtils.spaceV(16),
                AppFormField(
                  title: 'Full name',
                  controller: TextEditingController.fromValue(
                    const TextEditingValue(text: 'Shayna Hanna'),
                  ),
                ),
                AppUtils.spaceV(16),
                AppFormField(
                  title: 'Email Address',
                  controller: TextEditingController.fromValue(
                    const TextEditingValue(text: 'anggarisky@google.com'),
                  ),
                ),
                AppUtils.spaceV(16),
                AppFormField(
                  title: 'Password',
                  obscured: true,
                  controller: TextEditingController.fromValue(
                    const TextEditingValue(text: 'Shaynahan'),
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
