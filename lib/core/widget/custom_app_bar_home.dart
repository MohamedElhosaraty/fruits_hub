import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widget/notification_widget.dart';

class CustomAppBarHome extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppBarHome({super.key, required this.title,this.showBackButton = true});

  final String title;
  final bool showBackButton ;


  @override
  State<CustomAppBarHome> createState() => _CustomAppBarHomeState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarHomeState extends State<CustomAppBarHome> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.title,style: TextStyles.bold19,
      ),
      actions: [
        const NotificationWidget(),
      ],
      leading: Visibility(
        visible: widget.showBackButton,
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
