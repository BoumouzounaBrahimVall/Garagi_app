import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

import '../../../config/colors.dart';
import '../../../config/constants.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({
    super.key,
    required this.inputName,
    required this.inputLabel,
    required this.inputHint,
    required this.controller,
    required this.keyboardType,
    this.password = false,
    this.enabled = false,
    this.enableSuggestions = false,
    this.passwordValidation = false,
    this.prefixText = "",
    this.validator,
    this.inputFormatters,
    this.onChanged,
  });

  final String inputName, inputLabel, inputHint, prefixText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool password, passwordValidation, enabled, enableSuggestions;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  // Declarations
  late bool obscureText = true;
  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.inputLabel,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlueDark,
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            FormBuilderTextField(
              controller: widget.controller,
              name: widget.inputName,
              textInputAction: TextInputAction.next,
              keyboardType: widget.keyboardType,
              cursorColor: AppColors.colorBlack,
              textAlign: TextAlign.left,
              enableInteractiveSelection: widget.password ? false : true,
              autocorrect: widget.password ? false : true,
              obscureText: widget.password ? obscureText : false,
              enabled: widget.enabled ? false : true,
              enableSuggestions: widget.enableSuggestions ? false : true,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.colorBlack.withOpacity(0.9),
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                hintText: widget.inputHint,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.all(
                  AppConstants.inputRadiusValue,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixText:
                    widget.prefixText.isEmpty ? "" : "${widget.prefixText}  ",
                prefixStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorBlack,
                ),
                errorStyle: const TextStyle(
                  height: 0.8,
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.colorRed,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    topRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.colorGray,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    topRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.colorRed,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    topRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(
                    color: AppColors.colorBlueDark,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    topRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomLeft: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                    bottomRight: Radius.circular(
                      AppConstants.inputRadiusValue,
                    ),
                  ),
                ),
                suffixIcon: widget.password
                    ? TextButton(
                        onPressed: () => {
                          setState(() {
                            obscureText = !obscureText;
                          })
                        },
                        child: Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.colorBlueDark,
                          ),
                        ),
                      )
                    : null,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.password && widget.passwordValidation
                  ? FormBuilderValidators.compose(
                      [
                        (val) {
                          if (val == null || val.isEmpty) {
                            return 'Password is required';
                          } else if (val.length < 6) {
                            return 'Is too short (min 6 characters)';
                          } else if (!val.contains(RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one letter uppercase';
                          } else if (!val.contains(RegExp(r'[a-z]'))) {
                            return 'Password must contain at least one letter lowercase';
                          } else if (!val.contains(RegExp(r'[0-9]'))) {
                            return 'Password must contain at least one number';
                          } else if (!val
                              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'))) {
                            return 'Password must contain at least one special character';
                          } else {
                            return null;
                          }
                        }
                      ],
                    )
                  : widget.validator,
              onSaved: (value) {
                widget.controller.text = value!;
              },
              onChanged: widget.onChanged,
              inputFormatters: widget.inputFormatters,
            ),
            Positioned(
              top: 11,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppConstants.inputRadiusValue,
                ),
                child: Text(
                  widget.prefixText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorBlack,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        widget.password && widget.passwordValidation
            ? Container(
                margin: const EdgeInsets.only(
                  top: 8,
                ),
                child: FlutterPasswordStrength(
                  password: widget.controller.text,
                  strengthCallback: (strength) {
                    debugPrint(strength.toString());
                  },
                  height: 5,
                  radius: 100,
                  backgroundColor: AppColors.colorGray,
                  // duration: const Duration(seconds: 1),
                ))
            : const SizedBox(),
      ],
    );
  }
}
