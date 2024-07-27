import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groceries_app/features/location/presentation/cubit/location_cubit.dart';
import 'package:groceries_app/features/location/presentation/widgets/location_confirmation_dialog.dart';
import 'package:groceries_app/features/location/presentation/widgets/search_bar.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  Marker? _marker;
  LatLng? latLng;
  late final GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is GetPositionSuccess) {
          _setLatLng(state.position.latitude, state.position.longitude);
        }

        if (state is GetPlaceDetailsSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _setMarker(state);
              _setLatLng(state.entity.location.latitude,
                  state.entity.location.longitude);
            });
          });
        }

        return Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              onMapCreated: (controller) => _mapController = controller,
              markers: _marker == null ? {} : {_marker!},
              initialCameraPosition: CameraPosition(target: latLng!, zoom: 16),
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              myLocationEnabled: false,
            ),
            const SearchBarWidget(),
          ],
        );
      },
    );
  }

  void _setMarker(GetPlaceDetailsSuccess state) {
    _marker = Marker(
      markerId: const MarkerId('1'),
      onTap: () {
        _showConfirmationDialog();
      },
      position: LatLng(
          state.entity.location.latitude, state.entity.location.longitude),
      infoWindow: InfoWindow(
        title: state.entity.address.split(',').first,
      ),
    );
  }

  void _setLatLng(double latitude, double longitude) {
    latLng = LatLng(latitude, longitude);
    _animateToPosition();
  }

  void _animateToPosition() async {
    await _mapController
        .animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng!, zoom: 16)))
        .then((value) {
      _showConfirmationDialog();
    });
  }

  _showConfirmationDialog() {
    final cubit = context.read<LocationCubit>();
    if (!cubit.isConfirmationDialogShown) {
      cubit.confirmationDialogShown = true;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => BlocProvider.value(
                value: cubit,
                child: const LocationConfirmationDialog(),
              ));
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
