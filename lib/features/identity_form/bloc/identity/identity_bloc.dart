import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../lib.dart';

class IdentityBloc extends Bloc<IdentityEvent, IdentityState> {
  final IdentityRepository repository;
  StreamSubscription<List<IdentityResponse>> _animeFavSubs;

  IdentityBloc({@required this.repository}) : assert(repository != null);

  @override
  IdentityState get initialState => IdentityLoading();

  @override
  Stream<IdentityState> mapEventToState(IdentityEvent event) async* {
    if (event is GetAllIdentity) {
      yield* _mapGetAllIdentityToState(event);
    }
    if (event is AddIdentity) {
      yield* _mapAddIdentityToState(event);
    }
    if (event is IdentityUpdated) {
      yield* _mapIdentityUpdatedToState(event);
    }
  }

  Stream<IdentityState> _mapGetAllIdentityToState(GetAllIdentity event) async* {
    _animeFavSubs =
        repository.getAllIdentity(userId: event.userId).listen((data) {
      add(IdentityUpdated(data: data));
    }, onError: (e) {
      print(e);
    });
  }

  Stream<IdentityState> _mapAddIdentityToState(AddIdentity event) async* {
    await repository.addIdentity(request: event.request);
    yield IdentityLoaded(
        response: (state as IdentityLoaded).response, isAddNew: true);
  }

  Stream<IdentityState> _mapIdentityUpdatedToState(
      IdentityUpdated event) async* {
    yield IdentityLoaded(response: event.data, isAddNew: false);
  }

  @override
  Future<void> close() async {
    _animeFavSubs?.cancel();
    super.close();
  }
}
