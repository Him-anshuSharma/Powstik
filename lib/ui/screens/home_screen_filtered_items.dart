
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:powstik/model/cart_item.dart';
import 'package:powstik/provider/filtered_products.dart';
import 'package:provider/provider.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;

import '../../provider/cart.dart';


class FilteredProductListScreen extends StatelessWidget {
  static String filteredProductListScreen = 'FilteredProductListScreen';

  const FilteredProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final filterProvider = Provider.of<FilteredProducts>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.COLOR_PRIMARY,
        title: const Text('Product List'),
      ),
      body: filterProvider.products.isEmpty? Center(
        child: Column(
          children: const [
            Icon(Icons.shopping_cart, size: 64),
            Text('No such item available'),
          ],
        ),
      )
          : Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                child: Text("Products from your search", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              ),
              Divider(height: 2,thickness: 2,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
        itemCount: filterProvider.products.length,
        itemBuilder: (BuildContext context, int index) {
                final product = filterProvider.products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('${product.category} - \$${product.price.toStringAsFixed(2)}',style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.normal)),
                  trailing: ElevatedButton(
                    onPressed: () {
                      cart.addToCart(CartItem(itemName: product.name, itemImage: product.imageUrl, itemPrice: product.price, itemQty: 1));
                      Fluttertoast.showToast(msg: "Item Added to cart");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: theme.COLOR_PRIMARY,
                      onPrimary: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
              ),
            ],
          )
    );
  }
}
