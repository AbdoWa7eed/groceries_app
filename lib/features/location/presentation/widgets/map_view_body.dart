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
  void initState() {
    super.initState();

    final position = context.read<LocationCubit>().state;
    if (position is GetPositionSuccess) {
      _setLatLng(position.position.latitude, position.position.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is GetPlaceDetailsSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              final entity = state.entity;
              _setMarker(state);
              _setLatLng(entity.location.latitude, entity.location.longitude);
              _animateToPosition(state.entity.address);
            });
          });
        }
      },
      child: Stack(
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
      ),
    );
  }

  void _setMarker(GetPlaceDetailsSuccess state) {
    _marker = Marker(
      markerId: const MarkerId('1'),
      onTap: () {
        _showConfirmationDialog(state.entity.address);
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
  }

  void _animateToPosition(String address) async {
    await _mapController
        .animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng!, zoom: 16)))
        .then((value) {
      _showConfirmationDialog(address);
    });
  }

  _showConfirmationDialog(String address) {
    final cubit = context.read<LocationCubit>();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => BlocProvider.value(
              value: cubit,
              child: LocationConfirmationDialog(address: address),
            ));
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
