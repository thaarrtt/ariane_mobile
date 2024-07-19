import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopsScreen extends StatelessWidget {
  const ShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Text(
            'Shops',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.75,
            ),
            itemCount: shopItems.length,
            itemBuilder: (context, index) {
              return ShopItemCard(item: shopItems[index]);
            },
          ),
        ],
      ),
    );
  }
}

class ShopItemCard extends StatelessWidget {
  final ShopItem item;

  const ShopItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: SvgPicture.asset(
              item.imageUrl,
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/diamond.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${item.price}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () {
                    // Handle purchase
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 36.h),
                  ),
                  child: const Text('Buy'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShopItem {
  final String name;
  final int price;
  final String imageUrl;

  ShopItem({required this.name, required this.price, required this.imageUrl});
}

// Sample shop items with SVG images
final List<ShopItem> shopItems = [
  ShopItem(
      name: 'Gold Sword', price: 100, imageUrl: 'assets/icons/gold_sword.svg'),
  ShopItem(
      name: 'Dragon Egg', price: 500, imageUrl: 'assets/icons/dragon_egg.svg'),
  ShopItem(
      name: 'Enchanted Armor',
      price: 200,
      imageUrl: 'assets/icons/enchanted_armor.svg'),
  ShopItem(
      name: 'Phoenix Feather',
      price: 150,
      imageUrl: 'assets/icons/phoenix_feather.svg'),
  ShopItem(name: 'Eye Mask', price: 75, imageUrl: 'assets/icons/eye_mask.svg'),
];
