import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
          return !state.isGpsEnabled
              ? const _EnableGpsMessage()
              : const _AccessButton();
        }),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Es necesario el acceso a PGS',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        MaterialButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          child: const Text(
            'Solicitar Acceso',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe Habilitar el PGS',
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
    );
  }
}
