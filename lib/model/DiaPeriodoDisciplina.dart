final String diaPeriodoDisciplinaTable = "diaPeriodoDisciplinaTable";
final String idDPDColumn = "idDPDColumn";
final String fkDColumn = "fkDColumn";
final String periodoColumn = "periodoColumn";
final String diaColumn = "diaColumn";
final String horasColumn = "horasColumn";



class DiaPeriodoDisciplina {

  int id;
  int fkDisciplina;
  String strPeriodo;
  String strDiaSemana;
  int horas;

  DiaPeriodoDisciplina();

  DiaPeriodoDisciplina.fromMap(Map map) {

    id = map[idDPDColumn];
    fkDisciplina = map[fkDColumn];
    strPeriodo = map[periodoColumn];
    strDiaSemana = map[diaColumn];
    horas = map[horasColumn];


  }


  Map toMap() {
    Map<String, dynamic> map = {



      fkDColumn: fkDisciplina,
      periodoColumn: strPeriodo,
      diaColumn: strDiaSemana


    };

    if (id != null) {
      map[idDPDColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Periodo(id: $id, fkdisciplina: $fkDisciplina, periodo: $strPeriodo, dias: $strDiaSemana, horas: $horas)";

  }


}
