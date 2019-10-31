
import 'package:ceapp/model/disciplina.dart';
import 'package:ceapp/model/disciplina_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CronometroPage extends StatefulWidget {

  DisciplinaView disciplina;


  CronometroPage(selectedEvent){


    this.disciplina = selectedEvent;


  }


  @override
  _CronometroPageState createState() => _CronometroPageState(this.disciplina);
}

class _CronometroPageState extends State<CronometroPage> {


  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);
  DisciplinaView disciplina;



  _CronometroPageState(disciplina){

   this.disciplina = disciplina;

  }



  @override
  void initState() {




    super.initState();
  }



  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.stop();
      } else {
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed() {
    if (_stopWatch.isRunning) {
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
    });
  }

  void _setStopwatchText() {
    _stopwatchText = _stopWatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(

        backgroundColor: Colors.grey[350],
        title: Text(
          disciplina.nome,
          style: TextStyle(color: Colors.white, fontSize: 22.0,  fontWeight: FontWeight.bold,  fontFamily: 'OpenSans'),
        ),
        elevation: 0.0,

      ),

      body: Container(
        color: Colors.grey[350],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            cronometro(context),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget cronometro(BuildContext context) {
    return Center(
      
        child: Card(
            color: Colors.white,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            margin: EdgeInsets.all(16.0),

            elevation: 5.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  _stopwatchText,
                  style: TextStyle(fontSize: 50, color: Colors.indigo),
                ),
                Divider(
                  color: Colors.indigoAccent,
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.indigoAccent,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Icon(
                            _isStart ? Icons.play_arrow : Icons.stop,
                            color: Colors.white,
                          ),
                          onPressed: _startStopButtonPressed,
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.indigoAccent,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text('Reiniciar', style: TextStyle(fontFamily: 'OpenSans'),),
                          onPressed: _resetButtonPressed,
                        ),
                      ],
                    )),


                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text('Salvar progresso',style: TextStyle(fontFamily: 'OpenSans'),),
                  onPressed: _resetButtonPressed,
                ),
              ],
            )));
  }
}
