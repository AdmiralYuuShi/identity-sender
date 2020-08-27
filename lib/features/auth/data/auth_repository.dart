import 'package:meta/meta.dart';

import '../../../lib.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository({@required this.provider}) : assert(provider != null);

  Future<bool> isLogedIn() async {
    return await provider.isLogedIn();
  }

  Future<void> googleSignIn() async {
    return await provider.googleSignIn();
  }

  Future<void> googleSignOut() async {
    return await provider.googleSignOut();
  }

  Future<String> getUserId() async {
    return await provider.getUserId();
  }
}
