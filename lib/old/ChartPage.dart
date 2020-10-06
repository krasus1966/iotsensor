import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'pojo/ListData.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Biovolt> list;
  int nodenum;

  @override
  void initState() {
    _itemsData();
    super.initState();
  }
  // 图表页，使用了谷歌的插件
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图表", textAlign: TextAlign.center),
          centerTitle: true,
          leading: Icon(Icons.send),
          backgroundColor: Color.fromRGBO(66, 129, 94, 1),
        ),
        body: FutureBuilder(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              } else if (snapShot.connectionState == ConnectionState.done) {
                if (snapShot.hasError) {
                  return Text('Error: ${snapShot.error}');
                }
                List<Biovolt> b1 = snapShot.data;
                return Column(children: <Widget>[
                  Container(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          children: _buttomItems(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SfCartesianChart(
                                  legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.top),
                                  title: ChartTitle(text: '节点电压'),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  trackballBehavior: TrackballBehavior(
                                      enable: true,
                                      tooltipSettings: InteractiveTooltip(
                                          enable: true, color: Colors.red)),
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      enablePinching: true,
                                      enableSelectionZooming: true,
                                      selectionRectBorderColor: Colors.red,
                                      selectionRectBorderWidth: 1,
                                      selectionRectColor: Colors.grey),
                                  primaryXAxis: CategoryAxis(
                                      maximumLabels: 3,
                                      labelPlacement: LabelPlacement.onTicks,
                                      interval: 2),
                                  series: <ChartSeries>[
                                    LineSeries<Biovolt, dynamic>(
                                      name: "节点电压",
                                      enableTooltip: true,
                                      dataSource: snapShot.data,
                                      xValueMapper: (Biovolt biovolt, _) =>
                                          biovolt.time,
                                      yValueMapper: (Biovolt biovolt, _) =>
                                          biovolt.nodevoltage,
                                    )
                                  ]),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SfCartesianChart(
                                  title: ChartTitle(text: '生物点电压'),
                                  legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.top),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  trackballBehavior: TrackballBehavior(
                                      enable: true,
                                      tooltipSettings: InteractiveTooltip(
                                          enable: true, color: Colors.red)),
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      enablePinching: true,
                                      enableSelectionZooming: true,
                                      selectionRectBorderColor: Colors.red,
                                      selectionRectBorderWidth: 1,
                                      selectionRectColor: Colors.grey),
                                  primaryXAxis: CategoryAxis(
                                      maximumLabels: 3,
                                      labelPlacement: LabelPlacement.onTicks,
                                      interval: 2),
                                  series: <ChartSeries>[
                                    LineSeries<Biovolt, dynamic>(
                                        name: "生物点电压1",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.biopointvoltage1),
                                    LineSeries<Biovolt, dynamic>(
                                        name: "生物点电压2",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.biopointvoltage2),
                                    LineSeries<Biovolt, dynamic>(
                                        name: "生物点电压3",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.biopointvoltage3)
                                  ]),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SfCartesianChart(
                                  title: ChartTitle(text: '光照强度'),
                                  legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.top),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  trackballBehavior: TrackballBehavior(
                                      // Enables the trackball
                                      enable: true,
                                      tooltipSettings: InteractiveTooltip(
                                          enable: true, color: Colors.red)),
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      enablePinching: true,
                                      enableSelectionZooming: true,
                                      selectionRectBorderColor: Colors.red,
                                      selectionRectBorderWidth: 1,
                                      selectionRectColor: Colors.grey),
                                  primaryXAxis: CategoryAxis(
                                      maximumLabels: 3,
                                      labelPlacement: LabelPlacement.onTicks,
                                      interval: 2),
                                  series: <ChartSeries>[
                                    LineSeries<Biovolt, dynamic>(
                                        name: "光照强度",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.illumination),
                                  ]),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SfCartesianChart(
                                  title: ChartTitle(text: '温度'),
                                  legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.top),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  trackballBehavior: TrackballBehavior(
                                      enable: true,
                                      tooltipSettings: InteractiveTooltip(
                                          enable: true, color: Colors.red)),
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      enablePinching: true,
                                      enableSelectionZooming: true,
                                      selectionRectBorderColor: Colors.red,
                                      selectionRectBorderWidth: 1,
                                      selectionRectColor: Colors.grey),
                                  primaryXAxis: CategoryAxis(
                                      maximumLabels: 3,
                                      labelPlacement: LabelPlacement.onTicks,
                                      interval: 2),
                                  series: <ChartSeries>[
                                    LineSeries<Biovolt, dynamic>(
                                        name: "环境温度",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.airtemperature),
                                    LineSeries<Biovolt, dynamic>(
                                        name: "土壤温度",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.soiltemperature),
                                  ]),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SfCartesianChart(
                                  title: ChartTitle(text: '湿度'),
                                  legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.top),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  trackballBehavior: TrackballBehavior(
                                      // Enables the trackball
                                      enable: true,
                                      tooltipSettings: InteractiveTooltip(
                                          enable: true, color: Colors.red)),
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      enablePinching: true,
                                      enableSelectionZooming: true,
                                      selectionRectBorderColor: Colors.red,
                                      selectionRectBorderWidth: 1,
                                      selectionRectColor: Colors.grey),
                                  primaryXAxis: CategoryAxis(
                                      maximumLabels: 3,
                                      labelPlacement: LabelPlacement.onTicks,
                                      interval: 2),
                                  series: <ChartSeries>[
                                    LineSeries<Biovolt, dynamic>(
                                        name: "环境湿度",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.airhumidity),
                                    LineSeries<Biovolt, dynamic>(
                                        name: "土壤湿度",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.soilhumidity)
                                  ]),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SfCartesianChart(
                                  title: ChartTitle(text: '重量'),
                                  legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.top),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  trackballBehavior: TrackballBehavior(
                                      // Enables the trackball
                                      enable: true,
                                      tooltipSettings: InteractiveTooltip(
                                          enable: true, color: Colors.red)),
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      enablePinching: true,
                                      enableSelectionZooming: true,
                                      selectionRectBorderColor: Colors.red,
                                      selectionRectBorderWidth: 1,
                                      selectionRectColor: Colors.grey),
                                  primaryXAxis: CategoryAxis(
                                      maximumLabels: 3,
                                      labelPlacement: LabelPlacement.onTicks,
                                      interval: 2),
                                  series: <ChartSeries>[
                                    LineSeries<Biovolt, dynamic>(
                                        name: "重量1",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.weight1),
                                    LineSeries<Biovolt, dynamic>(
                                        name: "重量2",
                                        enableTooltip: true,
                                        dataSource: snapShot.data,
                                        xValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.time,
                                        yValueMapper: (Biovolt biovolt, _) =>
                                            biovolt.weight2),
                                  ]),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]);
              }
            }));
  }

  _buttomItems() {
    return _nodeList.map((_nodeList) {
      return Container(
          margin: EdgeInsets.all(3),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                this.nodenum = _nodeList;
                _getData();
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

  Future<List<Biovolt>> _getData() async {
    final response = await http
        .post('http://www.krasus1966.top/iot/DataJsonForAndroid?NodeNum=$nodenum');
    final result = json.decode(response.body);
    ListData listData = ListData.fromJson(result);
    return listData.biovolt;
  }

  List<dynamic> _nodeList = [];

  Future _itemsData() async {
    final response = await http.post('http://krasus1966.top/iot/nodelist');
    List nodelist = json.decode(response.body);
    setState(() {
      _nodeList = nodelist;
      nodenum = _nodeList.first;
      print(nodenum);
    });
  }
}
