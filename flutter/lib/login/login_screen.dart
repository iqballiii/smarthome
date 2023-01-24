import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameField = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0.0,
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: usernameField,
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
                child: Text('Password',
                    style: Theme.of(context).textTheme.subtitle1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: passwordController,
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
            ),
            SizedBox(
              height: mediaSize.height * 0.2,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: usernameField.text,
                      password: passwordController.text);
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
