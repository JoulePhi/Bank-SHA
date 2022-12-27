import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static var spaceV = (double height) => SizedBox(
        height: height,
      );
  static var spaceH = (double width) => SizedBox(
        width: width,
      );

  static var myAppBar = (String title, BuildContext context) => AppBar(
        backgroundColor: AppColors.lightBgColor,
        centerTitle: true,
        title: Text(
          title,
          style: AppTextStyle.blackPoppins(20, FontWeight.w600),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      );
}
