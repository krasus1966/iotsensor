import 'data_model.dart';

class ListDataModel {
  int nodeNum;
  List<DataModel> biovolt;
  ListDataModel({this.nodeNum, this.biovolt});

  factory ListDataModel.fromJson(Map<String, dynamic> json) {
    var biovoltListJson = json['biovolt'] as List;
    List<DataModel> biovoltList =
        biovoltListJson.map((e) => DataModel.fromJson(e)).toList();

    return ListDataModel(nodeNum: json['nodeNum'], biovolt: biovoltList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nodeNum'] = this.nodeNum;
    if (this.biovolt != null) {
      data['biovolt'] = this.biovolt.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
