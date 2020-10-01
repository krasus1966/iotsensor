import 'package:flutter/material.dart';

import 'ChartPage.dart';
import 'DataPages.dart';

void main() => runApp(DynamicThemeState());

class DynamicThemeState extends StatefulWidget {
  @override
  _DynamicThemeStateState createState() => _DynamicThemeStateState();
}

class _DynamicThemeStateState extends State<DynamicThemeState> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Iot_Sensor",
      theme: ThemeData(
        brightness: _brightness,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    //将页面增加到组件列表中
    pages..add(DataPage())..add(ChartPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //侧边栏，通过右划打开
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("出现问题请联系"),
                accountEmail: Text("2134123985@qq.com")),
            ListTile(
              title: Text("更新 "),
              leading: Icon(Icons.update),
              onTap: () {},
            ),
          ],
        ),
      ),
      //底部按钮组
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //按钮列表
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("实时数据"),
            icon: Icon(Icons.refresh),
            backgroundColor: Color.fromRGBO(66, 129, 94, 1),
          ),
          BottomNavigationBarItem(
            title: Text("数据图表"),
            icon: Icon(Icons.photo_size_select_actual),
            backgroundColor: Color.fromRGBO(66, 129, 94, 1),
          ),
        ],
      ),
      // 页面的切换是通过改变_currentIndex的值来实现
      body: pages[_currentIndex],
    );
  }
}
