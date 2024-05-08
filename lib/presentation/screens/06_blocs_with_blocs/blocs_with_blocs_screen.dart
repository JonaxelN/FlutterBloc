import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final geoLocationCubit = context.watch<GeolocationCubit>();
    final historicLocationBloc = context.watch<HistoricLocationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocs con Blocs'),
      ),
      body: ListView.builder(
        itemCount: historicLocationBloc.state.howManyLocations,
        itemBuilder: (BuildContext context, int index) {
          final location = historicLocationBloc.state.locations[index];
          final (lat, lng) = location;

          return ListTile(
            title: Text('Lat: $lat, Lng: $lng'),
          );
        },
      ),
    );
  }
}
