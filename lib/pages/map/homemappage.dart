// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/map/.env.dart';
import 'package:virtual_courier/pages/map/directions_model.dart';
import 'package:virtual_courier/pages/map/Pickup_panel/panel.dart';

import '../../utils/routes.dart';
import 'Pickup_panel/recentLocations.dart';
import 'directions_repository.dart';

class HomeMapPage extends StatefulWidget {
  const HomeMapPage({Key? key}) : super(key: key);

  @override
  _HomeMapPageState createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(21.632459289835975, 72.97962033809979),
    zoom: 11.5,
  );

  GoogleMapController? _googleMapController;

  Marker? _origin;
  Marker? _destination;
  Marker? _stop;
  Directions? _info;
  String location = "Enter Location";
  String destinationLocation = "Enter Destination";
  String stopLocation = "Enter Stop";

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(59, 255, 255, 255),
        centerTitle: false,
        title: const Text('Google Maps'),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.purple,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            ),
          if (_stop != null)
            TextButton(
              onPressed: () => _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _stop!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('STOP'),
            ),
          // FloatingActionButton(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   foregroundColor: Colors.black,
          //   onPressed: () => _googleMapController?.animateCamera(
          //     _info != null
          //         ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
          //         : CameraUpdate.newCameraPosition(_initialCameraPosition),
          //   ),
          //   child: const Icon(Icons.center_focus_strong),
          // ).pOnly(right: 100),
        ],
      ),
      body: Builder(
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              // trafficEnabled: true,
              compassEnabled: true,
              // mapType: MapType.satellite,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: {
                if (_origin != null) _origin!,
                if (_destination != null) _destination!,
                if (_stop != null) _stop!,
              },
              polylines: {
                if (_info != null)
                  Polyline(
                    polylineId: const PolylineId('overview_polyline'),
                    color: Colors.cyan,
                    width: 7,
                    points: _info!.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
              onLongPress: _addMarker,
            ),
            if (_info != null)
              Positioned(
                top: 00.0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Distance: ${_info!.totalDistance}\nTime: ${_info!.totalDuration}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            if (_info != null)
              Positioned(
                top: 80,
                left: 110,
                child: FloatingActionButton.small(
                  onPressed: () {
                    () {};
                  },
                  child: Icon(Icons.restore),
                ),
              ),
            Positioned(
              top: 80,
              right: 110,
              child: FloatingActionButton.small(
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Icon(
                    Icons.dashboard_rounded,
                  ),
                  onPressed: () {
                    showBottomSheet(
                      enableDrag: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => SlidingUpPanel(
                        backdropEnabled: true,
                        boxShadow: const [
                          BoxShadow(blurRadius: 10, color: Colors.grey)
                        ],
                        minHeight: MediaQuery.of(context).size.height / 3,
                        maxHeight: MediaQuery.of(context).size.height,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        panel: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.search)),
                                  "Enter Pickup".text.xl.bold.make(),
                                ],
                              ).pOnly(bottom: 10),
                              Column(
                                children: [
                                  VxTwoRow(
                                    left: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ),
                                    right: Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          var place =
                                              await PlacesAutocomplete.show(
                                                  context: context,
                                                  apiKey: googleAPIKey,
                                                  mode: Mode.overlay,
                                                  types: [],
                                                  strictbounds: false,
                                                  components: [
                                                    Component(
                                                        Component.country, 'in')
                                                  ],
                                                  //google_map_webservice package
                                                  onError: (err) {
                                                    print(err);
                                                  });

                                          if (place != null) {
                                            setState(() {
                                              location =
                                                  place.description.toString();
                                            });

                                            //form google_maps_webservice package
                                            final plist = GoogleMapsPlaces(
                                              apiKey: googleAPIKey,
                                              apiHeaders:
                                                  await GoogleApiHeaders()
                                                      .getHeaders(),
                                              //from google_api_headers package
                                            );
                                            String placeid =
                                                place.placeId ?? "0";
                                            final detail = await plist
                                                .getDetailsByPlaceId(placeid);
                                            final geometry =
                                                detail.result.geometry!;
                                            final lat = geometry.location.lat;
                                            final lang = geometry.location.lng;
                                            var newlatlang = LatLng(lat, lang);
                                            _addMarker(newlatlang);
                                            //move map camera to selected place with animation
                                            _googleMapController?.animateCamera(
                                                CameraUpdate.newCameraPosition(
                                                    CameraPosition(
                                                        target: newlatlang,
                                                        zoom: 17)));
                                          }
                                        },
                                        child: ListTile(
                                          tileColor: Colors.grey[100],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          title: location.text.xl.make(),
                                          dense: true,
                                        ).p16(),
                                      ),
                                    ),
                                  ),
                                  VxTwoRow(
                                    left: Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                    ),
                                    right: Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          var place =
                                              await PlacesAutocomplete.show(
                                                  context: context,
                                                  apiKey: googleAPIKey,
                                                  mode: Mode.overlay,
                                                  types: [],
                                                  strictbounds: false,
                                                  components: [
                                                    Component(
                                                        Component.country, 'in')
                                                  ],
                                                  //google_map_webservice package
                                                  onError: (err) {
                                                    print(err);
                                                  });

                                          if (place != null) {
                                            setState(() {
                                              stopLocation =
                                                  place.description.toString();
                                            });

                                            //form google_maps_webservice package
                                            final plist = GoogleMapsPlaces(
                                              apiKey: googleAPIKey,
                                              apiHeaders:
                                                  await GoogleApiHeaders()
                                                      .getHeaders(),
                                              //from google_api_headers package
                                            );
                                            String placeid =
                                                place.placeId ?? "0";
                                            final detail = await plist
                                                .getDetailsByPlaceId(placeid);
                                            final geometry =
                                                detail.result.geometry!;
                                            final lat = geometry.location.lat;
                                            final lang = geometry.location.lng;
                                            var newlatlang = LatLng(lat, lang);
                                            _addMarker(newlatlang);
                                            //move map camera to selected place with animation
                                            _googleMapController?.animateCamera(
                                                CameraUpdate.newCameraPosition(
                                                    CameraPosition(
                                                        target: newlatlang,
                                                        zoom: 17)));
                                          }
                                        },
                                        child: ListTile(
                                          tileColor: Colors.grey[100],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          title: stopLocation.text.xl.make(),
                                          dense: true,
                                        ).p16(),
                                      ),
                                    ),
                                  ),
                                  VxTwoRow(
                                    left: Icon(
                                      Icons.location_on,
                                      color: Colors.purple,
                                    ),
                                    right: Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          var place =
                                              await PlacesAutocomplete.show(
                                                  context: context,
                                                  apiKey: googleAPIKey,
                                                  mode: Mode.overlay,
                                                  types: [],
                                                  strictbounds: false,
                                                  components: [
                                                    Component(
                                                        Component.country, 'in')
                                                  ],
                                                  //google_map_webservice package
                                                  onError: (err) {
                                                    print(err);
                                                  });

                                          if (place != null) {
                                            setState(() {
                                              destinationLocation =
                                                  place.description.toString();
                                            });

                                            //form google_maps_webservice package
                                            final plist = GoogleMapsPlaces(
                                              apiKey: googleAPIKey,
                                              apiHeaders:
                                                  await GoogleApiHeaders()
                                                      .getHeaders(),
                                              //from google_api_headers package
                                            );
                                            String placeid =
                                                place.placeId ?? "0";
                                            final detail = await plist
                                                .getDetailsByPlaceId(placeid);
                                            final geometry =
                                                detail.result.geometry!;
                                            final lat = geometry.location.lat;
                                            final lang = geometry.location.lng;
                                            var newlatlang = LatLng(lat, lang);
                                            _addMarker(newlatlang);
                                            //move map camera to selected place with animation
                                            _googleMapController?.animateCamera(
                                                CameraUpdate.newCameraPosition(
                                                    CameraPosition(
                                                        target: newlatlang,
                                                        zoom: 17)));
                                          }
                                        },
                                        child: ListTile(
                                          tileColor: Colors.grey[100],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          title: destinationLocation.text.xl
                                              .make(),
                                          dense: true,
                                        ).p16(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    RecentLocations(),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, MyRoutes.whattosendroute);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              const Text('Done Button Pressed'),
                                          duration: const Duration(seconds: 1),
                                        ));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(context
                                                .theme.colorScheme.secondary),
                                        shape: MaterialStateProperty.all(
                                          StadiumBorder(),
                                        ),
                                      ),
                                      child:
                                          "Continue".text.xl.white.bold.make(),
                                    ).wh(MediaQuery.of(context).size.width, 50),
                                  ],
                                ),
                              ),
                            ],
                          ).pSymmetric(v: 32, h: 16),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
        // Reset destination
        _destination;

        // Reset info
        _info;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          position: pos,
        );
      });
      final directions = await DirectionsRepository(dio: Dio())
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions!);
    }
    // if (_origin != null && _destination != null) {
    //   setState(() {
    //     _stop = Marker(
    //       markerId: const MarkerId('stop'),
    //       infoWindow: const InfoWindow(title: 'stop'),
    //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    //       position: pos,
    //     );
    //   });
    //   final directions = await DirectionsRepository(dio: Dio()).getDirections(
    //       origin: _origin!.position,
    //       stop: pos,
    //       destination: _destination!.position);
    //   setState(() => _info = directions!);
    // }
  }
}
