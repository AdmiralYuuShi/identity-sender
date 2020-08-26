import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../lib.dart';

abstract class IdentityEvent extends Equatable {
  const IdentityEvent();
  @override
  List<Object> get props => [];
}

class AddIdentity extends IdentityEvent {
  final IdentityRequest request;

  AddIdentity({@required this.request}) : assert(request != null);

  @override
  List<Object> get props => [request];
}

class GetAllIdentity extends IdentityEvent {}

class IdentityUpdated extends IdentityEvent {
  final List<IdentityResponse> data;

  IdentityUpdated({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}
