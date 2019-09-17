import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool manha = false;
  bool tarde = false;
  bool noite = false;
  bool segunda = false;
  bool terca = false;
  bool quarta = false;
  bool quinta = false;
  bool sexta = false;
  bool sabado = false;
  bool domingo = false;

  @override
  Widget build(BuildContext context) {
    List<StaggeredTile> _disposicaoCards = const <StaggeredTile>[
      const StaggeredTile.count(2, 5),
      const StaggeredTile.count(2, 3),
      const StaggeredTile.count(2, 2),
    ];

    List<Widget> _cards = <Widget>[
      _cardDisciplinas(),
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
                color: Colors.indigo,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Horários",
                  style: TextStyle(color: Colors.indigo),
                ),
              )
            ],
          ),
          Divider(),
          Expanded(
              flex: 1,
              child: Container(

/*
              child:

              Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[





                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Manhã"),
                      Checkbox(

                        value: manha,
                        onChanged: (bool value) {
                          setState(() {
                            manha = value;
                          });
                        },
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tarde"),
                      Checkbox(

                        value: tarde,
                        onChanged: (bool value) {
                          setState(() {
                            tarde = value;
                          });
                        },
                      ),
                    ],
                  ),
                  // [Wednesday] checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Noite"),
                      Checkbox(
                        value: noite,
                        onChanged: (bool value) {
                          setState(() {
                            noite = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )*/

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
          Divider(),
          Expanded(
            flex: 1,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[



                  Container(
                      height: 15.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                        ],
                      ))
                ])),
          )
        ],
      ),
    );
  }

  Widget _cardDisciplinas() {
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
          Divider(),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}

/*
**********MÉTODOS AUXILIARES**************
*/
