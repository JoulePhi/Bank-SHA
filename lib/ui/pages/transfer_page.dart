import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_page_sections.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController searchC = TextEditingController();
  Widget section = const RecentUserSection();
  @override
  void initState() {
    super.initState();
    searchC.addListener(() {
      if (searchC.text.isNotEmpty) {
        setState(() {
          section = const ResultSection();
        });
      } else {
        setState(() {
          section = const RecentUserSection();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Transfer', context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          AppUtils.spaceV(30),
          Text(
            'Search',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          AppFormField(
            title: 'by username',
            controller: searchC,
            isTitled: false,
          ),
          AppUtils.spaceV(40),
          section,
        ],
      ),
    );
  }
}
