import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ProviderSelect extends StatelessWidget {
  const ProviderSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.myAppBar('Beli Data', context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          AppUtils.spaceV(30),
          Text(
            'From Wallet',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(10),
          Row(
            children: [
              Image.asset(
                'assets/mini_wallet.png',
                height: 55,
              ),
              AppUtils.spaceH(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: AppTextStyle.blackPoppins(16, FontWeight.w500),
                  ),
                  AppUtils.spaceV(2),
                  Text(
                    'Balance: Rp ${AppUtils.formatCurrency(180000000)}',
                    style: AppTextStyle.greyPoppins(12, FontWeight.normal),
                  )
                ],
              )
            ],
          ),
          AppUtils.spaceV(40),
          Text(
            'Select Provider',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          // const BankItem(
          //   name: 'Telkomsel',
          //   logoUrl: 'assets/img_telkomsel.png',
          //   isSelected: true,
          // ),
          // const BankItem(
          //   name: 'Indosat Ooredoo',
          //   logoUrl: 'assets/img_indosat.png',
          // ),
          // const BankItem(
          //   name: 'Singtel ID',
          //   logoUrl: 'assets/img_singtel.png',
          // ),
          AppUtils.spaceV(50),
          FilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, PagesName.packagePage);
            },
          ),
          AppUtils.spaceV(100),
        ],
      ),
    );
  }
}
