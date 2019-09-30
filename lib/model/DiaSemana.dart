final String diaSemanaTable = "diaSemanaTable";
final String idDSColumn = "idDSColumn";
final String nomeDSColumn = "nomeDSColumn";



class Periodo {

  int id;
  String nome;

  Periodo();

  Periodo.fromMap(Map map) {

    id = map[idDSColumn];
    nome = map[nomeDSColumn];


  }


  Map toMap() {
    Map<String, dynamic> map = {
      nomeDSColumn: nome,


    };

    if (id != null) {
      map[idDSColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Periodo(id: $id, nome: $nome)";

  }


}
