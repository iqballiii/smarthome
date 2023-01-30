import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginscreenContract {
  void onLoginSuccess(data);
  void onLoginError(data);
}

class LoginScreenPresenter {
  late LoginscreenContract _view;
  LoginScreenPresenter(this._view);
  Future loginUser(String email, password) async {
    //  try {
    // var data =
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => _view.onLoginSuccess(value))
        .catchError((error) => _view.onLoginError(error));
    //   Logger().i(data);
    // } catch (e) {
    //   FirebaseAuthException exception =
    //       e as FirebaseAuthException;
    //   Logger().e(exception.code);
    //   Logger().e(exception.message);
    // }
  }
}
