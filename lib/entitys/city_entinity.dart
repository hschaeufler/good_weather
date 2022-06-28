import 'package:drift/drift.dart';

class CityEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get lat => real()();
  RealColumn get long => real()();
  TextColumn get country => text()();
  TextColumn get state => text().nullable()();
}
