// ignore_for_file: constant_identifier_names

import 'dart:convert';

class TrafficResponse {
  final List<Route> routes;
  final List<Waypoint> waypoints;
  final String code;
  final String uuid;

  TrafficResponse({
    required this.routes,
    required this.waypoints,
    required this.code,
    required this.uuid,
  });

  factory TrafficResponse.fromJson(String str) =>
      TrafficResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrafficResponse.fromMap(Map<String, dynamic> json) => TrafficResponse(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromMap(x))),
        waypoints: List<Waypoint>.from(
            json["waypoints"].map((x) => Waypoint.fromMap(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toMap() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toMap())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toMap())),
        "code": code,
        "uuid": uuid,
      };
}

class Route {
  final String weightName;
  final double weight;
  final double duration;
  final double distance;
  final List<Leg> legs;
  final String geometry;

  Route({
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.legs,
    required this.geometry,
  });

  factory Route.fromJson(String str) => Route.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Route.fromMap(Map<String, dynamic> json) => Route(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromMap(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toMap() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toMap())),
        "geometry": geometry,
      };
}

class Leg {
  final List<dynamic> viaWaypoints;
  final List<Admin> admins;
  final double weight;
  final double duration;
  final List<Step> steps;
  final double distance;
  final String summary;

  Leg({
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  factory Leg.fromJson(String str) => Leg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Leg.fromMap(Map<String, dynamic> json) => Leg(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins: List<Admin>.from(json["admins"].map((x) => Admin.fromMap(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromMap(x))),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toMap() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toMap())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x.toMap())),
        "distance": distance,
        "summary": summary,
      };
}

class Admin {
  final String iso31661Alpha3;
  final String iso31661;

  Admin({
    required this.iso31661Alpha3,
    required this.iso31661,
  });

  factory Admin.fromJson(String str) => Admin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Admin.fromMap(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toMap() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
      };
}

class Step {
  final List<Intersection> intersections;
  final Maneuver maneuver;
  final String name;
  final double duration;
  final double distance;
  final DrivingSide drivingSide;
  final double weight;
  final Mode mode;
  final String geometry;
  final String? destinations;
  final String? ref;
  final String? exits;

  Step({
    required this.intersections,
    required this.maneuver,
    required this.name,
    required this.duration,
    required this.distance,
    required this.drivingSide,
    required this.weight,
    required this.mode,
    required this.geometry,
    this.destinations,
    this.ref,
    this.exits,
  });

  factory Step.fromJson(String str) => Step.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Step.fromMap(Map<String, dynamic> json) => Step(
        intersections: List<Intersection>.from(
            json["intersections"].map((x) => Intersection.fromMap(x))),
        maneuver: Maneuver.fromMap(json["maneuver"]),
        name: json["name"],
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        drivingSide: drivingSideValues.map[json["driving_side"]]!,
        weight: json["weight"]?.toDouble(),
        mode: modeValues.map[json["mode"]]!,
        geometry: json["geometry"],
        destinations: json["destinations"],
        ref: json["ref"],
        exits: json["exits"],
      );

  Map<String, dynamic> toMap() => {
        "intersections":
            List<dynamic>.from(intersections.map((x) => x.toMap())),
        "maneuver": maneuver.toMap(),
        "name": name,
        "duration": duration,
        "distance": distance,
        "driving_side": drivingSideValues.reverse[drivingSide],
        "weight": weight,
        "mode": modeValues.reverse[mode],
        "geometry": geometry,
        "destinations": destinations,
        "ref": ref,
        "exits": exits,
      };
}

enum DrivingSide { LEFT, RIGHT, SLIGHT_LEFT, SLIGHT_RIGHT, STRAIGHT }

final drivingSideValues = EnumValues({
  "left": DrivingSide.LEFT,
  "right": DrivingSide.RIGHT,
  "slight left": DrivingSide.SLIGHT_LEFT,
  "slight right": DrivingSide.SLIGHT_RIGHT,
  "straight": DrivingSide.STRAIGHT
});

class Intersection {
  final List<int> bearings;
  final List<bool> entry;
  final MapboxStreetsV8? mapboxStreetsV8;
  final bool? isUrban;
  final int adminIndex;
  final int? out;
  final int geometryIndex;
  final List<double> location;
  final int? intersectionIn;
  final double? duration;
  final double? turnWeight;
  final double? turnDuration;
  final double? weight;
  final bool? trafficSignal;
  final List<ClassElement>? classes;
  final TollCollection? tollCollection;
  final List<Lane>? lanes;
  final bool? yieldSign;
  final bool? railwayCrossing;

  Intersection({
    required this.bearings,
    required this.entry,
    this.mapboxStreetsV8,
    this.isUrban,
    required this.adminIndex,
    this.out,
    required this.geometryIndex,
    required this.location,
    this.intersectionIn,
    this.duration,
    this.turnWeight,
    this.turnDuration,
    this.weight,
    this.trafficSignal,
    this.classes,
    this.tollCollection,
    this.lanes,
    this.yieldSign,
    this.railwayCrossing,
  });

