import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String name;
  final int price;
  final bool added;
  final VoidCallback onAddToCart;

  const OfferCard({super.key,
    required this.name,
    required this.price,
    required this.added,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: BoxConstraints(
        maxHeight: 250,
        minHeight: 200,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/small_sneakers.png",
              fit: BoxFit.cover,
              width: 160,
              height: 124,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${price.toStringAsFixed(0)} Р',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: !added
                        ? ElevatedButton(
                      onPressed: onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('В корзину', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                    )
                        : ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Перейти в корзину', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
