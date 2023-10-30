// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecomui/components/album_tile.dart';
import 'package:ecomui/models/album.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart
  void addAlbumToCart(Album album) {
    Provider.of<Cart>(context, listen: false).addItemToCart(album);

    //alert the user that album successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfuly added"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //seach bar
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(color: Colors.grey)),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),
          //message
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "New hair, new tee, new jeans, do you see?",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot picks 🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Album album = value.getAlbumList()[index];

                return AlbumTile(
                  onTap: () => addAlbumToCart(album),
                  album: album,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
