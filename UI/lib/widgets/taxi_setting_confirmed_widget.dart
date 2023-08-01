import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graviton/bloc/taxi_booking_bloc.dart';
import 'package:graviton/models/taxi_booking.dart';
import 'package:graviton/models/taxi_driver.dart';
import 'package:graviton/widgets/taxi_booking_cancellation_dialog.dart';

class TaxiSettingConfirmedWidget extends StatefulWidget {
  @override
  _TaxiSettingConfirmedWidgetState createState() =>
      _TaxiSettingConfirmedWidgetState();
}

class _TaxiSettingConfirmedWidgetState extends State<TaxiSettingConfirmedWidget>
    with TickerProviderStateMixin<TaxiSettingConfirmedWidget> {
  AnimationController animationController;
  Animation animation;
  Saarthi driver;
  TaxiBooking booking;
  @override
  void initState() {
    super.initState();
    booking = (BlocProvider.of<TaxiBookingBloc>(context).state
            as TaxiBookingConfirmedState)
        .booking;
    driver = (BlocProvider.of<TaxiBookingBloc>(context).state
            as TaxiBookingConfirmedState)
        .driver;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: animationController,
    );
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                    child: Container(
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(
                          vertical: 28.0, horizontal: 28.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Meet your Saathi",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        TaxiBookingCancellationDialog());
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )),
                Container(
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                    child: Container(
                      padding: EdgeInsets.all(24.0),
                      color: Colors.white,
                      child: buildDriver(),
                    ),
                  ),
                )
              ]),
        ),
        builder: (context, child) {
          return Container(
            height: 200.0 * animation.value,
            child: child,
          );
        });
  }

  Widget buildDriver() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "${driver.saarthiName}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 4.0,
            ),
          ],
        )),
        SizedBox(
          width: 8.0,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffeeeeee).withOpacity(0.5),
              borderRadius: BorderRadius.circular(12.0)),
          padding: EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[],
          ),
        )
      ],
    );
  }
}
