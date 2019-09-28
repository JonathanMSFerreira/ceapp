import 'package:ceapp/helper/MultiSelectChip.dart';
import 'package:flutter/material.dart';


class NewCePage extends StatefulWidget {
  @override
  _NewCePageState createState() => _NewCePageState();
}

class _NewCePageState extends State<NewCePage> {
  @override
  Widget build(BuildContext context) {
    List<String> diasList = [
      "Segunda",
      "Terça",
      "Quarta",
      "Quinta",
      "Sexta",
      "Sábado",
      "Domingo"
    ];

    List<String> horariosList = [
      "Manhã",
      "Tarde",
      "Noite",
    ];



    MultiSelectChip multiSelectChip = MultiSelectChip(diasList);


    List<String> horariosSelecionadosList = List();

    List<String> diasSelecionadosList = List();

    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          title: Text("Cronograma",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'OpenSans', fontSize: 20.0)),
          elevation: 0.0,

        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  color: Colors.indigoAccent,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(children: [
                            Text("Informações",
                                style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.indigo,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Nome do ciclo',
                              ),
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Início do ciclo'),
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Fim do ciclo'),
                            ),
                          ]),
                        )),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(children: [
                            Text("Dias disponíveis",
                                style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.indigo,
                            ),
                            MultiSelectChip(
                              diasList,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  diasSelecionadosList = selectedList;
                                });
                              },
                            ),
                          ]),
                        )),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(children: [
                            Text("Horários disponíveis",
                                style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.indigo,
                            ),
                            MultiSelectChip(
                              horariosList,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  horariosSelecionadosList = selectedList;
                                });
                              },
                            ),
                          ]),
                        )),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(15.0),
                            textColor: Colors.white,
                            color: Colors.indigo,
                            onPressed: () {},
                            child: new Text("Salvar", style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 17.0)),),
                          ),
                       ] )
                      ))),
        );
  }
}


