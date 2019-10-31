import 'package:ceapp/fragments/bottom_navigation.dart';
import 'package:ceapp/helper/db_ceapp.dart';
import 'package:ceapp/model/disciplina.dart';
import 'package:ceapp/model/disciplina_view.dart';
import 'package:ceapp/ui/novo_cronograma_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'cronometro_page.dart';

class CronogramaPage extends StatefulWidget {
  @override
  _CronogramaPageState createState() => _CronogramaPageState();
}

class _CronogramaPageState extends State<CronogramaPage> with TickerProviderStateMixin {

 // List<Disciplina> _listDisciplinas = new List<Disciplina>();
  List<DisciplinaView> _listDisciplinasView = new List<DisciplinaView>();
  DbCeAppHelper _helper;
  bool down = false;
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {

    _helper = new DbCeAppHelper();
    _calendarController = CalendarController();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();

    final selectedDay = DateTime.now();


    _loadListaDisciplinas(selectedDay);

    super.initState();
  }

  _loadListaDisciplinas(DateTime selectedDay) {

    _helper.getDisciplinasPorDiaSemana(selectedDay.weekday).then((disciplinas) {
      setState(() {
        _listDisciplinasView = disciplinas;

        _events = {selectedDay: _listDisciplinasView};

        _selectedEvents = _events[selectedDay] ?? [];




      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  /*
    MÉTODO QUE SELECIONA O DIA NO CALENDÁRIO E CARREGA AS DISCIPLINAS
   */
  void _onDaySelected(DateTime day, List events) {
    _loadListaDisciplinas(day);
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      down == true ? down = false : down = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
        appBar: AppBar(


          backgroundColor: Colors.grey[350],


          elevation: 0.0,
          title: Text(
            "Cronograma",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'OpenSans', fontSize: 22.0),
          ),
          actions: <Widget>[
            _menuPopUp(),
          ],
        ),
        drawer: _ceDrawer(),
        body: Container(
            color: Colors.grey[350],
            child: Column(
              children: <Widget>[

                CeBottomNavigation(),

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Disciplinas de hoje',
                              style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontFamily: 'OpenSans',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(
                      height: 5.0,
                      color: Colors.indigoAccent,
                    ),
                    Expanded(
                        child:  _selectedEvents.isNotEmpty  ?  _buildEventList():
                         Column(

                           mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Icon(Icons.local_hotel,size: 70,color: Colors.grey,),

                                  Center(
                                   child: Text('Sem estudos para hoje!',
                                   style: TextStyle(
                                       color: Colors.grey,
                                       fontFamily: 'OpenSans',
                                       fontSize: 20.0)),
                                 )
                                ],
                            )
                    ),
                  ],
                ))),

              ],
            )));
  }

  Widget _ceDrawer() {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Jonathan Ferreira",
                      style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 20.0),
                ),
                accountEmail: Text(
                  "jmontsf@gmail.com",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'OpenSans',
                      fontSize: 15.0),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text('Cronograma de estudos',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0)),
                leading: Icon(Icons.calendar_today, color: Colors.indigoAccent),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.indigoAccent,
              ),
              ListTile(
                title: Text('Disciplinas',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0)),
                leading: Icon(Icons.school, color: Colors.indigoAccent),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.indigoAccent,
              ),
              ListTile(
                title: Text('Compartilhe',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0)),
                leading: Icon(Icons.share, color: Colors.indigoAccent),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.indigoAccent,
              ),
              ListTile(
                title: Text("Sair",
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0)),
                leading:
                    Icon(Icons.power_settings_new, color: Colors.indigoAccent),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pt_br',
      calendarController: _calendarController,
      events: _events,
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
          fontSize: 18,

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
            ? Colors.orange
            : _calendarController.isToday(date)
                ? Colors.black54
                : Colors.black12,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${_selectedEvents.length}' ?? '',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _menuPopUp() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: FlatButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => NovoCronogramaPage()));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.indigoAccent,
                ),
                label: Text("Editar",
                    style: TextStyle(
                        color: Colors.indigoAccent, fontFamily: 'OpenSans')))),
        PopupMenuItem(
            value: 2,
            child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.file_upload,
                  color: Colors.indigoAccent,
                ),
                label: Text("Exportar",
                    style: TextStyle(
                        color: Colors.indigoAccent, fontFamily: 'OpenSans')))),
        PopupMenuItem(
            value: 2,
            child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.print,
                  color: Colors.indigoAccent,
                ),
                label: Text("Imprimir",
                    style: TextStyle(
                        color: Colors.indigoAccent, fontFamily: 'OpenSans')))),
        PopupMenuDivider(),
        PopupMenuItem(
            value: 2,
            child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.indigoAccent,
                ),
                label: Text("Deletar",
                    style: TextStyle(
                        color: Colors.indigoAccent, fontFamily: 'OpenSans')))),
      ],
    );
  }



  _convertPeriodo(periodo){
    switch (periodo){
      case 1:
        return 'Manhã';
      case 2:
        return 'Tarde';
      case 3:
        return 'Noite';
    }
  }


  Widget _buildEventList() {


    return ListView.separated(

        itemCount: _selectedEvents.length,
        separatorBuilder: (context, index) => Divider(height: 1.0, color: Colors.grey),
        itemBuilder: (context, index) {

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(_selectedEvents[index].cor),
              child: Center(
                child: Text(
                  _selectedEvents[index].sigla,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            subtitle: Text(_convertPeriodo(_selectedEvents[index].periodo)),
            trailing: Icon(
              Icons.access_alarms,
              color: Colors.black26,
            ),
            title: Text(
              _selectedEvents[index].nome ?? '',
              style: TextStyle(color: Colors.indigo, fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CronometroPage(_selectedEvents[index])));
            },
          );
        });
  }
}
