import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib.dart';

class MyIdentitySentOrg extends StatelessWidget {
  final ScrollController scrollController;
  MyIdentitySentOrg({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      if (authState is LogedIn) {
        return BlocBuilder<IdentityBloc, IdentityState>(
            builder: (context, state) {
          if (state is IdentityLoaded) {
            List<IdentityResponse> data = state.response;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text20Atm(
                  text: 'Identity Sent',
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                AppDimens.verticalSpace20,
                Container(
                  child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        DateTime dateUpload =
                            DateTime.fromMillisecondsSinceEpoch(
                                data[index].dateUpload);
                        return Container(
                          decoration: borderRadiusAllDecoration(),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageNetworkAtm(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                width: 140,
                                height: 100,
                                imageUrl: data[index].imageUrl,
                                fit: BoxFit.fill,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text16Atm(
                                        text: '${data[index].type}',
                                      ),
                                      AppDimens.verticalSpace4,
                                      Text16Atm(
                                        text:
                                            getStringFormattedDateMonthNameTime(
                                                dateUpload),
                                      ),
                                      AppDimens.verticalSpace4,
                                      Text16Atm(
                                        text: '${data[index].description}',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          }
          return Container();
        });
      }
      return Container();
    });
  }
}
