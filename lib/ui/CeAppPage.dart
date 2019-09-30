import 'package:ceapp/fragments/CeBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'charts/DiasSemanaChart.dart';
import 'charts/DisciplinasChart.dart';
import 'charts/PeriodoChart.dart';



class CeAppPage extends StatefulWidget {
  @override
  _CeAppPageState createState() => _CeAppPageState();
}

class _CeAppPageState extends State<CeAppPage> {
  DateTime date1;
  DateTime date2;
  DateTime date3;

  DisciplinasChart _disciplinasChart = new DisciplinasChart();

  PeriodoChart _periodoChart = new PeriodoChart();

  DiasSemanaChart _diasSemanaChart = new DiasSemanaChart();



  @override
  Widget build(BuildContext context) {
    List<StaggeredTile> disposicaoCards = const <StaggeredTile>[
      const StaggeredTile.count(4, 3),
      const StaggeredTile.count(2, 2),
      const StaggeredTile.count(2, 2),
    ];

    List<Widget> cards = <Widget>[
      _cardDisciplinas(context),
      _cardDias(context),
      _cardPeriodos(context),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Receita Federal",
          style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
        ),

      ),
      //drawer: _ceDrawer(),
      body: Container(
          color: Colors.indigoAccent,
          constraints: BoxConstraints.expand(),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 20,
                animation: true,
                lineHeight: 17.0,
                animationDuration: 2500,
                percent: 0.5,
                center: Text(
                  "09 dias restantes",
                  style: TextStyle(color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.indigo,
              ),
            ],
          ),*/
            /* Padding(
            padding: EdgeInsets.only(left: 13.0, right: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "10/02/2019",
                  style: TextStyle(color: Colors.black45),
                ),
                Text(
                  "10/12/2019",
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ),*/
            /*    SizedBox(
            height: 3.0,
          ),*/
            Expanded(
                /* padding: const EdgeInsets.only(top: 12.0),*/
                child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: disposicaoCards,
              children: cards,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(10.0),
            )),
            CeBottomNavigation()
          ])),
    );
  }

  _cardPeriodos(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 5.0),
            child: Text("Períodos do dia",
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0)),
          ),
          Expanded(
              flex: 1, child: Container(child: _periodoChart.build(context)))
        ],
      ),
    );
  }

  Widget _cardDias(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text("Dias da semana",
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: _diasSemanaChart.build(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardDisciplinas(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text("Disciplinas",
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: _disciplinasChart.build(context),
            ),
          )
        ],
      ),
    );
  }
}

/*
**********WIDGETS**************
*/



void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        backgroundColor: Colors.indigo,
        title: new Text(
          "Remover cronograma ?",
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
              style: TextStyle(color: Colors.white),
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
