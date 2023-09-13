import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/constants.dart';

import '../../../../config/colors.dart';

class PrimaryAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final Widget? icon;
  final Color? backgroundColor;
  final void Function()? onPressedMore;
  final double horizontalPadding;

  const PrimaryAppBarWidget({
    Key? key,
    this.icon,
    this.onPressedMore,
    this.backgroundColor,
    required this.horizontalPadding,
  }) : super(key: key);

  @override
  State<PrimaryAppBarWidget> createState() => _PrimaryAppBarWidgetState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppConstants.appBarHeightValue);
}

class _PrimaryAppBarWidgetState extends State<PrimaryAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor ?? AppColors.colorWhite,
      shadowColor: Colors.transparent,
      toolbarHeight: AppConstants.appBarHeightValue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svg/garagi_logo.svg',
            width: 80,
          ),
        ],
      ),
      actions: [
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
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
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
            onPressed:
                widget.onPressedMore != null ? widget.onPressedMore! : null,
          ),
        ),
      ],
    );
  }
}
