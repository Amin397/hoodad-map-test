import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled1/Controllers/Home/home_controller.dart';


class BuildMapWidget extends StatelessWidget {
  BuildMapWidget({super.key , required this.controller});


  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: GetBuilder(
        init: controller,
        id: 'mapUpdate',
        builder: (ctx){
          return FlutterMap(
            options: MapOptions(
              onLongPress: (tapPosition, latLng) {
                // ctx.addMarkerToMap(
                //   pressedPoint: latLng,
                // );
              },
              initialCenter: const LatLng(
                35.79653413901838,
                51.41736988430125,
              ),
              initialZoom: 18.0,
            ),
            mapController: ctx.mapController,
            children: [
              TileLayer(
                urlTemplate:
                'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png?key=4c1N5rAPVh6vwCrss8Rx',
                // 'https://basemaps.cartocdn.com/rastertiles/voyager_nolabels/{z}/{x}/{y}.png',
                // 'https://api.mapbox.com/styles/v1/mapbox/light-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiaG9vZGFkdGVjaCIsImEiOiJjbG1memp3ZGwwOXNwM3NsbGZ3MWkwdWwwIn0.-1Iv-9rRM5OtKwmkQnV2BA',
                userAgentPackageName: 'com.example.app',
              ),
              if (ctx.routPoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: ctx.routPoints,
                      color: Colors.blue,
                      strokeWidth: 9.0,
                    ),
                  ],
                ),
              // if (ctx.originMarker is Marker)
              //   MarkerLayer(
              //     markers: [ctx.originMarker!],
              //   ),
              // if (ctx.destinationMarker is Marker)
              //   MarkerLayer(
              //     markers: [ctx.destinationMarker!],
              //   ),
              MarkerLayer(
                markers: ctx.markerList,
              ),
              if(ctx.currentLocation is Marker)MarkerLayer(
                markers: [
                  ctx.currentLocation!,
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
