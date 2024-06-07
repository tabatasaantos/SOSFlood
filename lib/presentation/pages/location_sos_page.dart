import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/location_sos_controller.dart';

class LocationSOSPage extends StatelessWidget {
  const LocationSOSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final controller = Get.put(LocationSOSController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[300],
      ),
      body:
  
          GetBuilder<LocationSOSController>(
        init: controller,
        builder: (value) => GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
            target: controller.position,
            zoom: 13,
          ),
          onMapCreated: controller.onMapCreated,
          myLocationEnabled: true,
          markers: controller.markers,
        ),
      ),
    );
  }
}
