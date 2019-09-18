import 'package:ceapp/ui/charts/DiasSemanaChart.dart';
import 'package:ceapp/ui/tabsDisciplinaPage/EstatiticasContent.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeContent extends StatelessWidget {




  EstatisticasContent _estatisticasContent =  new EstatisticasContent();

  //DiasSemanaChart _diasSemanaChart =  new  DiasSemanaChart();


  List<charts.Series> seriesList;
   bool animate;





  static List<charts.Series<Periodo, String>> _createSampleData() {
    final data = [
      new Periodo('Manha', 20, Colors.yellow),
      new Periodo('Tarde', 55, Colors.indigo),
      new Periodo('Noite', 25, Colors.grey),


    ];


    return [
      new charts.Series<Periodo, String>(
        id: 'Periodos',
        domainFn: (Periodo sales, _) => sales.periodo,
        measureFn: (Periodo sales, _) => sales.horas,
        data: data,
        colorFn: (Periodo sales, _) => sales.color,
        labelAccessorFn: (Periodo row, _) => '${row.periodo}: ${row.horas}',
      )
    ];
  }




  @override
  Widget build(BuildContext context) {


    List<StaggeredTile> _disposicaoCards = const <StaggeredTile>[
      const StaggeredTile.count(4, 3),
      const StaggeredTile.count(2, 2),
      const StaggeredTile.count(2, 2),

    ];







    List<Widget> _cards = <Widget>[
      _cardDisciplinas(context),
      _cardDias(),
      _cardPeriodos(true, true, true),
    ];

    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Row(
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
      ),
      Padding(
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
      ),
      SizedBox(
        height: 3.0,
      ),
      Expanded(
          /* padding: const EdgeInsets.only(top: 12.0),*/
          child: new StaggeredGridView.count(
        crossAxisCount: 4,
        staggeredTiles: _disposicaoCards,
        children: _cards,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(10.0),
      ))
    ]);
  }

  _cardPeriodos(bool manha, bool tarde, bool noite) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
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
          Row(
            children: <Widget>[
              Icon(
                Icons.wb_sunny,
                color: Colors.orange,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Períodos do dia",
                  style: TextStyle(color: Colors.orange),
                ),
              )
            ],
          ),

          Expanded(
              flex: 1,
              child: Container(

                child:  charts.PieChart(_createSampleData(),
                      animate: false,

                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 60,
                          arcRendererDecorators: [new charts.ArcLabelDecorator()]))
                  ))
        ],
      ),
    );
  }

  Widget _cardDias() {
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
          Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                color: Colors.indigo,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Dias da semana",
                  style: TextStyle(color: Colors.indigo),
                ),
              )
            ],
          ),

          Expanded(
            flex: 1,
            child: Container(



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
          Row(
            children: <Widget>[
              Icon(
                Icons.school,
                color: Colors.indigo,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Disciplinas",
                  style: TextStyle(color: Colors.indigo),
                ),
              )
            ],
          ),

          Expanded(
            flex: 1,
            child: Container(



                child : _estatisticasContent.build(context)


            ),
          )
        ],
      ),
    );
  }
}

/*
**********MÉTODOS AUXILIARES**************
*/
class Periodo {
  final String periodo;
  final int horas;
  final charts.Color color;

  Periodo(this.periodo, this.horas, Color color): this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}