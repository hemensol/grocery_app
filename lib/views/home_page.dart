import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/cart_page.dart';
import '../bloc/cart/cart_bloc.dart';
import '../components/grocery_tile.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_state.dart';
import '../bloc/home/home_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(37, 158, 158, 158),
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: ()  => BlocProvider(
          create: (context) => CartBloc(),
          child: CartPage(),
        ),
        child: const Icon(Icons.shopping_bag),
      ),

      body: Container(
        color: Color.fromARGB(37, 158, 158, 158),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Only the freshest items for you",
                style: GoogleFonts.raleway(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                color: Colors.green,
                thickness: 1.3,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child:  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is HomeInitialState) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                          .add(GetDataButtonPressed());
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                        ),
                      padding: const EdgeInsets.all(14),
                      child: const Text(
                        "Start Browsing",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    ),
                  );
                } else if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeFailState) {
                  return Text(state.message);
                } else if (state is HomeSuccessState) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    physics: const ScrollPhysics(),            
                    itemCount: state.Item.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryTile(
                        name: state.Item[index].name,
                        price: state.Item[index].price,
                        image: state.Item[index].image,
                      );
                    },
                  );
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
    );
  }
}