import 'dart:async';

import 'package:booking_app/data/database/db_helper.dart';
import 'package:booking_app/data/models/user_model.dart';

class UserHelper {
  static final UserHelper _instance = new UserHelper.internal();

  factory UserHelper() => _instance;

  UserHelper.internal();

  final tableName = "userTable";
  String tablePrimaryKey = "id";

  Future<int> savePost(UserModel row) async {
    var dbClient = await (DBHelper().db);
//    row.logoImage =await getImageLogo(row.memberID.toString());
    var res = await dbClient.insert("$tableName", row.toJsonDB());
    return res;
  }

  Future<List<UserModel>> getAll() async {
    var dbClient = await (DBHelper().db);
    List<Map> result = await dbClient.rawQuery("SELECT * FROM $tableName");
    return result.length == 0
        ? []
        : result
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Future<UserModel?> get(String id) async {
    var dbClient = await (DBHelper().db);
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE ${tablePrimaryKey}=?", [id]);
    if (result.length == 0) return null;

    return new UserModel.fromJson(result.first);
  }

  Future<int> delete(String? id) async {
    var dbClient = await (DBHelper().db);
    return await dbClient
        .delete(tableName, where: "$tablePrimaryKey = ?", whereArgs: [id]);
  }

  Future<int> update(UserModel row) async {
    var dbClient = await (DBHelper().db);
    return await dbClient.update(tableName, row.toJsonDB(),
        where: "${tablePrimaryKey} =?", whereArgs: [row.id]);
  }

  Future<bool> deleteAll() async {
    List<UserModel> result = await getAll();
    print(result.length.toString());
    if (result.length > 0) {
      for (var row in result) {
        print(row.id);
        await delete(row.id.toString());
      }
    }
    return true;
  }

  Future close() async {
    var dbClient = await (DBHelper().db);
    return dbClient.close();
  }
}
