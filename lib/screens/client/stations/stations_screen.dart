//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:dio/dio.dart';

final _mylocation2 = LatLng(33.68786707309622, -7.37669344496729);
final _mylocation = LatLng(33.70342654258918, -7.36632285713708);

class DirectionModel {
  late List<LatLng> route;
  late double duration;
  late double distance;
}

Future<DirectionModel> getRouteUsingMapbox(
    LatLng source, LatLng destination) async {
  String navType = 'driving'; //cycling
  Dio dio = Dio();

  String url =
      '${AppConstants.directionsBaseUrl}/$navType/${source.longitude},${source.latitude};${destination.longitude},${destination.latitude}?alternatives=true&continue_straight=true&geometries=geojson&language=en&overview=full&steps=true&access_token=${AppConstants.mapboxAccessToken}';
  try {
    dio.options.contentType = Headers.jsonContentType;
    final responseData = await dio.get(url);

    var coordinatesData =
        responseData.data["routes"][0]["geometry"]["coordinates"];

// Extract coordinates from "geometry"
    List<List<double>> coordinatesList =
        (coordinatesData as List<dynamic>).map<List<double>>((coord) {
      return [coord[1], coord[0]];
    }).toList();
// Convert List<List<double>> to List<LatLng>
    DirectionModel direction = DirectionModel();
    direction.route =
        coordinatesList.map((coord) => LatLng(coord[0], coord[1])).toList();
    direction.distance = responseData.data['routes'][0]['distance'];
    direction.duration = responseData.data['routes'][0]['duration'];
    print(direction.route);
    return direction;
  } catch (e) {
    print(e);
    return DirectionModel();
  }
}

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key, this.destination});
  final LatLng? destination;
  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final mapController = MapController();
  late LatLng centerLocation;
  DirectionModel? directionModel;
  double currentZoom = 11;
  @override
  void initState() {
    super.initState();
    centerLocation = _mylocation;
    if (widget.destination != null) {
      getRoute(widget.destination!);
    }
  }

  Future<void> getRoute(LatLng destination) async {
    directionModel = await getRouteUsingMapbox(_mylocation, destination);
    setState(() {});
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
        appBar: widget.destination != null
            ? SecondaryAppBarWidget(
                horizontalPadding: 0,
                title: "Car Location",
                onPressedBack: () => Navigator.of(context).pop(),
              )
            : null,
        backgroundColor: Colors.black,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (directionModel != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    directionModel = null;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.colorYellow,
                  ),
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: AppColors.colorWhite),
                  ),
                ),
              ),
            Container(
              width: 70,
              margin: const EdgeInsets.only(bottom: 100),
              decoration: BoxDecoration(
                  color: AppColors.colorYellow,
                  borderRadius: BorderRadius.circular(8)),
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
          ],
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
                  debugPrint("${point.latitude}");
                  debugPrint("${point.longitude}");
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
                if (directionModel != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: directionModel!
                            .route, // Replace with your list of LatLng
                        color: AppColors.colorYellow, // Polyline color
                        strokeWidth: 4.0, // Polyline width
                      ),
                    ],
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
                      return GestureDetector(
                        onTap: () async {
                          await getRoute(_mylocation2);
                        },
                        child: Image.asset(
                          "assets/icons/station_marker.png",
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  if (widget.destination != null)
                    Marker(
                      width: 70,
                      height: 70,
                      point: widget.destination!,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () async {
                            await getRoute(widget.destination!);
                          },
                          child: Image.asset(
                            "assets/icons/car_marker.png",
                            fit: BoxFit.contain,
                          ),
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
                      ]),
                ),
                child: directionModel != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.colorYellow,
                              ),
                              child: Text(
                                "Distance: ${(directionModel!.distance / 1000.0).toStringAsFixed(1)}KM",
                                style: const TextStyle(
                                    color: AppColors.colorWhite),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.colorYellow,
                              ),
                              child: Text(
                                "Duration: ${(directionModel!.duration).toStringAsFixed(1)}mins",
                                style: const TextStyle(
                                    color: AppColors.colorWhite),
                              ),
                            ),
                          ])
                    : null,
              ),
            )
          ],
        ));
  }
}
