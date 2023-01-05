import 'package:bank_sha/models/latest_transaction_model.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class LatestTracItem extends StatelessWidget {
  final LatestTransactionModel data;

  final Map<String, String> icons = {
    'top_up': 'assets/ic_trac_topup.png',
    'internet': 'assets/ic_trac_topup.png',
    'cashback': 'assets/ic_trac_cashback.png',
    'withdraw': 'assets/ic_trac_withdraw.png',
    'transfer': 'assets/ic_trac_transfer.png',
    'electric': 'assets/ic_trac_electric.png',
  };
  final Map<String, String> symbol = {
    'cr': '+',
    'dr': '-',
  };
  LatestTracItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            icons[data.transactionTypeModel!.code].toString(),
            width: 48,
          ),
          AppUtils.spaceH(16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.transactionTypeModel!.name.toString(),
                  style: AppTextStyle.blackPoppins(16, FontWeight.w500),
                ),
                Text(
                  data.createdAt!.toString().split(' ')[0],
                  style: AppTextStyle.greyPoppins(12, FontWeight.normal),
                )
              ],
            ),
          ),
          Text(
            '${symbol[data.transactionTypeModel!.action]} ${AppUtils.formatCurrency(data.amount!, symbol: '')}',
            style: AppTextStyle.blackPoppins(16, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
