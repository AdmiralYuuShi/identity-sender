import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class LogedIn extends AuthState {
  final String userId;

  LogedIn({@required this.userId}) : assert(userId != null);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'LogedIn { userId: $userId }';
}

class NotLogedIn extends AuthState {
  @override
  String toString() => 'Not LogedIn';
}
