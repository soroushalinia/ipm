import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class Project extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Operator extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
}

class Task extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get operatorName => integer().references(Operator, #id)();
  TextColumn get schematicId => text()();
  IntColumn get duration => integer()();
  IntColumn get order => integer()();
  IntColumn get priority => integer()();
  IntColumn get costManHour => integer()();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get finish => dateTime()();
  IntColumn get progress => integer()();
  BoolColumn get done => boolean()();
  IntColumn get project => integer().references(Project, #id)();
}

class Delay extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get task => integer().references(Task, #id)();
  TextColumn get description => text()();
  IntColumn get time => integer()();
}

@DriftDatabase(tables: [
  Project,
  Operator,
  Task,
  Delay,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // ignore: override_on_non_overriding_member
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ipm.db'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}
