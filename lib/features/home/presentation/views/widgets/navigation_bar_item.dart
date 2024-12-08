import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entites/bottom_navigation_bar_entites.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntites});

  final bool isSelected;
  final BottomNavigationBarEntites bottomNavigationBarEntites;

  @override
  Widget build(BuildContext context) {
    return isSelected ?  ActiveItem(
        image:bottomNavigationBarEntites.activeImage,
      text: bottomNavigationBarEntites.name,
    ) :  InactiveItem(image: bottomNavigationBarEntites.inactiveImage,);
  }
}
