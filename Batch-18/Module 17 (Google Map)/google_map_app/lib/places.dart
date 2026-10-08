import 'package:google_maps_flutter/google_maps_flutter.dart';

/// One named place on the map.
class Landmark {
  const Landmark({
    required this.id,
    required this.name,
    required this.position,
    required this.fact,
  });

  /// Becomes the MarkerId. Two markers on the same map cannot share an id.
  final String id;
  final String name;
  final LatLng position;

  /// The short line under the name in an info window.
  final String fact;
}

class Places {
  static const Landmark parliament = Landmark(
    id: 'parliament',
    name: 'National Parliament',
    position: LatLng(23.7625, 90.3783),
    fact: 'Jatiya Sangsad Bhaban',
  );

  static const Landmark shahidMinar = Landmark(
    id: 'shahid_minar',
    name: 'Shahid Minar',
    position: LatLng(23.7271, 90.3967),
    fact: 'Remembers the Language Movement',
  );

  static const Landmark lalbaghFort = Landmark(
    id: 'lalbagh',
    name: 'Lalbagh Fort',
    position: LatLng(23.7190, 90.3880),
    fact: 'Mughal fort, started in 1678',
  );

  static const Landmark ahsanManzil = Landmark(
    id: 'ahsan_manzil',
    name: 'Ahsan Manzil',
    position: LatLng(23.7086, 90.4068),
    fact: 'The Pink Palace',
  );

  static const Landmark hatirjheel = Landmark(
    id: 'hatirjheel',
    name: 'Hatirjheel',
    position: LatLng(23.7690, 90.4240),
    fact: 'The lake in the middle of the city',
  );

  static const Landmark university = Landmark(
    id: 'du',
    name: 'University of Dhaka',
    position: LatLng(23.7340, 90.3928),
    fact: 'University of Dhaka campus',
  );

  static const List<Landmark> all = [
    parliament,
    shahidMinar,
    lalbaghFort,
    ahsanManzil,
    hatirjheel,
    university,
  ];

  /// First camera frame. Later moves go through GoogleMapController.
  static const CameraPosition openingCamera = CameraPosition(
    target: LatLng(23.740, 90.400),
    zoom: 12,
  );
}
