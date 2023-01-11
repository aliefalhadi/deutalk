import 'package:deutalk/config/locator.dart';
import 'package:deutalk/config/routes.dart';
import 'package:deutalk/provider/MainProvider.dart';
import 'package:deutalk/view/Home.dart';
import 'package:deutalk/view/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  MainProvider mainProvider = locator<MainProvider>();
  mainProvider.onStartApp().then((value) {
    return runApp(MyApp(
      route: value,
    ));
  });
}

class MyApp extends StatelessWidget {
  final String route;
  MyApp({this.route});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: route == '/login' ? Login() : Home(),
      onGenerateRoute: RouterApp.generateRoute,
    );
  }
}
