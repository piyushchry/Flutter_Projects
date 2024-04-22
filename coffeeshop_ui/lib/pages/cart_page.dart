import 'package:coffeeshop_ui/components/coffee_tile.dart';
import 'package:coffeeshop_ui/models/coffee.dart';
import 'package:coffeeshop_ui/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  void payNow() {

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
        children: [
          Text(
          'Your Cart', 
          style: TextStyle(fontSize: 20),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: value.userCart.length,
            itemBuilder: (context, index) {
          //get individual coffee
          Coffee eachCoffee = value.userCart[index];

          //return coffee tile
          return CoffeeTile(coffee: eachCoffee, onPressed: () => removeFromCart(eachCoffee), icon: Icon(Icons.delete),);
        },
        ),
        ),

        GestureDetector(
          onTap: payNow,
          child: Container(
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(12)
            ),
            child: const Center(
              child: Text(
                "Pay Now", 
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
        ],
      ),
      ),
    ),
    );
  }
}