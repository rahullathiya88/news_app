import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/utils/color.dart';

Widget otherSignInOption() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'or',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: KColor.disableText),
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/google.svg'),
          const SizedBox(width: 10),
          SvgPicture.asset('assets/images/apple.svg'),
          const SizedBox(width: 10),
          SvgPicture.asset('assets/images/facebook.svg'),
        ],
      ),
    ],
  );
}
