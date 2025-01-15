import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Map<String, dynamic> menuData = {
    "pizza": [
      {
        "id": 0,
        "name": "Margherita",
        "description": "A classic pizza with tomato sauce and mozzarella",
        "ingredients": ["Tomato sauce", "Mozzarella"],
        "spicy": false,
        "vegetarian": true,
        "price": 17.0,
        "image": "https://i.imgur.com/8B8YLOo.jpg"
      },
      {
        "id": 1,
        "name": "Pepperoni",
        "description": "A classic pizza topped with pepperoni",
        "ingredients": ["Tomato sauce", "Mozzarella", "Double pepperoni"],
        "spicy": false,
        "vegetarian": false,
        "price": 20.0,
        "image": "https://i.imgur.com/OHHctnf.jpg"
      },
      {
        "id": 2,
        "name": "Rome",
        "description": "A classic pizza with tomato sauce,mozzarella,ham,mushrooms and beef cubes",
        "ingredients": [
          "Tomato sauce",
          "Mozzarella",
          "Ham",
          "Mushrooms",
          "Beef cubes"
        ],
        "spicy": false,
        "vegetarian": false,
        "price": 25.75,
        "image": "https://i.imgur.com/3ZTwCfz.png"
      }
    ],
    "dessert": [
      {
        "id": 0,
        "name": "Brownie",
        "description": "A delicious cake with chocolate and hazelnuts",
        "ingredients": ["Chocolate", "Hazelnuts"],
        "spicy": false,
        "vegetarian": false,
        "price": 15,
        "image": "https://i.imgur.com/7WbfaDN.png"
      },
      {
        "id": 1,
        "name": "Chocolate Tortilla",
        "description": "Tortilla filled with chocolate cream",
        "ingredients": ["Tortilla", "Chocolate"],
        "spicy": false,
        "vegetarian": false,
        "price": 12,
        "image": "https://i.imgur.com/Mgsc3IZ.png"
      },
      {
        "id": 2,
        "name": "Apple Pie",
        "description": "Hot pie with apple and cinnamon",
        "ingredients": ["Apple", "Cinnamon"],
        "spicy": false,
        "vegetarian": true,
        "price": 15,
        "image": "https://i.imgur.com/OWIVhWX.png"
      },
      {
        "id": 3,
        "name": "Cheesecake",
        "description": "Cheesecake with berries topping",
        "ingredients": ["Berries"],
        "spicy": false,
        "vegetarian": false,
        "price": 15,
        "image": "https://i.imgur.com/AsldA7x.png"
      }
    ]
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Image.asset(
            'images/burger-with-melted-cheese.jpg',
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Menu Categories',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(12),
                    children: [
                      CategoryCard(
                        categoryName: "Pizzas",
                        items: menuData["pizza"],
                      ),
                      CategoryCard(
                        categoryName: "Desserts",
                        items: menuData["dessert"],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  class CategoryCard extends StatelessWidget {
  final String categoryName;
  final List items;

  CategoryCard({required this.categoryName, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(categoryName, style: TextStyle(fontSize: 20)),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuItemsScreen(
                categoryName: categoryName,
                items: items,
              ),
            ),
          );
        },
      ),
    );
  }
}

class MenuItemsScreen extends StatelessWidget {
  final String categoryName;
  final List items;

  MenuItemsScreen({required this.categoryName, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.orange,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image section
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9.0),
                    child: Image.network(
                      item['image'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Text section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(item['description'],style: TextStyle(
                            fontSize: 14),),
                        SizedBox(height: 5),
                        Text("Ingredients: ${item['ingredients'].join(', ')}"
                          ,style: TextStyle(
                              fontSize: 12),),
                        SizedBox(height: 5),
                        Text("Vegetarian: ${item['vegetarian']
                            ? 'Yes'
                            : 'No'}",
                          style: TextStyle(
                              fontSize: 12,),),
                        SizedBox(height: 5),
                        Text("Spicy: ${item['spicy'] ? 'Yes' : 'No'}",
                          style: TextStyle(
                              fontSize: 12),),
                        SizedBox(height: 5),
                        Text("\$${item['price']}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}