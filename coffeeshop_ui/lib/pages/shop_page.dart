

import 'package:coffeeshop_ui/components/coffee_tile.dart';
import 'package:coffeeshop_ui/models/coffee.dart';
import 'package:coffeeshop_ui/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add to cart
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    //notification of adding into cart
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Successfully added to the cart"),
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //Heading Message
            const Text(              
            "How would you like your coffee?", 
            style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 25,),


            //List of coffee items
            Expanded(
              child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {

              Coffee eachCoffee = value.coffeeShop[index];

              return CoffeeTile(              
                coffee: eachCoffee,
                icon: Icon(Icons.add),
                onPressed: () => addToCart(eachCoffee),
                );
            },
            ),
            )
          ],
        ),
      ),
    ),
    );
  }
}