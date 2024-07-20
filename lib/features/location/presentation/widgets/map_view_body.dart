import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groceries_app/core/widgets/confirmation_dialog_widget.dart';
import 'package:groceries_app/features/location/presentation/widgets/search_bar.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  Marker? _marker;

  @override
  void initState() {
    super.initState();
    _marker = Marker(
      markerId: const MarkerId('1'),
      onTap: () {},
      position: const LatLng(30.1231339, 31.1318117),
      infoWindow: const InfoWindow(
        title: 'My Location',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapToolbarEnabled: false,
          markers: _marker == null
              ? {}
              : {
                  Marker(
                    markerId: const MarkerId('1'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmationDialogWidget(
                            child:
                                const Text("Do you want to add this location?"),
                            onPressed: () {
                              context.pop();
                            },
                          );
                        },
                      );
                    },
                    position: _marker!.position,
                  ),
                },
          initialCameraPosition: const CameraPosition(
              target: LatLng(30.1231339, 31.1318117), zoom: 16),
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          onMapCreated: (controller) {},
        ),
        const SearchBarWidget(),
      ],
    );
  }
}
