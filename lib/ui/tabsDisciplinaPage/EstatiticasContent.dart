import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class EstatisticasContent extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    var data = [
      DadoAluno("1",2),
      DadoAluno("2",1),
      DadoAluno("3",4),
      DadoAluno("4",3),
      DadoAluno("5",1),
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





    return Column(
      children: <Widget>[
        Expanded(child:


        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(2.0),
          crossAxisSpacing: 3.0,
          crossAxisCount: 1,
          children: <Widget>[
            graficoComportamento,


          ],
        )


        ),

      ],

    );



  }


}
class DadoAluno{

  String dia;
  int comportamento;

  DadoAluno(this.dia, this.comportamento);

}