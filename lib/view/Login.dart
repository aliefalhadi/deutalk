import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:deutalk/config/locator.dart';
import 'package:deutalk/provider/LoginProvider.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageController _pageController = PageController();

  void _onNextTap(OnBoardState onBoardState) async {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      bool res = await locator<LoginProvider>().login();
      if (res) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        Toast.show("Maaf terjadi kesalahan, silahkan coba lagi.", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
  }

  final List<OnBoardModel> onBoardData = [
    OnBoardModel(
      title: "Tingkatkan skill bahasa Jermanmu",
      description:
          "Terdapat fitur kamus, kalimat dan latihan untuk meningkatkan skill bahasa Jermanmu",
      imgUrl: "assets/images/welcome.png",
    ),
    OnBoardModel(
      title: "Kamus bahasa Jerman",
      description: "Banyak kata bahasa Jerman baru yang dapat kamu pelajari",
      imgUrl: 'assets/images/kamus.png',
    ),
    OnBoardModel(
      title: "Latihan pelafalan bahasa Jerman",
      description: "Selesaikan semua modul latihan yang tersedia",
      imgUrl: 'assets/images/latihankamus.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: OnBoard(
            pageController: _pageController,
            onSkip: () {
              print('skipped');
            },
            onDone: () async {
              bool res = await locator<LoginProvider>().login();
              if (res) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              } else {
                Toast.show(
                    "Maaf terjadi kesalahan, silahkan coba lagi.", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              }
            },
            onBoardData: onBoardData,
            titleStyles: TextStyle(
              color: Colors.blueAccent,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.15,
            ),
            descriptionStyles: TextStyle(
              fontSize: 16,
              color: Colors.brown.shade300,
            ),
            pageIndicatorStyle: PageIndicatorStyle(
              width: 100,
              inactiveColor: Colors.blueGrey,
              activeColor: Colors.blueAccent,
              inactiveSize: Size(8, 8),
              activeSize: Size(12, 12),
            ),
            skipButton: FlatButton(
              onPressed: () {
                print('skipped');
              },
              child: Text(''),
            ),
            nextButton: Consumer<OnBoardState>(
              builder:
                  (BuildContext context, OnBoardState state, Widget child) {
                return InkWell(
                  onTap: () => _onNextTap(state),
                  child: Container(
                    width: 230,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      ),
                    ),
                    child: Text(
                      state.isLastPage ? "Login" : "Selanjutnya",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
