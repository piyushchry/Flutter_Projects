import 'package:coffeeshop_ui/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{

  //coffee for sale 
  final List<Coffee> _shop = [
    //black coffee
    Coffee(name: 'Long Black', price: "100", imagePath: "lib/Images/blackcoffee.png",),

    //latte
    Coffee(name: 'Latte', price: "100", imagePath: "lib/Images/latte.png",),

    //expresso
    Coffee(name: 'Expresso', price: "100", imagePath: "lib/Images/expresso.png",),

    //iced coffee
    Coffee(name: 'Iced Coffee', price: "100", imagePath: "lib/Images/icedcoffee.png",),
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}