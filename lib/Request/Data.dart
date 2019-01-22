import 'package:http/http.dart' as http;
import 'dart:convert';

class Data {
  final String xApiToken =
      '9d33d694124645e5adab01d4d2e284625320350e5008140ac72b234c675f4e0f';
  final String xLinkScanUrl = 'https://www.virustotal.com/vtapi/v2/url/scan';
  final String xLinkScanUrlReport =
      'http://www.virustotal.com/vtapi/v2/url/report';

  Future xSendUrlScan(String urlScan) async {
    final xResponse = await http.post(xLinkScanUrl,
        body: {"apikey": "$xApiToken", "url": "$urlScan"});
    if (xResponse.statusCode == 200) {
      final Map xResultado = jsonDecode(xResponse.body);
      xCheckUrlReport(xResultado["resource"]);
    } else {
      //Erro
      throw('Ocorreu um erro ao realizar o request dos Posts');
    }
  }
  Future<List> xCheckUrlReport(String xResource) async {
    http.post(xLinkScanUrlReport, body: {
      "apikey": "$xApiToken",
      "resource": "$xResource"
    }).then((response) {
      print("Response statusReport: ${response.statusCode}");
      print("Response bodyReport Porraaa: ${response.body}");
      //funcional
    });
  }
}
