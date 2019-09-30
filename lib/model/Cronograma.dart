final String cronogramaTable = "cronogramaTable";
final String idColumn = "idColumn";
final String nomeColumn = "nomeColumn";
final String dataInicioColumn = "dataInicioColumn";
final String dataFimColumn = "dataFimColumn";




class Cronograma {

  int id;
  String nome;
  String dataInicio;
  String dataFim;




  Cronograma();


  Cronograma.fromMap(Map map) {

    id = map[idColumn];
    nome = map[nomeColumn];
    dataInicio = map[dataInicioColumn];
    dataFim = map[dataFimColumn];


  }


  Map toMap() {
    Map<String, dynamic> map = {
      nomeColumn: nome,
      dataInicioColumn: dataInicio,
      dataFimColumn: dataFim,


    };

    if (id != null) {
      map[idColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Cronograma(id: $id, name: $nome, dateInicio: $dataInicio, dataFim: $dataFim)";

  }


}
