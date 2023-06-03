import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

///// ios  127.0.0.1
/// android 10.0.2.2

String uri = 'https://sarman-farm-server2.onrender.com';

class GlobalColors {
  static HexColor mainColor = HexColor('#40B984');
  static HexColor textColor = HexColor('#4F4F4F');
}

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(64, 185, 132, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'assets/images/promo1.png',
    'assets/images/promo1.png',
    'assets/images/promo1.png',
    'assets/images/promo1.png',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Poultry',
      'image': 'assets/images/poultry.png',
    },
    {
      'title': 'Fishery',
      'image': 'assets/images/fishery.png',
    },
    {
      'title': 'Vegetables',
      'image': 'assets/images/vegetables.png',
    },
    {
      'title': 'Snails',
      'image': 'assets/images/snails.png',
    },
    {
      'title': 'Grains',
      'image': 'assets/images/grains.png',
    },
    {
      'title': 'Oil',
      'image': 'assets/images/oil.png',
    },
    {
      'title': 'Flour',
      'image': 'assets/images/flour.png',
    },
    {
      'title': 'Meat',
      'image': 'assets/images/meat.png',
    },
    {
      'title': 'Fruits',
      'image': 'assets/images/fruits.png',
    },
    {
      'title': 'Other',
      'image': 'assets/images/other.png',
    },
  ];
}
