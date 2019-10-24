
import 'package:ceapp/model/DiaPeriodoDisciplina.dart';
import 'package:ceapp/model/DiaSemana.dart';
import 'package:ceapp/model/Disciplina.dart';
import 'package:ceapp/model/Periodo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ceapp/model/Cronograma.dart';



/*

CLASSE QUE AUXILIA NA MANIPULAÇÃO DO BANCO DE DADOS SQFLITE

 */
class DbCeAppHelper {

  static final DbCeAppHelper _instance = DbCeAppHelper.internal();

  factory DbCeAppHelper() => _instance;

  DbCeAppHelper.internal();

  Database _db;


 Future<Database> get db async{

    if(_db != null){
      return _db;
    }else{
       _db = await initDb();
       return _db;

    }
  }

  /*
      INICIALIZA O BANCO DE DADOS
   */
  Future<Database> initDb() async{

    final databasesPath = await getDatabasesPath();
    final path =  join(databasesPath,"db_ceapp.db");

    return await openDatabase(path, version: 2, onCreate: (Database db, int newerVersion) async{

        await db.execute("CREATE TABLE $cronogramaTable( $idColumn INTEGER PRIMARY KEY, $nomeColumn TEXT NOT NULL,  $dataInicioColumn TEXT NOT NULL, $dataFimColumn TEXT NOT NULL)");

        db.execute("CREATE TABLE $disciplinaTable( $idDColumn INTEGER PRIMARY KEY, $nomeDColumn TEXT NOT NULL, $siglaDColumn TEXT NOT NULL, $corDColumn INTEGER NOT NULL)");

       db.execute("CREATE TABLE $periodoTable( $idPColumn INTEGER PRIMARY KEY, $nomePColumn TEXT NOT NULL)");

        db.execute("CREATE TABLE $diaSemanaTable( $idDSColumn INTEGER PRIMARY KEY, $nomeDSColumn TEXT NOT NULL, $siglaDSColumn TEXT NOT NULL)");

       db.execute("CREATE TABLE $diaPeriodoDisciplinaTable( $idDPDColumn INTEGER PRIMARY KEY, $fkDColumn INTEGER NOT NULL"", $diaColumn TEXT NOT NULL, $periodoColumn TEXT NOT NULL,  $horasColumn INTEGER NOT NULL)");

       db.execute("INSERT INTO $diaSemanaTable($nomeDSColumn, $siglaDSColumn) VALUES ('Segunda','SEG'), ('Terça','TER'), ('Quarta','QUA'), ('Quinta','QUI'), ('Sexta','SEX'),('Sábado','SAB'),('Domingo','DOM')");

       db.execute("INSERT INTO $periodoTable ($nomePColumn) VALUES('Manhã'), ('Tarde'),('Noite')");



        print("DATABASE CREATED");



    });
  }

  /*
      MÉTODO PARA SALVAR UM CRONOGRAMA
   */
  Future<Cronograma> saveCronograma(Cronograma cronograma) async {

   Database dbCronograma = await db;
   cronograma.id = await dbCronograma.insert(cronogramaTable, cronograma.toMap());
   return cronograma;


  }

  /*
      MÉTODO PARA BUSCAR UM CRONOGRAMA PELO ID
   */
  Future<Cronograma> getCronograma(int id) async {

    Database dbCronograma = await db;

    List<Map> maps = await dbCronograma.query(cronogramaTable,
        columns: [idColumn,nomeColumn,dataInicioColumn, dataFimColumn],
    where: "$idColumn = ?",
    whereArgs: [id]);

    if(maps.length > 0){
      return Cronograma.fromMap(maps.first);
    }else{

      return null;
    }

  }


  /*
     DELETA  UM  CRONOGRAMA PELO ID
   */
  Future<int> deleteCronograma(int id) async{

    Database dbCronograma = await db;


    return await dbCronograma.delete(cronogramaTable, where: "$idColumn = ?",whereArgs: [id]);


  }


