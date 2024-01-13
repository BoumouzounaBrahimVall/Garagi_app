import 'package:flutter/material.dart';

class TextFormSearchStyled extends StatefulWidget {
  const TextFormSearchStyled(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.icon,
      this.controller,
      this.keyboardType,
      this.action,
      this.isPassword = false,
      required this.validator,
      this.decoration,
      this.obscureText,
      this.onChanged,
      this.initialValue});
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? action;
  final bool isPassword;
  final Function validator;
  final InputDecoration? decoration;
  final bool? obscureText;
  final Function? onChanged;
  final String? initialValue;

  @override
  State<TextFormSearchStyled> createState() => _TextFormSearchStyled();
}

class _TextFormSearchStyled extends State<TextFormSearchStyled> {
  bool _isPasswordVisible = false;
  late TextEditingController controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _isPasswordVisible = widget.isPassword;
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = TextEditingController();
    }
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8),
            width: width * 0.9,
            decoration: BoxDecoration(
              //border: OutlineInputBorder(),
              border: Border.all(
                color: Color(0xffECECEC), // Color of the border
                width: 1, // Width of the border
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0)), // Optional: Add rounded corners

              color: Colors.white,
            ),
            child: Center(
              child: TextFormField(
                autofocus: false,
                focusNode: _focusNode,
                validator: ((value) => widget.validator(value)),
                initialValue: widget.initialValue,
                controller: controller, //widget.controller,
                keyboardType: widget.keyboardType,
                onTap: () => widget.action,
                obscureText: _isPasswordVisible,
                style: Theme.of(context).textTheme.bodyMedium,
                onChanged: ((value) => widget.onChanged!(value)),
                decoration: InputDecoration(
                    suffixIcon: widget.isPassword
                        ? IconButton(
                            alignment: Alignment.center,
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
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      widget.icon,
                      size: 24,
                      color: Color(0xff112A59),
                    ),
                    fillColor: const Color.fromARGB(255, 0, 0, 0),
                    hintText: widget.placeholder,
                    hintStyle:
                        TextStyle(color: Color(0xff879EA4), fontSize: 18)),
              ),
            ))
      ],
    );
  }
}
