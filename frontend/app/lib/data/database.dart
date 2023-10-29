import 'dart:async';
import 'package:fixnum/fixnum.dart';

import 'package:app/pb/google/protobuf/timestamp.pb.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Session {
  Session({
    this.sessionId,
    this.accessToken,
    this.accessTokenExpiresAt,
    this.refreshToken,
    this.refreshTokenExpiresAt,
    this.accountId,
  }) {
    _init();
  }

  String? sessionId;
  String? accessToken;
  String? refreshToken;
  Timestamp? accessTokenExpiresAt;
  Timestamp? refreshTokenExpiresAt;
  Int64? accountId;

  late Database _database;

  Future<Database> get database async => _database;

  static Future<Session> get newSession async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'df_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sessions(accountId INTEGER PRIMARY KEY, sessionId TEXT, accessToken TEXT, accessTokenExpiresAt TEXT, refreshToken TEXT, refreshTokenExpiresAt TEXT)',
        );
      },
      version: 1,
    );
    Session s = Session();
    s._database = db;
    return s;
  }

  void _init() {
    _initDatabase();
  }

  Future<Database> _initDatabase() async {
    print('DB: INITIALIZING - start');
    _database = await openDatabase(
      join(await getDatabasesPath(), 'df_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sessions(accountId INTEGER PRIMARY KEY, sessionId TEXT, accessToken TEXT, accessTokenExpiresAt TEXT, refreshToken TEXT, refreshTokenExpiresAt TEXT)',
        );
      },
      version: 1,
    );
    print('DB: INITIALIZING - end');

    return _database;
  }

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId?.toInt(),
      'sessionId': sessionId,
      'accessToken': accessToken,
      'accessTokenExpiresAt': accessTokenExpiresAt?.toDateTime().toString(),
      'refreshToken': refreshToken,
      'refreshTokenExpiresAt': refreshTokenExpiresAt?.toDateTime().toString(),
    };
  }

  @override
  String toString() {
    return 'Session{accountId: $accountId, sessionId: $sessionId, accessToken: $accessToken, accessTokenExpiresAt: ${accessTokenExpiresAt.toString()}, refreshToken: $refreshToken, refreshTokenExpiresAt: ${refreshTokenExpiresAt.toString()}}';
  }

  Future<void> insertSession(Session session) async {
    print('INSERTING SESSION: ${session.sessionId}');
    final db = _database;
    final result = await db.insert(
      'sessions',
      session.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('INSERT RESULT: $result');
  }

  Future<void> removeSession(String sessionId) async {
    final db = _database;
    await db.delete('sessions', where: 'sessionId = ?', whereArgs: [sessionId]);
  }

  Future<List<Session>> getSessions() async {
    final db = await database;

    final List<Map<String, Object?>> maps = await db.query('sessions');

    final List<Session> sessions = List.generate(
      maps.length,
      (i) {
        print('GOT MAP: ${maps[i]}');

        return Session(
          sessionId: maps[i]['sessionId'] as String,
          accessToken: maps[i]['accessToken'] as String,
          accessTokenExpiresAt: Timestamp.fromDateTime(
              DateTime.parse(maps[i]['accessTokenExpiresAt'] as String)),
          refreshToken: maps[i]['refreshToken'] as String,
          refreshTokenExpiresAt: Timestamp.fromDateTime(
              DateTime.parse(maps[i]['refreshTokenExpiresAt'] as String)),
          accountId: Int64(maps[i]['accountId'] as int),
        );
      },
    );

    return sessions;
  }

  static Future<Session> getSession(Int64 accountId) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'df_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sessions(accountId INTEGER PRIMARY KEY, sessionId TEXT, accessToken TEXT, accessTokenExpiresAt TEXT, refreshToken TEXT, refreshTokenExpiresAt TEXT)',
        );
      },
      version: 1,
    );

    final List<Map<String, Object?>> maps = await db.query('sessions',
        where: 'accountId = ?', whereArgs: [accountId], limit: 1);

    final List<Session> sessions = List.generate(
      maps.length,
      (i) {
        return Session(
          sessionId: maps[i]['sessionId'] as String,
          accessToken: maps[i]['accessToken'] as String,
          accessTokenExpiresAt: maps[i]['accessTokenExpiresAt'] as Timestamp,
          refreshToken: maps[i]['refreshToken'] as String,
          refreshTokenExpiresAt: maps[i]['refreshTokenExpiresAt'] as Timestamp,
          accountId: maps[i]['accountId'] as Int64,
        );
      },
    );

    return sessions[0];
  }
}
