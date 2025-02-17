
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_button/flutter_gradient_button.dart';

import '../../constants/color_constants.dart';

class PaymentMadeScreen extends StatelessWidget {
  const PaymentMadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: getBlueWhiteGradient(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/done.png'),
              SizedBox(height: 16),
              Text(
                "Оплата произведена успешно\nСпасибо за заказ!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 1.7)
              ),
              const Spacer(),
              GradientButton(
                textStyle: Theme.of(context).textTheme.titleMedium,
                colors: getPurpleWhiteGradient(),
                height: 45,
                width: 300,
                gradientDirection: GradientDirection.leftToRight,
                text: "Вернуться в магазин",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 16)
            ],
          ),
        )

      ),
    );
  }

}