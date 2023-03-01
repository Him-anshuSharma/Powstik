import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:powstik/constants/constants.dart';
import 'package:powstik/ui/screens/cart_screen.dart';
import 'package:powstik/ui/screens/home_screen_filtered_items.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../provider/filtered_products.dart';
import '../components/home_screen_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //List<Product> filteredProducts = [];
  late var filterProvider;
  final TextEditingController _searchController = TextEditingController();
  static String HomeScreen = 'HomeScreen';
  List<String> options = Constants.options;
  String query = "";
  int selectedIndex = 0;
  bool searchVisible = false;
  bool showFilteredItems = false;

  @override
  Widget build(BuildContext context) {
    filterProvider = Provider.of<FilteredProducts>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.COLOR_PRIMARY,
        title: Row(
          children: [
            !searchVisible
                ? Image.asset(
                    'assets/images/logo.png', // set width to 50
                    height: 25,
                    width: 100,
                  )
                : Container(
                    height: 0,
                  ),
            searchVisible
                ? Expanded(
                    child: TextField(
                    controller: _searchController,
                    onSubmitted: (value) {
                      if (value == '') {
                        Fluttertoast.showToast(msg: "Enter valid query");
                      } else {
                        filterProducts(_searchController.text.toString());
                        setState(() {
                          _searchController.text = '';
                          searchVisible = !searchVisible;
                          Navigator.pushNamed(
                              context,
                              FilteredProductListScreen
                                  .filteredProductListScreen);
                        });
                      }
                    },
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: 'Search items',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ))
                : Container(),
          ],
        ),
        actions: [
          !searchVisible
              ? IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    searchVisible = !searchVisible;
                    setState(() {});
                  },
                )
              : IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    searchVisible = !searchVisible;
                    setState(() {});
                  },
                ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.cartScreen);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options[index];
                  final bool isSelected = index == selectedIndex;
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.COLOR_PRIMARY
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: !isSelected
                                ? Colors.black
                                : theme.COLOR_PRIMARY,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            HomeScreenListView.buildListView(Constants.categories),
          ],
        ),
      ),
    );
  }

  void filterProducts(String query) {
    filterProvider.clearCart();
    for (var category in Constants.categories) {
      if (category.itemNames
          .any((name) => name.toLowerCase().contains(query.toLowerCase()))) {
        int index = category.itemNames.indexWhere(
            (name) => name.toLowerCase().contains(query.toLowerCase()));
        filterProvider.addToCart(Product(
            name: category.itemNames[index],
            category: category.title,
            price: 10,
            imageUrl: category.imageUrls[index]));
      }
    }
  }
}
