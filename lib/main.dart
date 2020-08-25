import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lib.dart';

void main() => runApp(MainApp());

// With BLOC

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   BlocSupervisor.delegate = AppBlocDelegate();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
//     runApp(
//       MultiBlocProvider(
//         child: MainApp(),
//         providers: providers,
//       ),
//     );
//   });
// }
