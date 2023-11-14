import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/update_pin_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPinPage extends StatefulWidget {
  const EditPinPage({super.key});

  @override
  State<EditPinPage> createState() => _EditPinPageState();
}

class _EditPinPageState extends State<EditPinPage> {
  TextEditingController oldPinC = TextEditingController();
  TextEditingController newPinC = TextEditingController();

  bool validate() {
    if (newPinC.text.length < 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Edit Pin', context),
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
                      title: 'Old Pin',
                      controller: oldPinC,
                      type: TextInputType.number,
                      obscured: true,
                    ),
                    AppUtils.spaceV(16),
                    AppFormField(
                      title: 'New Pin',
                      controller: newPinC,
                      type: TextInputType.number,
                      obscured: true,
                    ),
                    AppUtils.spaceV(30),
                    MyFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(
                                  UpdatePinModel(
                                    previousPin: oldPinC.text,
                                    newPin: newPinC.text,
                                  ),
                                ),
                              );
                        } else {
                          AppUtils.showAppSnackbar(
                              context, 'New Pin Harus 6 Digit');
                        }
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
