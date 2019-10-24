import 'package:ceapp/fragments/MultiSelectChip.dart';
import 'package:ceapp/helper/DbCeAppHelper.dart';
import 'package:ceapp/model/DiaSemana.dart';
import 'package:ceapp/model/Disciplina.dart';
import 'package:ceapp/ui/DisciplinasPage.dart';
import 'package:flutter/material.dart';

class NovaDisciplinaPage extends StatefulWidget {

  @override
  _NovaDisciplinaPageState createState() => _NovaDisciplinaPageState();
}

class _NovaDisciplinaPageState extends State<NovaDisciplinaPage> {


  List<String> _listaDias = new List<String>();
  DbCeAppHelper helper;
  int _corSelecionada;
  Disciplina tmpDisciplina;
  bool _nomeInserido = false;
  bool _siglaInserido = false;
  bool _corInserido = false;
  Disciplina disciplina;
  List<String> horariosSelecionadosList = List();
  List<String> diasSelecionadosList = List();


  @override
  void initState() {
    helper = new DbCeAppHelper();
    tmpDisciplina = new Disciplina();
    _getDias();
    super.initState();
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
        body: ListView(children: [
          Card(
              child: Padding(
            padding: EdgeInsets.all(16.0),
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
              TextField(
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0),
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),


                  onChanged: (inputNome) {
                    setState(() {
                      if (inputNome.isNotEmpty &&  inputNome != null) {
                        tmpDisciplina.nome = inputNome;
                        _nomeInserido = true;
                      } else {
                        _nomeInserido = false;
                      }
                    });
                  }



              ),
              TextField(
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0),
                decoration: InputDecoration(labelText: 'Sigla'),

                  onChanged: (inputSigla) {
                    setState(() {
                      if (inputSigla.isNotEmpty &&  inputSigla != null) {
                        tmpDisciplina.sigla = inputSigla;
                        _siglaInserido = true;
                      } else {
                        _siglaInserido = false;
                      }
                    });
                  }




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
              carregaCores(_listaCores())
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
              Text("Manhã",
                  style: TextStyle(
                      color: Colors.indigoAccent, fontFamily: 'OpenSans')),
              MultiSelectChip(
                _listaDias,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    diasSelecionadosList = selectedList;
                  });
                },
              ),
              Divider(),
              Text("Tarde",
                  style: TextStyle(
                      color: Colors.indigoAccent, fontFamily: 'OpenSans')),
              MultiSelectChip(
                _listaDias,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    diasSelecionadosList = selectedList;
                  });
                },
              ),
              Divider(),
              Text("Noite",
                  style: TextStyle(
                      color: Colors.indigoAccent, fontFamily: 'OpenSans')),
              MultiSelectChip(
                _listaDias,
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
              onPressed: formIsOk(_nomeInserido, _siglaInserido, _corInserido) == true ? () {


                tmpDisciplina.toString();

                helper.saveDisciplina(tmpDisciplina);

                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => DisciplinasPage()));


    } : null,
           child: new Text("Salvar",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 17.0)),
            ),
          ),
        ]));
  }



  List<Color>  _listaCores(){

   return    [
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


 }




  Widget carregaCores(List<Color> cores) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cores.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.all(3.0),
              child: GestureDetector(
                child: Stack(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: cores[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                    _corSelecionada == cores[index].value
                        ? Center(
                            child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30.0,
                          ))
                        : Container()
                  ],
                ),
                onTap: () {
                  setState(() {
                    _corSelecionada = cores[index].value;
                    tmpDisciplina.cor = cores[index].value;
                    _corInserido = true;


                  });
                },
              ));
        });
  }



  bool formIsOk(hasNome, hasSigla, hasCor) {
    return hasNome && hasSigla && hasCor;
  }


  void _getDias() {
    List<String> tmpLista = new List<String>();

    helper.getDias().then((list) {
      for (DiaSemana d in list) {
        tmpLista.add(d.nome);
      }

      setState(() {
        _listaDias = tmpLista;
      });
    });
  }

}
