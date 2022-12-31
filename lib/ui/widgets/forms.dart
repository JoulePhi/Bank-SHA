import 'package:bank_sha/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/text_style.dart';
import '../../shared/utils.dart';

class AppFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscured, isTitled;
  final TextInputType? type;

  const AppFormField({
    super.key,
    required this.title,
    required this.controller,
    this.obscured = false,
    this.isTitled = true,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTitled)
          Text(
            title,
            style: AppTextStyle.blackPoppins(14, FontWeight.w500),
          ),
        if (isTitled) AppUtils.spaceV(8),
        TextFormField(
          controller: controller,
          obscureText: obscured,
          style: AppTextStyle.blackPoppins(14, FontWeight.w500),
          keyboardType: type,
          decoration: InputDecoration(
            hintText: !isTitled ? title : null,
            filled: !isTitled,
            fillColor: AppColors.whiteColor,
            hintStyle: AppTextStyle.greyPoppins(14, FontWeight.normal),
            enabledBorder: isTitled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blueColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(14)),
            contentPadding: const EdgeInsets.all(12),
          ),
        )
      ],
    );
  }
}
