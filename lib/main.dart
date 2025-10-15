import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lab2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/streetClothes.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                  ),
                  Positioned(
                    left: 24,
                    bottom: 40,
                    child: Text(
                      'Street clothes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Sale Section
              _buildSectionHeader('Sale', 'Super summer sale'),
              const SizedBox(height: 16),
              SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ProductCard(
                      image: 'assets/images/eveningDress.png',
                      badge: '-20%',
                      badgeColor: const Color(0xFFDB3022),
                      rating: 5,
                      reviewCount: 10,
                      brand: 'Dorothy Perkins',
                      name: 'Evening Dress',
                      originalPrice: '15\$',
                      salePrice: '12\$',
                      onTap: () {},
                    ),
                    ProductCard(
                      image: 'assets/images/sportDress.png',
                      badge: '-15%',
                      badgeColor: const Color(0xFFDB3022),
                      rating: 5,
                      reviewCount: 10,
                      brand: 'Sitlly',
                      name: 'Sport Dress',
                      originalPrice: '22\$',
                      salePrice: '19\$',
                      onTap: () {},
                    ),
                    ProductCard(
                      image: 'assets/images/shortDress.png',
                      badge: '-20%',
                      badgeColor: const Color(0xFFDB3022),
                      rating: 5,
                      reviewCount: 10,
                      brand: 'H&M',
                      name: 'Short Dress',
                      originalPrice: '24\$',
                      salePrice: '19\$',
                      onTap: () {

                        //to other page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // New Section
              _buildSectionHeader('New', 'You\'ve never seen it before!'),
              const SizedBox(height: 16),
              SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ProductCard(
                      image: 'assets/images/blouse.png',
                      badge: 'NEW',
                      badgeColor: Colors.black,
                      rating: 0,
                      reviewCount: 0,
                      brand: 'OVS',
                      name: 'Blouse',
                      price: '30\$',
                      onTap: () {},
                    ),
                    ProductCard(
                      image: 'assets/images/T-shirtSailing.png',
                      badge: 'NEW',
                      badgeColor: Colors.black,
                      rating: 0,
                      reviewCount: 0,
                      brand: 'Mango Boy',
                      name: 'T-Shirt Sailing',
                      price: '10\$',
                      onTap: () {},
                    ),
                    ProductCard(
                      image: 'assets/images/Shirt.png',
                      badge: 'NEW',
                      badgeColor: Colors.black,
                      rating: 0,
                      reviewCount: 0,
                      brand: 'Mango Boy',
                      name: 'Shirt',
                      price: '12\$',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Text(
            'View all',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String badge;
  final Color badgeColor;
  final int rating;
  final int reviewCount;
  final String brand;
  final String name;
  final String? originalPrice;
  final String? salePrice;
  final String? price;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.image,
    required this.badge,
    required this.badgeColor,
    required this.rating,
    required this.reviewCount,
    required this.brand,
    required this.name,
    this.originalPrice,
    this.salePrice,
    this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ...List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    size: 14,
                    color: index < rating ? const Color(0xFFFFBA49) : Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '($reviewCount)',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              brand,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            if (salePrice != null)
              Row(
                children: [
                  Text(
                    originalPrice!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    salePrice!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFDB3022),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), //back to main
        ),
        title: const Text(
          'Short dress',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            SizedBox(
              height: 380,
              child: PageView(
                children: [
                  Image.asset(
                    'assets/images/shortDress.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/T-Shirt.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Size and Color Selectors
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown('Size'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDropdown('Black'),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Brand and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'H&M',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Short black dress',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 140),
                      Text(
                        '\$24',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '\$19',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 8),

                  // Rating
                  Row(
                    children: [
                      ...List.generate(
                        5,
                            (index) => Icon(
                          Icons.star,
                          size: 16,
                          color: index < 5 ? const Color(0xFFFFBA49) : Colors.grey[300],
                        ),
                      ),

                      const Text(
                        '(10)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDB3022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Shipping Info & Support
                  Divider(color: Colors.grey[300]),
                  _buildListTile('Shipping info'),
                  Divider(color: Colors.grey[300]),
                  _buildListTile('Support'),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 24),

                  // You can also like this
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'You can also like this',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '12 items',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Similar Products
                  SizedBox(
                    height: 320,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                          image: 'assets/images/eveningDress.png',
                          badge: '-20%',
                          badgeColor: const Color(0xFFDB3022),
                          rating: 5,
                          reviewCount: 10,
                          brand: 'Dorothy Perkins',
                          name: 'Evening Dress',
                          originalPrice: '15\$',
                          salePrice: '12\$',
                          onTap: () {},
                        ),
                        ProductCard(
                          image: 'assets/images/T-shirtSailing.png',
                          badge: 'NEW',
                          badgeColor: Colors.black,
                          rating: 0,
                          reviewCount: 0,
                          brand: 'Mango Boy',
                          name: 'T-Shirt Sailing',
                          price: '10\$',
                          onTap: () {},
                        ),
                        ProductCard(
                          image: 'assets/images/Shirt.png',
                          badge: 'NEW',
                          badgeColor: Colors.black,
                          rating: 0,
                          reviewCount: 0,
                          brand: 'Mango Boy',
                          name: 'Shirt',
                          price: '12\$',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 20),
        ],
      ),
    );
  }

  Widget _buildListTile(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: () {},
    );
  }
}