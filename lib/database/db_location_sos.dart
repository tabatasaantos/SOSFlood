import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class DB {
  DB._();
  static final DB _instance = DB._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return DB._instance._firestore;
  }

  static setupDemoData() async {
    FirebaseFirestore firestore = DB.get();
    final geo = Geoflutterfire();

    List<GeoFirePoint> houses = [
      geo.point(latitude: -23.5560767, longitude: -46.6608517),
      geo.point(latitude: -23.5585417, longitude: -46.6631051),
      geo.point(latitude: -23.5548119, longitude: -46.6571616),
      geo.point(latitude: -23.5584417, longitude: -46.6632462),
      geo.point(latitude: -23.5764314, longitude: -46.6892785),
    ];
    final dados = [
      {
        'nome': 'House',
        
        'position': houses[0].data,
      },
      {
        'nome': 'House II',
        
        'position': houses[1].data,
      },
      {
        'nome': 'House III',
        
        'position': houses[2].data,
      },
      
    ];

    await firestore.collection('cafes').add(dados[0]);
    await firestore.collection('cafes').add(dados[1]);
    await firestore.collection('cafes').add(dados[2]);
    await firestore.collection('cafes').add(dados[3]);
    await firestore.collection('cafes').add(dados[4]);
  }
}