  /*
      ATUALIZA UM CRONOGRAMA
   */
  Future<int> updateCronograma(Cronograma cronograma) async {

    Database dbCronograma = await db;
   return  await dbCronograma.update(cronogramaTable, cronograma.toMap(), where: "$idColumn = ?",whereArgs: [cronograma.id]);


  }


  //////////////////////////////////////////////////////////////////////////////////////////////
  /*
      MÉTODO PARA SALVAR UM CRONOGRAMA
   */
  Future<DiaPeriodoDisciplina> saveDiaPeriodoDisciplina(DiaPeriodoDisciplina diaPeriodoDisciplina) async {

    Database dbDiaPeriodoDisciplina = await db;
    diaPeriodoDisciplina.id = await dbDiaPeriodoDisciplina.insert(diaPeriodoDisciplinaTable, diaPeriodoDisciplina.toMap());
    return diaPeriodoDisciplina;


  }

  /*
      MÉTODO PARA BUSCAR UM CRONOGRAMA PELO ID
   */
  Future<DiaPeriodoDisciplina> getDiaPeriodoDisciplina(int id) async {

    Database dbDiaPeriodoDisciplina = await db;

    List<Map> maps = await dbDiaPeriodoDisciplina.query(diaPeriodoDisciplinaTable,
        columns: [idDPDColumn,fkDColumn,periodoColumn, diaColumn, horasColumn],
        where: "$idDPDColumn = ?",
        whereArgs: [id]);

    if(maps.length > 0){
      return DiaPeriodoDisciplina.fromMap(maps.first);
    }else{

      return null;
    }

  }


  /*
     DELETA  UM  CRONOGRAMA PELO ID
   */
  Future<int> deleteDiaPeriodoDisciplina(int id) async{

    Database dbDiaPeriodoDisciplina = await db;

    return await dbDiaPeriodoDisciplina.delete(diaPeriodoDisciplinaTable, where: "$idDPDColumn = ?",whereArgs: [id]);


  }


  /*
      ATUALIZA UM CRONOGRAMA
   */
  Future<int> updateDiaPeriodoDisciplina(DiaPeriodoDisciplina diaPeriodoDisciplina) async {

    Database dbDiaPeriodoDisciplina = await db;
    return  await dbDiaPeriodoDisciplina.update(cronogramaTable, diaPeriodoDisciplina.toMap(), where: "$idDPDColumn= ?",whereArgs: [diaPeriodoDisciplina.id]);


  }



  /*
      MÉTODO PARA SALVAR UMA DISCIPLINA
   */
  Future<Disciplina> saveDisciplina(Disciplina disciplina) async {

    Database dbDisciplina = await db;

    disciplina.toString();


    disciplina.id = await dbDisciplina.insert(disciplinaTable, disciplina.toMap());
    return disciplina;


  }



  Future<List<Disciplina>> getDisciplinas() async {

    Database dbDisciplinas = await db;
    List listMap = await dbDisciplinas.rawQuery("SELECT * FROM $disciplinaTable" );
    List<Disciplina> listDisciplina =  List();
    for(Map m in listMap){

      listDisciplina.add(Disciplina.fromMap(m));

    }

    return listDisciplina;

  }



  Future<List> getPeriodos() async {

    Database dbPeriodo = await db;
    List listMap = await dbPeriodo.rawQuery("SELECT * FROM $periodoTable" );
    List<Periodo> listPeriodo =  List();
    for(Map m in listMap){

      listPeriodo.add(Periodo.fromMap(m));

    }

    return listPeriodo;

  }



  Future<List> getDias() async {

    Database dbDias = await db;
    List listMap = await dbDias.rawQuery("SELECT * FROM $diaSemanaTable" );
    List<DiaSemana> listDiaSemana =  List();
    for(Map m in listMap){

      listDiaSemana.add(DiaSemana.fromMap(m));

    }

    return listDiaSemana;

  }




//////////////////////////////////////////////////////////////////////////////////////////////



