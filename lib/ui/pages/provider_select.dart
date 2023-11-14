import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/provider/provider_bloc.dart';
import 'package:bank_sha/models/select_provider_moder.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/pages/provider_package_select.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderSelect extends StatefulWidget {
  const ProviderSelect({super.key});

  @override
  State<ProviderSelect> createState() => _ProviderSelectState();
}

class _ProviderSelectState extends State<ProviderSelect> {
  ProviderModel? isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.myAppBar('Beli Data', context),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                AppUtils.spaceV(30),
                Text(
                  'From Wallet',
                  style: AppTextStyle.blackPoppins(16, FontWeight.w600),
                ),
                AppUtils.spaceV(10),
                Row(
                  children: [
                    Image.asset(
                      'assets/mini_wallet.png',
                      height: 55,
                    ),
                    AppUtils.spaceH(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: AppTextStyle.blackPoppins(16, FontWeight.w500),
                        ),
                        AppUtils.spaceV(2),
                        Text(
                          'Balance: ${AppUtils.formatCurrency(state.user.balance ?? 0)}',
                          style:
                              AppTextStyle.greyPoppins(12, FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
                AppUtils.spaceV(40),
                Text(
                  'Select Provider',
                  style: AppTextStyle.blackPoppins(16, FontWeight.w600),
                ),
                AppUtils.spaceV(14),
                BlocProvider(
                    create: (context) => ProviderBloc()..add(ProviderGet()),
                    child: BlocBuilder<ProviderBloc, ProviderState>(
                      builder: (context, state) {
                        if (state is ProviderSuccess) {
                          return Column(
                            children: state.data
                                .map((e) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected = e;
                                      });
                                    },
                                    child: ProviderItem(
                                      data: e,
                                      isSelected: e.id == isSelected?.id,
                                    )))
                                .toList(),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
              ],
            );
          }
          return Container();
        },
      ),
      floatingActionButton: isSelected != null
          ? Container(
              margin: const EdgeInsets.all(24),
              child: MyFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PackageSelect(
                        data: isSelected!.dataPlans,
                      ),
                    ),
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
