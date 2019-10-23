final String diaSemanaTable = "diaSemanaTable";
final String idDSColumn = "idDSColumn";
final String nomeDSColumn = "nomeDSColumn";



class DiaSemana {

  int id;
  String nome;

  DiaSemana();

  DiaSemana.fromMap(Map map) {

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

    return "DiaSemana(id: $id, nome: $nome)";

  }


}
