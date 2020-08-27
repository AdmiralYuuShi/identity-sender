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
  final bool isAddNew;

  IdentityLoaded({@required this.response, this.isAddNew})
      : assert(response != null && isAddNew != null);

  @override
  List<Object> get props => [response, isAddNew];
}

class IdentityError extends IdentityState {}
