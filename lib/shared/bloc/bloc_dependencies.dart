import 'package:flutter_bloc/flutter_bloc.dart';

import '../../lib.dart';

List<BlocProvider> providers = [
  BlocProvider<IdentityBloc>(
    create: (context) => IdentityBloc(
        repository: IdentityRepository(provider: IdentityProvider())),
  ),
];
