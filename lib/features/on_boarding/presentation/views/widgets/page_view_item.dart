import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shered_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.title,
      required this.subtitle,
        required this.isVisible});

  final String image, backgroundImage;
  final Widget title;
  final String subtitle;
  final bool isVisible ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisible,
                child:  GestureDetector(
                  onTap: (){
                    Prefs.setBool(kIsOnBoardingViewSeen, true);
                    Navigator.of(context).pushReplacementNamed(SigninView.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("تخط",style: TextStyles.regular13.copyWith(
                      color : Color(0xff949D9E),
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
        64.verticalSpace,
        title,
        24.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            subtitle,textAlign: TextAlign.center,
          style: TextStyles.semiBold13.copyWith(
              color : Color(0xff4E5556),),
          ),
        ),
      ],
    );
  }
}
