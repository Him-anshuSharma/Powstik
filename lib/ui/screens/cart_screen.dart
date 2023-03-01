import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powstik/ui/screens/checkout_screen.dart';
import 'package:powstik/ui/screens/home_screen.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;
import 'package:provider/provider.dart';

import '../../model/cart_item.dart';
import '../../provider/cart.dart';

class CartScreen extends StatelessWidget {
  static String cartScreen = 'CartScreen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.COLOR_PRIMARY,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:cart.items.length ==0? EmptyCartScreen(): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    'PRODUCT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'PRICE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'QUANTITY',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'SUBTOTAL',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    CartItemWidget(
                      cartItem: cart.items[index], index: index,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'TOTAL:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$${cart.totalAmount}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: theme.COLOR_PRIMARY,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CheckoutScreen.checkoutScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: theme.COLOR_PRIMARY,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'CHECKOUT',
                    style: TextStyle(
                      fontSize: 16,
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


class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final int index;

  CartItemWidget({required this.cartItem, required this.index});

  @override
  Widget build(BuildContext context) {

    var cartProvider = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: ListTile(
        leading: Container(
          width: 80,
          height: 80,
          child: Image.network(cartItem.itemImage, fit: BoxFit.cover),
        ),
        title: Text(cartItem.itemName),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${cartItem.itemPrice.toStringAsFixed(2)}'),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Decrease quantity
                    if (cartItem.itemQty > 1) {
                      cartProvider.removeFromCart(index);
                      Provider.of<Cart>(context, listen: false).notifyListeners();
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(cartItem.itemQty.toString()),
                IconButton(
                  onPressed: () {
                    // Increase quantity
                    cartProvider.addToCart(cartItem);
                    Provider.of<Cart>(context, listen: false).notifyListeners();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Text('\$${(cartItem.itemPrice * cartItem.itemQty).toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

class EmptyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: theme.COLOR_ACCENT,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
              ),
              onPressed: () {
                // navigate to the product list screen
                Navigator.pop(context);
              },
              child: const Text('Browse products'),
            ),
          ],
        ),
      ),
    );
  }
}