  factory Intersection.fromJson(String str) =>
      Intersection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Intersection.fromMap(Map<String, dynamic> json) => Intersection(
        bearings: List<int>.from(json["bearings"].map((x) => x)),
        entry: List<bool>.from(json["entry"].map((x) => x)),
        mapboxStreetsV8: json["mapbox_streets_v8"] == null
            ? null
            : MapboxStreetsV8.fromMap(json["mapbox_streets_v8"]),
        isUrban: json["is_urban"],
        adminIndex: json["admin_index"],
        out: json["out"],
        geometryIndex: json["geometry_index"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
        intersectionIn: json["in"],
        duration: json["duration"]?.toDouble(),
        turnWeight: json["turn_weight"]?.toDouble(),
        turnDuration: json["turn_duration"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        trafficSignal: json["traffic_signal"],
        classes: json["classes"] == null
            ? []
            : List<ClassElement>.from(
                json["classes"]!.map((x) => classElementValues.map[x]!)),
        tollCollection: json["toll_collection"] == null
            ? null
            : TollCollection.fromMap(json["toll_collection"]),
        lanes: json["lanes"] == null
            ? []
            : List<Lane>.from(json["lanes"]!.map((x) => Lane.fromMap(x))),
        yieldSign: json["yield_sign"],
        railwayCrossing: json["railway_crossing"],
      );

  Map<String, dynamic> toMap() => {
        "bearings": List<dynamic>.from(bearings.map((x) => x)),
        "entry": List<dynamic>.from(entry.map((x) => x)),
        "mapbox_streets_v8": mapboxStreetsV8?.toMap(),
        "is_urban": isUrban,
        "admin_index": adminIndex,
        "out": out,
        "geometry_index": geometryIndex,
        "location": List<dynamic>.from(location.map((x) => x)),
        "in": intersectionIn,
        "duration": duration,
        "turn_weight": turnWeight,
        "turn_duration": turnDuration,
        "weight": weight,
        "traffic_signal": trafficSignal,
        "classes": classes == null
            ? []
            : List<dynamic>.from(
                classes!.map((x) => classElementValues.reverse[x])),
        "toll_collection": tollCollection?.toMap(),
        "lanes": lanes == null
            ? []
            : List<dynamic>.from(lanes!.map((x) => x.toMap())),
        "yield_sign": yieldSign,
        "railway_crossing": railwayCrossing,
      };
}

enum ClassElement { MOTORWAY, TOLL, TUNNEL }

final classElementValues = EnumValues({
  "motorway": ClassElement.MOTORWAY,
  "toll": ClassElement.TOLL,
  "tunnel": ClassElement.TUNNEL
});

class Lane {
  final List<DrivingSide> indications;
  final DrivingSide? validIndication;
  final bool valid;
  final bool active;

  Lane({
    required this.indications,
    this.validIndication,
    required this.valid,
    required this.active,
  });

  factory Lane.fromJson(String str) => Lane.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lane.fromMap(Map<String, dynamic> json) => Lane(
        indications: List<DrivingSide>.from(
            json["indications"].map((x) => drivingSideValues.map[x]!)),
        validIndication: drivingSideValues.map[json["valid_indication"]]!,
        valid: json["valid"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "indications": List<dynamic>.from(
            indications.map((x) => drivingSideValues.reverse[x])),
        "valid_indication": drivingSideValues.reverse[validIndication],
        "valid": valid,
        "active": active,
      };
}

class MapboxStreetsV8 {
  final MapboxStreetsV8Class mapboxStreetsV8Class;

  MapboxStreetsV8({
    required this.mapboxStreetsV8Class,
  });

  factory MapboxStreetsV8.fromJson(String str) =>
      MapboxStreetsV8.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MapboxStreetsV8.fromMap(Map<String, dynamic> json) => MapboxStreetsV8(
        mapboxStreetsV8Class: mapboxStreetsV8ClassValues.map[json["class"]]!,
      );

  Map<String, dynamic> toMap() => {
        "class": mapboxStreetsV8ClassValues.reverse[mapboxStreetsV8Class],
      };
}

enum MapboxStreetsV8Class {
  MOTORWAY,
  MOTORWAY_LINK,
  PRIMARY,
  PRIMARY_LINK,
  SECONDARY,
  SECONDARY_LINK,
  STREET,
  TERTIARY
}

final mapboxStreetsV8ClassValues = EnumValues({
  "motorway": MapboxStreetsV8Class.MOTORWAY,
  "motorway_link": MapboxStreetsV8Class.MOTORWAY_LINK,
  "primary": MapboxStreetsV8Class.PRIMARY,
  "primary_link": MapboxStreetsV8Class.PRIMARY_LINK,
  "secondary": MapboxStreetsV8Class.SECONDARY,
  "secondary_link": MapboxStreetsV8Class.SECONDARY_LINK,
  "street": MapboxStreetsV8Class.STREET,
  "tertiary": MapboxStreetsV8Class.TERTIARY
});

class TollCollection {
  final String type;

  TollCollection({
    required this.type,
  });

  factory TollCollection.fromJson(String str) =>
      TollCollection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TollCollection.fromMap(Map<String, dynamic> json) => TollCollection(
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
      };
}

class Maneuver {
  final String type;
  final String instruction;
  final int bearingAfter;
  final int bearingBefore;
  final List<double> location;
  final DrivingSide? modifier;

  Maneuver({
    required this.type,
    required this.instruction,
    required this.bearingAfter,
    required this.bearingBefore,
    required this.location,
    this.modifier,
  });

  factory Maneuver.fromJson(String str) => Maneuver.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Maneuver.fromMap(Map<String, dynamic> json) => Maneuver(
        type: json["type"],
        instruction: json["instruction"],
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
        modifier: drivingSideValues.map[json["modifier"]]!,
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "instruction": instruction,
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": List<dynamic>.from(location.map((x) => x)),
        "modifier": drivingSideValues.reverse[modifier],
      };
}

enum Mode { DRIVING }

final modeValues = EnumValues({"driving": Mode.DRIVING});

class Waypoint {
  final double distance;
  final String name;
  final List<double> location;

  Waypoint({
    required this.distance,
    required this.name,
    required this.location,
  });

  factory Waypoint.fromJson(String str) => Waypoint.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Waypoint.fromMap(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
