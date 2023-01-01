import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment_method_moder.dart';
import 'package:bank_sha/models/top_up_model.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/pages/checkout_page.dart';
import 'package:bank_sha/ui/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Top Up', context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          AppUtils.spaceV(30),
          Text(
            'Wallet',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/mini_wallet.png',
                      height: 55,
                    ),
                    AppUtils.spaceH(16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: AppTextStyle.blackPoppins(16, FontWeight.w500),
                        ),
                        Text(
                          state.user.name.toString(),
                          style:
                              AppTextStyle.greyPoppins(12, FontWeight.normal),
                        )
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          ),
          AppUtils.spaceV(40),
          Text(
            'Select Bank',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: state.paymentMethods
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = e;
                              });
                            },
                            child: BankItem(
                              paymentMethod: e,
                              isSelected: e.id == isSelected?.id,
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Container();
              },
            ),
          ),
          AppUtils.spaceV(30),
        ],
      ),
      floatingActionButton: (isSelected != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: FilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                        data: TopUpModel(
                          paymentMethodCode: isSelected!.code,
                        ),
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
