import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_app/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  LocationPermission? _permission;
  bool _isServiceOn = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  bool get _canShowBlueDot {
    return _permission == LocationPermission.always ||
        _permission == LocationPermission.whileInUse;
  }

  Future<void> _refresh() async {
    final bool serviceIsOn = await Geolocator.isLocationServiceEnabled();
    final LocationPermission permission = await Geolocator.checkPermission();
    if (!mounted) return;
    setState(() {
      _isServiceOn = serviceIsOn;
      _permission = permission;
    });
  }

  Future<void> _ask() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      _isServiceOn = await Geolocator.isLocationServiceEnabled();
    }

    if (!mounted) return;
    setState(() {
      _permission = permission;
    });
  }

  String _explain() {
    LocationPermission? permission = _permission;
    if (permission == null) {
      return 'No location permission available.';
    }
    switch (permission) {
      case LocationPermission.denied:
        return 'Location permission is denied.';
      case LocationPermission.deniedForever:
        return 'Location permission is permanently denied.';
      case LocationPermission.always:
        return 'Location permission is granted always.';
      case LocationPermission.whileInUse:
        return 'Location permission is granted while in use.';
      default:
        return 'Unknown location permission.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permission')),
      body: Center(
        child: Column(
          children: [
            Text(_explain()),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: Places.openingCamera,
                myLocationEnabled: _canShowBlueDot,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Wrap(
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: _ask,
                    child: const Text('Ask for permission'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refresh,
                    child: const Text('check Again'),
                  ),
                  const SizedBox(height: 16),
                  Text('Location service is ${_isServiceOn ? 'ON' : 'OFF'}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
