import 'package:ceapp/fragments/MultiSelectChip.dart';
import 'package:ceapp/helper/DbCeAppHelper.dart';
import 'package:ceapp/model/Cronograma.dart';
import 'package:ceapp/model/DiaPeriodoDisciplina.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';


class NovoCronogramaPage extends StatefulWidget {
  @override
  _NovoCronogramaPageState createState() => _NovoCronogramaPageState();
}

class _NovoCronogramaPageState extends State<NovoCronogramaPage> {



  bool diasSelecionado = true;


  static final _key = GlobalKey<FormState>();
  bool _autoValidate = false;


  var _passKey = GlobalKey();
  var _passIKey = GlobalKey();
  var _passFKey = GlobalKey();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    DbCeAppHelper helper = new DbCeAppHelper();

    Cronograma tmpCronograma = new Cronograma();

    List<String> diasList = [
      "Segunda",
      "Terça",
      "Quarta",
      "Quinta",
      "Sexta",
      "Sábado",
      "Domingo"
    ];

    List<String> horariosList = [
      "Manhã",
      "Tarde",
      "Noite",
    ];

    MultiSelectChip _multiSelectChip = MultiSelectChip(diasList);

    List<String> _horariosSelecionadosList = List();

    List<String> _diasSelecionadosList = List();

    final dateFormat = DateFormat("dd/MM/yyyy");


    String _nome;
    DateTime  _inicio;
    DateTime _fim;




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
      body: SingleChildScrollView(
          child: Container(
              color: Colors.indigoAccent,
              child: Form(
                  key: _key,
                  autovalidate: _autoValidate,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            TextFormField(
                              key: _passKey,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontFamily: 'OpenSans', fontSize: 15.0),
                              decoration: InputDecoration(
                                labelText: 'Nome',
                              ),
                              // ignore: missing_return
                              validator: (val) {
                                if (val.isEmpty)
                                  return 'O nome não pode ser vazio!';

                                if (val.length > 20)
                                  return 'Informe um nome com até 20 caracteres';
                                else


                                  setState(() {
                                    _nome = val;
                                  });



                              },



                            ),
                            DateTimePickerFormField(
                              key: _passIKey,
                              dateOnly: true,
                              format: dateFormat,
                              decoration: InputDecoration(
                                  labelText: 'Início dos estudos'),
                              initialDate: DateTime.now(),
                              // ignore: missing_return
                              validator: (value) {
                                if (value == null) return 'Defina uma data para o início dos seus estudos!';
                                else {
                                  setState(() {
                                    _inicio = value;
                                  });
                                }


                              },

                            ),



                            DateTimePickerFormField(

                              key: _passFKey,
                              dateOnly: true,
                              format: dateFormat,
                              decoration:
                                  InputDecoration(labelText: 'Fim dos estudos'),
                              initialDate: DateTime.now(),
                              // ignore: missing_return
                              validator: (value) {
                                if (value == null) return 'Informe uma data para o fim do cronograma!';
                                else{


                                  setState(() {

                                    _fim = value;


                                  });
                                }
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
                              diasList,

                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  _diasSelecionadosList = selectedList;
                                });
                              },

                            ),


                          diasSelecionado == false ? Text("Selecione pelo menos um dia para os estudos!", style: TextStyle(color: Colors.redAccent, fontSize: 12.0),)
                          : Container()


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
                              horariosList,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  _horariosSelecionadosList = selectedList;
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
                            color: Colors.orange,
                            onPressed: () async {
                              if (_key.currentState.validate()) {

                                   tmpCronograma.nome = _nome;
                                   tmpCronograma.dataInicio = _inicio.toString();
                                   tmpCronograma.dataFim = _fim.toString();

                                    Cronograma  savedCronograma = await helper.saveCronograma(tmpCronograma);


                                   DiaPeriodoDisciplina tmpDpd = new DiaPeriodoDisciplina();








                                    DiaPeriodoDisciplina dpd = await helper.saveDiaPeriodoDisciplina(tmpDpd);















                              } else {

                                setState(() {
                                  _autoValidate = true;



                                });



                              }
                            },
                            child: new Text("Salvar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 17.0)),
                          ),
                        ),
                      ])))),
    );
  }
}
