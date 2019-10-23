final String disciplinaTable = "disciplinaTable";
final String idDColumn = "idColumn";
final String nomeDColumn = "nomeColumn";
final String siglaDColumn = "siglaColumn";
final String corDColumn = "corColumn";



class Disciplina {

  int id;
  String nome;
  String sigla;
  int cor;

  Disciplina();

  Disciplina.fromMap(Map map) {

    id = map[idDColumn];
    nome = map[nomeDColumn];
    sigla = map[siglaDColumn];
    cor = map[corDColumn];

  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeDColumn: nome,
      siglaDColumn: sigla,
      corDColumn: cor

    };

    if (id != null) {
      map[idDColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Disciplina(id: $id, nome: $nome, sigla: $sigla, cor: $cor)";

  }


}
