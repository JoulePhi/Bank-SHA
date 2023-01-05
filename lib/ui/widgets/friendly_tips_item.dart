import 'package:bank_sha/models/friendly_tips_modle.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FriendlyTipsItems extends StatelessWidget {
  final FriendlyTipsModel data;

  const FriendlyTipsItems({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri myUri = Uri.parse(data.url.toString());
        if (await canLaunchUrl(myUri)) {
          launchUrl(
            myUri,
            mode: LaunchMode.externalApplication,
          );
        }
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  data.thumbnail.toString(),
                  width: 155,
                  height: 110,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                data.title.toString(),
                maxLines: 2,
                style: AppTextStyle.blackPoppins(14, FontWeight.w500).copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
