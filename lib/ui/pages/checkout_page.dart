import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/top_up/top_up_bloc.dart';
import 'package:bank_sha/models/top_up_model.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/pin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  final TopUpModel? data;
  const CheckoutPage({super.key, this.data});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController numC = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    numC.addListener(() {
      final text = numC.text;
      numC.value = numC.value.copyWith(
        text: NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addValue(String val) {
    if (numC.text == '0') {
      numC.text = '';
    }
    setState(() {
      numC.text += val;
    });
  }

  deleteVal() {
    if (numC.text.isNotEmpty) {
      setState(() {
        numC.text = numC.text.substring(0, numC.text.length - 1);
      });
    } else {
      numC.text = '0';
    }

    if (numC.text == '') {
      numC.text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBgColor,
      body: BlocProvider(
        create: (context) => TopUpBloc(),
        child: BlocConsumer<TopUpBloc, TopUpState>(
          listener: (context, state) async {
            if (state is TopUpFailed) {
              AppUtils.showAppSnackbar(context, state.e);
            }

            if (state is TopUpSuccess) {
              if (await launchUrlString(
                    state.url,
                    mode: LaunchMode.externalApplication,
                  ) ==
                  true) {
                context.read<AuthBloc>().add(AuthUpdateBalance(
                    int.parse(numC.text.replaceAll(".", ""))));
                Navigator.pushNamedAndRemoveUntil(
                    context, PagesName.checkoutSuccessPage, (route) => false);
              }
            }
          },
          builder: (context, state) {
            if (state is TopUpLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppUtils.spaceV(50),
                    Center(
                      child: Text(
                        'Total Amount',
                        style: AppTextStyle.whitePoppins(20, FontWeight.w600),
                      ),
                    ),
                    AppUtils.spaceV(50),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: numC,
                        enabled: false,
                        style: AppTextStyle.whitePoppins(36, FontWeight.w500),
                        decoration: InputDecoration(
                          prefixIcon: Text(
                            'Rp ',
                            style:
                                AppTextStyle.whitePoppins(36, FontWeight.w500),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.darkGreyColor),
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
                    ),
                    AppUtils.spaceV(50),
                    FilledButton(
                      title: "Checkout Now",
                      width: 260,
                      onPressed: () async {
                        if (await Navigator.pushNamed(
                                context, PagesName.pinPage) ==
                            true) {
                          final authState = context.read<AuthBloc>().state;
                          if (authState is AuthSuccess) {
                            String pin = authState.user.pin!;
                            context
                                .read<TopUpBloc>()
                                .add(TopUpPost(widget.data!.copyWith(
                                  pin: pin,
                                  amount: numC.text.replaceAll(".", ""),
                                )));
                          }
                        }
                      },
                    ),
                    AppUtils.spaceV(25),
                    PlainButton(
                      title: 'Terms & Conditions',
                      onPressed: () {},
                    ),
                    AppUtils.spaceV(50),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
