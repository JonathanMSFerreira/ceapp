import 'package:flutter/material.dart';
import 'dart:async';

class CronometroPage extends StatefulWidget {
  @override
  _CronometroPageState createState() => _CronometroPageState();
}

class _CronometroPageState extends State<CronometroPage> {
  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

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
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: Text(
          "História",
          style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Container(
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
                          child: Text('Reiniciar'),
                          onPressed: _resetButtonPressed,
                        ),
                      ],
                    )),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text('Salvar progresso'),
                  onPressed: _resetButtonPressed,
                ),
              ],
            )));
  }
}
