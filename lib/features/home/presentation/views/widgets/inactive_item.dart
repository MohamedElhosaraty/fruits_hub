import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InactiveItem extends StatelessWidget {
  const InactiveItem({super.key, required this.image});

  final String image ;

  @override
  Widget build(BuildContext context) {
    return Container(
         color: Colors.transparent,
        child: SvgPicture.asset(image));
  }
}
