import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thiketthuchocphan_mobile/Bean/LichSuMua.dart';

class LichSuMuaDao{
  static const _version = 1;
  static const String _dbName = 'LichSuMuaDaoDaoDao.db';

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE LichSuMua(id INTEGER PRIMARY KEY,soluong INTEGER,idkhachhang INTEGER,diachinhan TEXT,idsanpham INTEGER,tensanpham TEXT,giacu INTEGER,giamoi INTEGER,img TEXT,tendanhmuc TEXT)'),
        version: _version);
  }

  static Future<int?> insertLichSuMua(LichSuMua ls) async {
    final db = await _getDB();
    return await db.insert(
      'LichSuMua',
      ls.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<LichSuMua?>> getAllListLichSuMua(int? idkhachhang) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('LichSuMua', where: 'idkhachhang = ?', whereArgs: [idkhachhang]);
    return List.generate(maps.length, (i) {
      if (maps[i]['idkhachhang'] == idkhachhang) {
        return LichSuMua(
            id: maps[i]['id'],
            soluong: maps[i]['soluong'],
            idkhachhang: maps[i]['idkhachhang'],
            diachinhan: maps[i]['diachinhan'],
            idsanpham: maps[i]['idsanpham'],
            tensanpham: maps[i]['tensanpham'],
            giacu: maps[i]['giacu'],
            giamoi: maps[i]['giamoi'],
            img: maps[i]['img'],
            tendanhmuc: maps[i]['tendanhmuc']);
      }
    });
  }
}