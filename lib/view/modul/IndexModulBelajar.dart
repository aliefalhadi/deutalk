import 'package:deutalk/model/DaftarModulBelajarModel.dart';
import 'package:flutter/material.dart';
import 'package:deutalk/provider/ModulProvider.dart';
import 'package:deutalk/constants/ViewState.dart';
import 'package:deutalk/view/BaseView.dart';

class IndexModulBelajar extends StatefulWidget {
  final String namaModul, idModul;
  IndexModulBelajar({this.namaModul, this.idModul});
  @override
  _IndexModulBelajarState createState() => _IndexModulBelajarState();
}

class _IndexModulBelajarState extends State<IndexModulBelajar> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ModulProvider>(
      onModelReady: (model) => model.getDaftarModulBelajar(widget.idModul),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.namaModul),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: provider.state == ViewState.Fetching &&
                    provider.daftarModulBelajarModel == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.state == ViewState.FetchNull &&
                        provider.daftarModulBelajarModel == null
                    ? Center(
                        child: Text("data tidak ditemukan"),
                      )
                    : ListView.builder(
                        itemCount: provider.state == ViewState.Fetching
                            ? provider.daftarModulBelajarModel.data.length + 1
                            : provider.daftarModulBelajarModel.data.length,
                        itemBuilder: (context, index) {
                          if (provider.state == ViewState.Fetching &&
                              index ==
                                  provider
                                      .daftarModulBelajarModel.data.length) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else {
                            DatumBelajar dataModul =
                                provider.daftarModulBelajarModel.data[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/modul/belajar/detail',
                                    arguments: index);
                              },
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    dataModul.polaBelajar,
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
