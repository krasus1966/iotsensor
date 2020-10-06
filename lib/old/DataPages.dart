import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'pojo/NewData.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int datanum;
  int nodenum;
  String date;
  String time;
  double nodevoltage;
  double biopointvoltage1;
  double biopointvoltage2;
  double biopointvoltage3;
  int illumination;
  double airtemperature;
  double airhumidity;
  double soiltemperature;
  double soilhumidity;
  int weight1;
  int weight2;

  //初始化时执行其中方法
  @override
  void initState() {
    _itemsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = new TextStyle(fontSize: 20);
    TextStyle dataTextStyle = new TextStyle(fontSize: 15);
    return Scaffold(
      appBar: AppBar(
        title: Text("iot", textAlign: TextAlign.center),
        centerTitle: true,
        leading: Icon(Icons.send),
        backgroundColor: Color.fromRGBO(66, 129, 94, 1),
      ),

      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Row(
                  // 横向滑动的按钮组，存放节点号
                  children: _buttomItems(),
                ),
              ],
            ),
          ),
          Expanded(
            // 可下拉刷新页面，下拉后调用 _handleRefresh 方法，重新获取数据
              child: RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("节点号", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$nodenum",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("数据号", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$datanum",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("日期", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child:
                                          Text("$date", style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("时间", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child:
                                          Text("$time", style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("节点电压", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$nodevoltage",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("生物点电压1", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$biopointvoltage1",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("生物点电压2", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$biopointvoltage2",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("生物点电压3", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$biopointvoltage3",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("光照强度", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$illumination",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("环境温度", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$airtemperature",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("环境湿度", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$airhumidity",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("土壤温度", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$soiltemperature",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("土壤湿度", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$soilhumidity",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("重量1", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$weight1",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("重量2", style: titleTextStyle),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("$weight2",
                                          style: dataTextStyle),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(""),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh))
        ],
      ),
    );
  }

  List<dynamic> _nodeList = [];

  _buttomItems() {
    return _nodeList.map((_nodeList) {
      return Container(
          margin: EdgeInsets.all(3),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                this.nodenum = _nodeList;
                getData();
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text("节点$_nodeList"),
              ],
            ),
          ));
    }).toList();
  }

  Future<Null> _handleRefresh() async {
    Future.delayed(Duration(milliseconds: 200), () {
      getData();
    });
  }

  // 请求获取节点数量
  Future _itemsData() async {
    final response = await http.post('http://krasus1966.top/iot/nodelist');
    List nodelist = json.decode(response.body);
    setState(() {
      _nodeList = nodelist;
      nodenum = _nodeList.first;
      print(nodenum);
    });
    await getData();
  }

  // 请求获取特定节点的数据
  Future getData() async {
    print(nodenum);
    final response =
        await http.post('http://krasus1966.top/iot/dataJson?NodeNum=$nodenum');
    print(response.body.length);
    if (response.body.length == 0) {
      setState(() {
        datanum = 0;
        date = null;
        time = null;
        nodevoltage = 0;
        biopointvoltage1 = 0;
        biopointvoltage2 = 0;
        biopointvoltage3 = 0;
        illumination = 0;
        airtemperature = 0;
        airhumidity = 0;
        soiltemperature = 0;
        soilhumidity = 0;
        weight1 = 0;
        weight2 = 0;
        print(weight1);
      });
    } else {
      NewdataModel value = NewdataModel.fromJson(json.decode(response.body));
      setState(() {
        datanum = value.datanum;
        date = value.date;
        time = value.time;
        nodevoltage = value.nodevoltage;
        biopointvoltage1 = value.biopointvoltage1;
        biopointvoltage2 = value.biopointvoltage2;
        biopointvoltage3 = value.biopointvoltage3;
        illumination = value.illumination;
        airtemperature = value.airtemperature;
        airhumidity = value.airhumidity;
        soiltemperature = value.soiltemperature;
        soilhumidity = value.soilhumidity;
        weight1 = value.weight1;
        weight2 = value.weight2;
      });
    }
  }
}
