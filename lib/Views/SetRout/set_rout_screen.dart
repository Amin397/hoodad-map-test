import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/SetRout/set_rout_controller.dart';

class SetRoutScreen extends StatelessWidget {
  SetRoutScreen({super.key});

  final SetRoutController controller = Get.put(SetRoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.addRandomMarker();
          // controller.updateLocation();
          controller.calDistance();
        },
        backgroundColor: Colors.blue,
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: paddingAll18,
        child: SafeArea(
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: GetBuilder(
              init: controller,
              id: 'routPoints',
              builder: (ctx) {
                return Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        onLongPress: (tapPosition, latLng) {
                          ctx.addMarkerToMap(
                            pressedPoint: latLng,
                          );
                        },
                        initialCenter: const LatLng(
                          35.80723,
                          51.42881,
                        ),
                        initialZoom: 15.0,
                      ),
                      mapController: ctx.mapController,
                      children: [
                        TileLayer(
                          urlTemplate:
                              // 'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png?key=4c1N5rAPVh6vwCrss8Rx',
                              // 'https://basemaps.cartocdn.com/rastertiles/voyager_nolabels/{z}/{x}/{y}.png',
                              'https://api.mapbox.com/styles/v1/mapbox/light-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiaG9vZGFkdGVjaCIsImEiOiJjbG1memp3ZGwwOXNwM3NsbGZ3MWkwdWwwIn0.-1Iv-9rRM5OtKwmkQnV2BA',
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
                        if (ctx.originMarker is Marker)
                          MarkerLayer(
                            markers: [ctx.originMarker!],
                          ),
                        if (ctx.destinationMarker is Marker)
                          MarkerLayer(
                            markers: [ctx.destinationMarker!],
                          ),
                        MarkerLayer(
                          markers: ctx.markerList,
                        ),
                        if(ctx.currentLocation is Marker)MarkerLayer(
                          markers: [
                            ctx.currentLocation!,
                          ],
                        ),
                      ],
                    ),
                    if(ctx.distanceInMeters > 0.0)Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Distance: ${ctx.distanceInMeters} ${ctx.showDistance}'),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
