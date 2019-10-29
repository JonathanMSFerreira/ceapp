final String disciplinaView = "disciplinaView";
final String idDVwColumn = "idColumn";
final String nomeDVwColumn = "nomeColumn";
final String siglaDVwColumn = "siglaColumn";
final String corDVwColumn = "corColumn";
final String perDVwColumn = "fkPerColumn";



class DisciplinaView {

  int id;
  String nome;
  String sigla;
  int cor;
  int periodo;

  DisciplinaView();

  DisciplinaView.fromMap(Map map) {

    id = map[idDVwColumn];
    nome = map[nomeDVwColumn];
    sigla = map[siglaDVwColumn];
    cor = map[corDVwColumn];
    periodo = map[perDVwColumn];

  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeDVwColumn: nome,
      siglaDVwColumn: sigla,
      corDVwColumn: cor,
      perDVwColumn: periodo

    };

    if (id != null) {
      map[idDVwColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "DisciplinaView(id: $id, nome: $nome, sigla: $sigla, cor: $cor, periodo: $periodo)";

  }


}
