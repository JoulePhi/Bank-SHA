import 'dart:convert';
import 'dart:io';
import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/signup_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignupKtpPage extends StatefulWidget {
  final SignUpModel? data;

  const SignupKtpPage({super.key, this.data});

  @override
  State<SignupKtpPage> createState() => _SignupKtpPageState();
}

class _SignupKtpPageState extends State<SignupKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            AppUtils.showAppSnackbar(context, state.error);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, PagesName.homePage, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
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
                      'Passport/ID Card',
                      style: AppTextStyle.blackPoppins(18, FontWeight.w500),
                    ),
                    AppUtils.spaceV(50),
                    FilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data!.copyWith(
                                      ktp:
                                          'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'),
                                ),
                              );
                        } else {
                          AppUtils.showAppSnackbar(
                              context, 'Gambar tidak boleh kosong');
                        }
                      },
                    )
                  ],
                ),
              ),
              AppUtils.spaceV(40),
              PlainButton(
                title: 'Skip For Now',
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthRegister(widget.data!),
                      );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
