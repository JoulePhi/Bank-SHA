import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/pin_button.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  TextEditingController pinC = TextEditingController();

  addValue(String val) {
    if (pinC.text.length < 6) {
      setState(() {
        pinC.text += val;
      });
    } else {
      pinC.text = pinC.text;
    }

    if (pinC.text == '123456') {
      Navigator.pop(context, true);
    }
  }

  deleteVal() {
    if (pinC.text.isNotEmpty) {
      setState(() {
        pinC.text = pinC.text.substring(0, pinC.text.length - 1);
      });
    } else {
      pinC.text = pinC.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sha PIN',
              style: AppTextStyle.whitePoppins(20, FontWeight.w600),
            ),
            AppUtils.spaceV(50),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: pinC,
                obscureText: true,
                obscuringCharacter: '*',
                enabled: false,
                style: AppTextStyle.whitePoppins(36, FontWeight.w500).copyWith(
                  letterSpacing: 15,
                ),
                decoration: InputDecoration(
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
            )
          ],
        ),
      ),
    );
  }
}
