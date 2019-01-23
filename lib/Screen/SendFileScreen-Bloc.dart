import 'package:rxdart/rxdart.dart';
import 'package:virustotalscan/Request/Data.dart';
import 'package:virustotalscan/models/VirusTotal.dart';

class SendFileScreenBloc{

  Data _data = Data();

  var _controllerScans = BehaviorSubject<List<VirusTotalModel>>();
  Stream get outScannedResult => _controllerScans.stream;

  Future<void> loadScanResult() async {
    _controllerScans.add(null);
    _data.xSendUrlScan("https://jsoneditoronline.org") //Manda url pra Data.dart
      .then((result) {
        print("porraaaaa");
        print(result);
        _controllerScans.add(result);
       
      }).catchError((error) {
        _controllerScans.addError(error);
      });
  }

  void dispose(){
    _controllerScans.close(); // Streams sempre devem ser fechadas
  }
}