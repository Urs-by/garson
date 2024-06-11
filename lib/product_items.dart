import 'package:flutter/material.dart';
import 'package:garson/temp_data.dart';

class Product {
  final String imageUrl;
  final String itemName;
  final String price;
  final String description;
  final String weight;
  final String additionalInfo;

  Product(
      {required this.imageUrl,
      required this.itemName,
      required this.price,
      required this.description,
      required this.weight,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SizedBox(
                width: 115,
                height: 115,

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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Wrap(
                            children: [
                              Text(product.itemName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Wrap(
                            children: [
                              Text(
                                product.weight,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(product.description,
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Text(product.price,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
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
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      widget.product.itemName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Text(widget.product.itemName,
          // style: const TextStyle(
          //     fontSize: 16, fontWeight: FontWeight.bold)),
          // const SizedBox(height: 20,),
          SizedBox(
              height: 300,
              width: 300,
              child: Image.network(widget.product.imageUrl, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text(widget.product.weight,
                //     style: const TextStyle(fontSize: 18)),
                // const SizedBox(height: 5),
                Text(widget.product.description,
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 5),
                Text(widget.product.additionalInfo,
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
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
