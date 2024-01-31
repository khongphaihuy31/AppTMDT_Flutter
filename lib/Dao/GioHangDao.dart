import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thiketthuchocphan_mobile/Bean/GioHang.dart';

class GioHangDao {
  static const _version = 1;
  static const String _dbName = 'GioHangCartCartC.db';

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE GioHang(id INTEGER PRIMARY KEY,soluong INTEGER,idkhachhang INTEGER,idsanpham INTEGER,tensanpham TEXT,giacu INTEGER,giamoi INTEGER,img TEXT,tendanhmuc TEXT)'),
        version: _version);
  }

  static Future<int?> insertGioHang(GioHang gh) async {
    final db = await _getDB();
    return await db.insert(
      'GioHang',
      gh.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateGioHang(GioHang gh) async {
    final db = await _getDB();
    return await db.update(
      'GioHang',
      gh.toMap(),
      where: 'id = ?',
      whereArgs: [gh.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteGioHang(GioHang sv) async {
    final db = await _getDB();
    return await db.delete(
      'GioHang',
      where: 'id = ?',
      whereArgs: [sv.id],
    );
  }

  static Future<List<GioHang?>> getAllListGioHang(int? idkhachhang) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('GioHang', where: 'idkhachhang = ?', whereArgs: [idkhachhang]);
    return List.generate(maps.length, (i) {
      if (maps[i]['idkhachhang'] == idkhachhang) {
        return GioHang(
            id: maps[i]['id'],
            soluong: maps[i]['soluong'],
            idkhachhang: maps[i]['idkhachhang'],
            idsanpham: maps[i]['idsanpham'],
            tensanpham: maps[i]['tensanpham'],
            giacu: maps[i]['giacu'],
            giamoi: maps[i]['giamoi'],
            img: maps[i]['img'],
            tendanhmuc: maps[i]['tendanhmuc']);
      }
    });
  }

  static Future<bool> kiemTraSanPham(int idsanpham, int idkhachhang) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('GioHang', where: 'idsanpham = ? AND idkhachhang = ?', whereArgs: [idsanpham,idkhachhang]);
    for (int i = 0; i < maps.length; i++) {
      if (maps[i]['idkhachhang'] == idkhachhang && maps[i]['idsanpham'] == idsanpham) {
        return true;
      }
    }
    return false;
  }

  static Future<int> getSoLuong(int idsanpham, int idkhachhang) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('GioHang', where: 'idsanpham = ? AND idkhachhang = ?', whereArgs: [idsanpham,idkhachhang]);
    for (int i = 0; i < maps.length; i++) {
      if (maps[i]['idsanpham'] == idsanpham && maps[i]['idkhachhang'] == idkhachhang) {
        return maps[i]['soluong'];
      }
    }
    return 0;
  }

  static Future<int> getSoLuongSpTrongGio(int idkhachhang) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('GioHang', where: 'idkhachhang = ?', whereArgs: [idkhachhang]);
    if(maps == null){
      return 0 ;
    }else{
      return maps.length;
    }
  }

  static Future<GioHang?> getGioHang(int idsanpham, int idkhachhang) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('GioHang', where: 'idsanpham = ? AND idkhachhang = ?', whereArgs: [idsanpham,idkhachhang]);
    GioHang? u ;
    for(int i=0; i< maps.length; i++){
      if(maps[i]['idsanpham'] == idsanpham && maps[i]['idkhachhang'] == idkhachhang){
        u = GioHang(
          id: maps[i]['id'],
            soluong: maps[i]['soluong'],
            idkhachhang: maps[i]['idkhachhang'],
            idsanpham: maps[i]['idsanpham'],
            tensanpham: maps[i]['tensanpham'],
            giacu: maps[i]['giacu'],
            giamoi: maps[i]['giamoi'],
            img: maps[i]['img'],
            tendanhmuc: maps[i]['tendanhmuc']
        );
      }
    }
    return u;
  }
}
