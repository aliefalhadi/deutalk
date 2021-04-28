import 'package:deutalk/constants/ViewState.dart';
import 'package:flutter/material.dart';
import 'package:deutalk/model/DaftarModulModel.dart';
import 'package:deutalk/provider/ModulProvider.dart';
import 'package:deutalk/view/BaseView.dart';

class ModulIndex extends StatefulWidget {
  @override
  _ModulIndexState createState() => _ModulIndexState();
}

class _ModulIndexState extends State<ModulIndex> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ModulProvider>(
      onModelReady: (model) => model.initDataModul(),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Daftar Modul Belajar"),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: provider.state == ViewState.Fetching &&
                    provider.listModul.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.state == ViewState.FetchNull &&
                        provider.listModul.length == 0
                    ? Center(
                        child: Text("data tidak ditemukan"),
                      )
                    : ListView.builder(
                        itemCount: provider.state == ViewState.Fetching
                            ? provider.listModul.length + 1
                            : provider.listModul.length,
                        itemBuilder: (context, index) {
                          if (provider.state == ViewState.Fetching &&
                              index == provider.listModul.length) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else {
                            Datum dataModul = provider.listModul[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/modul/belajar',
                                    arguments: {
                                      'idModul': dataModul.idModul.toString(),
                                      'namaModul': dataModul.namaModul
                                    });
                              },
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    dataModul.namaModul,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: Icon(
                                    Icons.book,
                                    color: Colors.blue,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
          ),
        );
      },
    );
  }
}
