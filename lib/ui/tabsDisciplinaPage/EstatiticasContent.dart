import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class EstatisticasContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var data = [
      DadoAluno("DT",2),
      DadoAluno("RLM",1),
      DadoAluno("PRT",4),
      DadoAluno("MAT",3),
      DadoAluno("DC",1),
    ];

    var series = [
      charts.Series(

          domainFn: (DadoAluno dadoAluno,_)=>dadoAluno.dia,
          measureFn: (DadoAluno dadoAluno,_)=>dadoAluno.comportamento,
          id: "Dados",
          data: data,
      )

    ];


    var graficoComportamento = charts.BarChart(
        series

    );





    return Container(
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(1.0),
          crossAxisSpacing: 1.0,
          crossAxisCount: 1,

          children: <Widget>[
            graficoComportamento,

          ]));



  }


}
class DadoAluno{

  String dia;
  int comportamento;


  DadoAluno(this.dia, this.comportamento);

}