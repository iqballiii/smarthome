import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              validator: (value) {},
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
