import 'package:ceapp/fragments/MultiSelectChip.dart';
import 'package:ceapp/model/Disciplina.dart';
import 'package:flutter/material.dart';

class DialogNovaDisciplina extends StatefulWidget {


  Disciplina disciplina;


  DialogNovaDisciplina(Disciplina disciplina) {
    this.disciplina = disciplina;
  }


  @override
  _DialogNovaDisciplinaState createState() =>
      _DialogNovaDisciplinaState(disciplina);
}


class _DialogNovaDisciplinaState extends State<DialogNovaDisciplina> {

/*
  List<Color> coresList = [
    Colors.red,
    Colors.redAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.grey,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreenAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.cyanAccent,
    Colors.amber,
    Colors.amberAccent,

  ];
*/




  List<Color> coresList = [
    Colors.red,
    Colors.redAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.grey,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreenAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.cyanAccent,
    Colors.amber,
    Colors.amberAccent,

  ];

  Disciplina disciplina;

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

  List<String> horariosSelecionadosList = List();

  List<String> diasSelecionadosList = List();

  _DialogNovaDisciplinaState(Disciplina disciplina) {
    this.disciplina = disciplina;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: new Text(
            "Nova disciplina",
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 20.0),
          ),
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
                                      color: Colors.orange,
                                      fontFamily: 'OpenSans',
                                      fontSize: 17.0)),
                              Divider(
                                height: 2.0,
                                color: Colors.indigo,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15.0),
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15.0),
                                decoration: InputDecoration(labelText: 'Sigla'),
                              ),
                            ]),
                          )),
                          Card(
                              child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(children: [
                              Text("Selecione uma cor",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontFamily: 'OpenSans',
                                      fontSize: 17.0)),
                              Divider(
                                height: 2.0,
                                color: Colors.indigo,
                              ),
                              carregaCores(coresList)
                            ]),
                          )),
                          Card(
                              child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(children: [
                              Text("Horários de estudo",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0,
                                  )),
                              Divider(
                                height: 2.0,
                                color: Colors.indigo,
                              ),
                              Text("Manhã", style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontFamily: 'OpenSans')),
                              MultiSelectChip(
                                diasList,
                                onSelectionChanged: (selectedList) {
                                  setState(() {
                                    diasSelecionadosList = selectedList;
                                  });
                                },
                              ),
                              Divider(),

                              Text("Tarde", style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontFamily: 'OpenSans')),
                              MultiSelectChip(
                                diasList,
                                onSelectionChanged: (selectedList) {
                                  setState(() {
                                    diasSelecionadosList = selectedList;
                                  });
                                },
                              ),
                              Divider(),
                              Text("Noite", style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontFamily: 'OpenSans')),
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
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: RaisedButton(
                              padding: const EdgeInsets.all(15.0),
                              textColor: Colors.white,
                              color: Colors.orange,
                              onPressed: () {},
                              child: new Text("Salvar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontSize: 17.0)),
                            ),
                          ),
                        ])))));
  }

  Widget carregaCores(List<Color> cores) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cores.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8), //change the number as you want

        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  width: 3.0,
                  height: 3.0,
                  decoration: new BoxDecoration(
                    color: cores[index],
                    shape: BoxShape.circle,
                  ),
                )),
            onTap: () {
              print(cores[index].value);
            },
          );
        });
  }

}
