import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DiasSemanaChart extends StatelessWidget {


  List<charts.Series> seriesList;

   bool animate = true;




  @override
  Widget build(BuildContext context) {

    return new charts.BarChart(
      _createSampleData(),
      animate: animate,
      vertical: false,
      animationDuration: Duration(seconds: 2),




    );
  }


  static List<charts.Series<DiaSemana, String>> _createSampleData() {
    final data = [
      new DiaSemana('Seg', 5),
      new DiaSemana('Ter', 25),
      new DiaSemana('Qua', 100),
      new DiaSemana('Qui', 37),
      new DiaSemana('Sex', 85),
      new DiaSemana('Sab', 55),
      new DiaSemana('Dom', 25),

    ];

    return [
      new charts.Series<DiaSemana, String>(
        id: 'DiaSemana',
        domainFn: (DiaSemana dia, _) => dia.diaSemana,
        measureFn: (DiaSemana dia, _) => dia.horas,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class DiaSemana {
  final String diaSemana;
  final int horas;

  DiaSemana(this.diaSemana, this.horas);
}