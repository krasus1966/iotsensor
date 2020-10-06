
import 'dart:convert';

import 'package:iot_sensor/model/list_data_model.dart';
import 'package:http/http.dart' as http;

class ListDataDao{
  static Future<ListDataModel> fetch(int nodenum) async{
    final response = await http.post('http://www.krasus1966.top/iot/DataJsonForAndroid?NodeNum=$nodenum');
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return ListDataModel.fromJson(result);
    }else{
      throw Exception("加载数据失败!");
    }
  }
}