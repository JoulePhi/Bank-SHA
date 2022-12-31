import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_page_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBgColor,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: AppTextStyle.blackPoppins(20, FontWeight.w600),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, PagesName.homePage, (route) => false);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            AppUtils.showAppSnackbar(context, state.error);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, PagesName.signinPage, ((route) => false));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.fromLTRB(30, 22, 30, 0),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? const AssetImage('assets/image_profile.png')
                                : NetworkImage(state.user.profilePicture!)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  'assets/ic_check.png',
                                  width: 28,
                                ),
                              )
                            : null,
                      ),
                      AppUtils.spaceV(16),
                      Text(
                        state.user.name.toString(),
                        style: AppTextStyle.blackPoppins(18, FontWeight.w500),
                      ),
                      AppUtils.spaceV(40),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(
                                  context, PagesName.pinPage) ==
                              true) {
                            Navigator.pushNamed(
                                context, PagesName.profileEditPage);
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_my_pin.png',
                        title: 'My Pin',
                        onTap: () async {
                          if (await Navigator.pushNamed(
                                  context, PagesName.pinPage) ==
                              true) {
                            Navigator.pushNamed(context, PagesName.pinEditPage);
                          }
                        },
                      ),
                      const ProfileMenuItem(
                          iconUrl: 'assets/ic_wallet_setting.png',
                          title: 'Wallet Settings'),
                      const ProfileMenuItem(
                          iconUrl: 'assets/ic_my_rewards.png',
                          title: 'My Rewards'),
                      const ProfileMenuItem(
                          iconUrl: 'assets/ic_help_center.png',
                          title: 'Help Center'),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_log_out.png',
                        title: 'Log Out',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                AppUtils.spaceV(40),
                const PlainButton(title: 'Report a Problem')
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
