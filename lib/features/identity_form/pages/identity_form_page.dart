import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib.dart';

class IdentityFormPage extends StatefulWidget {
  @override
  _IdentityFormPageState createState() => _IdentityFormPageState();
}

class _IdentityFormPageState extends State<IdentityFormPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IdentityBloc>(context).add(GetAllIdentity());
  }

  @override
  Widget build(BuildContext context) {
    return ImagePickerTmp();
  }
}
