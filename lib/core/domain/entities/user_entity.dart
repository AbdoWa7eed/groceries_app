import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int userId;
  final String username;
  final String email;
  final String? address;
  final String phoneNumber;
  final String imageUrl;
  final String role;

  const UserEntity({
    required this.userId,
    required this.username,
    required this.email,
    this.address,
    required this.phoneNumber,
    required this.imageUrl,
    required this.role,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        address,
        phoneNumber,
        imageUrl,
        role,
      ];
}
