import 'package:drift/drift.dart';
import 'package:good_weather/entitys/city_entinity.dart';

import '../persistance/weather_database.dart';

part 'city_dao.g.dart';

@DriftAccessor(tables: [CityEntity])
class CityDAO extends DatabaseAccessor<WeatherDatabase> with _$CityDAOMixin {
  CityDAO(WeatherDatabase db) : super(db);

  Future<int> insertCity(CityEntityCompanion city) =>
      into(cityEntity).insert(city);
  Future<List<CityEntityData>> get allCities => select(cityEntity).get();
  Future<CityEntityData?> getById(int id) {
    return (select(cityEntity)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
