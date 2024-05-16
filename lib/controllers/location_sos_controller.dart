// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../database/db_location_sos.dart';

class LocationSOSController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final raio = 0.0.obs;

  late StreamSubscription<Position> positionStream;
  final LatLng _position = const LatLng(-23.571505, -46.689104);
  late GoogleMapController _mapsController;
  final markers = <Marker>{};

  static LocationSOSController get to => Get.find<LocationSOSController>();
  get mapsController => _mapsController;
  get position => _position;
  String get distancia => raio.value < 1
      ? '${(raio.value * 1000).toStringAsFixed(0)} m'
      : '${(raio.value).toStringAsFixed(1)} km';

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  filtrarMap() {
    final geo = Geoflutterfire();
    final db = DB.get();

    GeoFirePoint center = geo.point(
      latitude: latitude.value,
      longitude: longitude.value,
    );

    CollectionReference ref = db.collection('locations');

    String field = 'position';

    Stream<List<DocumentSnapshot>> stream =
        geo.collection(collectionRef: ref).within(center: center, radius: raio.value, field: field);

    stream.listen((List<DocumentSnapshot> locations) {
      markers.clear();
      for (var location in locations) {
        addMarker(location);
        update();
      }
      Get.back();
    });
  }

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadLocations();

    var style = await rootBundle.loadString('assets/map/light.json');
    _mapsController.setMapStyle(style);
  }

  loadLocations() async {
    FirebaseFirestore db = DB.get();
    final locations = await db.collection('locations').get();

    for (var location in locations.docs) {
      addMarker(location);
    }
  }

  addMarker(location) async {
    GeoPoint point = location.get('position.geopoint');
    final Uint8List icon = await getBytesFromAsset('assets/light.png', 64);

    markers.add(
      Marker(
        markerId: MarkerId(location.id),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: location.get('nome')),
        icon: BitmapDescriptor.fromBytes(icon),
        onTap: () => {},
      ),
    );
    update();
  }



  watchPosicao() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      if (position != null) {
        latitude.value = position.latitude;
        longitude.value = position.longitude;
      }
    });
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone.');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização.');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Autorize o acesso à localização nas configurações.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosicao() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)));
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}