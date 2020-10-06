import 'dart:convert';

import 'package:iot_sensor/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataDao{
  static Future<DataModel> fetch(int nodenum) async{
    final response = await http.post('http://krasus1966.top/iot/dataJson?NodeNum=$nodenum');
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return DataModel.fromJson(result);
    }else{
      throw Exception("加载数据失败!");
    }
  }
}