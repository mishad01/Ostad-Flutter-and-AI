import 'package:flutter/material.dart';
import 'package:google_map_app/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylinesScreen extends StatefulWidget {
  const PolylinesScreen({super.key});

  @override
  State<PolylinesScreen> createState() => _PolylinesScreenState();
}

class _PolylinesScreenState extends State<PolylinesScreen> {
  List<LatLng> _point = [];

  void _addPoint(LatLng position) {
    setState(() => _point = [..._point, position]);
  }

  void _loadCampusRoute() {
    setState(() {
      _point = [for (final Landmark stop in Places.shuttleRoute) stop.position];
    });
  }

  Set<Polyline> _lines() {
    return {
      Polyline(
        polylineId: PolylineId('walk'),
        color: Colors.teal,
        points: _point,
        width: 5,
      ),
    };
  }

  void _clear() {
    setState(() {
      _point = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polylines')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Center(child: Text('Polylines Screen')),
            Text(
              'Tap the map to add points, or use the buttons below to load the campus route',
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: Places.openingCamera,
                polylines: _lines(),
                onTap: _addPoint,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _loadCampusRoute,
                  child: const Text('Load Campus Route'),
                ),
                ElevatedButton(onPressed: _clear, child: const Text('Clear')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
