import 'package:ceapp/ui/tabsDisciplinaPage/CronometroContent.dart';
import 'package:ceapp/ui/tabsDisciplinaPage/EstatiticasContent.dart';
import 'package:ceapp/ui/tabsDisciplinaPage/HomeDisciplinaContent.dart';
import 'package:flutter/material.dart';

class DisciplinaPage extends StatefulWidget {
  @override
  _DisciplinaPageState createState() => _DisciplinaPageState();
}

class _DisciplinaPageState extends State<DisciplinaPage> {


  int _currentIndex = 0;

  final List<Widget> _children = [

  HomeDisciplinaContent(),

    EstatisticasContent(),

    CronometroContent(),
  ];




  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Direito Adminstrativo"),
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.pie_chart),
            title: new Text('Estatísticas'),


          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text('Cronômetro'))
        ],
      ),
        body: _children[_currentIndex],
        );
  }
}

