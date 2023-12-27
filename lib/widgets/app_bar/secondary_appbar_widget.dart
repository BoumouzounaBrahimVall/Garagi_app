import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';

import '../../../../config/colors.dart';

class SecondaryAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? icon, leftIcon;
  final Color? backgroundColor, actionColor, titleColor;
  final void Function()? onPressedBack, onPressedMore;
  final double horizontalPadding;

  const SecondaryAppBarWidget({
    Key? key,
    this.title,
    this.icon,
    this.leftIcon,
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
      actions: widget.onPressedMore != null
          ? [
              Padding(
                padding: EdgeInsets.only(
                  right: widget.horizontalPadding,
                ),
                child: IconButton(
                  icon: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorYellow),
                    child: const Text('i',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold)),
                  ),
                  padding: const EdgeInsets.all(
                    0,
                  ),
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStatePropertyAll(
                      AppColors.colorYellow,
                    ),
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: widget.onPressedMore != null
                      ? widget.onPressedMore!
                      : null,
                ),
              ),
            ]
          : null,
      leading: Padding(
        padding: EdgeInsets.only(
          left: widget.horizontalPadding,
        ),
        child: widget.onPressedBack != null
            ? IconButton(
                icon: widget.leftIcon != null
                    ? widget.leftIcon!
                    : FeatherIcon(
                        FeatherIcons.chevronLeft,
                        color: widget.actionColor ?? AppColors.colorYellow,
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
