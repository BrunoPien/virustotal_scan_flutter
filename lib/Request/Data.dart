import 'package:http/http.dart' as http;
import 'dart:convert';

class Data {
  final String xApiToken = '9d33d694124645e5adab01d4d2e284625320350e5008140ac72b234c675f4e0f';
  final String xLinkScanUrl = 'https://www.virustotal.com/vtapi/v2/url/scan';
  final String xLinkScanUrlReport = 'http://www.virustotal.com/vtapi/v2/url/report';
  
  Future<List> sendFile() async {
    http.post(xLinkScanUrl, body: {"apikey": "$xApiToken", "url": "https://www.google.com/"}).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }
}
