import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_app/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GpsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<GpsScreen> createState() => _GpsScreenState();
}

class _GpsScreenState extends State<GpsScreen> {
  GoogleMapController? _map;
  LatLng? _me;

  String _status = 'Press "Find me" On an emulator, set a fake location first';
  bool _busy = false;

  Future<void> _findMe() async {
    setState(() => _busy = true);

    try {
      //1.Permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (!mounted) return;

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _status = 'Location permission is $permission. Allow it';
        });
        return;
      }

      //Current Position
      final Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: .high,
          timeLimit: Duration(seconds: 15),
        ),
      );
      if (!mounted) return;

      //Current LatLng
      final LatLng here = LatLng(position.latitude, position.longitude);
      setState(() {
        _me = here;
        _status =
            'Lat: ${here.latitude.toStringAsFixed(4)}\n'
            ' Lng: ${here.longitude.toStringAsFixed(4)}\n';
        _busy = false;
      });
    } on PermissionDeniedException {
      setState(() {
        _status = 'Permission denied. Allow it from settings';
      });
    } on LocationServiceDisabledException {
      setState(() {
        _status = 'Location service is disabled. Enable it from settings';
      });
    } on TimeoutException {
      setState(() {
        _status = 'Timeout. Try again';
      });
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = {
      if (_me != null)
        Marker(
          markerId: const MarkerId('me'),
          position: _me!,
          infoWindow: const InfoWindow(title: 'Me'),
        ),
    };
    return Scaffold(
      appBar: AppBar(title: const Text('GPS')),
      body: Column(
        children: [
          const Center(child: Text('GPS Screen')),
          Padding(padding: const EdgeInsets.all(8.0), child: Text(_status)),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: Places.openingCamera,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (controller) => _map = controller,
              markers: markers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _busy ? null : _findMe,
              child: const Text('Find me'),
            ),
          ),
        ],
      ),
    );
  }
}
