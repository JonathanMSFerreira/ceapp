import 'package:ceapp/helper/db_ceapp.dart';
import 'package:ceapp/ui/cronograma_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  DbCeAppHelper _dbCeAppHelper = new DbCeAppHelper();


  @override
  void initState() {

    Future futureDb = _dbCeAppHelper.initDb();
    Future futureTimer = Future.delayed(Duration(seconds: 3));
    Future.wait([futureTimer, futureDb]).then((List values){

      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => CronogramaPage()));

    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(


      color: Colors.grey[350],

      child: Center(

        child: CircularProgressIndicator( backgroundColor: Colors.white,),

      ),


    );
  }
}
