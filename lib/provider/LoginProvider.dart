import 'package:deutalk/provider/BaseProvider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends BaseProvider {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  int _page = 0;
  bool _isLastPage = false;

  int get page => _page;
  bool get isLastPage => _isLastPage;

  void onPageChanged(int page, int dataLength) {
    _page = page;
    _isLastPage = _page == dataLength - 1;
    notifyListeners();
  }

  Future login() async {
    try {
      print('asd');
      await _googleSignIn.signIn();


      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('isLogin', true);
      sharedPreferences.setString('email', _googleSignIn.currentUser.email);
      sharedPreferences.setString('name', _googleSignIn.currentUser.displayName);
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future logout() async {
    await _googleSignIn.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLogin', false);
    await sharedPreferences.clear();
    return true;
  }
}
