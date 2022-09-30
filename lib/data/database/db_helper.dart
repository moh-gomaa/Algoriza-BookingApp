import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:booking_app/resources/constants/constants.dart' as constant;

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();

  factory DBHelper() => _instance;

  DBHelper.internal();

  final userTable = "userTable";
  String id = "id";
  String name = "name";
  String email = "email";
  String apiToken = "api_Token";
  String image = "image";
  String password = "password";
  String password_confirmation = "password_confirmation";

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, constant.db);
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    db.execute('''
          CREATE TABLE $userTable (
          $id INTEGER, 
          $name TEXT,
          $email TEXT,
          $apiToken TEXT,
          $image TEXT,
          $password TEXT,
          $password_confirmation TEXT
          )
        ''');
  }

  Future close() async {
    var dbClient = await (db);
    return dbClient.close();
  }
}
