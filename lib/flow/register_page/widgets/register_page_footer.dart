import 'package:audio_video_calling/utils/asset_paths/image_paths/app_images.dart';
import 'package:flutter/material.dart';

class RegisterPageFooter extends StatelessWidget {
  static const _imageOpacity = 0.7;
  const RegisterPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      child: Align(
        alignment: Alignment.centerRight,
        child: Opacity(
          opacity: _imageOpacity,
          child: Image.asset(
            AppImages.cartoonPhoneImage,
          ),
        ),
      ),
    );
  }
}
