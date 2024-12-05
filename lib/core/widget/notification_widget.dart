import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/generated/assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      decoration: const ShapeDecoration(
        color: Color(0xffeff2ee),
        shape: OvalBorder(),),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}
