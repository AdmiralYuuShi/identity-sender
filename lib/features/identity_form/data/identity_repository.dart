import 'package:meta/meta.dart';

import '../../../lib.dart';

class IdentityRepository {
  final IdentityProvider provider;

  IdentityRepository({@required this.provider}) : assert(provider != null);

  Stream<List<IdentityResponse>> getAllIdentity() {
    return provider.getAllIdentity();
  }

  Future<void> addIdentity({IdentityRequest request}) async {
    return await provider.addIdentity(request: request);
  }
}
