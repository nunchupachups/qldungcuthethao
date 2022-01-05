
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:qldungcuthethao/modul/modul_data.dart';
import 'dart:async';

final String itemsTable = "itemsTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String brandColumn = "brandColumn";
final String weightColumn= "weightColumn";
final String categoryColumn = "categoryColumn";
final String descriptionColumn = "descriptionColumn";
final String imgColumn = "imgColumn";

class SqlHelper{
  static final SqlHelper _instance = SqlHelper.internal();
  factory SqlHelper() => _instance;

  SqlHelper.internal();

  Database _db;

  Future<Database> get db async{
    if(_db !=null){
      return _db;
    }else{
      _db = await initDb();

      return _db;
    }
  }

  Future<Database> initDb() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "brhom5.db");
    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE $itemsTable("
          "$idColumn INTEGER PRIMARY KEY,"
          "$nameColumn TEXT,"
          "$brandColumn TEXT,"
          "$weightColumn TEXT,"
          "$categoryColumn TEXT,"
          "$descriptionColumn TEXT,"
          "$imgColumn TEXT)");
    });
  }
  
  Future<Data> readingData(int id) async{
    Database dbData = await db;
    List<Map> maps = await dbData.query(itemsTable,
    columns: [
      idColumn,
      nameColumn,
      brandColumn,
      weightColumn,
      categoryColumn,
      descriptionColumn,
      imgColumn,
    ],
      where: "$idColumn = ?",
      whereArgs: [id]);
    if (maps.length>0){
      return Data.fromMap(maps.first);
    }else{
      return null;
    }
  }

  Future<Data> insertData(Data data) async{
    Database dbData = await db;
    data.id = await dbData.insert(itemsTable, data.toMap());
    return data;
  }

  Future<int> deleteData(int id) async{
    Database dbData = await db;
    return await dbData.delete(itemsTable,where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateData(Data data) async{
    Database dbData = await db;
    return await dbData.update(itemsTable, data.toMap(), where: "idColumn = ?", whereArgs: [data.id]);
  }

  Future<List> getData() async{
    Database dbData = await db;
    List listMap = await dbData.rawQuery("SELECT * FROM $itemsTable");
    List<Data> listData = List();
    for(Map m in listMap){
      listData.add(Data.fromMap(m));
    }
    return listData;
  }

  Future<int> getNumber() async{
    Database dbData = await db;
    return Sqflite.firstIntValue(
      await dbData.rawQuery("SELECT COUNT(*) FROM $itemsTable"));
  }

  Future close() async {
    Database dbData = await db;
    dbData.close();
  }
}