// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/map/.env.dart';
import 'package:virtual_courier/pages/map/Pickup_panel/recentLocations.dart';
import 'package:virtual_courier/pages/map/homemappage.dart';
import 'package:virtual_courier/utils/routes.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  GoogleMapController? _googleMapController;

  String location = "Enter Pickup";
  String destination_location = "Enter Destination";

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
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
                        color: Colors.green,
                      ),
                      right: Expanded(
                        child: InkWell(
                          onTap: () async {
                            var place = await PlacesAutocomplete.show(
                                context: context,
                                apiKey: googleAPIKey,
                                mode: Mode.overlay,
                                types: [],
                                strictbounds: false,
                                components: [
                                  Component(Component.country, 'in')
                                ],
                                //google_map_webservice package
                                onError: (err) {
                                  print(err);
                                });

                            if (place != null) {
                              setState(() {
                                location = place.description.toString();
                              });

                              //form google_maps_webservice package
                              final plist = GoogleMapsPlaces(
                                apiKey: googleAPIKey,
                                apiHeaders:
                                    await GoogleApiHeaders().getHeaders(),
                                //from google_api_headers package
                              );
                              String placeid = place.placeId ?? "0";
                              final detail =
                                  await plist.getDetailsByPlaceId(placeid);
                              final geometry = detail.result.geometry!;
                              final lat = geometry.location.lat;
                              final lang = geometry.location.lng;
                              var newlatlang = LatLng(lat, lang);

                              //move map camera to selected place with animation
                              _googleMapController?.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: newlatlang, zoom: 17)));
                            }
                          },
                          child: ListTile(
                            tileColor: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            title: location.text.xl.make(),
                            dense: true,
                          ).p16(),
                        ),
                      ),
                    ),
                    VxTwoRow(
                      left: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      right: Expanded(
                        child: InkWell(
                          onTap: () async {
                            var place = await PlacesAutocomplete.show(
                                context: context,
                                apiKey: googleAPIKey,
                                mode: Mode.overlay,
                                types: [],
                                strictbounds: false,
                                components: [
                                  Component(Component.country, 'in')
                                ],
                                //google_map_webservice package
                                onError: (err) {
                                  print(err);
                                });

                            if (place != null) {
                              setState(() {
                                destination_location =
                                    place.description.toString();
                              });

                              //form google_maps_webservice package
                              final plist = GoogleMapsPlaces(
                                apiKey: googleAPIKey,
                                apiHeaders:
                                    await GoogleApiHeaders().getHeaders(),
                                //from google_api_headers package
                              );
                              String placeid = place.placeId ?? "0";
                              final detail =
                                  await plist.getDetailsByPlaceId(placeid);
                              final geometry = detail.result.geometry!;
                              final lat = geometry.location.lat;
                              final lang = geometry.location.lng;
                              var newlatlang = LatLng(lat, lang);

                              //move map camera to selected place with animation
                              _googleMapController?.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: newlatlang, zoom: 17)));
                            }
                          },
                          child: ListTile(
                            tileColor: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            title: destination_location.text.xl.make(),
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
                RecentLocations(),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.whattosendroute);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Done Button Pressed'),
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
                ).wh(MediaQuery.of(context).size.width, 50),
              ],
            ).pSymmetric(v: 32, h: 16),
          ),
        ),
      ),
    );
  }
}
