import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widget/custom_app_bar_home.dart';
import 'package:fruits_hub/features/best_selling_fruits/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
          title: 'الأكثر مبيعًا'),
      body: BestSellingViewBody(),
    );
  }
}
