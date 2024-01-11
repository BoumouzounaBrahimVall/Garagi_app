import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/domain/models/consultation_model.dart';
import 'package:garagi_app/screens/client/car_finder/consultation/methods/consultation_methods.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key, required this.model});
  final ConsultationModel model;
  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: SecondaryAppBarWidget(
        horizontalPadding: 10,
        title: 'Consultation',
        onPressedBack: () {
          Navigator.pop(context);
        },
      ),
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // car details card
              consultationDetailWidget(width, height),
              const Text(
                "Service Efffectuer ",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: AppColors.colorWhite,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.colorBlack.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ],
                ),
                child: Column(children: [
                  ...widget.model.services
                      .map((e) => serviceWidget(
                          title: e.title,
                          subtitle: e.details,
                          // this test is to remove the devider under the last element
                          withDivider: widget.model.services.indexOf(e) ==
                                  widget.model.services.length - 1
                              ? false
                              : true))
                      .toList(),
                ]),
              ),

              if (widget.model.problems != null &&
                  widget.model.problems!.isNotEmpty)
                const Text(
                  "Problème Découvert ",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              if (widget.model.problems != null &&
                  widget.model.problems!.isNotEmpty)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: AppColors.colorWhite,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.colorBlack.withOpacity(0.1),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  child: Column(children: [
                    ...widget.model.problems!
                        .map((e) => serviceWidget(
                            title: e.title,
                            subtitle: e.details,
                            isProblem: true,
                            // this test is to remove the devider under the last element
                            withDivider: widget.model.problems!.indexOf(e) ==
                                    widget.model.problems!.length - 1
                                ? false
                                : true))
                        .toList(),
                  ]),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceWidget(
      {required String title,
      bool isProblem = false,
      String? subtitle,
      bool withDivider = true}) {
    Widget xIcon = Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.colorRed,
      ),
      child: const Icon(
        Icons.close,
        size: 19,
        color: AppColors.colorWhite,
      ),
    );
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          horizontalTitleGap: -3,
          visualDensity: VisualDensity.compact,
          leading: isProblem ? xIcon : const Icon(Icons.check_circle_rounded),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          subtitle: (subtitle != null)
              ? Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                )
              : null,
        ),
        if (withDivider)
          const Divider(
              color: AppColors.colorGray,
              indent: 16,
              endIndent: 16,
              thickness: 1),
      ],
    );
  }

  Widget consultationDetailWidget(double width, double height) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: AppColors.colorWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.colorBlack.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: width * 0.45,
                  height: height / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        consultationTitle(widget.model.type),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.model.price,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 26,
                            color: AppColors.colorGray,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                          color: AppColors.colorGrayDark,
                          //indent: 16,
                          //  endIndent: 16,
                          thickness: 2),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/mecanician_svg.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.model.mecanicianName,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.33,
                height: height / 4.4,
                child: Stack(fit: StackFit.passthrough, children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        widget.model.date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: -36,
                      right: -30,
                      child: SvgPicture.asset(
                        consultationSvgPath(widget.model.type),
                        height: 150,
                        color: AppColors.colorGray,
                      )),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
