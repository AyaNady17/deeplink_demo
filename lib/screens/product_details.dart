
// Product Detail Screen
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productDetails = _getProductDetails(productId);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Share link:  scheme://deeplink-demo-site.vercel.app/product/$productId'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/'); // Navigate back to home
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade200, Colors.grey.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 100, color: Colors.grey),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    productDetails['name']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Rating
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 20,
                          );
                        }),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${productDetails['rating']} (${productDetails['reviews']} reviews)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Price
                  Text(
                    productDetails['price']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productDetails['description']!,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Features
                  const Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: (productDetails['features'] as List<String>)
                        .map((feature) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle, 
                                      size: 20, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(feature)),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getProductDetails(String id) {
    final products = {
      '1': {
        'name': 'iPhone 15 Pro',
        'price': '\$999.00',
        'rating': '4.8',
        'reviews': '2.1k',
        'description': 'The iPhone 15 Pro features a titanium design, advanced camera system, and the powerful A17 Pro chip. Experience the ultimate in mobile technology.',
        'features': [
          'A17 Pro chip for lightning-fast performance',
          'Pro camera system with 5x telephoto',
          'Titanium design - strong yet lightweight',
          '6.1-inch Super Retina XDR display',
          'All-day battery life',
        ],
      },
      '2': {
        'name': 'Nike Air Max 270',
        'price': '\$120.00',
        'rating': '4.5',
        'reviews': '856',
        'description': 'The Nike Air Max 270 delivers incredible comfort with its large Air unit in the heel. Perfect for all-day wear and athletic activities.',
        'features': [
          'Large Air unit for maximum comfort',
          'Breathable mesh upper',
          'Durable rubber outsole',
          'Lightweight foam midsole',
          'Modern athletic design',
        ],
      },
      '3': {
        'name': 'MacBook Air M3',
        'price': '\$1,299.00',
        'rating': '4.9',
        'reviews': '1.5k',
        'description': 'The new MacBook Air with M3 chip delivers exceptional performance and all-day battery life in an incredibly thin and light design.',
        'features': [
          'Apple M3 chip with 8-core CPU',
          '13.6-inch Liquid Retina display',
          'Up to 18 hours battery life',
          'MagSafe charging port',
          'Incredibly thin and light design',
        ],
      },
      '4': {
        'name': 'AirPods Pro (2nd Gen)',
        'price': '\$249.00',
        'rating': '4.7',
        'reviews': '3.2k',
        'description': 'AirPods Pro feature active noise cancellation, spatial audio, and a comfortable, secure fit for an immersive listening experience.',
        'features': [
          'Active Noise Cancellation',
          'Spatial Audio with dynamic head tracking',
          'Up to 30 hours total listening time',
          'MagSafe charging case',
          'Sweat and water resistant (IPX4)',
        ],
      },
      '5': {
        'name': 'Samsung Galaxy S24',
        'price': '\$699.00',
        'rating': '4.6',
        'reviews': '1.8k',
        'description': 'Experience the power of AI with the Samsung Galaxy S24. Advanced photography, all-day battery life, and premium design.',
        'features': [
          'Advanced AI photography features',
          '6.2-inch Dynamic AMOLED display',
          'All-day intelligent battery',
          'Durable armor aluminum frame',
          '5G connectivity ready',
        ],
      },
      '6': {
        'name': 'iPad Pro 12.9"',
        'price': '\$1,099.00',
        'rating': '4.8',
        'reviews': '890',
        'description': 'The most advanced iPad Pro ever with M2 chip, ProRes video capture, and the ultimate iPad experience for professionals.',
        'features': [
          'M2 chip for incredible performance',
          '12.9-inch Liquid Retina XDR display',
          'ProRes video capture capability',
          'All-day battery life',
          'Compatible with Apple Pencil',
        ],
      },
    };
    
    return products[id] ?? products['1']!;
  }
}