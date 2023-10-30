// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecomui/models/album.dart';
import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  void Function()? onTap;
  Album album;
  AlbumTile({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //album pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(album.imagePath),
          ),
          //description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              album.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //price + details
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //shoe name
                    Text(
                      album.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    //price
                    Text(
                      album.price,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                //plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
