import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexLatihan extends StatefulWidget {
  @override
  _IndexLatihanState createState() => _IndexLatihanState();
}

class _IndexLatihanState extends State<IndexLatihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          "Modul Latihan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                "Daftar Latihan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    color: Colors.orangeAccent,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    color: Colors.orangeAccent,
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
