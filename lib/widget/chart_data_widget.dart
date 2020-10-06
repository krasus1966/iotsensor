import 'package:flutter/material.dart';
import 'package:iot_sensor/model/data_model.dart';
import 'package:iot_sensor/model/list_data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData extends StatefulWidget {
  final String title;
  final List<LineSeries> chartDataModels;

  const ChartData({Key key, this.title, this.chartDataModels});

  @override
  _ChartDataState createState() => _ChartDataState();
}

class _ChartDataState extends State<ChartData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: SfCartesianChart(
                legend: Legend(isVisible: true, position: LegendPosition.top),
                title: ChartTitle(text: widget.title),
                tooltipBehavior: TooltipBehavior(enable: true),
                trackballBehavior: TrackballBehavior(
                    enable: true,
                    tooltipSettings:
                        InteractiveTooltip(enable: true, color: Colors.red)),
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
                series: widget.chartDataModels),
          )
        ],
      ),
    );
  }
}
