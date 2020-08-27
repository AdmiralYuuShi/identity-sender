import 'package:meta/meta.dart';

import '../../../lib.dart';

class IdentityRepository {
  final IdentityProvider provider;

  IdentityRepository({@required this.provider}) : assert(provider != null);

  Stream<List<IdentityResponse>> getAllIdentity({@required String userId}) {
    return provider.getAllIdentity(userId: userId);
  }

  Future<void> addIdentity({IdentityRequest request}) async {
    return await provider.addIdentity(request: request);
  }
}
