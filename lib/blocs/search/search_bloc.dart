import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:mapas/models/models.dart';
import 'package:mapas/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TrafficService trafficService;
  SearchBloc({required this.trafficService}) : super(const SearchState()) {
    on<OnActivateManualMarketEvent>((event, emit) {
      emit(state.copyWith(displayManualMarket: true));
    });
    on<OnDeactivateManualMarketEvent>((event, emit) {
      emit(state.copyWith(displayManualMarket: false));
    });
  }

  Future<RouteDestination> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final trafficResponse = await trafficService.getCoorsStartToEnd(start, end);
    final distance = trafficResponse.routes[0].distance;
    final duration = trafficResponse.routes[0].duration;
    final geometry = trafficResponse.routes[0].geometry;
    final points = decodePolyline(geometry, accuracyExponent: 6);
    final latLngList = points
        .map((coor) => LatLng(coor[0].toDouble(), coor[1].toDouble()))
        .toList();

    return RouteDestination(
      points: latLngList,
      duration: duration,
      distance: distance,
    );
  }
}
