import 'package:drift/drift.dart';
import 'package:good_weather/entitys/city_entinity.dart';
import 'connection.dart';

part 'weather_database.g.dart';

@DriftDatabase(tables: [CityEntity])
class WeatherDatabase extends _$WeatherDatabase {
  WeatherDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
