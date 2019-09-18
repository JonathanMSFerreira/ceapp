import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class EstatisticasContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var data = [
      DadoAluno("DT",45),
      DadoAluno("RLM",6),
      DadoAluno("PRT",23),
      DadoAluno("MAT",10),
      DadoAluno("DC",10),
      DadoAluno("DY",9),
      DadoAluno("IC",34),
      DadoAluno("CT",33),
      DadoAluno("PL",6),
      DadoAluno("DF",20),
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
          crossAxisSpacing: 0,
          crossAxisCount: 1,
          childAspectRatio: 6/4,
          reverse: true,

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