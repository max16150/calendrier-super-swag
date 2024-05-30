import 'package:flutter/material.dart';


// ignore: must_be_immutable
enum Style { bgFill }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 64,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    412,
    height ?? 64,
  );

  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 64,
          width: 412,
          decoration:const BoxDecoration(
            //color: theme.colorScheme.onErrorContainer,
          ),
        );
      default:
        return null;
    }
  }
}