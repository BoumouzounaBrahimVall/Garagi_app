import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:latlong2/latlong.dart';

final _mylocation2 = LatLng(33.68786707309622, -7.37669344496729);
final _mylocation = LatLng(33.70342654258918, -7.36632285713708);

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final mapController = MapController();
  late LatLng centerLocation;

  double currentZoom = 11;
  @override
  void initState() {
    super.initState();
    centerLocation = _mylocation;
  }

  void zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(centerLocation, currentZoom);
  }

  void zoomInt() {
    currentZoom = currentZoom + 1;
    mapController.move(centerLocation, currentZoom);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Container(
          width: 70,
          margin: const EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
              color: AppColors.colorYellow,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: zoomInt,
                  child: const Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
              const Text(
                "|",
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                  onTap: zoomOut,
                  child: const Text(
                    "-",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ))
            ],
          ),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                minZoom: 5,
                maxZoom: 16,
                zoom: 13,
                center: centerLocation,
                onTap: (tapPosition, point) {
                  print(point.latitude);
                  print(point.longitude);
                },
              ),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/brahimvall/{id}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                  additionalOptions: const {
                    "accessToken": AppConstants.mapboxAccessToken,
                    "id": AppConstants.mapboxStyle
                  },
                ),
                MarkerLayer(markers: [
                  Marker(
                    width: 50,
                    height: 50,
                    point: _mylocation,
                    builder: (context) {
                      return Image.asset(
                        "assets/icons/marker.png",
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                  Marker(
                    width: 70,
                    height: 70,
                    point: _mylocation2,
                    builder: (context) {
                      return Image.asset(
                        "assets/icons/station_marker.png",
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ])
              ],
            ),
            Positioned(
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 200,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.0)
                      ])),
                ))
          ],
        ));
  }
}
