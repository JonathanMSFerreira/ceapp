import 'package:ceapp/ui/util/Cronometro.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';





final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['Ano novo'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};


class CeCalendar extends StatefulWidget {


  final String title;

  CeCalendar({Key key, this.title}) : super(key: key);



  @override
  _CeCalendarState createState() => _CeCalendarState();
}

class _CeCalendarState extends State<CeCalendar> with TickerProviderStateMixin {


  bool down = false;
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): ['História', 'Direito Administrativo', 'Direito Penal'],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],

      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): ['Event A8', 'Event B8', 'Event C8', 'Event D8'],
      _selectedDay.add(Duration(days: 3)): Set.from(['Direito Adm', 'Direito Penal', 'RLM']).toList(),
      _selectedDay.add(Duration(days: 7)): ['Event A10', 'Event B10', 'Event C10'],

    };

    _selectedEvents = _events[_selectedDay] ?? [];

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {



    //TODO

    print('CALLBACK: _onDaySelected');


    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');

    setState(() {


      down == true ? down = false : down = true;

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Concurso TJ MA"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

       //   _buildTableCalendar(),
          Card(

              elevation: 8.0,
           child: Column(


              children:<Widget>[

                _buildTableCalendarWithBuilders(),

                   Icon(down == true ?  Icons.expand_less : Icons.expand_more, color: Colors.grey,)


              ]


            )






           ),

          const SizedBox(
              height: 5.0
          ),
       //  _buildButtons(),

          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }




  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(



      locale: 'pt_br',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,


      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },





      calendarStyle: CalendarStyle(



        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.grey),
        holidayStyle: TextStyle().copyWith(color: Colors.grey),
      ),



      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.orangeAccent),



      ),


      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,



      ),





      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepPurpleAccent,
              width: 100,
              height: 100,
              child: Text(
                '${date.day}' ?? '', style: TextStyle().copyWith(fontSize: 16.0, color: Colors.white),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.grey,
            width: 100,
            height: 100,
            child: Text('${date.day}' ?? '',  style: TextStyle().copyWith(fontSize: 16.0,color: Colors.white),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Colors.yellow
            : _calendarController.isToday(date) ? Colors.yellowAccent: Colors.black54,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}' ?? '',
          style: TextStyle().copyWith(color: Colors.white, fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('month' ?? ''),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('week' ?? ''),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text('setDay 10-07-2019' ?? ''),
          onPressed: () {
            _calendarController.setSelectedDay(DateTime(2019, 7, 10), runCallback: true);
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return





      Card(






        elevation: 8.0,
        color: Colors.deepPurple,
        child: ListView(children: _selectedEvents.map((event) => Card(

          elevation: 5.0,
          color: Colors.deepPurpleAccent,
            child: ListTile(

              trailing: Icon(Icons.zoom_out_map, color: Colors.white,),
              subtitle: Text("08h à 9h 30", style: TextStyle(color: Colors.white),),
              title: Text(event.toString() ?? '', style: TextStyle(color: Colors.yellowAccent, fontSize: 20.0),),
              onTap: () {

                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Cronometro()));


              },
            ),


          )
        ).toList(),
        )
      );

  }
}