import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graviton/bloc/taxi_booking_bloc.dart';

import 'package:graviton/models/taxi_booking.dart';
import 'package:graviton/models/taxi_driver.dart';
import 'package:graviton/widgets/rounded_button.dart';
import 'package:graviton/widgets/taxi_booking_cancellation_dialog.dart';

class TaxiSettingNotConfirmedWidget extends StatefulWidget {
  @override
  _TaxiSettingNotConfirmedWidgetState createState() =>
      _TaxiSettingNotConfirmedWidgetState();
}

class _TaxiSettingNotConfirmedWidgetState
    extends State<TaxiSettingNotConfirmedWidget> {
  TaxiBooking booking;
  Saarthi driver;

  @override
  void initState() {
    super.initState();
    booking = (BlocProvider.of<TaxiBookingBloc>(context).state
            as TaxiNotConfirmedState)
        .booking;
    driver = (BlocProvider.of<TaxiBookingBloc>(context).state
            as TaxiNotConfirmedState)
        .driver;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildDriver(),
                SizedBox(
                  height: 12.0,
                ),
                buildPriceDetails(),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 22.0,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Expanded(
                        child: Text(
                      "Change Pickup Location",
                      style: Theme.of(context).textTheme.headlineSmall,
                    )),
                    Text(
                      "Edit",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              RoundedButton(
                onTap: () {},
                iconData: Icons.call,
              ),
              SizedBox(
                width: 24.0,
              ),
              Expanded(
                flex: 2,
                child: RoundedButton(
                  text: "Cancel Booking",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => TaxiBookingCancellationDialog());
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
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
            Text(
              "${driver.taxiDetails}",
              style: Theme.of(context).textTheme.titleSmall,
            )
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
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20.0,
              ),
              Text(
                "${driver.saarthiRating}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildPriceDetails() {
    return Column(
      children: <Widget>[
        Divider(),
        SizedBox(
          height: 14.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildIconText("21 km", Icons.directions),
            buildIconText("1-3", Icons.person_outline),
            buildIconText("₹150", Icons.monetization_on),
          ],
        ),
        SizedBox(
          height: 14.0,
        ),
        Divider()
      ],
    );
  }

  Widget buildIconText(String text, IconData iconData) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          size: 22.0,
          color: Colors.black,
        ),
        Text(
          " $text",
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
