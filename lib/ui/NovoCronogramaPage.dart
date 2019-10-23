import 'package:ceapp/fragments/MultiSelectChip.dart';
import 'package:ceapp/helper/DbCeAppHelper.dart';
import 'package:ceapp/model/Cronograma.dart';
import 'package:ceapp/model/DiaPeriodoDisciplina.dart';
import 'package:ceapp/model/DiaSemana.dart';
import 'package:ceapp/model/Periodo.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


class NovoCronogramaPage extends StatefulWidget {
  @override
  _NovoCronogramaPageState createState() => _NovoCronogramaPageState();
}

class _NovoCronogramaPageState extends State<NovoCronogramaPage> {


  List<String> _listaPeriodos = new List<String>();
  List<String> _listaDias = new List<String>();



  List<String> _horariosSelecionadosList = List();
  List<String> _diasSelecionadosList = List();


  DbCeAppHelper helper;


  FocusNode _nomeFocus;
  FocusNode _inicioFocus;
  FocusNode _fimFocus;

  bool _nomeInserido = false;
  bool _inicioInserido = false;
  bool _fimInserido = false;
  bool _diasInserido = false;
  bool _horariosInserido = false;


  Cronograma tmpCronograma;



  @override
  void initState() {
    super.initState();
    helper = new DbCeAppHelper();

    _getPeriodos();
    _getDias();


    tmpCronograma = new Cronograma();
    _nomeFocus = FocusNode();
    _inicioFocus = FocusNode();
    _fimFocus = FocusNode();
  }

  @override
  void dispose() {
    _nomeFocus.dispose();
    _inicioFocus.dispose();
    _fimFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final dateFormat = DateFormat("dd/MM/yyyy");

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: Text("Cronograma",
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 20.0)),
        elevation: 0.0,
      ),
      body: ListView(




                  children: [
                    Card(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(children: [
                            Text("Informações",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.indigo,
                            ),
                            TextField(

                              focusNode: _nomeFocus,

                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontFamily: 'OpenSans', fontSize: 15.0),
                              decoration: InputDecoration(
                                labelText: 'Nome',
                              ),
                              onSubmitted: (term) {
                                _fieldFocusChange(context, _nomeFocus,
                                    _inicioFocus);
                              },

                              onChanged: (inputNome) {
                                setState(() {
                                  if (inputNome.isNotEmpty &&
                                      inputNome != null) {
                                    tmpCronograma.nome = inputNome;
                                    _nomeInserido = true;
                                  } else {
                                    _nomeInserido = false;
                                  }
                                });
                              },


                            ),
                            DateTimePickerFormField(
                              focusNode: _inicioFocus,

                              dateOnly: true,
                              format: dateFormat,
                              decoration: InputDecoration(
                                  labelText: 'Início dos estudos'),
                              initialDate: DateTime.now(),

                              onFieldSubmitted: (term) {
                                _fieldFocusChange(context, _inicioFocus,
                                    _fimFocus);
                              },

                              onChanged: (inputInicio) {
                                setState(() {
                                  if (inputInicio != null) {
                                    tmpCronograma.dataInicio =
                                        inputInicio.toString();
                                    _inicioInserido = true;
                                  } else {
                                    _inicioInserido = false;
                                  }
                                }


                                );
                              },

                            ),


                            DateTimePickerFormField(

                              focusNode: _fimFocus,
                              dateOnly: true,
                              format: dateFormat,
                              decoration:
                              InputDecoration(labelText: 'Fim dos estudos'),
                              initialDate: DateTime.now(),
                              onChanged: (inputFim) {
                                setState(() {
                                  if (inputFim != null) {
                                    tmpCronograma.dataFim = inputFim.toString();
                                    _fimInserido = true;
                                  } else {
                                    _fimInserido = false;
                                  }
                                }


                                );
                              },


                            ),
                          ]),
                        )),
                    Card(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(children: [
                            Text("Dias disponíveis",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.indigo,
                            ),
                            MultiSelectChip(
                              _listaDias,

                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  _diasSelecionadosList = selectedList;

                                  if (_diasSelecionadosList.isNotEmpty) {
                                    _diasInserido = true;
                                  } else {
                                    _diasInserido = false;
                                  }
                                });
                              },

                            ),


                          ]),
                        )),
                    Card(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(children: [
                            Text("Horários disponíveis",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.indigo,
                            ),
                            MultiSelectChip(
                              _listaPeriodos,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  _horariosSelecionadosList = selectedList;


                                  if (_horariosSelecionadosList.isNotEmpty) {
                                    _horariosInserido = true;
                                  } else {
                                    _horariosInserido = false;
                                  }
                                });
                              },
                            ),
                          ]),
                        )),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: RaisedButton(
                        padding: const EdgeInsets.all(15.0),
                        textColor: Colors.white,
                        color: formIsOk(
                            _nomeInserido, _inicioInserido, _fimInserido,
                            _diasInserido, _horariosInserido) == true ? Colors
                            .orange : Colors.grey,
                        onPressed: formIsOk(_nomeInserido, _inicioInserido, _fimInserido,
                            _diasInserido, _horariosInserido) == true ?

                            () {
                          helper.saveCronograma(tmpCronograma);


                          tmpCronograma.toString();


                          // Cronograma  savedCronograma = await helper.saveCronograma(tmpCronograma);


                          // DiaPeriodoDisciplina tmpDpd = new DiaPeriodoDisciplina();


                          // DiaPeriodoDisciplina dpd = await helper.saveDiaPeriodoDisciplina(tmpDpd);


                        } : null,

                        child: new Text("Salvar",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 17.0)),
                      ),
                    ),
                  ]),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool formIsOk(hasNome, hasInicio, hasFim, hasDia, hasHorarios) {
    return hasNome && hasInicio && hasFim && hasDia && hasHorarios;
  }

  void _getPeriodos() {

    List<String> tmpLista = new List<String>();

    helper.getPeriodos().then((list) {

       for(Periodo p in list){

         tmpLista.add(p.nome);

       }

       setState(() {

         _listaPeriodos = tmpLista;



       });
    });
  }


  void _getDias() {

    List<String> tmpLista = new List<String>();

    helper.getDias().then((list) {

      for(DiaSemana d in list){

        tmpLista.add(d.nome);

      }

      setState(() {

        _listaDias = tmpLista;



      });
    });
  }







}
