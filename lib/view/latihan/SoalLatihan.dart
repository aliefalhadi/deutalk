import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deutalk/provider/ModulLatihanSoalProvider.dart';
import 'package:deutalk/constants/ViewState.dart';
import 'package:deutalk/view/BaseView.dart';

class SoalLatihan extends StatefulWidget {
  final Map dataProgresLatihanModul;
  SoalLatihan({this.dataProgresLatihanModul});
  @override
  _SoalLatihanState createState() => _SoalLatihanState();
}

class _SoalLatihanState extends State<SoalLatihan> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ModulLatihanSoalProvider>(
      onModelReady: (model) => model.initDataSoalModulLatihan(
          widget.dataProgresLatihanModul['idModulLatihan'].toString()),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Latihan " +
                widget.dataProgresLatihanModul['namaModulLatihan']),
          ),
          body: provider.state == ViewState.Fetching
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                      itemCount: provider.listDaftarSoal.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                        context, '/modul/latihan/soal/jawab',
                                        arguments: index)
                                    .then((value) =>
                                        provider.initDataSoalModulLatihan(widget
                                            .dataProgresLatihanModul[
                                                'idModulLatihan']
                                            .toString()));
                              },
                              child: Card(
                                margin: EdgeInsets.zero,
                                child: Container(
                                  child: ListTile(
                                    leading: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: provider.listDaftarSoal[index]
                                                  ['isSelesai']
                                              ? Colors.lightBlue
                                                  .withOpacity(0.5)
                                              : Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(
                                        Icons.assignment,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      provider.daftarSoalModulLatihanModel
                                          .data[index].textTerjemahan,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      provider.listDaftarSoal[index]
                                              ['isSelesai']
                                          ? "kamu sudah selesaikan soal"
                                          : "kamu belum selesaikan soal",
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      })),
        );
      },
    );
  }
}
