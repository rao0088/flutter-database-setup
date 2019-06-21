import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:project/database/user.dart';

class Databasehelper {

  static final Databasehelper _databasehelper =Databasehelper.internal();
  factory Databasehelper() => _databasehelper;

  static Database _db;
  final  String id = 'id';
  final  String name = 'name';
  final  String pass = 'pass';
  final  String table = 'user';
  final  String dbname = 'users.db';

  Future<Database> get db async{
    if(_db != null){
      return _db;

    }
    _db = await initDb();
    return _db;
  }

  Databasehelper.internal();

  initDb() async{

    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,dbname);

    var ourDb = openDatabase(path,version: 1, onCreate: _onCreate);

    return ourDb;


  }


   _onCreate(Database db, int version)async {

    await db.execute(
      "CREATE TABLE $table($id INTEGER PRIMARY KEY, $name TEXT,$pass TEXT)");
        

  }

  Future<int> saveUser(User user) async {

    var dbClient = await db;
    int res = await dbClient.insert("$table" , user.toMap());

    return res;

  }
  Future <List> getAllUsers() async{

    var dbClient = await db;
    var result =await dbClient.rawQuery("SELECT * FROM $table");
    return result.toList();

  }
  Future <int> getCount() async{
    var dbClient =await db;
    return Sqflite.firstIntValue(
      await dbClient.rawQuery("SELECT COUNT(*) FROM $table"));

  }
  Future<User>getUser(int uid) async{
    var dbClient =await db;
    var result = await dbClient.rawQuery("SELECT * FROM $table WHERE $id=$uid");

    if(result.length == 0)return null;
    return User.fromMap(result.first);

  }

  Future<int> deleteUser(int d) async{

    var dbClient =await db;
    return await dbClient.delete(table,where:"$id=?",whereArgs:[id]);

  }
  Future <int> updateUser(User user) async{
    var dbClient =await db;
    return await dbClient.update(table, user.toMap(),where: " $id = ?",whereArgs: [user.id]);
  }
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}

