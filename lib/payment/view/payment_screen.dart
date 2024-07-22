import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider for the current diamond balance
final diamondBalanceProvider = StateProvider<int>((ref) => 0);

// Provider for the selected top-up amount
final selectedTopUpProvider = StateProvider<int?>((ref) => null);

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diamondBalance = ref.watch(diamondBalanceProvider);
    final selectedTopUp = ref.watch(selectedTopUpProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Up Diamonds',
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
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/diamond.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '$diamondBalance',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                'Select Amount to Top Up',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: topUpOptions.length,
                  itemBuilder: (context, index) {
                    return TopUpOptionCard(
                      option: topUpOptions[index],
                      isSelected: selectedTopUp == topUpOptions[index].amount,
                      onTap: () {
                        ref.read(selectedTopUpProvider.notifier).state =
                            topUpOptions[index].amount;
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedTopUp != null
                      ? () {
                          // Perform the top-up action
                          ref.read(diamondBalanceProvider.notifier).state +=
                              selectedTopUp;
                          ref.read(selectedTopUpProvider.notifier).state = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Successfully topped up $selectedTopUp diamonds!')),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Top Up',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopUpOptionCard extends StatelessWidget {
  final TopUpOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const TopUpOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/diamond.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 8.w),
                Text(
                  '${option.amount}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              '\$${option.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopUpOption {
  final int amount;
  final double price;

  TopUpOption({required this.amount, required this.price});
}

final List<TopUpOption> topUpOptions = [
  TopUpOption(amount: 100, price: 0.99),
  TopUpOption(amount: 500, price: 4.99),
  TopUpOption(amount: 1000, price: 9.99),
  TopUpOption(amount: 2000, price: 19.99),
  TopUpOption(amount: 5000, price: 49.99),
  TopUpOption(amount: 10000, price: 99.99),
];
