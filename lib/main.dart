import 'package:flutter/material.dart';
import 'package:json_bhagavtgita/verses_page.dart';

import 'detailspage.dart';
import 'homepage.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        'VersesPage' : (context) => VersesPage(),
        'DetailPage' : (context) => DetailPage(),
      },
    ),
  );
}