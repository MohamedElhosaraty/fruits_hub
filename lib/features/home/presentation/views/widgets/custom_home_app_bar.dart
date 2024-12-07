import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widget/notification_widget.dart';
import '../../../../../generated/assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        "صباح الخير !..",
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        getUser().name,
        style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D),),
      ),
      trailing: const NotificationWidget(),

    );
  }
}