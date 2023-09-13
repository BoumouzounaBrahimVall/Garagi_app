import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/screens/main/home/home_screen.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';
import 'package:garagi_app/widgets/form/primary_button_widget.dart';
import 'package:garagi_app/widgets/form/text_input_widget.dart';
import 'package:garagi_app/widgets/screen_transitions_widget.dart';

import '../../../../config/colors.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // Declarations
  final GlobalKey<FormBuilderState> formSignin = GlobalKey<FormBuilderState>();
  final TextEditingController inputEmailUsername = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();
  bool hasInternet = true;
  bool connectivity() {
    /*
    checkInternetConnectivity().then((value) {
      setState(() {
        hasInternet = value;
        if (!hasInternet) {
          ToastWidget.showToast(
            context: context,
            text: 'No internet connection found!',
            icon: Icons.info,
          );
        }
      });
    });
    return hasInternet;
    */
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    // ================================================================== API SERVICES (START)
    /*
    Future<void> loginUsers() async {
      if (formSignin.currentState!.validate()) {
        if (inputEmailUsername.text == 'brahimvall@gmail.com') {
          Navigator.of(context)
              .push(SlideBottomRouteWidget(const AppFrameWidget()));
        } else {
          ToastWidget.showToast(
            context: context,
            text: 'Incorrect email or password',
            icon: Icons.info,
            bgColor: AppColors.colorRed,
            textColor: AppColors.colorWhite,
          );
        }
        return;
        //show snackbar to indicate loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Processing Data'),
            backgroundColor: Colors.green.shade300,
          ),
        );

        var apiClient = AuthApiClient();

        //get response from ApiClient
        dynamic res = await apiClient.login(
          {"login": inputEmailUsername.text, "password": inputPassword.text},
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        //if there is no error, get the user's accesstoken and pass it to HomeScreen
        if (res['status'] == true) {
          String accessToken = res['data']['token'];
          Provider.of<AuthModel>(
            context,
            listen: false,
          ).setAccessToken(accessToken);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => HomeScreen(accesstoken: accessToken)));
        } else {
          //if an error occurs, show snackbar with error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${res['message']}'),
              backgroundColor: Colors.red.shade300,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Invalid data"),
            backgroundColor: Colors.red.shade300,
          ),
        );
      }
    }
   */
    // ================================================================== API SERVICES (END)

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.colorWhite,
      appBar: const SecondaryAppBarWidget(
        actionColor: AppColors.colorYellow,
        horizontalPadding: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset(
                    AppConstants.logoNoTitle,
                    fit: BoxFit.cover,
                    width: width - 20,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Bienvenue',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          FormBuilder(
                            key: formSignin,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                TextInputWidget(
                                  inputName: "email_username_input",
                                  inputLabel: "Email address / Username",
                                  inputHint: "Your email address or username",
                                  controller: inputEmailUsername,
                                  keyboardType: TextInputType.name,
                                  validator: FormBuilderValidators.compose(
                                    [
                                      (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Email address or username is required';
                                        } else if (val.length < 5) {
                                          return 'Is too short (min 5 characters)';
                                        } else if (val.length > 40) {
                                          return 'Is too long (max 40 characters)';
                                        } else {
                                          return null;
                                        }
                                      }
                                    ],
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[ ]')),
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextInputWidget(
                                  inputName: "password_input",
                                  inputLabel: "Password",
                                  inputHint: "Your password",
                                  controller: inputPassword,
                                  keyboardType: TextInputType.text,
                                  password: true,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(15),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 20,
                                  padding: const EdgeInsets.all(0),
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerLeft,
                                    ),
                                    child: const Text(
                                      'Forgot password ?',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorBlueDark,
                                      ),
                                    ),
                                    onPressed: () {
                                      /*
                                        Navigator.of(context).push(
                                          SlideLeftRouteWidget(
                                            const ForgotPasswordScreen(),
                                          ),
                                        );*/
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        PrimaryButtonWidget(
                          buttonLabel: "Sign in",
                          onPressed: () {
                            if (connectivity()) {
                              Navigator.of(context).push(
                                SlideLeftRouteWidget(
                                  const HomeScreen(),
                                ),
                              );
                              //  loginUsers();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
