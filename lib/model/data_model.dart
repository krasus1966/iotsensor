class DataModel {
  int datanum;
  int nodenum;
  String date;
  String time;
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

  DataModel(
      {this.datanum,
      this.nodenum,
      this.date,
      this.time,
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

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        datanum: json['datanum'],
        nodenum: json['nodenum'],
        date: json['date'],
        time: json['time'],
        nodevoltage: json['nodevoltage'],
        biopointvoltage1: json['biopointvoltage1'],
        biopointvoltage2: json['biopointvoltage2'],
        biopointvoltage3: json['biopointvoltage3'],
        illumination: json['illumination'],
        airtemperature: json['airtemperature'],
        airhumidity: json['airhumidity'],
        soiltemperature: json['soiltemperature'],
        soilhumidity: json['soilhumidity'],
        weight1: json['weight1'],
        weight2: json['weight2']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datanum'] = this.datanum;
    data['nodenum'] = this.nodenum;
    data['date'] = this.date;
    data['time'] = this.time;
    data['nodevoltage'] = this.nodevoltage;
    data['biopointvoltage1'] = this.biopointvoltage1;
    data['biopointvoltage2'] = this.biopointvoltage2;
    data['biopointvoltage3'] = this.biopointvoltage3;
    data['illumination'] = this.illumination;
    data['airtemperature'] = this.airtemperature;
    data['airhumidity'] = this.airhumidity;
    data['soiltemperature'] = this.soiltemperature;
    data['soilhumidity'] = this.soilhumidity;
    data['weight1'] = this.weight1;
    data['weight2'] = this.weight2;
    return data;
  }
}
