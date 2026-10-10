import 'package:flutter/material.dart';
import 'package:google_map_app/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGesturesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MapGesturesScreen> createState() => _MapGesturesScreenState();
}

/*
Scroll Controll
Zoom in Zoom out Controll
Rotate Controll
Tilt Controll
How to find our current location
 */

class _MapGesturesScreenState extends State<MapGesturesScreen> {
  GoogleMapController? _map;

  bool _scroll = false;
  bool _zoom = false;
  bool _rotate = false;
  bool _tilt = false;

  final ValueNotifier<CameraPosition> _camera = ValueNotifier<CameraPosition>(
    Places.openingCamera,
  );

  @override
  void dispose() {
    super.dispose();
    _camera.dispose();
  }

  void _goToHatirjheel() {
    _map?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Places.hatirjheel.position,
          zoom: 16,
          tilt: 50,
          bearing: 45,
        ),
      ),
    );
  }

  void _resetNorth() {
    _map?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _camera.value.target, zoom: 12),
      ),
    );
  }

  void _zoomIn() {
    _map?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _map?.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Gestures')),
      body: Column(
        children: [
          const Center(child: Text('Map Gestures Screen')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<CameraPosition>(
              valueListenable: _camera,
              builder: (context, camera, child) {
                final LatLng target = camera.target;
                return Text(
                  'Lat: ${target.latitude.toStringAsFixed(4)}\n'
                  ' Lng: ${target.longitude.toStringAsFixed(4)}\n'
                  ' Zoom: ${camera.zoom.toStringAsFixed(2)}\n'
                  'Tilt: ${camera.tilt.toStringAsFixed(2)}\n'
                  'Bearing: ${camera.bearing.toStringAsFixed(2)}\n'
                  'Drag, scroll, twist and tilt with two Fingers',

                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: Places.openingCamera,
              scrollGesturesEnabled: _scroll,
              zoomControlsEnabled: _scroll,
              rotateGesturesEnabled: _rotate,
              tiltGesturesEnabled: _tilt,
              onMapCreated: (GoogleMapController controller) {
                _map = controller;
              },
              onCameraMove: (position) {
                _camera.value = position;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text("Scroll"),
                  selected: _scroll,
                  onSelected: (bool value) {
                    setState(() => _scroll = value);
                  },
                ),
                FilterChip(
                  label: Text("Zoom"),
                  selected: _zoom,
                  onSelected: (bool value) {
                    setState(() => _zoom = value);
                  },
                ),
                FilterChip(
                  label: Text("Rotate"),
                  selected: _rotate,
                  onSelected: (bool value) {
                    setState(() => _rotate = value);
                  },
                ),
                FilterChip(
                  label: Text("Tilt"),
                  selected: _tilt,
                  onSelected: (bool value) {
                    setState(() => _tilt = value);
                  },
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              OutlinedButton(
                onPressed: _goToHatirjheel,
                child: const Text('Go to Hatirjheel'),
              ),
              OutlinedButton(
                onPressed: _resetNorth,
                child: const Text('Reset North'),
              ),
              OutlinedButton(onPressed: _zoomIn, child: const Text('Zoom In')),
              OutlinedButton(
                onPressed: _zoomOut,
                child: const Text('Zoom Out'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
