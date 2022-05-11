import 'package:flutter/material.dart';

import '../models/city.dart';
import 'city_tile.dart';

typedef OnCitySelectedCallback = void Function(City city);
typedef OnCityDeleteCallback = void Function(City city);

class CityDrawer extends StatelessWidget {

  final OnCitySelectedCallback? onCitySelected;
  final OnCityDeleteCallback? onCityDeleted;
  final Future<List<City>>? cityList;

  const CityDrawer({ this.cityList, this.onCitySelected, this.onCityDeleted, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FutureBuilder(
      future: cityList,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error!.toString());
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          List<City> cityList = snapshot.data;
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final City currentCity = cityList[index];
              return Dismissible(
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction: cityList.length > 1
                    ? DismissDirection.endToStart
                    : DismissDirection.none,
                key: ValueKey<int>(currentCity.id!),
                child: CityTile(
                  city: currentCity,
                  onTap: () => onCitySelected?.call(currentCity),
                ),
                onDismissed: (direction) => onCityDeleted?.call(currentCity),
              );
            },
            shrinkWrap: true,
            itemCount: cityList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 0,
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
