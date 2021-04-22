import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:main_menu/models/place.dart';

class Map {
  List<Place> _places;
  List<Marker> _markers;
  Map({
    @required List<Place> places,
    @required List<Marker> markers,
  }) : assert(places != [] && markers != []) {
    this.places = places;
    this.markers = markers;
  }
  set places(List<Place> places) {
    this._places = places;
  }

  set markers(List<Marker> markers) {
    this._markers = markers;
  }

  List<Place> get places {
    return this._places;
  }

  List<Marker> get markers {
    return this._markers;
  }
}
