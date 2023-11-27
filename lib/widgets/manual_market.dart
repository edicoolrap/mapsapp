import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mapas/blocs/blocs.dart';
import 'package:mapas/helpers/helpers.dart';

class ManualMarket extends StatelessWidget {
  const ManualMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state.displayManualMarket) {
        return const _ManualMarketBody();
      } else {
        return const SizedBox();
      }
    });
  }
}

class _ManualMarketBody extends StatelessWidget {
  const _ManualMarketBody();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(children: [
        const _BtnBack(),
        const _PinCentrado(),
        BtnConfirmar(size: size)
      ]),
    );
  }
}

class BtnConfirmar extends StatelessWidget {
  const BtnConfirmar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Positioned(
        bottom: 26,
        left: 40,
        child: FadeInUp(
          child: MaterialButton(
            onPressed: () async {
              final start = locationBloc.state.lastKnowLocation;
              if (start == null) return;
              final end = mapBloc.mapCenter;
              if (end == null) return;
              showLoadingMessage(context);
              final destination =
                  await searchBloc.getCoorsStartToEnd(start, end);
              await mapBloc.drawRoutePolyline(destination);
              searchBloc.add(OnDeactivateManualMarketEvent());
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            minWidth: size.width - 120,
            color: Colors.black,
            elevation: 0,
            height: 50,
            shape: const StadiumBorder(),
            child: Text(
              'Confirmar Destino',
              style: TextStyle(
                  color: Colors.blue[100], fontWeight: FontWeight.w300),
            ),
          ),
        ));
  }
}

class _PinCentrado extends StatelessWidget {
  const _PinCentrado();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -22),
        child: BounceInDown(
          from: 100,
          child: const Icon(
            Icons.location_on_rounded,
            size: 50,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 70,
        left: 20,
        child: FadeInLeft(
          child: CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.black,
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<SearchBloc>(context)
                      .add(OnDeactivateManualMarketEvent());
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        ));
  }
}
