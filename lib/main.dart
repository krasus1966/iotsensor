

import 'package:flutter/material.dart';
import 'package:iot_sensor/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness _brightness = Brightness.light;
  IconData _themeIcons = Icons.brightness_2;
  String _themeTitle = "夜间";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(brightness: _brightness),
        home: Scaffold(
          drawer: Drawer(
              child: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: UserAccountsDrawerHeader(
                        accountName: Text("出现问题请联系"),
                        accountEmail: Text("2134123985@qq.com"))),
                Expanded(
                    flex: 10,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        ListTile(
                          title: Text("更新"),
                          leading: Icon(Icons.update),
                          onTap: () {},
                        ),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.zero,
                        child: ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                              onPressed: _changeTheme,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: Column(
                                  children: [
                                    Icon(_themeIcons),
                                    Text(_themeTitle)
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            )
                          ],
                        )))
              ],
            ),
          )),
          body: HomePage(),
        ));
  }

  _changeTheme() {
    setState(() {
      if (_brightness == Brightness.light) {
        _themeIcons = Icons.wb_sunny;
        _brightness = Brightness.dark;
        _themeTitle = "白天";
      } else {
        _themeIcons = Icons.brightness_2;
        _brightness = Brightness.light;
        _themeTitle = "夜间";
      }
    });
  }
}
