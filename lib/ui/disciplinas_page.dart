import 'package:ceapp/fragments/bottom_navigation.dart';
import 'package:ceapp/helper/db_ceapp.dart';
import 'package:ceapp/model/dia_periodo_disciplina.dart';
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
            trailing: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () async {

                Disciplina tmpDisciplina = disciplinas[index];

                var tmpDiscPeriodo = await helper.getDisciplinasPorDisciplina(disciplinas[index].id);
                helper.deleteCronogramaPorDisciplina(disciplinas[index].id);
                helper.deleteDisciplina(disciplinas[index].id);
                _getListaDisciplinas();


                final snackBar = SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Desfazer remoção'),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {

                      helper.saveDisciplina(tmpDisciplina);
                      for(DiaPeriodoDisciplina d in tmpDiscPeriodo){

                      helper.saveDiaPeriodoDisciplina(d);


                      }
                      _getListaDisciplinas();

                    },
                  ),
                );

                Scaffold.of(context).showSnackBar(snackBar);

              },

            ),
            title: Text(
              disciplinas[index].nome ?? '',
              style:
              TextStyle(color: Color(disciplinas[index].cor), fontSize: 20.0),
            ),

          );
        });
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
            padding: EdgeInsets.only(left: 16.0, bottom: 10.0, right: 16.0),
            color: Colors.grey[350],
            child: Column(
              children: <Widget>[
                CeBottomNavigation(2),
                Expanded(
                  child: _listDisciplinas.isNotEmpty ?

                  Card(

                   child: _cardsDisciplinas(_listDisciplinas),

                  )

                   : Card(
                    color: Colors.white,

                    child: Column(


                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Icon(Icons.school,size: 70,color: Colors.grey,),

                        Center(
                          child: Text('Nenhuma disciplina!',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'OpenSans',
                                  fontSize: 20.0)),
                        )
                      ],
                    ),


                  ),
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

