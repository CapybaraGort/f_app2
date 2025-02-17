import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/color_constants.dart';
import 'package:provider/provider.dart';

import '../../user_state.dart';
import '../components/offer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> items = [
    {'id': 1},
    {'id': 2},
    {'id': 3},
  ];

  final List<Map<String, dynamic>> offerItems = [
    {
      'id': 1,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 2,
      'name': "NIKE AIR FORCE 1 HIGH",
      'price': 14399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 3,
      'name': "NIKE AIR FORCE 1 Jord",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 4,
      'name': "NIKE AIR FORCE 1 Low",
      'price': 9399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 5,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 6,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 7,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 8,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 9,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 10,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 11,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 12,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 13,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
    {
      'id': 14,
      'name': "NIKE AIR FORCE 1",
      'price': 12399,
      'added': false,
      'countAdded': 0
    },
  ];

  int currentIndex = 0;

  void goToSlide(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void handleAddToCart(int itemId) {
    setState(() {
      for (var item in offerItems) {
        if (item['id'] == itemId) {
          item['added'] = true;
        }
      }
    });

    final addedItem = offerItems.firstWhere((item) => item['id'] == itemId);
    final cartItems =
        (sessionStorage['cartItems'] ?? []).cast<Map<String, dynamic>>();
    cartItems.add(addedItem);
    sessionStorage['cartItems'] = cartItems;
  }

  Map<String, dynamic> get sessionStorage {
    return {};
  }

  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
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
          Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '${userState.firstName} 👤',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: items.length,
                        onPageChanged: (index) => setState(() => currentIndex = index),
                        itemBuilder: (context, index) {
                          final isActive = index == currentIndex;
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            margin: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: isActive ? 0 : 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/big_sneakers.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            items.length,
                                (index) => GestureDetector(
                              onTap: () => _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: currentIndex == index ? 20 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Colors.white54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Подборка для вас',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.63,
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                          ),
                          itemCount: offerItems.length,
                          itemBuilder: (context, index) {
                            final item = offerItems[index];
                            return OfferCard(
                              name: item['name'],
                              price: item['price'],
                              added: item['added'],
                              onAddToCart: () => handleAddToCart(item['id']),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
