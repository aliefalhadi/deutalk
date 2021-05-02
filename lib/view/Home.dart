import 'package:deutalk/config/locator.dart';
import 'package:deutalk/constants/Dictionary.dart';
import 'package:flutter/material.dart';
import 'package:deutalk/provider/LoginProvider.dart';
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
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value){
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
                      "Halo "+name+",",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Ayo tingkatkan skill bahasa jerman kamu",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )),
            Container(
              child: InkWell(
                onTap: (){
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuContainer(
                        title: Dictionary.menuKamus,
                        image: Dictionary.imageMenuKamus,
                        color: Colors.deepPurple,
                        onTap: () {
                          Navigator.pushNamed(context, '/kamus');
                        },
                      ),
                      MenuContainer(
                        title: Dictionary.menuBelajar,
                        image: Dictionary.imageMenuBelajar,
                        color: Colors.blueAccent,
                        onTap: () {
                          Navigator.pushNamed(context, '/modul');
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
                        color: Colors.pink,
                        onTap: () {
                          Navigator.pushNamed(context, '/modul/latihan');
                        },
                      ),
                      MenuContainer(
                        title: Dictionary.menuPanduan,
                        image: Dictionary.imageMenuPanduan,
                        color: Colors.indigo,
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
                                                padding: EdgeInsets.all(
                                                    12.0),
                                                child:
                                                CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                  bool res =
                                  await locator<LoginProvider>()
                                      .logout();
                                  if (res) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                        '/login',
                                            (Route<dynamic> route) =>
                                        false);
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
  final Function onTap;
  final Color color;

  MenuContainer({this.image, this.title, this.onTap, this.color});

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
                    "Daftar kata",
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
