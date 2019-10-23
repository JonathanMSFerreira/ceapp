final String diaSemanaTable = "diaSemanaTable";
final String idDSColumn = "idDSColumn";
final String nomeDSColumn = "nomeDSColumn";
final String siglaDSColumn = "siglaDSColumn";

class DiaSemana {

  int id;
  String nome;
  String sigla;

  DiaSemana();

  DiaSemana.fromMap(Map map) {
    id = map[idDSColumn];
    nome = map[nomeDSColumn];
    sigla = map[siglaDSColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeDSColumn: nome,
      siglaDSColumn:sigla


    };

    if (id != null) {
      map[idDSColumn] = id;
    }

    return map;
  }

  @override
  String toString() {
    return "DiaSemana(id: $id, nome: $nome, sigla: $sigla)";
  }
}
