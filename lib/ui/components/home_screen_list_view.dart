import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;
import '../../model/cart_item.dart';
import '../../model/item_category.dart';
import '../../provider/cart.dart';

class HomeScreenListView {
  static Widget buildListView(List<ItemCategory> categories) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final ItemCategory category = categories[index];
          return Container(
            margin:const EdgeInsets.symmetric(vertical: 2) ,
            color: Colors.black12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category.itemNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String itemName = category.itemNames[index];
                      final String imageUrl = category.imageUrls[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Text(itemName),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                              ),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                                final cart = context.read<Cart>();
                                cart.addToCart(CartItem(
                                  itemName: itemName,
                                  itemImage: imageUrl,
                                  itemPrice: 10.0, // set the price here
                                  itemQty: 1,
                                ));
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
