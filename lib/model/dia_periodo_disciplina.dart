final String diaPeriodoDisciplinaTable = "diaPeriodoDisciplinaTable";
final String idDPDColumn = "idDPDColumn";

final String fkPerColumn = "fkPerColumn";
final String fkDiscColumn = "fkDiscColumn";
final String fkDiaColumn = "fkDiaColumn";




class DiaPeriodoDisciplina {

  int id;
  int fkDisciplina;
  int fkPeriodo;
  int fkDia;

  DiaPeriodoDisciplina();

  DiaPeriodoDisciplina.fromMap(Map map) {

    id = map[idDPDColumn];
    fkDisciplina = map[fkDiscColumn];
    fkPeriodo = map[fkPerColumn];
    fkDia = map[fkDiaColumn];



  }


  Map toMap() {
    Map<String, dynamic> map = {



      fkDiscColumn: fkDisciplina,
      fkPerColumn: fkPeriodo,
      fkDiaColumn: fkDia


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
