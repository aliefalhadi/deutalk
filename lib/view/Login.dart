import 'package:deutalk/config/locator.dart';
import 'package:deutalk/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/banner.png'),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "PrancisApp",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Apakah kamu siap untuk belajar bahasa prancis dengan mudah dan menyenangkan?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 32,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: RaisedButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.deepPurple,
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        bool res = await locator<LoginProvider>().login();
                        if (res) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        } else {
                          Toast.show(
                              "Maaf terjadi kesalahan, silahkan coba lagi.",
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
