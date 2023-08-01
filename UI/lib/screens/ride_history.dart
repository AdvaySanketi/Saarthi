import 'package:graviton/app_properties.dart';
import 'package:graviton/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graviton/widgets/staggered_category_card.dart';

class RideHistoryPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<RideHistoryPage> {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Price: ₹10\nStart: Banashankari\nDestination: Ring Road\nYour Saarthi: Advay Sanketi',
      'images/location.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Price: ₹50\nStart: Electronic City\nDestination: Whitefield\nYour Saarthi: Abhijith M S',
      'images/location.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Price: ₹100\nStart: HSR Layout\nDestination: M G Road\nYour Saarthi: Sumeet Pai',
      'images/location.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Price: ₹10\nStart: Banashankari\nDestination: Ring Road\nYour Saarthi: M Sai Nithin',
      'images/location.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Price: ₹10\nStart: Banashankari\nDestination: Ring Road\nYour Saarthi: Advay Sanketi',
      'images/location.png',
    )
  ];

  List<Category> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchResults = categories;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9F9F9),
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                child: Text(
                  'Your Ride History',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: StaggeredCardCard(
                    begin: searchResults[index].begin,
                    end: searchResults[index].end,
                    categoryName: searchResults[index].category,
                    assetPath: searchResults[index].image,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
