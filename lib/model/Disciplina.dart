final String disciplinaTable = "disciplinaTable";
final String idDColumn = "idColumn";
final String nomeDColumn = "nomeColumn";



class Disciplina {

  int id;
  String nome;

  Disciplina();

  Disciplina.fromMap(Map map) {

    id = map[idDColumn];
    nome = map[nomeDColumn];


  }


  Map toMap() {
    Map<String, dynamic> map = {
      nomeDColumn: nome,


    };

    if (id != null) {
      map[idDColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Disciplina(id: $id, nome: $nome)";

  }


}
