import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String title;
  final dynamic data;

  const DataCard({Key key, this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black12
            : Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        clipBehavior: Clip.antiAlias,
        semanticContainer: true,
        child: Container(
            height: 120,
            padding: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  "$data",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            )));
  }
}
