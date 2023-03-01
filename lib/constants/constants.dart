import '../model/item_category.dart';

class Constants {
  static List<ItemCategory> categories = [
    ItemCategory(
      title: 'Vegetables',
      itemNames: [
        'Potatoes',
        'Tomatoes',
        'Onions',
        'Carrots',
        'Broccoli',
        'Spinach',
      ],
      imageUrls: [

        'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
      ],
    ),
    ItemCategory(
      title: 'Fruits',
      itemNames: [
        'Apples',
        'Oranges',
        'Bananas',
        'Grapes',
        'Pineapples',
        'Mangoes',
      ],
      imageUrls: [

        'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
      ],
    ),
    ItemCategory(
      title: 'Meat',
      itemNames: [
        'Beef',
        'Pork',
        'Chicken',
        'Lamb',
        'Fish',
        'Seafood',
      ],
      imageUrls: [

        'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
      ],
    ),
    ItemCategory(
      title: 'Beverages',
      itemNames: [
        'Coffee',
        'Tea',
        'Juice',
        'Soda',
        'Beer',
        'Wine',
      ],
      imageUrls: [
        'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
            'https://picsum.photos/75',
      ],
    ),
    ItemCategory(title: 'Snacks', itemNames: [
      'Chips',
      'Cookies',
      'Candy',
      'Nuts',
      'Popcorn',
      'Crackers',
    ], imageUrls: [
      'https://picsum.photos/75',
      'https://picsum.photos/75',
      'https://picsum.photos/75',
      'https://picsum.photos/75',
      'https://picsum.photos/75',
      'https://picsum.photos/75',
    ])
  ];
  static List<String> options = [
    'Healthy Snacks',
    'Millets',
    'Super Foods',
    'Plant Proteins',
    'Beverages',
    'Medical Nutrition',
    'Organic Staples',
    'Services',
    'All'
  ];
}
