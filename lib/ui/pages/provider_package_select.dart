import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/provider/provider_bloc.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/data_post_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageSelect extends StatefulWidget {
  final List<DataPlanModel>? data;
  final DataPostModel? dataPostModel;

  const PackageSelect({super.key, this.data, this.dataPostModel});

  @override
  State<PackageSelect> createState() => _PackageSelectState();
}

class _PackageSelectState extends State<PackageSelect> {
  DataPlanModel? selectedPlan;
  TextEditingController numC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderBloc(),
      child: BlocConsumer<ProviderBloc, ProviderState>(
        listener: (context, state) {
          if (state is ProviderFailed) {
            AppUtils.showAppSnackbar(context, state.e);
          }

          if (state is ProviderBuySuccess) {
            context
                .read<AuthBloc>()
                .add(AuthUpdateBalance(selectedPlan!.price!, false));
            Navigator.pushNamed(context, PagesName.providerSuccessPage);
          }
        },
        builder: (context, state) {
          if (state is ProviderLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            backgroundColor: AppColors.lightBgColor,
            appBar: AppUtils.myAppBar('Paket Data', context),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                AppUtils.spaceV(30),
                Text(
                  'Phone Number',
                  style: AppTextStyle.blackPoppins(16, FontWeight.w600),
                ),
                AppUtils.spaceV(14),
                AppFormField(
                  title: '+628',
                  controller: numC,
                  isTitled: false,
                  type: TextInputType.number,
                  onSubmitted: (s) {
                    setState(() {});
                  },
                ),
                AppUtils.spaceV(40),
                Text(
                  'Select Package',
                  style: AppTextStyle.blackPoppins(16, FontWeight.w600),
                ),
                AppUtils.spaceV(14),
                Wrap(
                  spacing: 17,
                  runSpacing: 17,
                  children: widget.data!
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPlan = e;
                            });
                          },
                          child: PackageItem(
                            data: e,
                            isSelected: selectedPlan?.id == e.id,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            floatingActionButton:
                (selectedPlan != null && numC.text.length >= 11)
                    ? Container(
                        margin: const EdgeInsets.all(24),
                        child: MyFilledButton(
                          title: 'Continue',
                          onPressed: () async {
                            if (await Navigator.pushNamed(
                                    context, PagesName.pinPage) ==
                                true) {
                              final authState = context.read<AuthBloc>().state;
                              if (authState is AuthSuccess) {
                                context.read<ProviderBloc>().add(ProviderPost(
                                      DataPostModel(
                                        dataPlanId: selectedPlan!.id.toString(),
                                        pin: authState.user.pin,
                                        phoneNumber: numC.text,
                                      ),
                                    ));
                              }
                            }
                          },
                        ),
                      )
                    : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
