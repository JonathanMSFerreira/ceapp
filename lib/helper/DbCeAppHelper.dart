
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

    return await openDatabase(path,version: 1, onCreate: (Database db, int newerVersion) async{

      await db.execute(
        "CREATE TABLE $cronogramaTable( $idColumn INTEGER PRIMARY KEY, $nomeColumn TEXT NOT NULL,  $dataInicioColumn TEXT NOT NULL, $dataFimColumn TEXT NOT NULL)");



      /*await db.execute(
          "CREATE TABLE $itemTable( $idItemColumn INTEGER PRIMARY KEY, $nameItemColumn TEXT,  $qtdColumn TEXT, $medidaColumn TEXT,  $okColumn INTEGER NOT NULL,  $fkCompraColumn INTEGER)");*/



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

    dbCronograma.delete(cronogramaTable, where: "$idColumn = ?",whereArgs: [id]);

    return await dbCronograma.delete(cronogramaTable, where: "$idColumn = ?",whereArgs: [id]);


  }


  /*
      ATUALIZA UM CRONOGRAMA
   */
  Future<int> updateCronograma(Cronograma cronograma) async {

    Database dbCronograma = await db;
   return  await dbCronograma.update(cronogramaTable, cronograma.toMap(), where: "$idColumn = ?",whereArgs: [cronograma.id]);


  }



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
