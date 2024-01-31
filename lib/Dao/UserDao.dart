import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';

class UserDao{
  static const _version = 1;
  static const String _dbName = 'UserDao.db';

  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        await db.execute('CREATE TABLE User(id INTEGER PRIMARY KEY,hoten TEXT,sodienthoai TEXT,email TEXT,diachi TEXT,diachinhan TEXT,taikhoan TEXT,matkhau TEXT)'),
        version: _version
    );
  }

  static Future<int> updateUser(User u) async {
    final db = await _getDB();
    return await db.update(
      'User',
      u.toMap(),
      where: 'id = ?',
      whereArgs: [u.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> insertUser(User user) async {
    final db = await _getDB();
    return await db.insert(
      'User',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<User>?> getAllListUser() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('User');
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          hoten: maps[i]['hoten'],
          sodienthoai: maps[i]['sodienthoai'],
          email: maps[i]['email'],
          diachi: maps[i]['diachi'],
          diachinhan: maps[i]['diachinhan'],
          taikhoan: maps[i]['taikhoan'],
          matkhau: maps[i]['matkhau']
      );
    });
  }

  static Future<bool> kiemTraDangNhap(String taikhoan, String matkhau) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('User');
    if(maps.isEmpty){
      return false;
    }
    for(int i=0; i< maps.length; i++){
      if(maps[i]['taikhoan'] == taikhoan && maps[i]['matkhau']== matkhau){
        return true;
      }
    }
    return false;
  }

  static Future<User?> getUser(String taikhoan, String matkhau) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('User');
    late User u ;
    for(int i=0; i< maps.length; i++){
      if(maps[i]['taikhoan'] == taikhoan && maps[i]['matkhau']== matkhau){
        u = User(
            id: maps[i]['id'],
            hoten: maps[i]['hoten'],
            sodienthoai: maps[i]['sodienthoai'],
            email: maps[i]['email'],
            diachi: maps[i]['diachi'],
            diachinhan: maps[i]['diachinhan'],
            taikhoan: maps[i]['taikhoan'],
            matkhau: maps[i]['matkhau']
        );
      }
    }
    return u;
  }

  static Future<bool> kiemTraDangKy(String taikhoan) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('User');
    if(maps.isEmpty){
      return true;
    }
    for(int i=0; i< maps.length; i++){
      if(maps[i]['taikhoan'] == taikhoan){
        return false;
      }else{
        return true;
      }
    }
    return true;
  }

  static Future<User?> getUserByID(int id) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('User');
    late User u ;
    for(int i=0; i< maps.length; i++){
      if(maps[i]['id'] == id){
        u = User(
            id: maps[i]['id'],
            hoten: maps[i]['hoten'],
            sodienthoai: maps[i]['sodienthoai'],
            email: maps[i]['email'],
            diachi: maps[i]['diachi'],
            diachinhan: maps[i]['diachinhan'],
            taikhoan: maps[i]['taikhoan'],
            matkhau: maps[i]['matkhau']
        );
      }
    }
    return u;
  }
}