import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/signup_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/pages/signup_setprofile_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  bool validate() {
    if (nameC.text.isEmpty || passC.text.isEmpty || emailC.text.isEmpty) {
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
          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupProfilePage(
                  data: SignUpModel(
                      email: emailC.text,
                      name: nameC.text,
                      password: passC.text),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
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
                    image: AssetImage('assets/sha_logo_light.png'),
                  ),
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFormField(
                      title: 'Full Name',
                      controller: nameC,
                    ),
                    AppUtils.spaceV(16),
                    AppFormField(
                      title: 'Email Address',
                      controller: emailC,
                    ),
                    AppUtils.spaceV(8),
                    AppFormField(
                      title: 'Password',
                      controller: passC,
                      obscured: true,
                    ),
                    AppUtils.spaceV(30),
                    MyFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailC.text));
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
                title: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, PagesName.signinPage);
                },
              ),
              AppUtils.spaceV(50),
            ],
          );
        },
      ),
    );
  }
}
