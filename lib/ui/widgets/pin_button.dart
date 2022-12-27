import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const PinButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: title != 'delete'
              ? Text(
                  title,
                  style: AppTextStyle.whitePoppins(22, FontWeight.w600),
                )
              : Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                ),
        ),
      ),
    );
  }
}
