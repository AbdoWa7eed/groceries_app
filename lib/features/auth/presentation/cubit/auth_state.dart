
part of 'auth_cubit.dart';
abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String message;

  LoginErrorState(this.message);
}