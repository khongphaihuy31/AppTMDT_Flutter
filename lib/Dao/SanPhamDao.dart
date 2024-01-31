import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';

class SanPhamDao{
  static const _version = 1;
  static const String _dbName = 'SanPhamDaoDao.db';

  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        await db.execute('CREATE TABLE SanPham(id INTEGER PRIMARY KEY,tensanpham TEXT,giacu INTEGER,giamoi INTEGER,img TEXT,tendanhmuc TEXT)'),
        version: _version
    );
  }

  static Future<int?> insertSanPham(SanPham sp) async {
    final db = await _getDB();
    return await db.insert(
      'SanPham',
      sp.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteSanPham(SanPham sp) async {
    final db = await _getDB();
    return await db.delete(
      'SanPham',
      where: 'id = ?',
      whereArgs: [sp.id],
    );
  }

  static Future<List<SanPham?>> getAllListSanPham(String tendanhmuc) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('SanPham', where: 'tendanhmuc = ?', whereArgs: [tendanhmuc]);
    // if(maps.isEmpty){
    //   return null;
    // }
    return List.generate(maps.length, (i) {
      if(maps[i]['tendanhmuc'] == tendanhmuc){
        return SanPham(
            id: maps[i]['id'],
            tensanpham: maps[i]['tensanpham'],
            giacu: maps[i]['giacu'],
            giamoi: maps[i]['giamoi'],
            img: maps[i]['img'],
            tendanhmuc: maps[i]['tendanhmuc']
        );
      }
    });
  }

  static Future<List<SanPham?>> getAllListSanPhamTimKiem(String key) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('SanPham', where: 'tensanpham LIKE ? AND tendanhmuc != ?', whereArgs: ['%${key}%', 'tatca']);
    // if(maps.isEmpty){
    //   return null;
    // }
    return List.generate(maps.length, (i) {
      // if(maps[i]['tendanhmuc'] != 'tatca') {
        return SanPham(
            id: maps[i]['id'],
            tensanpham: maps[i]['tensanpham'],
            giacu: maps[i]['giacu'],
            giamoi: maps[i]['giamoi'],
            img: maps[i]['img'],
            tendanhmuc: maps[i]['tendanhmuc']
        );
      // }
    });
  }

  static Future<SanPham?> getSanPham(int idsanpham) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('SanPham');
    SanPham? u ;
    for(int i=0; i< maps.length; i++){
      if(maps[i]['id'] == idsanpham){
        u = SanPham(
            id: maps[i]['id'],
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