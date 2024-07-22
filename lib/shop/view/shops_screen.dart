import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopsScreen extends StatelessWidget {
  const ShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shops',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.8,
            ),
            itemCount: shopItems.length,
            itemBuilder: (context, index) {
              return ShopItemCard(item: shopItems[index]);
            },
          ),
        ),
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  item.imageUrl,
                  height: 60.h,
                  width: 60.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/diamond.svg',
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      '${item.price}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                ElevatedButton(
                  onPressed: () {
                    // Handle purchase
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 24.h),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Text('Buy', style: TextStyle(fontSize: 10.sp)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// The ShopItem class and shopItems list remain the same

// The ShopItem class and shopItems list remain the same
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
