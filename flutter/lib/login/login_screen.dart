import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Form(
        child: Column(
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: '*', style: TextStyle(color: Colors.red)),
              TextSpan(text: 'Email'),
            ])),
            TextFormField(
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
            SizedBox(
              height: mediaSize.height * 0.1,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: '*', style: TextStyle(color: Colors.red)),
              TextSpan(text: 'Email'),
            ])),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              obscuringCharacter: '*',
              validator: (value) {
                final passwordRegex = RegExp(
                    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
                if (passwordRegex.hasMatch(value!)) {
                  return null;
                } else {
                  return 'Your password must contain atleast a minimum of 8 characters, 1 uppercase and lowercase and 1 special character.';
                }
              },
            ),
            SizedBox(
              height: mediaSize.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
