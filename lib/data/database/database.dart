import 'dart:io';

import 'package:football_explorer/data/database/fav_league_dto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  static const String ID = "id";
  static const String FAV_LEAGUE_TABLE = "fav_league";
  static const String FAV_LEAGUE_NAME = "name";
  static const String FAV_LEAGUE_LOGO = "logo";
  static const String FAV_LEAGUE_SEASON = "season";
  static const String FAV_COUNTRY_ID = "country_id";

  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();

    String path = dir.path + 'of.db';
    print(path);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> init() async {
    await this.database;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $FAV_LEAGUE_TABLE ($ID INTEGER PRIMARY KEY, $FAV_LEAGUE_NAME TEXT, $FAV_LEAGUE_LOGO TEXT, $FAV_LEAGUE_SEASON TEXT, $FAV_COUNTRY_ID INTEGER)");
  }

  Future<List<int>> isFavLeagues(List<int> ids) async {
    Database db = await this.database;
    String query = "SELECT d.*,  FROM $FAV_LEAGUE_TABLE";
    final List<Map<String, dynamic>> mapList =
        await db.rawQuery(query).catchError((error) {
      print(error);
    });
    final List<FavLeagueDTO> list = [];
    mapList.forEach((element) {
      list.add(FavLeagueDTO.fromMap(element));
    });
    return [];
  }

  Future<List<FavLeagueDTO>> getAllFavLeagues() async {
    Database db = await this.database;
    String query = "SELECT * FROM $FAV_LEAGUE_TABLE";
    final List<Map<String, dynamic>> mapList =
        await db.rawQuery(query).catchError((error) {
      print(error);
    });
    final List<FavLeagueDTO> list = [];
    mapList.forEach((element) {
      list.add(FavLeagueDTO.fromMap(element));
    });
    return list;
  }

  Future<List<String>> getFavIdsByCountryId(int countryId) async {
    Database db = await this.database;
    String query = "SELECT * FROM $FAV_LEAGUE_TABLE where $FAV_COUNTRY_ID = ?";
    final List<Map<String, dynamic>> mapList =
        await db.rawQuery(query, [countryId]).catchError((error) {
      print(error);
    });
    final List<String> list = [];
    mapList.forEach((element) {
      list.add(element[DBProvider.ID].toString());
    });
    return list;
  }

  Future<int> insertFavLeague(FavLeagueDTO dto) async {
    Database db = await this.database;
    var id = await db.insert(FAV_LEAGUE_TABLE, dto.toMap());
    //db.close();
    return id;
  }

  Future<void> deleteFavLeague(int id) async {
    Database db = await this.database;
    await db.delete(FAV_LEAGUE_TABLE, where: '$ID = ?', whereArgs: [id]);
    //db.close();
  }
}
