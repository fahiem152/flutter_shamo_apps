import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/wishlist_provider.dart';
import '../theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  const WishlistCard(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        padding: const EdgeInsets.only(
          top: 10,
          left: 12,
          bottom: 14,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.galleries[0].url,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: primaryTextstyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                wishlistProvider.setProduct(product);
              },
              child: Image.asset(
                'assets/Love_blue_Icon.png',
                width: 34,
              ),
            )
          ],
        ),
      ),
    );
  }
}
