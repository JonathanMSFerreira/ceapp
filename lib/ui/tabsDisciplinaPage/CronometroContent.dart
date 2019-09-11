import 'package:flutter/material.dart';
import 'dart:async';



class CronometroContent extends StatefulWidget {
  @override
  _CronometroContentState createState() => _CronometroContentState();
}

class _CronometroContentState extends State<CronometroContent> {


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
    return Center(


      child: Card(
        shape: CircleBorder(),
          color: Colors.deepPurple,
          elevation: 5.0,
          child: Column(

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Text(
                  _stopwatchText,
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.deepPurpleAccent,
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
                        color: Colors.deepPurpleAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text('Resetar'),
                        onPressed: _resetButtonPressed,
                      ),
                    ],
                  ))
            ],
          ))



    );
  }
}
