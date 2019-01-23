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
    imageCache.clear(); // Limpa o cache das imagens, isso reduz o uso de memória pelo app
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
        builder: (BuildContext context, AsyncSnapshot<List<VirusTotalModel>> snapshot) {
          if(snapshot.hasData) { // Caso tiver dados o StreamBuilder irá exibir a lista
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                 print(snapshot.data);
                print(snapshot.data[index]);
               
                return SendFileWidgetBruno(
                  virustotalModel: snapshot.data[index],
                );
              },
            );
          }
          if(snapshot.hasError) { // Caso tiver erros o StreamBuilder irá exibir um texto exibindo o erro
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          // Quando estiver em loading, ou seja, sem dados nem erros, ele exibe um ProgressIndicator
          return Center(child: CircularProgressIndicator(),);
        },
      ),
       ),
    );
  }

 
}