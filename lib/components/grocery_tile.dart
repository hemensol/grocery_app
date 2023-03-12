import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';

class GroceryTile extends StatelessWidget {
  final String name;
  final num price;
  final String image;

  GroceryTile({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.network(image, height: 110,)
            ),

            Text(
              name,
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            MaterialButton(
              onPressed: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(GetDataButtonPressed());
                },
              color: Colors.green,
              child: Text(
                '\$$price',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
