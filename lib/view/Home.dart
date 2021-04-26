import 'dart:developer';

import 'package:deutalk/config/appTheme.dart';
import 'package:deutalk/constants/Dictionary.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(Dictionary.appName),
        actions: [
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: AppTheme.white,
              ),
              label: Container())
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Find your favorite course here",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(8),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Cari kosa kata",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Your Lesson",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuContainer(
                        title: Dictionary.menuKamus,
                        image: Dictionary.imageMenuKamus,
                        onTap: () {
                          Navigator.pushNamed(context, '/kamus');
                        },
                      ),
                      MenuContainer(
                        title: Dictionary.menuBelajar,
                        image: Dictionary.imageMenuBelajar,
                        onTap: () {
                          print('halo');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuContainer(
                        title: Dictionary.menuLatihan,
                        image: Dictionary.imageMenuLatihan,
                        onTap: () {
                          print('halo');
                        },
                      ),
                      MenuContainer(
                        title: Dictionary.menuPanduan,
                        image: Dictionary.imageMenuPanduan,
                        onTap: () {
                          print('halo');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;

  MenuContainer({this.image, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width / 2.7,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Image.asset(
              image,
              width: 60,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
