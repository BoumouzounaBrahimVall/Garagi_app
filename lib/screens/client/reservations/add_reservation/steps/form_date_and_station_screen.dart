import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:garagi_app/config/colors.dart';

import 'package:garagi_app/provider/reservation_from_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/drop_down_menu_widget.dart';
import '../../../../../widgets/step_infos_item.dart';

class FormDateAndStationScreen extends StatefulWidget {
  const FormDateAndStationScreen({super.key});

  @override
  State<FormDateAndStationScreen> createState() =>
      _FormDateAndStationScreenState();
}

class _FormDateAndStationScreenState extends State<FormDateAndStationScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepInfosItem(
              stepNumber: '02', stepTitle: 'Reservartion Infos'),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Text(
            'Station',
            style: Theme.of(context).textTheme.bodyMedium!.merge(
                const TextStyle(
                    color: Color(0xff222222),
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
          ),
          const SizedBox(height: 10),
          DropdownMenuWidget(
            list: const ["Garagi main Station"],
            onSelectedValue: (value) {
              context.read<ReservationFormProvider>().setStationId(1);
            },
          ),
          const SizedBox(height: 16),
          Text('Date and Time of the Reservation',
              style: Theme.of(context).textTheme.bodyMedium!.merge(
                  const TextStyle(
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w700,
                      fontSize: 20))),
          const SizedBox(height: 10),
          Container(
            // Set the desired height
            height: 65,
            width: width * 0.9,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.colorGrayDark, width: 1.5),
              color: Colors.white, // Set the desired background color
              borderRadius:
                  BorderRadius.circular(8), // Optional: Add rounded corners
            ),
            child: GestureDetector(
              onTap: () {
                dateTimePickerWidget(context);
              },
              child: Text(
                context
                        .read<ReservationFormProvider>()
                        .form
                        .reservationDateTime ??
                    "2024-01-01 a 14:15",
                style: Theme.of(context).textTheme.bodySmall!.merge(
                    const TextStyle(
                        color: AppColors.colorGray,
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dateTimePickerWidget(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: DateTime.now(),
      minDateTime: DateTime.now(),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        DateTime selectdate = dateTime;
        print(selectdate
            .copyWith(isUtc: true)
            .toIso8601String()); //2024-01-24T12:30:45.000Z

        context.read<ReservationFormProvider>().setReservationDateTime(
            selectdate.copyWith(isUtc: true).toIso8601String());
        setState(() {});
      },
    );
  }
}
