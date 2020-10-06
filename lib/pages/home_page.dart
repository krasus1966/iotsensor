import 'package:flutter/material.dart';
import 'package:iot_sensor/pages/chart_page.dart';
import 'package:iot_sensor/pages/data_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();
  String title = "";
  List<String> titles = List<String>()..add("实时数据")..add("数据图表");

  @override
  void initState() {
    super.initState();
    title = titles[_currentIndex];
    pages..add(DataPage())..add(ChartPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, textAlign: TextAlign.center),
        centerTitle: true,
        leading: Icon(Icons.send),
      ),
      //底部按钮组
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        unselectedIconTheme: IconTheme.of(context),
        selectedIconTheme: IconTheme.of(context),
        fixedColor: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            title = titles[_currentIndex];
          });
        },
        //按钮列表
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.blue,
            title: Text(
              "实时数据",
            ),
            icon: Icon(
              Icons.refresh,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "数据图表",
            ),
            icon: Icon(
              Icons.photo_size_select_actual,
            ),
            // backgroundColor: Colors.blue,
          ),
        ],
      ),
      // 页面的切换是通过改变_currentIndex的值来实现
      body: pages[_currentIndex],
    );
  }
}
