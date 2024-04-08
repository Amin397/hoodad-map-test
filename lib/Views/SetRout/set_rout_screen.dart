import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled1/Consts/measures.dart';
import 'package:untitled1/Controllers/SetRout/set_rout_controller.dart';
import 'package:untitled1/Utils/view_utils.dart';

class SetRoutScreen extends StatelessWidget {
  SetRoutScreen({super.key});

  final SetRoutController controller = Get.put(SetRoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return FlutterMap(
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
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                    if(ctx.originMarker is Marker)MarkerLayer(
                      markers: [ctx.originMarker!],
                    ),
                    if(ctx.destinationMarker is Marker)MarkerLayer(
                      markers: [ctx.destinationMarker!],
                    ),
                    // PolylineLayer(
                    //   polylineCulling: false,
                    //   polylines: [
                    //     Polyline(
                    //       points: ctx.routPoints,
                    //       color: Colors.blue,
                    //       strokeWidth: 9.0,
                    //     )
                    //   ],
                    // ),
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
