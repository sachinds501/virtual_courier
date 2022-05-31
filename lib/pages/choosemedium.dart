import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class ChooseMedium extends StatefulWidget {
  const ChooseMedium({Key? key}) : super(key: key);

  @override
  State<ChooseMedium> createState() => _ChooseMediumState();
}

class _ChooseMediumState extends State<ChooseMedium> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
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
                        Icons.dashboard,
                        color: Colors.black,
                      ),
                      onPressed: () {})
                  .pOnly(left: 20, top: 50),
              SlidingUpPanel(
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.grey)
                ],
                minHeight: MediaQuery.of(context).size.height / 2.2,
                maxHeight: MediaQuery.of(context).size.height / 2.2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                panel: Expanded(
                  child: Column(
                    children: [
                      "Medium".text.bold.make().pSymmetric(v: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                      ),
                      selectMedium(context),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Continue Button Pressed'),
                            duration: Duration(seconds: 1),
                          ));
                          Navigator.pushNamed(
                              context, MyRoutes.choosemediumroute);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.colorScheme.secondary),
                          shape: MaterialStateProperty.all(
                            const StadiumBorder(),
                          ),
                        ),
                        child: "Select Nduthi".text.xl.white.bold.make(),
                      ).wh(MediaQuery.of(context).size.width, 50).p16(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container selectMedium(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            title: 'Nduthi'.text.bold.size(13).make(),
            subtitle: '2 min'.text.size(8).make(),
            tileColor: Colors.blue,
            leading: Icon(
              Icons.bike_scooter,
              color: Theme.of(context).colorScheme.secondary,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Ksh 150'.text.bold.size(13).make(),
                "Ksh 180".text.lineThrough.caption(context).make()
              ],
            ),
          ),
          ListTile(
            title: 'Bike'.text.bold.size(13).make(),
            subtitle: '23 min'.text.size(8).make(),
            leading: Icon(
              Icons.electric_bike,
              color: Theme.of(context).colorScheme.secondary,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Ksh 250'.text.bold.size(13).make(),
                "Ksh 300".text.lineThrough.caption(context).make()
              ],
            ),
          ),
          ListTile(
            title: 'TukTuk'.text.bold.size(13).make(),
            subtitle: '15 min'.text.size(8).make(),
            leading: Icon(
              Icons.electric_rickshaw,
              color: Theme.of(context).colorScheme.secondary,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Ksh 150'.text.bold.size(13).make(),
                "Ksh 250".text.lineThrough.caption(context).make()
              ],
            ),
          )
        ],
      ),
    );
  }
}


// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors



