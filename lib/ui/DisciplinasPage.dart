import 'package:ceapp/fragments/CeBottomNavigation.dart';
import 'package:ceapp/model/Disciplina.dart';
import 'package:flutter/material.dart';

import 'dialog/DialogNovaDisciplina.dart';


class DisciplinasPage extends StatefulWidget {


  Disciplina disciplina;

  DisciplinasPage(Disciplina disciplina) {
    this.disciplina = disciplina;
  }

  @override
  _DisciplinasPageState createState() => _DisciplinasPageState(disciplina);
}

class _DisciplinasPageState extends State<DisciplinasPage> {


  Disciplina disciplina;


  _DisciplinasPageState(Disciplina disciplina) {
    this.disciplina = disciplina;
  }


  List<String> disciplinaList = [
    "História",
    "Português",
    "Geografia",
    "História",
    "Português",
    "Geografia",
    "História",
    "Português",
    "Geografia",


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,


     floatingActionButton:
      FloatingActionButton(

        backgroundColor: Colors.orange,
        onPressed: () {
          _dialogAdicionaDisciplina(disciplina, context);

        },
        child: Icon(Icons.add),
      ),

      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Disciplina",style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),),

      ),body: Column(


      children: <Widget>[

        Expanded(


          child: _cardsDisciplinas(disciplinaList),

        ),





      ],



    )


 ,







    );
  }
}
/*

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        backgroundColor: Colors.indigo,
        title: new Text(
          "Nova Disciplina",
          style: TextStyle(color: Colors.white),
        ),
        content: new Text(
          "Os dados serão apagados!",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(
              "Cancelar",
              style: TextStyle(color: Colors.grey[300]),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          new FlatButton(
            child: new Text(
              "Sim",
              style: TextStyle(color: Colors.yellow),
            ),
            shape: CircleBorder(),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
*/


Widget _cardsDisciplinas(List<String> disciplinasList) {
  return ListView.builder(


      itemCount: disciplinasList.length,

      itemBuilder: (context, index) {
        return Card(

          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Center(
                child: Text(
                  "HST",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            isThreeLine: true,

            subtitle: Text("Dias: Seg, Qua"),
            trailing: Icon(
              Icons.call_made,
              color: Colors.black26,
            ),
            title: Text(
              disciplinasList[index].toString() ?? '',
              style: TextStyle(color: Colors.indigo, fontSize: 20.0),
            ),
            onTap: () {



            },
          )


        );
      });
}






void _dialogAdicionaDisciplina(Disciplina disciplina, BuildContext context) {

  showDialog(

    context: context,
    barrierDismissible: false,
    builder: (context) {

      return  DialogNovaDisciplina(disciplina);

    },
  ).then((value){




  });
}