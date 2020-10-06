import 'package:flutter/material.dart';
import 'package:iot_sensor/pages/data_page.dart';

class NodeButton extends StatelessWidget {
  final int nodeNum;

  const NodeButton({Key key, @required this.nodeNum});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(3),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Column(
              children: [
                Icon(
                  Icons.offline_bolt,
                  size: 20,
                ),
                Text("节点$nodeNum"),
              ],
            )));
  }
}
