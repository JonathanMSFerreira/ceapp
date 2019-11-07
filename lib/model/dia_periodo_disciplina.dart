final String diaPeriodoDisciplinaTable = "diaPeriodoDisciplinaTable";
final String idDPDColumn = "idDPDColumn";
final String fkPerColumn = "fkPerColumn";
final String fkDiscColumn = "fkDiscColumn";
final String fkDiaColumn = "fkDiaColumn";
final String horaColumn = "horaColumn";
final String minutoColumn = "minutoColumn";
final String segundoColumn = "segundoColumn";




class DiaPeriodoDisciplina {

  int id;
  int fkDisciplina;
  int fkPeriodo;
  int fkDia;
  int hora;
  int minuto;
  int segundo;

  DiaPeriodoDisciplina();

  DiaPeriodoDisciplina.fromMap(Map map) {

    id = map[idDPDColumn];
    fkDisciplina = map[fkDiscColumn];
    fkPeriodo = map[fkPerColumn];
    fkDia = map[fkDiaColumn];
    hora = map[horaColumn];
    minuto = map[minutoColumn];
    segundo = map[segundoColumn];



  }


  Map toMap() {
    Map<String, dynamic> map = {



      fkDiscColumn: fkDisciplina,
      fkPerColumn: fkPeriodo,
      fkDiaColumn: fkDia,
      horaColumn: hora,
      minutoColumn: minuto,
      segundoColumn: segundo


    };

    if (id != null) {
      map[idDPDColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "DiaPeriodoDisciplina(id: $id, fkdisciplina: $fkDisciplina, periodo: $fkPeriodo, dias: $fkDia)";

  }


}
