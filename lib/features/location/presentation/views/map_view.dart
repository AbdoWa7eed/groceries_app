import 'package:flutter/material.dart';
import 'package:groceries_app/features/location/presentation/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MapViewBody());
  }
}
