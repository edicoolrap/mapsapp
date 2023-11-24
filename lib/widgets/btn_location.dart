import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/blocs/blocs.dart';
import 'package:mapas/ui/ui.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        maxRadius: 25,
        child: IconButton(
            onPressed: () {
              final userLocation = locationBloc.state.lastKnowLocation;
              var snackBar = CustomSnackBar(message: 'No hay ubicación');
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              if (userLocation == null) return;
              mapBloc.moveCamera(userLocation);
            },
            icon: const Icon(Icons.my_location_outlined)),
      ),
    );
  }
}
