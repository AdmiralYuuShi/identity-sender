import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib.dart';

class SendFormButtonOrg extends StatelessWidget {
  final IdentityRequest request;
  final AuthState authState;
  SendFormButtonOrg({Key key, this.request, this.authState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ButtonPrimaryAtm(
        width: 200,
        text: 'Send',
        onPressed: () {
          if (authState is LogedIn) {
            if (request.description.length >= 1 && request.image != null) {
              BlocProvider.of<IdentityBloc>(context)
                  .add(AddIdentity(request: request));
            } else {
              print('Not Filled');
            }
          } else {
            AskToLoginModalMol.openModal(context);
          }
        },
      ),
    );
  }
}
