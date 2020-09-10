import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/constants.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/screens/restaurant_screen.dart';
import 'package:food_delivery_app/widgets/rating_hearts.dart';

class NearbyRestaurants extends StatelessWidget {
  _buildRestaurants(BuildContext context) {
    List<Widget> restaurantsList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantsList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(
                restaurant: restaurant,
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: kMainBoxDecoration,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: kMainTilesBorderRadius,
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      image: AssetImage(restaurant.imageUrl),
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: kMainContainerMargin,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restaurant.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        RatingHearts(restaurant.rating),
                        SizedBox(height: 4.0),
                        Text(
                          restaurant.address,
                          style: kSecondaryTileText,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '0.5 km away',
                          style: kSecondaryTileText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurantsList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: kMainPadding,
          child: Text(
            'Nearby Restaurants',
            style: kMainTextStyle,
          ),
        ),
        _buildRestaurants(context),
      ],
    );
  }
}
