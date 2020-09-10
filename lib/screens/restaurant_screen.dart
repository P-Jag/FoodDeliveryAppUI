import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/constants.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_hearts.dart';
import 'package:food_delivery_app/widgets/restaurant_button.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: kMainTilesBorderRadius,
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: kMainTilesBorderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: <Widget>[
                Text(
                  menuItem.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.add,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 222.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                        size: 36.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      '0.5 km away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                RatingHearts(widget.restaurant.rating),
                SizedBox(height: 6.0),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RestaurantButton(
                btnText: 'Reviews',
              ),
              RestaurantButton(
                btnText: 'Contact',
              )
            ],
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text('Menu', style: kMainTextStyle),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
