import 'package:drift/drift.dart';
import 'package:good_weather/entitys/city_entinity.dart';
import 'package:good_weather/persistance/weather_database.dart';

part 'city_dao.g.dart';


@DriftAccessor(tables: [CityEntity])
class CityDAO extends DatabaseAccessor<WeatherDatabase> with _$CityDAOMixin {

  CityDAO(WeatherDatabase db) : super(db);


}