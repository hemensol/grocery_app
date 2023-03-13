import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_event.dart';
import 'package:grocery_app/bloc/cart/cart_state.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../model/item_model.dart';

class GroceryTile extends StatelessWidget {
  final Item item;
  final String name;
  final num price;
  final String image;

  GroceryTile({
    super.key,
    required this.item,
    required this.name,
    required this.price,
    required this.image,
  });
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
                    BlocProvider.of<CartBloc>(context)
                        .add(AddCartItem(cartItem: item));
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
    });
  }
}
