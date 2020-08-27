import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib.dart';

class IdentityFormTmp extends StatefulWidget {
  @override
  _IdentityFormTmpState createState() => _IdentityFormTmpState();
}

class _IdentityFormTmpState extends State<IdentityFormTmp> {
  File selectedImage;
  String type = 'KTP';
  String desc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarDefault(
          title: 'Identity Sender',
          withoutBack: true,
        ),
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                AppDimens.verticalSpace20,
                ImagePickerOrg(
                  authState: state,
                  onImageSelected: (value) {
                    setState(() {
                      selectedImage = value;
                    });
                  },
                ),
                AppDimens.verticalSpace20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text20Atm(
                      text: 'Type',
                      textStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    AppDimens.verticalSpace10,
                    DropdownButtonAtm(
                      selected: type,
                      items: ['KTP', 'SIM'],
                      values: ['KTP', 'SIM'],
                      onChanged: (v) {
                        setState(() {
                          type = v;
                        });
                      },
                    ),
                    AppDimens.verticalSpace20,
                    Text20Atm(
                      text: 'Description',
                      textStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    AppDimens.verticalSpace10,
                    TextFieldBorderedAtm(
                      hintText: 'Type the Description...',
                      hintTextStyle: TextStyle(color: colorGrey),
                      maxLines: 4,
                      onChanged: (v) {
                        setState(() {
                          desc = v;
                        });
                      },
                    ),
                    AppDimens.verticalSpace20,
                    SendFormButtonOrg(
                      authState: state,
                      request: IdentityRequest(
                          type: type,
                          description: desc,
                          image: selectedImage,
                          userId: (state as LogedIn).userId,
                          dateUpload: DateTime.now()),
                    )
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
