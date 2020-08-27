import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../lib.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({@required this.repository}) : assert(repository != null);

  @override
  AuthState get initialState => NotLogedIn();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield* _mapLoginEventToState(event);
    }
    if (event is LogoutEvent) {
      yield* _mapLogoutEventToState(event);
    }
    if (event is GetUserEvent) {
      yield* _mapGetUserEventToState(event);
    }
  }

  Stream<AuthState> _mapLoginEventToState(LoginEvent event) async* {
    yield AuthLoading();
    await repository.googleSignIn();
    bool isLogedIn = await repository.isLogedIn();
    if (isLogedIn) {
      String userId = await repository.getUserId();
      yield LogedIn(userId: userId);
    } else {
      yield NotLogedIn();
    }
  }

  Stream<AuthState> _mapLogoutEventToState(LogoutEvent event) async* {
    yield AuthLoading();
    await repository.googleSignOut();
    bool isLogedIn = await repository.isLogedIn();
    if (isLogedIn) {
      String userId = await repository.getUserId();
      yield LogedIn(userId: userId);
    } else {
      yield NotLogedIn();
    }
  }

  Stream<AuthState> _mapGetUserEventToState(GetUserEvent event) async* {
    bool isLogedIn = await repository.isLogedIn();
    if (isLogedIn) {
      String userId = await repository.getUserId();
      yield LogedIn(userId: userId);
    } else {
      yield NotLogedIn();
    }
  }
}
