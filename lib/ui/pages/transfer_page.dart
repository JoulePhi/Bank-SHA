import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/models/transfer_model.dart';
import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/recent_user_item.dart';
import 'package:bank_sha/ui/widgets/result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController searchC = TextEditingController();
  UserModel? selectedUser;
  late UserBloc user;
  @override
  void initState() {
    super.initState();

    user = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Transfer', context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          AppUtils.spaceV(30),
          Text(
            'Search',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          AppFormField(
            title: 'by username',
            controller: searchC,
            isTitled: false,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                user.add(UserGetByUsername(value));
              } else {
                user.add(UserGetRecent());
                selectedUser = null;
              }
              setState(() {});
            },
          ),
          AppUtils.spaceV(40),
          searchC.text.isEmpty ? recentUserSection() : resultUserSection(),
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Container(
              margin: const EdgeInsets.all(24),
              child: MyFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferAmount(
                        data: TransferModel(
                          sendTo: selectedUser?.username.toString(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget recentUserSection() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserFailed) {
          AppUtils.showAppSnackbar(context, state.e);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent User',
                  style: AppTextStyle.blackPoppins(16, FontWeight.w600),
                ),
                AppUtils.spaceV(14),
                ...state.users.map(
                  (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedUser = e;
                      });
                    },
                    child: RecentUserItem(
                      data: e,
                      isSelected: e.id == selectedUser?.id,
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget resultUserSection() {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserFailed) {
          AppUtils.showAppSnackbar(context, state.e);
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Result',
                style: AppTextStyle.blackPoppins(16, FontWeight.w600),
              ),
              AppUtils.spaceV(14),
              Center(
                child: Wrap(
                  spacing: 22,
                  runSpacing: 22,
                  children: state.users
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedUser = e;
                            });
                          },
                          child: ResultItem(
                            data: e,
                            isSelected: selectedUser?.id == e.id,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
