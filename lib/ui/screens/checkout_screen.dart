import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;
import '../../provider/cart.dart';

class CheckoutScreen extends StatefulWidget {
  static String checkoutScreen = 'CheckoutScreen';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _discountCode = '';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.COLOR_PRIMARY,
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Container(
            color: theme.COLOR_PRIMARY,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 12, 12, 12),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "basket",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Image.network(item.itemImage),
                      title: Text("${item.itemQty} x ${item.itemName}"),
                      subtitle:
                      Text('\$${item.itemPrice.toStringAsFixed(2)}'),
                    ),
                    const Divider(
                      thickness: 3,
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Discount Code:',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      _discountCode = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a discount code';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Text('Total: \$${cart.totalAmount.toStringAsFixed(2)}'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: theme.COLOR_PRIMARY,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Apply discount code

                // Place order
              }
            },
            child: const Text('Place Order'),
          ),
        ],
      ),
    );
  }
}
