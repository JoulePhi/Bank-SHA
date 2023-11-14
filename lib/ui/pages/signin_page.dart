import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/signin_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  bool validate() {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
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
        builder: ((context, state) {
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
                'Sign In &\nGrow Your Finance',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFormField(
                      title: 'Email Address',
                      controller: emailC,
                    ),
                    AppUtils.spaceV(16),
                    AppFormField(
                        title: 'Password', controller: passC, obscured: true),
                    AppUtils.spaceV(8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: AppTextStyle.bluePoppins(14, FontWeight.normal),
                      ),
                    ),
                    AppUtils.spaceV(30),
                    MyFilledButton(
                      title: 'Sign In',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInModel(
                                      email: emailC.text, password: passC.text),
                                ),
                              );
                        } else {
                          AppUtils.showAppSnackbar(
                              context, 'Semua Field Harus Diisi');
                        }
                      },
                    )
                  ],
                ),
              ),
              AppUtils.spaceV(40),
              PlainButton(
                title: "Create New Account",
                onPressed: () {
                  Navigator.pushNamed(context, PagesName.signupPage);
                },
              ),
              AppUtils.spaceV(50),
            ],
          );
        }),
      ),
    );
  }
}
