final String periodoTable = "periodoTable";
final String idPColumn = "idColumn";
final String nomePColumn = "nomeColumn";



class Periodo {

  int id;
  String nome;

  Periodo();

  Periodo.fromMap(Map map) {

    id = map[idPColumn];
    nome = map[nomePColumn];


  }


  Map toMap() {
    Map<String, dynamic> map = {
      nomePColumn: nome,


    };

    if (id != null) {
      map[idPColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Periodo(id: $id, nome: $nome)";

  }


}
