import '../database/database_helper.dart';
import '../models/user.dart';
import 'package:sqflite/sqflite.dart';

class AuthService {
  final dbHelper = DatabaseHelper.instance;

  Future<bool> signUp(String email, String password) async {
    try {
      final db = await dbHelper.database;
      await db.insert(
        'users',
        User(email: email, password: password).toMap(),
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    final db = await dbHelper.database;
    final res = await db.query(
      'users',
      where: 'email=? AND password=?',
      whereArgs: [email, password],
    );
    return res.isNotEmpty;
  }
}
