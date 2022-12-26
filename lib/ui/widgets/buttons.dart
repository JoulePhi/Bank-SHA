import 'package:flutter/material.dart';
import '../../shared/text_style.dart';

class FilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final Color color;
  const FilledButton(
      {super.key,
      required this.title,
      this.width = double.infinity,
      this.height = 50,
      this.onPressed,
      this.color = const Color(0xff5142E6)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56))),
        child: Text(
          title,
          style: AppTextStyle.whitePoppins(16, FontWeight.w600),
        ),
      ),
    );
  }
}

class PlainButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  const PlainButton(
      {super.key,
      required this.title,
      this.width = double.infinity,
      this.height = 24,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          title,
          style: AppTextStyle.greyPoppins(16, FontWeight.normal),
        ),
      ),
    );
  }
}
