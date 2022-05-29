// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/utils/routes.dart';

class HomeMapPage extends StatefulWidget {
  const HomeMapPage({Key? key}) : super(key: key);

  @override
  _HomeMapPageState createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.dashboard_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {})
              .pOnly(left: 20, top: 50),
          SlidingUpPanel(
            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey)],
            minHeight: MediaQuery.of(context).size.height / 4,
            maxHeight: MediaQuery.of(context).size.height,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            onPanelOpened: () =>
                Navigator.pushNamed(context, MyRoutes.panelroute),
            panel: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Enter Pickup',
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
              ),
            ).p32(),
          )
        ],
      ),
    ));
  }
}
