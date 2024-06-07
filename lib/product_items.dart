import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final String itemName;
  final String price;
  final String description;
  final String? weight;
  final String additionalInfo;

  Product(
      {required this.imageUrl,
      required this.itemName,
      required this.price,
      required this.description,
      this.weight,
      required this.additionalInfo});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      imageUrl:
          'https://st.bork.ru/recipes/vypechka-i-deserty/neapolitanskaya-pizza/2.jpg',
      itemName: 'Пицца "Паперони"',
      price: '18,00 руб',
      description: 'Тесто, пелати, моцарелла, пеперони, дор блю',
      weight: '450 гр',
      additionalInfo: 'Additional information about Dish 1.',
    ),
    Product(
      imageUrl:
          'https://s1.eda.ru/StaticContent/Photos/120131085624/171213000301/p_O.jpg',
      itemName: "Пицца с грушей",
      price: '20.00 руб',
      description: 'Груша, горганзола, соус песто.',
      weight: '460 гр',
      additionalInfo: 'Additional information about Dish 2.',
    ),
    Product(
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5_5AMrUzaYoQKfq1LujfVvVci6Sicz__XChH-cmDw8FF4eHBGyPI2zZbzBaIk42o-6vI&usqp=CAU',
      itemName: "Пицца 'Деревенская'",
      price: '17.00 руб',
      description: 'Тесто, пелати, моцарелла, салями, огурец солёный, лук синий, орегано',
      weight: 'Вес: 500 г.',
      additionalInfo: 'Additional information about Dish 2.',
    ),
    Product(
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5_5AMrUzaYoQKfq1LujfVvVci6Sicz__XChH-cmDw8FF4eHBGyPI2zZbzBaIk42o-6vI&usqp=CAU',
      itemName: "Пицца с грушей",
      price: '20 USD',
      description: 'Груша, горганзола, соус песто.',
      weight: '460 гр',
      additionalInfo: 'Additional information about Dish 2.',
    ),
    Product(
      imageUrl:
      'https://s1.eda.ru/StaticContent/Photos/120131085624/171213000301/p_O.jpg',
      itemName: "Пицца с грушей",
      price: '20 USD',
      description: 'Груша, горганзола, соус песто.',
      weight: '460 гр',
      additionalInfo: 'Additional information about Dish 2.',
    ),
    Product(
      imageUrl:
      'https://s1.eda.ru/StaticContent/Photos/120131085624/171213000301/p_O.jpg',
      itemName: "Пицца с грушей",
      price: '20 USD',
      description: 'Груша, горганзола, соус песто.',
      weight: '460 гр',
      additionalInfo: 'Additional information about Dish 2.',
    ),
    Product(
      imageUrl:
      'https://pizzamarkoni.by/wp-content/uploads/2018/11/Picca-s-grushej-i-gorgonzoloj-foto-4-300x300.jpg',
      itemName: "Пицца с грушей",
      price: '20 USD',
      description: 'Груша, горганзола, соус песто.',
      weight: '460 гр',
      additionalInfo: 'Additional information about Dish 2.',
    ),
    // Add more products here
  ];

   ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Product List'),
      // ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              // MediaQuery.of(context).size.width / 2,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.price,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(product.description, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Column(
        children: [
          Text(widget.product.itemName),
          Image.network(widget.product.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.product.additionalInfo,
                style: const TextStyle(fontSize: 18)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantity > 0) quantity--;
                  });
                },
              ),
              Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
              IconButton(
                icon:const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if (quantity < 99) quantity++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
