import 'package:ceapp/fragments/bottom_navigation.dart';
import 'package:ceapp/helper/db_ceapp.dart';
import 'package:ceapp/model/disciplina.dart';
import 'package:flutter/material.dart';

import 'package:ceapp/ui/nova_disciplina_page.dart';

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
        backgroundColor: Colors.grey[350],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:  FloatingActionButton(
                backgroundColor: Colors.indigoAccent,
                child: Icon(Icons.add, color: Colors.white, size: 36.0,),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => NovaDisciplinaPage()));
                }),

        appBar: AppBar(
          backgroundColor: Colors.grey[350],
          elevation: 0.0,

          title: Text(
            "Disciplinas",
            style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontFamily: 'OpenSans', fontSize: 22.0),
          ),
        ),
        body: Container(
            color: Colors.grey[350],
            child: Column(
              children: <Widget>[
                CeBottomNavigation(),
                Expanded(
                  child: _listDisciplinas != null ?

                  Card(

                   child: _cardsDisciplinas(_listDisciplinas),

                  )

                   : Container(),
                ),
              ],
            )));
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
  return ListView.separated(
      itemCount: disciplinas.length,
      separatorBuilder: (context, index) => Divider(height: 1.0, color: Colors.grey),
      itemBuilder: (context, index) {
        return ListTile(
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
        );
      });
}
