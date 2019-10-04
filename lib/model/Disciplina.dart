final String disciplinaTable = "disciplinaTable";
final String idDColumn = "idColumn";
final String nomeDColumn = "nomeColumn";
final String siglaDColumn = "siglaColumn";



class Disciplina {

  int id;
  String nome;
  String sigla;

  Disciplina();

  Disciplina.fromMap(Map map) {

    id = map[idDColumn];
    nome = map[nomeDColumn];
    sigla = map[siglaDColumn];


  }


  Map toMap() {
    Map<String, dynamic> map = {
      nomeDColumn: nome,
      siglaDColumn: sigla


    };

    if (id != null) {
      map[idDColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Disciplina(id: $id, nome: $nome, sigla: $sigla)";

  }


}
