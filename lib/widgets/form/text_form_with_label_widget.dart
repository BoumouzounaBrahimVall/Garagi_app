import 'package:flutter/material.dart';

class TextFormWithLabelWidget extends StatefulWidget {
  const TextFormWithLabelWidget(
      {Key? key,
      required this.label,
      required this.placeholder,
      this.icon,
      this.controller,
      this.keyboardType,
      this.action,
      this.isPassword = false,
      required this.validator,
      this.decoration,
      this.obscureText,
      this.onChanged})
      : super(key: key);
  final String label;
  final String placeholder;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? action;
  final bool isPassword;
  final Function validator;
  final InputDecoration? decoration;
  final bool? obscureText;
  final Function? onChanged;

  @override
  _TextFormWithLabelWidgetState createState() =>
      _TextFormWithLabelWidgetState();
}

class _TextFormWithLabelWidgetState extends State<TextFormWithLabelWidget> {
  bool _isPasswordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    _isPasswordVisible = widget.isPassword;
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(
              color: Color(0xff222222),
              fontWeight: FontWeight.w700,
              fontSize: 20)),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
                height: 60,
                padding: EdgeInsets.only(top: 8),
                alignment: Alignment.center,
                width: width * 0.9,
                decoration: BoxDecoration(
                  //border: OutlineInputBorder(),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5), // Color of the border
                    width: 2, // Width of the border
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)), // Optional: Add rounded corners

                  color: Colors.white,
                ),
                child: Center(
                  child: TextFormField(
                    validator: ((value) => widget.validator(value)),
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    onTap: () => widget.action,
                    obscureText: _isPasswordVisible ?? false,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) {
                      if (widget.onChanged != null) widget.onChanged!(value);
                    },
                    decoration: InputDecoration(
                        suffixIcon: widget.isPassword
                            ? IconButton(
                                color: Colors.grey,
                                icon: Icon(
                                  !_isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              )
                            : null,
                        isDense: true,
                        enabledBorder: null,
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          widget.icon,
                          color: Color(0xff879EA4),
                        ),
                        fillColor: const Color.fromARGB(255, 0, 0, 0),
                        hintText: widget.placeholder ?? ' ',
                        hintStyle: TextStyle(color: Color(0xff879EA4))),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
