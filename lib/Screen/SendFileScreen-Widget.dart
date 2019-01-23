import 'package:flutter/material.dart';
import 'package:virustotalscan/models/VirusTotal.dart';

class SendFileWidgetBruno extends StatelessWidget {
  final VirusTotalModel virustotalModel;
  const SendFileWidgetBruno({Key key, this.virustotalModel}) : super(key: key);

  final imagemPerfil =
      'https://scontent.fplu13-1.fna.fbcdn.net/v/t1.0-9/27654498_569489453383383_6720160347219401384_n.png?_nc_cat=111&_nc_ht=scontent.fplu13-1.fna&oh=7eeaae46831db06eaf0174825567c9be&oe=5CD96468';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${virustotalModel.xNameAV}"),
            Text("${virustotalModel.xResult}"),
            Text("${virustotalModel.xDetected}")
          ],
        ),
      ),
    );
  }
}
