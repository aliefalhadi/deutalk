import 'package:deutalk/config/appTheme.dart';
import 'package:deutalk/constants/ViewState.dart';
import 'package:deutalk/provider/ModulLatihanProvider.dart';
import 'package:deutalk/view/BaseView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndexLatihan extends StatefulWidget {
  @override
  _IndexLatihanState createState() => _IndexLatihanState();
}

class _IndexLatihanState extends State<IndexLatihan> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ModulLatihanProvider>(
      onModelReady: (model) => model.initDataModul(),
      builder: (context, provider, child) {
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
            child: provider.state == ViewState.Fetching
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60))),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppTheme.colorSeashell,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: CircularPercentIndicator(
                                  radius: 100.0,
                                  lineWidth: 13.0,
                                  animation: true,
                                  percent: provider.totalProgres / 100,
                                  center: new Text(
                                    provider.totalProgres.round().toString() + "%",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: AppTheme.colorRoyalBlue,
                                ),
                              ),
                              SizedBox(
                                width: 32,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Good Result !",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Your Germany has been improved.",
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                          runSpacing: 16,
                          children: List.generate(
                              provider.daftarModulLatihanModel.data.length,
                              (index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                        context, '/modul/latihan/soal',
                                        arguments: provider
                                            .listProgressLatihanUser[index])
                                    .then((value) => provider.initDataModul());
                              },
                              child: CardListLatihan(
                                namaModul: provider.daftarModulLatihanModel
                                    .data[index].model.namaModulLatihan,
                                progres: provider.listProgressLatihanUser[index]['nilaiProses'].toDouble(),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class CardListLatihan extends StatelessWidget {
  final String namaModul;
  final double progres;

  CardListLatihan({this.namaModul, this.progres});

  @override
  Widget build(BuildContext context) {
    print(progres);
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      padding: EdgeInsets.all(16),
      height: 195,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlue.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 8,
                  offset: Offset(0, 8), // changes position of shadow
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/kamus.png',
              width: 30,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 55,
            child: Text(
              namaModul,
              style: AppTheme.textBold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Progress latihan "+ progres.round().toString() +"%",
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 8,
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            width: 120,
            lineHeight: 6.0,
            percent: progres/100,
            progressColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
