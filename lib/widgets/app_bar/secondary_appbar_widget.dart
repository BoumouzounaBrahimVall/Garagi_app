import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';

import '../../../../config/colors.dart';

class SecondaryAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? icon;
  final Color? backgroundColor, actionColor, titleColor;
  final void Function()? onPressedBack, onPressedMore;
  final double horizontalPadding;

  const SecondaryAppBarWidget({
    Key? key,
    this.title,
    this.icon,
    this.actionColor,
    this.titleColor,
    this.onPressedBack,
    this.onPressedMore,
    this.backgroundColor,
    required this.horizontalPadding,
  }) : super(key: key);

  @override
  State<SecondaryAppBarWidget> createState() => _SecondaryAppBarWidgetState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppConstants.appBarHeightValue);
}

class _SecondaryAppBarWidgetState extends State<SecondaryAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor ?? AppColors.colorWhite,
      shadowColor: Colors.transparent,
      toolbarHeight: AppConstants.appBarHeightValue,
      title: Text(
        widget.title ?? "",
        style: TextStyle(
          color: widget.titleColor ?? AppColors.colorBlack,
          fontFamily: AppConstants.primaryTypeFace,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(
          left: widget.horizontalPadding,
        ),
        child: widget.onPressedBack != null
            ? IconButton(
                icon: FeatherIcon(
                  FeatherIcons.chevronLeft,
                  color: widget.actionColor ?? AppColors.colorOrange,
                  size: 40,
                  strokeWidth: 3,
                ),
                padding: const EdgeInsets.all(0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                alignment: Alignment.centerLeft,
                onPressed: widget.onPressedBack!,
              )
            : const SizedBox(),
      ),
    );
  }
}
