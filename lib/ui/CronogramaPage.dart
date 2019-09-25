import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'DisciplinaPage.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['Ano novo'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class CronogramaPage extends StatefulWidget {
  final String title;

  CronogramaPage({Key key, this.title}) : super(key: key);

  @override
  _CronogramaPageState createState() => _CronogramaPageState();
}

class _CronogramaPageState extends State<CronogramaPage>
    with TickerProviderStateMixin {
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
      _selectedDay.subtract(Duration(days: 30)): [
        'História',
        'Direito Administrativo',
        'Direito Penal'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay: [
        'História',
        'Geografia',
        'Português',
        'Inglês',
        'Artes',
        'Filosofia',
        'Matemática',
        'Física'
      ],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Direito Adm', 'Direito Penal', 'RLM']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
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

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
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
          elevation: 0.0,

          title: Text(
            "Cronograma",
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 20.0),
          ),
        ),
        body: Container(
            color: Colors.indigoAccent,
            child: Column(
              children: <Widget>[
                Card(
                    elevation: 6.0,
                    child: Column(
                      children: <Widget>[
                        _buildTableCalendarWithBuilders(),
                        Icon(
                          down == true ? Icons.expand_less : Icons.expand_more,
                          color: Colors.grey,
                        )
                      ],
                    )),
                Expanded(

                    child: Card(




                        child: Column(

                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Container(



                          color: Colors.indigo,
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Disciplinas',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 25.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                dataFormatada(DateTime.now()),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),




                        Expanded(child: _buildEventList()),

                      ],


                    )
                    )

                    ),

              ],
            )));
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
      rowHeight: 50,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
        weekendStyle: TextStyle().copyWith(color: Colors.grey),
        holidayStyle: TextStyle().copyWith(color: Colors.indigoAccent),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.grey),
        weekdayStyle: TextStyle().copyWith(color: Colors.indigoAccent),
      ),
      headerStyle: HeaderStyle(
        leftChevronIcon: Icon(
          Icons.arrow_back_ios,
          color: Colors.indigoAccent,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.indigoAccent,
        ),
        centerHeaderTitle: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle().copyWith(
          color: Colors.indigoAccent,
          fontFamily: 'OpenSans',
          fontSize: 17,
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.indigoAccent,
              width: 100,
              height: 100,
              child: Text(
                '${date.day}' ?? '',
                style:
                    TextStyle().copyWith(fontSize: 16.0, color: Colors.white),
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
            child: Text(
              '${date.day}' ?? '',
              style: TextStyle().copyWith(fontSize: 16.0, color: Colors.white),
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

          /*   if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }*/

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
            : _calendarController.isToday(date) ? Colors.black : Colors.black54,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}' ?? '',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

/*
  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }
*/

  String dataFormatada(DateTime data) {
    String mes;

    switch (data.month) {
      case 1:
        mes = "janeiro";
        break;
      case 2:
        mes = "fevereiro";
        break;
      case 3:
        mes = "março";
        break;
      case 4:
        mes = "abril";
        break;
      case 5:
        mes = "maio";
        break;
      case 6:
        mes = "junho";
        break;
      case 7:
        mes = "julho";
        break;
      case 8:
        mes = "agosto";
        break;
      case 9:
        mes = "setembro";
        break;
      case 10:
        mes = "outubro";
        break;
      case 11:
        mes = "novembro";
        break;
      case 12:
        mes = "dezembro";
        break;
    }

    return data.day.toString() + ' de ' + mes + ' de ' + data.year.toString();
  }

  Widget _buildEventList() {
    return ListView(

      children: _selectedEvents
          .map((event) =>  ListTile(


                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Center(
                      
                      child: Text("HST", style: TextStyle(color: Colors.white),),
                      
                    ),
                  ),
                  trailing: Icon(
                    Icons.call_made,
                    color: Colors.black26,
                  ),

                  title: Text(
                    event.toString() ?? '',
                    style: TextStyle(color: Colors.indigo, fontSize: 20.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new DisciplinaPage()));
                  },

              ))
          .toList(),
    );
  }
}
