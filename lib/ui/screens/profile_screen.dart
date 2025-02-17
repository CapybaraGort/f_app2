import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/color_constants.dart';
import 'package:flutter_application_2/ui/components/dropdown_cards.dart';
import 'package:flutter_application_2/ui/screens/redact_user_info_screen.dart';
import 'package:provider/provider.dart';

import '../../user_state.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: _background(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar(context),
          body: SizedBox.expand(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _userInfo(context),
              SizedBox(height: 12),
              _paymentInfo(context),
              _userOrders(context),
              const Spacer(),
              Column(
                children: [
                  customButton(context: context, text: "Оценить приложение", icon: Icons.star),
                  customButton(context: context, text: "Поддержка", icon: Icons.contact_support),
                  customButton(context: context, text: "Политика конфиденциальности", icon: Icons.menu_book),
                ],
              )
            ],
          ))),
    );
  }

  TextButton customButton({required BuildContext context, required String text, required IconData icon}) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      onPressed: () {},
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Row(
          children: [
            SizedBox(width: 8),
            Icon(icon, color: Colors.white, size: 18),
            SizedBox(width: 4),
            Text(text, style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      )
    );
  }

  Widget _userOrders(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _purchaseInfo(
                  context: context,
                  amount: "23",
                  description: "заказа",
                  lineSpacing: 8),
              _purchaseInfo(
                  context: context,
                  amount: "3",
                  description: "избранных\nмагазина",
                  fontHeight: 0.85,
                  lineSpacing: 4)
            ],
          ),
        ),
        SizedBox(height: 8),
        _purchaseInfo(
            context: context,
            amount: "5",
            description: "предзаказов",
            textAlignAmount: TextAlign.center)
      ],
    );
  }

  Widget _purchaseInfo(
      {required BuildContext context,
      required String amount,
      required String description,
      double? fontHeight = 1,
      double? lineSpacing = 1,
      TextAlign? textAlignAmount = TextAlign.end}) {
    return DecoratedBox(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              textAlign: textAlignAmount,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(description,
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(height: fontHeight)),
            SizedBox(height: lineSpacing)
          ],
        ));
  }

  Widget _userInfo(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: 96,
            maxHeight: 144,
            minWidth: 96,
            maxWidth: 144
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.5)),
          child: Icon(Icons.photo_camera, size: 64),
        ),
        SizedBox(height: 12),
        Text("${userState.firstName} ${userState.lastName}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center)
      ],
    );
  }

  Widget _paymentInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text('Способы оплаты',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Row(
              children: [
                Text('Основной способ оплаты |',
                    style: Theme.of(context).textTheme.bodyLarge),
                DropdownCards()
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Container(
              width: 41,
              height: 41,
              decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle),
              child: IconButton(
                color: Colors.white,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RedactUserInfoScreen())
                  );
                },
              )),
        )
      ],
    );
  }

  BoxDecoration _background() {
    return BoxDecoration(
        gradient: LinearGradient(
            colors: getBlueWhiteGradient(),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter));
  }
}
