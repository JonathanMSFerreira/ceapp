import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DisciplinasChart extends StatelessWidget {


  List<charts.Series> seriesList;
  bool animate = true;


  @override
  Widget build(BuildContext context) {

    return new charts.BarChart(
      _createChartDisciplina(),
      animate: animate,
     // vertical: false,
    );
  }


  static List<charts.Series<Disciplina, String>> _createChartDisciplina() {
    final data = [
      new Disciplina('MAT', 5),
      new Disciplina('ING', 25),
      new Disciplina('PRT', 90),
      new Disciplina('BIO', 75),
      new Disciplina('QUI', 17),
      new Disciplina('LIT', 80),
      new Disciplina('GEO', 44),
      new Disciplina('EDF', 95),
      new Disciplina('FIS', 89),
    ];

    return [
      new charts.Series<Disciplina, String>(
        id: 'Disciplina',
        domainFn: (Disciplina disc, _) => disc.disciplina,
        measureFn: (Disciplina disc, _) => disc.horas,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class Disciplina{
  final String disciplina;
  final int horas;

  Disciplina(this.disciplina, this.horas);
}