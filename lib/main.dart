import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../views/home_page.dart';
import 'bloc/cart/cart_bloc.dart';
import 'views/cart_page.dart';
import 'views/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // home: const HomePage(),
        routes: {
          '/': (context) => HomePage(),
          '/cart': (context) => CartPage(),
          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}

