import 'package:ceapp/fragments/CeBottomNavigation.dart';
import 'package:ceapp/helper/DbCeAppHelper.dart';
import 'package:ceapp/model/Disciplina.dart';
import 'package:flutter/material.dart';

import 'package:ceapp/ui/NovaDisciplinaPage.dart';

class DisciplinasPage extends StatefulWidget {
  @override
  _DisciplinasPageState createState() => _DisciplinasPageState();
}

class _DisciplinasPageState extends State<DisciplinasPage> {


  List<Disciplina> _listDisciplinas = new List<Disciplina>();
  DbCeAppHelper helper;

  @override
  void initState() {
    helper = new DbCeAppHelper();
    _getListaDisciplinas();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                new MaterialPageRoute(
                    builder: (context) => NovaDisciplinaPage()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Disciplinas",
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: _listDisciplinas != null ?  _cardsDisciplinas(_listDisciplinas):  Container(),
            ),
          ],
        ));
  }

  void _getListaDisciplinas() {
    helper.getDisciplinas().then((lista) {
      setState(() {
        _listDisciplinas = lista;
      });
    });
  }
}

Widget _cardsDisciplinas(List<Disciplina> disciplinas) {

  return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(disciplinas[index].cor),
            child: Center(
              child: Text(
                disciplinas[index].sigla,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          trailing: Icon(
            Icons.call_made,
            color: Colors.black26,
          ),
          title: Text(
            disciplinas[index].nome ?? '',
            style:
                TextStyle(color: Color(disciplinas[index].cor), fontSize: 20.0),
          ),
          onTap: () {},
        ));
      });
}
