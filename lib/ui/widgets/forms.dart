import 'package:flutter/material.dart';

import '../../shared/text_style.dart';
import '../../shared/utils.dart';

class AppFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscured;

  const AppFormField(
      {super.key,
      required this.title,
      required this.controller,
      this.obscured = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.blackPoppins(14, FontWeight.w500),
        ),
        AppUtils.spaceV(8),
        TextFormField(
          controller: controller,
          obscureText: obscured,
          style: AppTextStyle.blackPoppins(14, FontWeight.w500),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        )
      ],
    );
  }
}
