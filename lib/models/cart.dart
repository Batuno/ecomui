import 'package:ecomui/models/album.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of albums for sale
  List<Album> albumShop = [
    Album(
        name: "First ep",
        price: "15,000₩",
        imagePath: "lib/images/1step.png",
        description: "First album of new jeans"),
    Album(
        name: "Get up",
        price: "20,000₩",
        imagePath: "lib/images/getup.png",
        description: "Get up bag version"),
    Album(
        name: "Get up",
        price: "20,000₩",
        imagePath: "lib/images/getup2.png",
        description: "Get up Powerpuff girls version"),
    Album(
        name: "OMG",
        price: "20,000₩",
        imagePath: "lib/images/omghyein.png",
        description: "OMG album hyein edition"),
  ];
  //list of items in user cart
  List<Album> userCart = [];
  //get list of albums for sale
  List<Album> getAlbumList() {
    return albumShop;
  }

  //get cart
  List<Album> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Album album) {
    userCart.add(album);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(Album album) {
    userCart.remove(album);
    notifyListeners();
  }
}
