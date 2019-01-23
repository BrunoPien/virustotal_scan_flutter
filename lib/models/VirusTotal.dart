class VirusTotalModel {
  String xNameAV;
  bool xDetected;
  String xResult;

  DateTime createdDate;
 

  String data() {
    return '${createdDate.day.toString().padLeft(2,'0')}/${createdDate.month.toString().padLeft(2,'0')}/${createdDate.year.toString().padLeft(4,'0')}';
  }

  VirusTotalModel.fromJson(String nameAv, Map mapAv) {
    this.xNameAV = nameAv;
    this.xDetected = mapAv["detected"];
    this.xResult = mapAv["result"];
  }
  
}