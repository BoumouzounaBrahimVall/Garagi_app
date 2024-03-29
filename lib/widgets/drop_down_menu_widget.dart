import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget(
      {required this.list, this.onSelectedValue, super.key});
  final List<String> list;
  final Function? onSelectedValue;

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      // Set the desired height
      width: width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorGrayDark, width: 1.5),
        color: Colors.white, // Set the desired background color
        borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: Theme.of(context).textTheme.displaySmall!.merge(const TextStyle(
            color: AppColors.colorOrange, fontWeight: FontWeight.w300)),
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            widget.onSelectedValue!(dropdownValue);
          });
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodySmall!.merge(
                  const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 52, 52, 52),
                      fontWeight: FontWeight.w600)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
