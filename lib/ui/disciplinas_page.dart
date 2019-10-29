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
        backgroundColor: Colors.white,




        floatingActionButton: Container(
          height: 170.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(

                backgroundColor: Colors.indigoAccent,
                child: Icon(Icons.add),

                onPressed: () {
                  Navigator.push(
                context,
              new MaterialPageRoute(
                    builder: (context) => NovaDisciplinaPage()));


                }),
          ),
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

            CeBottomNavigation(),


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
