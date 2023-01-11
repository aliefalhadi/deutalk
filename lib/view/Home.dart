import 'package:deutalk/config/locator.dart';
import 'package:deutalk/constants/Dictionary.dart';
import 'package:deutalk/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String name = '';

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        name = value.getString('name');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: EndDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          Dictionary.appName,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () {
                print(_drawerKey.currentState);
                _drawerKey.currentState.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo " + name + ",",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Ayo tingkatkan skill bahasa Prancis kamu",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/kamus');
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cari kosa kata",
                        style: TextStyle(color: Colors.grey),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Your Lesson",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/kamus');
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Image.asset(
                          'assets/images/kamuss.png',
                          width: 24,
                        ),
                      ),
                      title: Text(Dictionary.menuKamus),
                      subtitle: Text("Daftar kata"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/modul');
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Image.asset(
                          'assets/images/modull.png',
                          width: 24,
                        ),
                      ),
                      title: Text(Dictionary.menuBelajar),
                      subtitle: Text("Modul pembelajaran"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/modul/latihan');
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: Image.asset(
                          'assets/images/latihan22.png',
                          width: 24,
                        ),
                      ),
                      title: Text(Dictionary.menuLatihan),
                      subtitle: Text("Pengucapan bahasa Prancis"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Image.asset(
                          'assets/images/panduan2.png',
                          width: 24,
                        ),
                      ),
                      title: Text(Dictionary.menuPanduan),
                      subtitle: Text("Aplikasi"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ),
                  // MenuContainer(
                  //   title: Dictionary.menuPanduan,
                  //   subtitle: "Aplikasi",
                  //   image: Dictionary.imageMenuPanduan,
                  //   color: Colors.indigo,
                  //   onTap: () {
                  //     Alert(
                  //       context: context,
                  //       type: AlertType.none,
                  //       title: "PANDUAN APLIKASI",
                  //       content: Column(
                  //         children: [
                  //           Text(
                  //             "Aplikasi pembelajaran Bahasa Perancis ini memiliki materi pembelajaran berasal dari buku \"Jago Kuasai Bahasa Jerman\" yang ditulis oleh Dian Dwi Anisa dan Cindhy Dwi Meidany",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //           SizedBox(
                  //             height: 8,
                  //           ),
                  //           Text(
                  //             "Aplikasi ini memiliki 6 sub menu materi yang terdiri dari kata sambung, kata bantu, kata sifat, kata ganti tunjuk, kata kerja dan kata benda.",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //           SizedBox(
                  //             height: 8,
                  //           ),
                  //           Text(
                  //             "Dibawah ini adalah panduan menggunakan aplikasi:",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //           Text(
                  //             "1. Pengguna aplikasi login menggunakan akun google.",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //           Text(
                  //             "2. pengguna bisa belajar materi pada menu belajar.",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //           Text(
                  //             "3. Penguna bisa melihat kosa kata bahasa Jerman pada menu kamus.",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //           Text(
                  //             "4. Pengguna bisa menyelesaikan semua kategori latihan pengucapakan pada menu latihan.",
                  //             textAlign: TextAlign.justify,
                  //             style: Theme.of(context).textTheme.bodyText1,
                  //           ),
                  //         ],
                  //       ),
                  //       buttons: [
                  //         DialogButton(
                  //           child: Text(
                  //             "OK",
                  //             style: TextStyle(
                  //                 color: Colors.white, fontSize: 20),
                  //           ),
                  //           onPressed: () => Navigator.pop(context),
                  //           width: 120,
                  //         )
                  //       ],
                  //     ).show();
                  //   },
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                ),
                InkWell(
                  child: ListTile(
                    title: Text(''),
                  ),
                  onTap: () async {
//                          Navigator.pop(context);
//                            Navigator.pushNamed(context, 'ganti-password');
                  },
                ),
                Divider(
                  height: 1,
                ),
                InkWell(
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Keluar'),
                  ),
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Keluar"),
                            content: Text("Apakah anda yakin?"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Batal",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              FlatButton(
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (dialogContex) {
                                        return WillPopScope(
                                          onWillPop: () async => false,
                                          child: Center(
                                            child: Card(
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                padding: EdgeInsets.all(12.0),
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                  bool res =
                                      await locator<LoginProvider>().logout();
                                  if (res) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/login',
                                            (Route<dynamic> route) => false);
                                  }
                                },
                                child: Text("Keluar"),
                              )
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function onTap;
  final Color color;

  MenuContainer(
      {this.image, this.title, this.onTap, this.color, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 170,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  image,
                  width: 120,
                ))
          ],
        ),
      ),
    );
  }
}
