import 'package:flutter/material.dart';
import 'package:google_map_app/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoWindowsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<InfoWindowsScreen> createState() => _InfoWindowsScreenState();
}

class _InfoWindowsScreenState extends State<InfoWindowsScreen> {
  String _status = 'Tap a pin, then tap the white bubble';

  String? _snippetFor(Landmark landmark) {}

  Set<Marker> _markers() {
    return {
      for (final Landmark place in Places.all)
        Marker(
          markerId: MarkerId(place.id),
          position: place.position,
          infoWindow: InfoWindow(
            title: place.name,
            snippet: place.fact,
            onTap: () {
              setState(() => _status = 'Bubble tapped : ${place.name}');
            },
          ),
          onTap: () {
            setState(() => _status = 'Pin tapped : ${place.name}');
          },
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Part 1- Info Windows')),
      body: Column(
        children: [
          const Center(child: Text('Info Windows Screen')),
          Text(_status, style: TextStyle(fontSize: 13)),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: Places.openingCamera,
              zoomControlsEnabled: true,
              // markers: {
              //   Marker(
              //     markerId: MarkerId('test_marker'),
              //     position: Places.all.first.position,
              //     infoWindow: InfoWindow(
              //       title: Places.all.first.name,
              //       snippet: Places.all.first.fact,
              //       onTap: () {
              //         setState(
              //           () => _status =
              //               'Bubble tapped : ${Places.all.first.name}',
              //         );
              //       },
              //     ),
              //     onTap: () {
              //       setState(
              //         () => _status = 'Pin tapped : ${Places.all.first.name}',
              //       );
              //     },
              //   ),
              // },

              markers: _markers(),
            ),
          ),
        ],
      ),
    );
  }
}
