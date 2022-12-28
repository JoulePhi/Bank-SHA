import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

class PackageSelect extends StatelessWidget {
  const PackageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Paket Data', context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          AppUtils.spaceV(30),
          Text(
            'Phone Number',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          AppFormField(
            title: '+628',
            controller: TextEditingController(),
            isTitled: false,
          ),
          AppUtils.spaceV(40),
          Text(
            'Select Package',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              PackageItem(package: '10GB', price: 218000),
              PackageItem(package: '25GB', price: 420000),
              PackageItem(
                package: '40GB',
                price: 2500000,
                isSelected: true,
              ),
              PackageItem(package: '99GB', price: 5000000),
            ],
          ),
          AppUtils.spaceV(50),
          FilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, PagesName.pinPage) ==
                  true) {
                Navigator.pushNamed(context, PagesName.providerSuccessPage);
              }
            },
          ),
          AppUtils.spaceV(50),
        ],
      ),
    );
  }
}
