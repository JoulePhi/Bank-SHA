import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/signup_model.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/pages/signup_ktp_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupProfilePage extends StatefulWidget {
  final SignUpModel? data;

  const SignupProfilePage({super.key, this.data});

  @override
  State<SignupProfilePage> createState() => _SignupProfilePageState();
}

class _SignupProfilePageState extends State<SignupProfilePage> {
  TextEditingController pinC = TextEditingController();
  XFile? selectedImage;

  bool validate() {
    if (pinC.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sha_logo_light.png'))),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: AppTextStyle.blackPoppins(20, FontWeight.w600),
          ),
          AppUtils.spaceV(20),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await AppUtils.pickImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBgColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                File(selectedImage!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: selectedImage == null
                        ? Center(
                            child: Image.asset(
                              'assets/icon_upload.png',
                              width: 32,
                            ),
                          )
                        : null,
                  ),
                ),
                AppUtils.spaceV(16),
                Text(
                  widget.data!.toJson()['name'],
                  style: AppTextStyle.blackPoppins(18, FontWeight.w500),
                ),
                AppUtils.spaceV(30),
                AppFormField(
                  title: 'Set PIN (6 digit number)',
                  controller: pinC,
                  obscured: true,
                  type: TextInputType.number,
                ),
                AppUtils.spaceV(30),
                MyFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupKtpPage(
                            data: widget.data!.copyWith(
                              pin: pinC.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}',
                            ),
                          ),
                        ),
                      );
                    } else {
                      AppUtils.showAppSnackbar(context, 'Pin Harus 6 Digit');
                    }
                  },
                )
              ],
            ),
          ),
          AppUtils.spaceV(50),
        ],
      ),
    );
  }
}
