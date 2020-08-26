import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../lib.dart';

abstract class IdentityState extends Equatable {
  const IdentityState();

  @override
  List<Object> get props => [];
}

class IdentityLoading extends IdentityState {}

class IdentityLoaded extends IdentityState {
  final List<IdentityResponse> response;

  IdentityLoaded({@required this.response}) : assert(response != null);

  @override
  List<Object> get props => [response];
}

class IdentityError extends IdentityState {}
