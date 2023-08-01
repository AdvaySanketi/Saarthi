import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graviton/widgets/saarthi_destination_selection_widget.dart';
import 'package:graviton/widgets/home_app_bar.dart';
import 'package:graviton/widgets/saarthi_home_drawer.dart';
import 'package:graviton/widgets/taxi_setting_confirmed_widget.dart';
import 'package:graviton/widgets/taxi_setting_home_widget.dart';
import 'package:graviton/widgets/taxi_map.dart';

import '../bloc/taxi_booking_bloc.dart';

class SaarthiHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SaarthiHomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<TaxiBookingBloc>(context).add(BackPressedEvent());
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          endDrawer: SaarthiHomeDrawer(),
          body: Stack(
            children: <Widget>[TaxiMap(), HomeAppBar()],
          ),
          bottomSheet: BlocBuilder<TaxiBookingBloc, TaxiBookingState>(
              builder: (BuildContext context, TaxiBookingState state) {
            if (state is TaxiBookingNotInitializedState) {
              return Container();
            }
            if (state is TaxiBookingNotSelectedState) {
              return DestinationSelctionWidget();
            }
            if (state is TaxiBookingConfirmedState) {
              return TaxiSettingConfirmedWidget();
            }
            return TaxiBookingHomeWidget();
          }),
        ),
      ),
    );
  }
}
