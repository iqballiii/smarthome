import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:smart_switches/presenter/login_presenter.dart';
import 'package:smart_switches/routes/routes_names.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginscreenContract {
  _LoginScreenState() {
    _presenter = LoginScreenPresenter(this);
  }
  late LoginScreenPresenter _presenter;
  final TextEditingController usernameField = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> showPassword = ValueNotifier(true);

  togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  String? passwordValidator(String? value) {
    final passwordRegex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    if (passwordRegex.hasMatch(value!)) {
      return null;
    } else {
      return 'Your password must contain atleast a minimum of 8 characters, 1 uppercase and lowercase and 1 special character.';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: AutofillGroup(
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaSize.height * 0.2,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.black),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    controller: usernameField,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black),
                    autofillHints: [AutofillHints.email],
                    decoration: InputDecoration(
                        // labelText: 'Email',
                        // floatingLabelBehavior: FloatingLabelBehavior.a1lways,
                        ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (emailValue) {
                      if (EmailValidator.validate(emailValue!)) {
                        return null;
                      } else {
                        return 'Please enter a valid email';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: mediaSize.height * 0.1,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.black),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ValueListenableBuilder<bool>(
                      valueListenable: showPassword,
                      builder: (context, value, _) {
                        return TextFormField(
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.password],
                          obscureText: value,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black),
                          decoration: InputDecoration(
                              suffix: IconButton(
                                  onPressed: () {
                                    togglePasswordVisibility();
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
                              errorMaxLines: 3
                              // labelText: 'Password',
                              // floatingLabelBehavior: FloatingLabelBehavior.always
                              ),
                          obscuringCharacter: '*',
                          validator: passwordValidator,
                        );
                      }),
                ),
                SizedBox(
                  height: mediaSize.height * 0.2,
                ),
                SizedBox(
                  height: mediaSize.height * 0.056,
                  width: mediaSize.width * 0.8,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xff292d32),
                      ),
                    ),
                    onPressed: () async {
                      if (_loginFormKey.currentState!.validate()) {
                        await _presenter.loginUser(
                            usernameField.text, passwordController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Please fill up the required fields.')));
                      }
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(data) {
    Logger().e(data);
  }

  @override
  void onLoginSuccess(data) {
    Logger().i(data);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.dashboardScreen, (route) => false);
  }
}
