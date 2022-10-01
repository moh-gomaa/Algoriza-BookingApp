import 'dart:async';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/data/database/db_helper.dart';
import 'package:booking_app/data/models/facility_model.dart';

class FacilityHelper {
  static final FacilityHelper _instance = new FacilityHelper.internal();

  factory FacilityHelper() => _instance;

  FacilityHelper.internal();

  final tableName = "facilityTable";
  String tablePrimaryKey = "id";

  Future<int> savePost(FacilityModel row) async {
    var dbClient = await (DBHelper().db);
//    row.logoImage =await getImageLogo(row.memberID.toString());
    var res = await dbClient.insert("$tableName", row.toJson());
    return res;
  }

  Future<List<FacilityModel>> getAll() async {
    var dbClient = await (DBHelper().db);
    List<Map> result = await dbClient.rawQuery("SELECT * FROM $tableName");
    return result.length == 0
        ? []
        : result
            .map((e) => FacilityModel.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Future<FacilityModel?> get(String id) async {
    var dbClient = await (DBHelper().db);
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE ${tablePrimaryKey}=?", [id]);
    if (result.length == 0) return null;

    return new FacilityModel.fromJson(result.first);
  }

  Future<int> delete(String? id) async {
    var dbClient = await (DBHelper().db);
    return await dbClient
        .delete(tableName, where: "$tablePrimaryKey = ?", whereArgs: [id]);
  }

  Future<int> update(FacilityModel row) async {
    var dbClient = await (DBHelper().db);
    return await dbClient.update(tableName, row.toJson(),
        where: "${tablePrimaryKey} =?", whereArgs: [row.id]);
  }

  Future<bool> deleteAll() async {
    List<FacilityModel> result = await getAll();
    // print(result.length.toString());
    if (result.length > 0) {
      for (var row in result) {
        // print(row.id);
        await delete(row.id.toString());
      }
    }
    return true;
  }

  Future close() async {
    var dbClient = await (DBHelper().db);
    return dbClient.close();
  }

  Future getData() async {
    final query = "facilities";

    // debugPrint(query);
    // debugPrint(baseUrl + query);
    var result = await DioHelper.get(query);

    if(result != false)
    {
      await  deleteAll();
      for (var item in result['data']) {
        savePost(FacilityModel.fromJson(item));
      }

    }
    List<FacilityModel> tt =await getAll();
    print(query + 'length ' + tt.length.toString());


  }


}
