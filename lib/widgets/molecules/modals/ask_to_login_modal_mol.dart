import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../lib.dart';
import '../../widgets.dart';

class AskToLoginModalMol {
  static Future<void> openModal(BuildContext context) async {
    await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LogedIn) {
                BlocProvider.of<IdentityBloc>(context)
                    .add(GetAllIdentity(userId: state.userId));
                Navigator.of(context).pop();
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return SimpleDialog(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                children: <Widget>[
                  Text20Atm(
                    text: 'You have to login first',
                    textAlign: TextAlign.center,
                  ),
                  AppDimens.verticalSpace20,
                  state is NotLogedIn
                      ? ButtonPrimaryAtm(
                          width: 80,
                          color: colorRedGoogle,
                          text: 'Login with Google',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LoginEvent());
                          },
                        )
                      : ButtonLoadingAtm(
                          color: colorRedGoogle,
                          width: 80,
                        ),
                  AppDimens.verticalSpace8,
                  ButtonFlatAtm(
                    width: 80,
                    text: 'Cancel',
                    fontColor: colorRedHeart,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }),
          );
        });
  }
}
