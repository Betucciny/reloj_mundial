import 'package:flutter/material.dart';
import 'package:reloj_mundial/pages/choose_location.dart';
import 'package:reloj_mundial/pages/home.dart';
import 'package:reloj_mundial/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation(),
  },

));
