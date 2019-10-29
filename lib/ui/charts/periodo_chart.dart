import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class PeriodoChart extends StatelessWidget {


  List<charts.Series> seriesList;
  bool animate = true;


  static List<charts.Series<Periodo, String>> _createSampleData() {
    final data = [
      new Periodo('M', 100, Colors.lightBlueAccent),
      new Periodo('T', 110, Colors.indigo),
      new Periodo('N', 200, Colors.grey),


    ];


    return [
      new charts.Series<Periodo, String>(
        id: 'Periodos',
        domainFn: (Periodo periodo, _) => periodo.periodo,
        measureFn: (Periodo periodo, _) => periodo.horas,
        data: data,
        colorFn: (Periodo periodo, _) => periodo.color,
        labelAccessorFn: (Periodo row, _) => '${row.periodo}: ${row.horas}',

      )
    ];
  }




  @override
  Widget build(BuildContext context) {
    return charts.PieChart(_createSampleData(),
        animate: animate,
        animationDuration: Duration(seconds: 2),
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]))
    ;

  }

}


class Periodo {

  String periodo;
  int horas;
   charts.Color color;

  Periodo(this.periodo, this.horas, Color color): this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}



