import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/color_constants.dart';
import 'package:flutter_application_2/ui/screens/payment_made_screen.dart';
import 'package:flutter_gradient_button/flutter_gradient_button.dart';

import '../components/cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> getCartItems() {
    return [
      {'id': 1, 'name': "NIKE AIR FORCE 1", 'price': 12399},
      {'id': 2, 'name': "NIKE AIR FORCE 1 HIGH", 'price': 14399},
      {'id': 3, 'name': "NIKE AIR FORCE 1 Jord", 'price': 12399},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = getCartItems();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: getBlueWhiteGradient(),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Корзина',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartCard(
                        name: item['name'],
                        price: item['price'],
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0500FF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2-3 дня',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              'Итого: ${cartItems.fold(0, (int sum, item) => sum + (item['price'] as num).toInt()).toStringAsFixed(0)} Р',
                              style: Theme.of(context).textTheme.bodyLarge
                            ),
                          ],
                        ),
                      ),

                      GradientButton(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        colors: getPurpleWhiteGradient(),
                        height: 45,
                        width: 300,
                        gradientDirection: GradientDirection.leftToRight,
                        text: "Оформить",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentMadeScreen())
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
