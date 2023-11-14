import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/edit_profile_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController usernameC = TextEditingController();
  TextEditingController fullnameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void initState() {
    super.initState();

    final state = context.read<AuthBloc>().state;
    if (state is AuthSuccess) {
      usernameC.text = state.user.username!;
      fullnameC.text = state.user.name!;
      emailC.text = state.user.email!;
      passC.text = state.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Edit Photo', context),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            AppUtils.showAppSnackbar(context, state.error);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, PagesName.editSuccessPage, ((route) => false));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    AppFormField(
                      title: 'Username',
                      controller: usernameC,
                    ),
                    AppUtils.spaceV(16),
                    AppFormField(
                      title: 'Full name',
                      controller: fullnameC,
                    ),
                    AppUtils.spaceV(16),
                    AppFormField(
                      title: 'Email Address',
                      controller: emailC,
                    ),
                    AppUtils.spaceV(16),
                    AppFormField(
                      title: 'Password',
                      obscured: true,
                      controller: passC,
                    ),
                    AppUtils.spaceV(30),
                    MyFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthUpdateUser(
                              EditProfileModel(
                                username: usernameC.text,
                                name: fullnameC.text,
                                email: emailC.text,
                                password: passC.text,
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
