// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unnecessary_null_comparison, avoid_print, unrelated_type_equality_checks
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/map/.env.dart';
import 'package:virtual_courier/pages/map/directions_model.dart';
import 'package:virtual_courier/utils/drawer.dart';

import '../../utils/routes.dart';
import 'Pickup_panel/recent_locations.dart';
import 'directions_repository.dart';

class HomeMapPage extends StatefulWidget {
  const HomeMapPage({Key? key}) : super(key: key);

  @override
  _HomeMapPageState createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
  var _initialCameraPosition = CameraPosition(
    target: LatLng(21.632459289835975, 72.97962033809979),
    zoom: 16,
  );

  GoogleMapController? _googleMapController;

  double bottomPaddingofMap = 0.0;
  Marker? _origin;
  Marker? _destination;
  Marker? _stop;
  Directions? _info;
  // LocationData? currentLocation;s
  String location = "Enter Pickup";
  String destinationLocation = "Enter Destination";
  String stopLocation = "Enter Stop";
  bool _panelIsClosed = true;
  bool _expandStop = false;

  Position? currentPosition;

  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlangPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latlangPosition, zoom: 19);
    _googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    setState(() {
      _initialCameraPosition = cameraPosition;
      _googleMapController!.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition));
    });
  }

  @override
  void initState() {
    // getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Builder(
          builder: (context) => Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                padding: EdgeInsets.symmetric(vertical: bottomPaddingofMap),
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                myLocationEnabled: true,
                compassEnabled: true,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (controller) {
                  _googleMapController = controller;
                  locatePosition();

                  setState(() {
                    bottomPaddingofMap = 300;
                  });
                },
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
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Distance left: ${_info!.totalDistance} ',
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                indent: 55,
                                endIndent: 55,
                              ),
                              Text(
                                'Time left: ${_info!.totalDuration}',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ).p8())
                      .py8(),
                ),
              if (_info != null)
                Positioned(
                  top: 200,
                  right: 300,
                  child: FloatingActionButton.small(
                    heroTag: "btn2",
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.teal[600],
                    onPressed: () {
                      () {
                        setState(() {
                          _origin = null;
                          _destination = null;
                          _info = null;
                        });
                      };
                    },
                    child: Icon(
                      Icons.restore,
                    ),
                  ),
                ),
              Positioned(
                top: 150,
                right: 200,
                child: FloatingActionButton.small(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  heroTag: "btn3",
                  backgroundColor: Colors.indigo[600],
                  onPressed: () {
                    locatePosition();
                  },
                  child: const Icon(Icons.center_focus_strong),
                ).pOnly(right: 100),
              ),
              Positioned(
                top: 100,
                right: 300,
                child: FloatingActionButton.small(
                    heroTag: "btn1",
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.deepOrange[600],
                    child: Icon(
                      Icons.dashboard_rounded,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    }),
              ),
              SlidingUpPanel(
                backdropEnabled: true,
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.grey)
                ],
                minHeight: MediaQuery.of(context).size.height / 3,
                maxHeight: MediaQuery.of(context).size.height,
                backdropColor: Colors.amber,
                header: Center(
                  widthFactor: 7,
                  heightFactor: 3,
                  child: SizedBox(
                    height: 15,
                    width: 50,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.colorScheme.primary),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          ),
                        ),
                        child: null,
                      ),
                    ),
                  ),
                ),
                onPanelOpened: () {
                  setState(() {
                    _panelIsClosed = false;
                  });
                },
                onPanelClosed: () {
                  setState(() {
                    _panelIsClosed = true;
                  });
                },
                borderRadius: _panelIsClosed == true
                    ? BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))
                    : null,
                /*
    
                            PANEL
    
                            */

                panel: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _panelIsClosed == true
                              ? Icon(Icons.search)
                              : Icon(Icons.close),
                          "Enter Pickup".text.xl.bold.make(),
                          Spacer(),
                          if (_origin != null)
                            TextButton(
                              onPressed: () =>
                                  _googleMapController?.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: _origin!.position,
                                    zoom: 17,
                                    tilt: 50.0,
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.red,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              child: 'ORIGIN'.text.size(10).make(),
                            ),
                          if (_destination != null)
                            TextButton(
                              onPressed: () =>
                                  _googleMapController?.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: _destination!.position,
                                    zoom: 17,
                                    tilt: 50.0,
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.purple,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              child: 'DEST'.text.size(10).make(),
                            ),
                          if (_stop != null)
                            TextButton(
                              onPressed: () =>
                                  _googleMapController?.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: _stop!.position,
                                    zoom: 17,
                                    tilt: 50.0,
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              child: 'STOP'.text.size(10).make(),
                            ),
                        ],
                      ).pOnly(bottom: 10),
                      if (_panelIsClosed == false)
                        Material(
                          elevation: 6,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          shadowColor: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  Expanded(
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
                                            apiHeaders: await GoogleApiHeaders()
                                                .getHeaders(),
                                            //from google_api_headers package
                                          );
                                          String placeid = place.placeId ?? "0";
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
                                  if (_expandStop == false)
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _expandStop = true;
                                          });
                                        },
                                        child: Text('Add\nStop')),
                                ]),
                                if (_expandStop == true)
                                  Row(children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                    ),
                                    Expanded(
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
                                          trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _expandStop = false;
                                              });
                                            },
                                            icon: Icon(Icons.close),
                                          ),
                                          dense: true,
                                        ).p16(),
                                      ),
                                    ),
                                  ]),
                                Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.purple,
                                  ),
                                  Expanded(
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
                                            apiHeaders: await GoogleApiHeaders()
                                                .getHeaders(),
                                            //from google_api_headers package
                                          );
                                          String placeid = place.placeId ?? "0";
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
                                        title:
                                            destinationLocation.text.xl.make(),
                                        dense: true,
                                      ).p16(),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      Expanded(
                        child: Column(
                          children: [
                            Divider(
                              thickness: 3,
                            ),
                            RecentLocations(),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.whattosendroute);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      const Text('Continue Button Pressed'),
                                  duration: const Duration(seconds: 1),
                                ));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    context.theme.colorScheme.secondary),
                                shape: MaterialStateProperty.all(
                                  StadiumBorder(),
                                ),
                              ),
                              child: "Continue".text.xl.white.bold.make(),
                            )
                                .wh(MediaQuery.of(context).size.width, 50)
                                .pOnly(bottom: 20),
                          ],
                        ),
                      ),
                    ],
                  ).pSymmetric(v: 32, h: 16),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
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
    //else {
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
    //   // final directions2 = await DirectionsRepository(dio: Dio()).getDirections(
    //   //     stop: _stop!.position, destination: _destination!.position);
    //   // setState(() => _info = directions2!);
    // }
  }
}
