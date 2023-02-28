import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powstik/constants/constants.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;
import 'package:powstik/ui/screens/cart_screen.dart';

import '../../model/item_category.dart';
import '../components/home_screen_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  static String HomeScreen = 'HomeScreen';
  List<String> options = Constants.options;
  String query = "";
  int selectedIndex = 0;
  bool searchVisible = false;

  @override
  Widget build(BuildContext context) {
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
                : Container(height: 0,),
            searchVisible
                ? const Expanded(
                  child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: 'Search items',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                )
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
            Expanded(
              child: SingleChildScrollView(
                child: HomeScreenListView.buildListView(Constants.categories),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ItemCategory? findItemByName(String itemName) {
    for (var category in Constants.categories) {
      if (category.itemNames.contains(itemName)) {
        return category;
      }
    }
    return null;
  }

}
