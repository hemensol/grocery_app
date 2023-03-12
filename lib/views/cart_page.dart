import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_state.dart';

// import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // list view of cart
              Expanded(
                child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  if (state is CartInitialState) {
                  return Container();
                } else if (state is CartLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CartFailState) {
                  return Text(state.message);
                } else if (state is CartSuccessState) {
                  return ListView.builder(
                    itemCount: state.Item.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(
                              state.Item[index][2],
                              height: 36,
                            ),
                            title: Text(
                              state.Item[index][0],
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              '\$' + state.Item[index][1],
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () => BlocProvider(
                                create: (context) => CartBloc(),
                                child: Container(),
                              )
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              }),
              ),

               Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: const [
                          // total price
                          Text(
                            '\$2000',
                            // '\$${value.calculateTotal()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
