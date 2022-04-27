// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class City extends DataClass implements Insertable<City> {
  final int id;
  final String name;
  final double lat;
  final double long;
  final String country;
  final String state;
  City(
      {required this.id,
      required this.name,
      required this.lat,
      required this.long,
      required this.country,
      required this.state});
  factory City.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return City(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      lat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat'])!,
      long: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}long'])!,
      country: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country'])!,
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<double>(lat);
    map['long'] = Variable<double>(long);
    map['country'] = Variable<String>(country);
    map['state'] = Variable<String>(state);
    return map;
  }

  CityEntityCompanion toCompanion(bool nullToAbsent) {
    return CityEntityCompanion(
      id: Value(id),
      name: Value(name),
      lat: Value(lat),
      long: Value(long),
      country: Value(country),
      state: Value(state),
    );
  }

  factory City.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return City(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<double>(json['lat']),
      long: serializer.fromJson<double>(json['long']),
      country: serializer.fromJson<String>(json['country']),
      state: serializer.fromJson<String>(json['state']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<double>(lat),
      'long': serializer.toJson<double>(long),
      'country': serializer.toJson<String>(country),
      'state': serializer.toJson<String>(state),
    };
  }

  City copyWith(
          {int? id,
          String? name,
          double? lat,
          double? long,
          String? country,
          String? state}) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        country: country ?? this.country,
        state: state ?? this.state,
      );
  @override
  String toString() {
    return (StringBuffer('City(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('country: $country, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lat, long, country, state);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is City &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.country == this.country &&
          other.state == this.state);
}

class CityEntityCompanion extends UpdateCompanion<City> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> lat;
  final Value<double> long;
  final Value<String> country;
  final Value<String> state;
  const CityEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
  });
  CityEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double lat,
    required double long,
    required String country,
    required String state,
  })  : name = Value(name),
        lat = Value(lat),
        long = Value(long),
        country = Value(country),
        state = Value(state);
  static Insertable<City> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? lat,
    Expression<double>? long,
    Expression<String>? country,
    Expression<String>? state,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (country != null) 'country': country,
      if (state != null) 'state': state,
    });
  }

  CityEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? lat,
      Value<double>? long,
      Value<String>? country,
      Value<String>? state}) {
    return CityEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<double>(long.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('country: $country, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }
}

class $CityEntityTable extends CityEntity
    with TableInfo<$CityEntityTable, City> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CityEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double?> lat = GeneratedColumn<double?>(
      'lat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double?> long = GeneratedColumn<double?>(
      'long', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _countryMeta = const VerificationMeta('country');
  @override
  late final GeneratedColumn<String?> country = GeneratedColumn<String?>(
      'country', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, lat, long, country, state];
  @override
  String get aliasedName => _alias ?? 'city_entity';
  @override
  String get actualTableName => 'city_entity';
  @override
  VerificationContext validateIntegrity(Insertable<City> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  City map(Map<String, dynamic> data, {String? tablePrefix}) {
    return City.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CityEntityTable createAlias(String alias) {
    return $CityEntityTable(attachedDatabase, alias);
  }
}

abstract class _$WeatherDatabase extends GeneratedDatabase {
  _$WeatherDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CityEntityTable cityEntity = $CityEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cityEntity];
}
