import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/blocs/blocs.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  mapBloc.add(OnStartFollowingUserEvent());
                },
                icon: Icon(
                  state.isFollowingUser
                      ? Icons.directions_run_outlined
                      : Icons.hail_rounded,
                ));
          },
        ),
      ),
    );
  }
}