  /*
      FECHA UMA CONEXÃO COM O BANCO DE DADOS
   */
  Future  closeDb() async {

    Database dbCronograma = await db;
    dbCronograma.close();


  }






/*


  //Atualiza uma compra
  Future<int> updateItem(Item item) async {

    Database dbCompra = await db;



    return  await dbCompra.update(itemTable, item.toMap(), where: "$idItemColumn = ?",whereArgs: [item.idItem]);


  }


  //Lista todos as listas de compras
  Future<List> getAllCompra() async {

    Database dbCompra = await db;
    List listMap = await dbCompra.rawQuery("SELECT * FROM $compraTable");
    List<Compra> listCompras =  List();
    for(Map m in listMap){

      listCompras.add(Compra.fromMap(m));

    }

    return listCompras;

  }


  //Retorna o tamanho da lista
  Future<int> getIsItensMarcados(int fk, int status) async {

    Database dbListaCompras = await db;
    return  Sqflite.firstIntValue(await dbListaCompras.rawQuery("SELECT COUNT(*) FROM $itemTable WHERE $fkCompraColumn = $fk AND $okColumn = $status"));


  }



  //Retorna o tamanho da lista
  Future<int> getSizeCompra() async {

    Database dbListaCompras = await db;
   return  Sqflite.firstIntValue(await dbListaCompras.rawQuery("SELECT COUNT(*) FROM $compraTable"));


  }



//CRUD DE ITEM DA LISTA DE COMPRAS


  Future<Item> saveItem(Item item) async {


    item.toString();


    Database dbItem = await db;
    item.idItem = await dbItem.insert(itemTable, item.toMap());
    return item;


  }




//Lista todos as listas de compras
  Future<List> getAllItens(int fk) async {

    Database dbCompra = await db;
    List listMap = await dbCompra.rawQuery("SELECT * FROM $itemTable WHERE $fkCompraColumn = $fk" );
    List<Item> listItens =  List();
    for(Map m in listMap){

      listItens.add(Item.fromMap(m));

    }

    return listItens;

  }


//Lista todos as listas de compras
  Future<List> getItensPorStatus(int fk, int status) async {

    Database dbCompra = await db;
    List listMap = await dbCompra.rawQuery("SELECT * FROM $itemTable WHERE $fkCompraColumn = $fk AND $okColumn = $status" );
    List<Item> listItens =  List();
    for(Map m in listMap){

      listItens.add(Item.fromMap(m));

    }

    return listItens;

  }







  //Lista todos as listas de compras
  Future<List> statusAllItens(int fkCompra, int status) async {

    Database dbCompra = await db;
    List listMap = await dbCompra.rawQuery("UPDATE $itemTable SET $okColumn = $status  WHERE $fkCompraColumn = $fkCompra" );
    List<Item> listItens =  List();
    for(Map m in listMap){

      listItens.add(Item.fromMap(m));

    }

    return listItens;

  }





  //Lista todos as listas de compras
  Future<List> getOrderItens(int fk) async {

    Database dbCompra = await db;
    List listMap = await dbCompra.rawQuery("SELECT * FROM $itemTable WHERE $fkCompraColumn = $fk  ORDER BY $okColumn ASC");
    List<Item> listItens =  List();
    for(Map m in listMap){

      listItens.add(Item.fromMap(m));

    }

    return listItens;

  }


  //Deleta um contact pelo id
  Future<int> deleteItem(int id) async{

    Database dbCompra = await db;
    return await dbCompra.delete(itemTable, where: "$idItemColumn = ?",whereArgs: [id]);

  }


  //Deleta todos os itens
  Future<int> deleteAllItens(int fkCompra) async{

    Database dbCompra = await db;

   return await dbCompra.delete(itemTable, where: "$fkCompraColumn = ?",whereArgs: [fkCompra]);



  }




//Retorna o tamanho da lista
  Future<int> getSizeItem(int fkCompra) async {

    Database dbListaCompras = await db;
    return  Sqflite.firstIntValue(await dbListaCompras.rawQuery("SELECT COUNT(*) FROM $itemTable WHERE  $fkCompraColumn = $fkCompra"));


  }

*/





}
