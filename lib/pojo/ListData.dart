class ListData {
  int nodeNum;
  List<Biovolt> biovolt;

  ListData({this.nodeNum, this.biovolt});

  ListData.fromJson(Map<String, dynamic> json) {
    nodeNum = json['nodeNum'];
    if (json['biovolt'] != null) {
      biovolt = new List<Biovolt>();
      json['biovolt'].forEach((v) {
        biovolt.add(new Biovolt.fromJson(v));
      });
    }
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

class Biovolt {
  int datanum;
  int nodenum;
  String date;
  String time;
  DateTime datetime;
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

  Biovolt(
      {this.datanum,
        this.nodenum,
        this.date,
        this.time,
        this.datetime,
        this.nodevoltage,
        this.biopointvoltage1,
        this.biopointvoltage2,
        this.biopointvoltage3,
        this.illumination,
        this.airtemperature,
        this.airhumidity,
        this.soiltemperature,
        this.soilhumidity,
        this.weight1,
        this.weight2});

  Biovolt.fromJson(Map<String, dynamic> json) {
    datanum = json['datanum'];
    nodenum = json['nodenum'];
    date = json['date'];
    time = json['time'];
    datetime = DateTime.parse(date+' '+time);
    nodevoltage = json['nodevoltage'];
    biopointvoltage1 = json['biopointvoltage1'];
    biopointvoltage2 = json['biopointvoltage2'];
    biopointvoltage3 = json['biopointvoltage3'];
    illumination = json['illumination'];
    airtemperature = json['airtemperature'];
    airhumidity = json['airhumidity'];
    soiltemperature = json['soiltemperature'];
    soilhumidity = json['soilhumidity'];
    weight1 = json['weight_1'];
    weight2 = json['weight_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datanum'] = this.datanum;
    data['nodenum'] = this.nodenum;
    data['date'] = this.date;
    data['time'] = this.time;
    data['datetime'] = this.datetime;
    data['nodevoltage'] = this.nodevoltage;
    data['biopointvoltage1'] = this.biopointvoltage1;
    data['biopointvoltage2'] = this.biopointvoltage2;
    data['biopointvoltage3'] = this.biopointvoltage3;
    data['illumination'] = this.illumination;
    data['airtemperature'] = this.airtemperature;
    data['airhumidity'] = this.airhumidity;
    data['soiltemperature'] = this.soiltemperature;
    data['soilhumidity'] = this.soilhumidity;
    data['weight_1'] = this.weight1;
    data['weight_2'] = this.weight2;
    return data;
  }
}