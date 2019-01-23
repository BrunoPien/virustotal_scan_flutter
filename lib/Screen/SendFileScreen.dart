import 'package:flutter/material.dart';
import 'package:virustotalscan/Screen/SendFileScreen-Bloc.dart';
import 'package:virustotalscan/Screen/SendFileScreen-Widget.dart';
import 'package:virustotalscan/models/VirusTotal.dart';

class SendFileScreen extends StatefulWidget {
  _SendFileScreenState createState() => _SendFileScreenState();
}

class _SendFileScreenState extends State<SendFileScreen> {
  SendFileScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    imageCache
        .clear(); // Limpa o cache das imagens, isso reduz o uso de memória pelo app
    bloc = SendFileScreenBloc(); // Instancia o bloc
    bloc.loadScanResult(); // Carrega todos os posts ao entrar na página
  }

  @override
  void dispose() {
    bloc.dispose(); // Esse método fecha as streams
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Virus Total Flutter"),
        ),
        body: StreamBuilder<List<VirusTotalModel>>(
          stream: bloc.outScannedResult,
          builder: (BuildContext context,
              AsyncSnapshot<List<VirusTotalModel>> snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ListView.builder(
                    // shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SendFileWidgetBruno(
                        virustotalModel: snapshot.data[index],
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Em Construção!!"),
                            IconButton(
                                icon: Icon(Icons.send), onPressed: () {})
                          ],
                        ),
                        elevation: 10.0,
                      ),
                    ),
                  )
                  // Text("bb")
                ],
              );
            }
            if (snapshot.hasError) {
              // Caso tiver erros o StreamBuilder irá exibir um texto exibindo o erro
              return Center(child: Text('Erro: ${snapshot.error}'));
            }
            // Quando estiver em loading, ou seja, sem dados nem erros, ele exibe um ProgressIndicator
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _xConfigureScan(AsyncSnapshot snapshot, int index) {
    return SendFileWidgetBruno(
      virustotalModel: snapshot.data[index],
    );
  }
}
