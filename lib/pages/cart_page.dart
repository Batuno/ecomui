// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecomui/models/album.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_items.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (BuildContext context, int index) {
                  //get individual album
                  Album individualAlbum = value.getUserCart()[index];
                  //return the cart item
                  return CartItem(
                    album: individualAlbum,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
