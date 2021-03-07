import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:main_menu/constants.dart';
import 'package:main_menu/models/place.dart';
import 'package:main_menu/services/marker_service.dart';
import 'package:main_menu/services/places_service.dart';
import 'package:url_launcher/url_launcher.dart';

const MAP_API_KEY = 'AIzaSyAVN-cKkBDRSc2NKC5WdtIPmaMs3HR5reQ';

class MentalClinicMap extends StatefulWidget {
  @override
  _MentalClinicMapState createState() => _MentalClinicMapState();
}

class _MentalClinicMapState extends State<MentalClinicMap> with MenuFunction {
  double latitude;
  double longitude;
  GoogleMapController mapController;
  Future mapFuture;
  List<Place> places;
  List<Marker> markers;
  BitmapDescriptor markerIcon;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future initializeMap() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/Images/marker.png');

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
      places = (latitude != null && longitude != null)
          ? await PlacesService().getPlaces(latitude, longitude, markerIcon)
          : null;
      markers = (places != null) ? MarkerService().getMarkers(places) : null;
    } catch (e) {
      print(e);
    }
  }

  void _launchMapsUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }

  @override
  void initState() {
    mapFuture = initializeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SwipeableWidget(
        height: double.infinity,
        onSwipeCallback: () {
          returnBack(context);
        },
      child: Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Nearby Mental Clinics',
                      textAlign: TextAlign.center,
                      style: kThickFont.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent)),
                ),
              ),
              FutureBuilder(
                future: mapFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      places != null) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GoogleMap(
                                markers: Set<Marker>.of(markers),
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(latitude, longitude),
                                  zoom: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            itemCount: places.length,
                            itemBuilder: (context, index) {
                              double distance;
                              if (places[index].geometry.location.lat != null)
                                distance = Geolocator.distanceBetween(
                                    latitude,
                                    longitude,
                                    places[index].geometry.location.lat,
                                    places[index].geometry.location.lng);

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8.0),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  title: Text(
                                    places[index].name,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  subtitle: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${places[index].vicinity} \u00b7  '),
                                          TextSpan(
                                              style: kThickFont.copyWith(
                                                  fontSize: 9),
                                              text:
                                                  '${(distance / 1000).toStringAsFixed(2)}km')
                                        ]),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      _launchMapsUrl(
                                          places[index].geometry.location.lat,
                                          places[index].geometry.location.lng);
                                    },
                                    alignment: Alignment.centerRight,
                                    icon: Icon(
                                      Icons.assistant_navigation,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Loading...',
                          style: kThickFont.copyWith(fontSize: 15),
                        ),
                      ),
                      Container(
                        child: LinearProgressIndicator(),
                        width: 90,
                        height: 8,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
