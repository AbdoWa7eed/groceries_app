
import 'package:json_annotation/json_annotation.dart';

part 'update_user_address_request.g.dart';

@JsonSerializable(createFactory: false)
class UpdateUserAddressRequest {
  final String address;

  UpdateUserAddressRequest({
    required this.address,
  });


  Map<String, dynamic> toJson() => _$UpdateUserAddressRequestToJson(this);

}
