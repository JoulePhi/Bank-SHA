import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/pin_button.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class TransferAmount extends StatefulWidget {
  const TransferAmount({super.key});

  @override
  State<TransferAmount> createState() => _TransferAmountState();
}

class _TransferAmountState extends State<TransferAmount> {
  TextEditingController numC = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    numC.addListener(() {
      final text = numC.text;
      numC.value = numC.value.copyWith(
        text: NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addValue(String val) {
    if (numC.text == '0') {
      numC.text = '';
    }
    setState(() {
      numC.text += val;
    });
  }

  deleteVal() {
    if (numC.text.isNotEmpty) {
      setState(() {
        numC.text = numC.text.substring(0, numC.text.length - 1);
      });
    } else {
      numC.text = '0';
    }

    if (numC.text == '') {
      numC.text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBgColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppUtils.spaceV(50),
              Center(
                child: Text(
                  'Total Amount',
                  style: AppTextStyle.whitePoppins(20, FontWeight.w600),
                ),
              ),
              AppUtils.spaceV(50),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: numC,
                  enabled: false,
                  style: AppTextStyle.whitePoppins(36, FontWeight.w500),
                  decoration: InputDecoration(
                    prefixIcon: Text(
                      'Rp ',
                      style: AppTextStyle.whitePoppins(36, FontWeight.w500),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyColor),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkGreyColor),
                    ),
                  ),
                ),
              ),
              AppUtils.spaceV(86),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    PinButton(
                        title: '1',
                        onTap: () {
                          addValue('1');
                        }),
                    PinButton(
                        title: '2',
                        onTap: () {
                          addValue('2');
                        }),
                    PinButton(
                        title: '3',
                        onTap: () {
                          addValue('3');
                        }),
                    PinButton(
                        title: '4',
                        onTap: () {
                          addValue('4');
                        }),
                    PinButton(
                        title: '5',
                        onTap: () {
                          addValue('5');
                        }),
                    PinButton(
                        title: '6',
                        onTap: () {
                          addValue('6');
                        }),
                    PinButton(
                        title: '7',
                        onTap: () {
                          addValue('7');
                        }),
                    PinButton(
                        title: '8',
                        onTap: () {
                          addValue('8');
                        }),
                    PinButton(
                        title: '9',
                        onTap: () {
                          addValue('9');
                        }),
                    const SizedBox(
                      width: 60,
                      height: 60,
                    ),
                    PinButton(
                        title: '0',
                        onTap: () {
                          addValue('0');
                        }),
                    PinButton(
                        title: 'delete',
                        onTap: () {
                          deleteVal();
                        }),
                  ],
                ),
              ),
              AppUtils.spaceV(50),
              FilledButton(
                title: "Continue",
                width: 260,
                onPressed: () async {
                  if (await Navigator.pushNamed(context, PagesName.pinPage) ==
                      true) {
                    Navigator.pushNamedAndRemoveUntil(context,
                        PagesName.transferSuccessPage, (route) => false);
                  }
                },
              ),
              AppUtils.spaceV(25),
              PlainButton(
                title: 'Terms & Conditions',
                onPressed: () {},
              ),
              AppUtils.spaceV(50),
            ],
          ),
        ),
      ),
    );
  }
}
