import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/blocs/blocs.dart';

class BtnShowPolylines extends StatelessWidget {
  const BtnShowPolylines({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        maxRadius: 25,
        child: IconButton(
            onPressed: () {
              mapBloc.add(OnToggleUserRoute());
            },
            icon: const Icon(Icons.more_horiz_rounded)),
      ),
    );
  }
}
