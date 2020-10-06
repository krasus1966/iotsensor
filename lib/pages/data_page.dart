import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iot_sensor/dao/data_dao.dart';
import 'package:iot_sensor/model/data_model.dart';
import 'package:iot_sensor/widget/data_chip_widget.dart';
import 'package:iot_sensor/widget/node_button_widget.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<dynamic> _nodeList = [];
  int nodeNum;
  String resultString = "";
  DataModel biovolt;

  // 刷新数据操作
  Future<Null> _handleRefresh() async {
    Future.delayed(Duration(milliseconds: 200), () {
      _getData(nodeNum);
    });
  }

  // 请求获取节点数量
  Future _itemsData() async {
    final response = await http.post('http://krasus1966.top/iot/nodelist');
    setState(() {
      _nodeList = json.decode(response.body);
      if (nodeNum == null) {
        nodeNum = _nodeList.first;
      }
    });
    _getData(nodeNum);
  }

  // 通过节点号获取当前节点最新数据
  Future _getData(nodeNum) async {
    DataDao.fetch(nodeNum).then((result) {
      setState(() {
        biovolt = result;
      });
    }).catchError((e) {
      throw e;
    });
  }

  _buttomItems() {
    return _nodeList.map((_nodeList) {
      return MaterialButton(
        onPressed: () {
          setState(() {
            nodeNum = _nodeList;
            _getData(nodeNum);
          });
        },
        child: NodeButton(nodeNum: _nodeList),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      );
    }).toList();
  }

  //初始化方法
  @override
  void initState() {
    super.initState();
    _itemsData();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return biovolt == null
          ? Center(
              child: Text("数据加载中"),
            )
          : Container(
              child: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [Row(children: _buttomItems())],
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "节点号",
                                  data: biovolt.nodenum,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "数据号",
                                  data: biovolt.datanum,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "时间",
                                  data: biovolt.date + " " + biovolt.time,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "节点电压",
                                  data: biovolt.nodevoltage,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "生物点电压1",
                                  data: biovolt.biopointvoltage1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "生物点电压2",
                                  data: biovolt.biopointvoltage2,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "生物点电压3",
                                  data: biovolt.biopointvoltage3,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "环境温度",
                                  data: biovolt.airtemperature,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "环境湿度",
                                  data: biovolt.airhumidity,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "土壤温度",
                                  data: biovolt.soiltemperature,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "土壤湿度",
                                  data: biovolt.soilhumidity,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "光照强度",
                                  data: biovolt.illumination,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "重量1",
                                  data: biovolt.weight1,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DataCard(
                                  title: "重量2",
                                  data: biovolt.weight2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
    } catch (e) {
      return Center(
        child: Text("数据加载失败！"),
      );
    }
  }
}
