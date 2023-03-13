import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_state.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../model/item_model.dart';

class CartItems extends StatelessWidget {
  final Item item;
  final String name;
  final num price;
  final String image;

  CartItems({
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
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Image.network(
                image,
                height: 38,
              ),
              title: Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                '\$$price',
                style: const TextStyle(fontSize: 12),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  BlocProvider.of<CartBloc>(context)
                    .add(RemoveCartItem(cartItem: item));
                },
              )
            ),
          ),
    );
    },
  );
  }
}