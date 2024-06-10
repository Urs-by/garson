import 'package:flutter/material.dart';
import 'package:garson/temp_data.dart';

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

class ProductListScreen extends StatefulWidget {

  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> products = productsList;

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
                    Text(product.description,
                        style: const TextStyle(fontSize: 16)),
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
          SizedBox(
              height: 350,
              width: 350,
              child: Image.network(widget.product.imageUrl, fit: BoxFit.cover)),
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
                icon: const Icon(Icons.add),
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
