import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iot_sensor/dao/list_data_dao.dart';
import 'package:iot_sensor/model/data_model.dart';
import 'package:iot_sensor/model/list_data_model.dart';
import 'package:iot_sensor/widget/chart_data_widget.dart';
import 'package:iot_sensor/widget/node_button_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<dynamic> _nodeList = [];
  ListDataModel listDataModel;
  int nodeNum;
  String resultString = "";

  // 请求获取节点数量
  _itemsData() async {
    final response = await http.post('http://krasus1966.top/iot/nodelist');
    _nodeList = json.decode(response.body);
    setState(() {
      if (nodeNum == null) {
        nodeNum = _nodeList.first;
        _getData();
      }
    });
  }

  // 通过节点号获取当前节点所有数据
  Future _getData() async {
    ListDataDao.fetch(nodeNum).then((result) {
      setState(() {
        listDataModel = result;
      });
    }).catchError((e) {
      throw e;
    });
  }

  // 通过节点号获取当前节点所有数据
  Future _getData2() async {
    ListDataDao.fetch(nodeNum).then((result) {
      return result;
    }).catchError((e) {
      throw e;
    });
  }

  // 节点按钮封装
  _buttomItems() {
    return _nodeList.map((_nodeList) {
      return MaterialButton(
        onPressed: () {
          setState(() {
            nodeNum = _nodeList;
            _getData();
          });
        },
        child: NodeButton(nodeNum: _nodeList),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      );
    }).toList();
  }

  // 图表数据封装
  _dataChart(String title, dynamic data) {
    return LineSeries<DataModel, dynamic>(
      name: title,
      enableTooltip: true,
      dataSource: listDataModel.biovolt,
      xValueMapper: (DataModel biovolt, _) => biovolt.time,
      yValueMapper: data,
    );
  }

  @override
  void initState() {
    super.initState();
    // 初始化时加载节点数量与按钮
    _itemsData();
  }

  @override
  Widget build(BuildContext context) {
    // print(nodeNum);
    // return Column(children: [
    //   Container(
    //     height: 60,
    //     child: ListView(
    //       scrollDirection: Axis.horizontal,
    //       children: [Row(children: _buttomItems())],
    //     ),
    //   ),
    //   FutureBuilder(
    //       future: _getData(),
    //       builder: (BuildContext context, AsyncSnapshot snapShot) {
    //         if (snapShot.connectionState == ConnectionState.waiting) {
    //           return Text('Loading...');
    //         } else if (snapShot.connectionState == ConnectionState.done) {
    //           if (snapShot.hasError) {
    //             return Text('Error: ${snapShot.error}');
    //           }
    //           if (snapShot.hasData) {
    //             setState(() {
    //               listDataModel = snapShot.data;
    //             });
    //             return Expanded(
    //               child: ListView(
    //                 children: [
    //                   ChartData(
    //                     title: "节点电压",
    //                     chartDataModels: [
    //                       _dataChart("节点电压",
    //                           (DataModel biovolt, _) => biovolt.nodevoltage),
    //                     ],
    //                   ),
    //                   ChartData(
    //                     title: "生物点电压",
    //                     chartDataModels: [
    //                       _dataChart(
    //                           "生物点电压1",
    //                           (DataModel biovolt, _) =>
    //                               biovolt.biopointvoltage1),
    //                       _dataChart(
    //                           "生物点电压2",
    //                           (DataModel biovolt, _) =>
    //                               biovolt.biopointvoltage2),
    //                       _dataChart(
    //                           "生物点电压3",
    //                           (DataModel biovolt, _) =>
    //                               biovolt.biopointvoltage3),
    //                     ],
    //                   ),
    //                   ChartData(
    //                     title: "光照强度",
    //                     chartDataModels: [
    //                       _dataChart("光照强度",
    //                           (DataModel biovolt, _) => biovolt.illumination),
    //                     ],
    //                   ),
    //                   ChartData(
    //                     title: "温度",
    //                     chartDataModels: [
    //                       _dataChart("环境温度",
    //                           (DataModel biovolt, _) => biovolt.airtemperature),
    //                       _dataChart(
    //                           "土壤温度",
    //                           (DataModel biovolt, _) =>
    //                               biovolt.soiltemperature),
    //                     ],
    //                   ),
    //                   ChartData(
    //                     title: "湿度",
    //                     chartDataModels: [
    //                       _dataChart("环境湿度",
    //                           (DataModel biovolt, _) => biovolt.airhumidity),
    //                       _dataChart("土壤湿度",
    //                           (DataModel biovolt, _) => biovolt.soilhumidity),
    //                     ],
    //                   ),
    //                   ChartData(
    //                     title: "重量",
    //                     chartDataModels: [
    //                       _dataChart(
    //                           "重量1", (DataModel biovolt, _) => biovolt.weight1),
    //                       _dataChart(
    //                           "重量2", (DataModel biovolt, _) => biovolt.weight2),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             );
    //           }
    //           return Text("请求成功，获取数据失败！");
    //         } else {
    //           return Text("获取数据失败！");
    //         }
    //       }),
    // ]);
    try {
      return listDataModel == null ? Center(child: Text("数据加载中"),) : Column(
        children: [
          Container(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [Row(children: _buttomItems())],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ChartData(
                  title: "节点电压",
                  chartDataModels: [
                    _dataChart(
                        "节点电压", (DataModel biovolt, _) => biovolt.nodevoltage),
                  ],
                ),
                ChartData(
                  title: "生物点电压",
                  chartDataModels: [
                    _dataChart("生物点电压1",
                            (DataModel biovolt, _) => biovolt.biopointvoltage1),
                    _dataChart("生物点电压2",
                            (DataModel biovolt, _) => biovolt.biopointvoltage2),
                    _dataChart("生物点电压3",
                            (DataModel biovolt, _) => biovolt.biopointvoltage3),
                  ],
                ),
                ChartData(
                  title: "光照强度",
                  chartDataModels: [
                    _dataChart(
                        "光照强度", (DataModel biovolt, _) => biovolt.illumination),
                  ],
                ),
                ChartData(
                  title: "温度",
                  chartDataModels: [
                    _dataChart(
                        "环境温度", (DataModel biovolt, _) =>
                    biovolt.airtemperature),
                    _dataChart("土壤温度",
                            (DataModel biovolt, _) => biovolt.soiltemperature),
                  ],
                ),
                ChartData(
                  title: "湿度",
                  chartDataModels: [
                    _dataChart(
                        "环境湿度", (DataModel biovolt, _) => biovolt.airhumidity),
                    _dataChart(
                        "土壤湿度", (DataModel biovolt, _) => biovolt.soilhumidity),
                  ],
                ),
                ChartData(
                  title: "重量",
                  chartDataModels: [
                    _dataChart(
                        "重量1", (DataModel biovolt, _) => biovolt.weight1),
                    _dataChart(
                        "重量2", (DataModel biovolt, _) => biovolt.weight2),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    } catch (e) {
      return Center(child: Text("获取数据失败！"),);
    }
  }
}
