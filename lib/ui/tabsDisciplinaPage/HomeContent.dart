import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  List<StaggeredTile> _staggeredTilesVideos(){


    return <StaggeredTile>[


      const StaggeredTile.count(5, 3),
      const StaggeredTile.count(3, 2),
      //   const StaggeredTile.count(2, 1),
      const StaggeredTile.count(2, 2),



    ];

  }

  List<Widget> _tilesVideos(context){

    return  <Widget>[

      _cardDisciplinas(context),

      _cardPeriodos(context),
      //   _cardHelp(context),

      _cardDias(context),


    ];}





  @override
  Widget build(BuildContext context) {


    bool _isChecked = true;
    String _currText = '';

    List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];


    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Concurso PC-DF',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 30,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text(
                  "80.0%",
                  style: TextStyle(color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.indigo,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
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

          SizedBox(height: 10.0,),





            Card(


              elevation: 8.0,
              color: Colors.white,
              child: Column(


                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(

                    title: Text("Períodos do dia"),
                    leading: Icon(Icons.wb_sunny),
                    isThreeLine: true,

                    subtitle:  Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text("asdfsa"),
                        Text("asdfsa"),
                        Text("asdfsa"),


                      ],


                    ),
                  )
                ],
              ),
            ),




            Card(


              elevation: 8.0,
              color: Colors.white,
              child: Column(


                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(

                    title: Text("Dias da semana"),
                    leading: Icon(Icons.calendar_today),



                  )
                ],
              ),
            ),
















          Card(


            elevation: 8.0,
            color: Colors.white,
            child: Column(


              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(

                  title: Text("Disciplinas"),
                 leading: Icon(Icons.school),



                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _cardDisciplinas(context) {


    return Card(

      color: Colors.indigo,


    );



  }

  _cardPeriodos(context) {

    return Card(color: Colors.black,);
  }

  _cardDias(context) {

    return Card(color: Colors.red,);


  }
}

/*
**********MÉTODOS AUXILIARES**************
*/
