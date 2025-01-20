import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {

  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        33.verticalSpace,
        ShippingItem(
          onTap: () {
              selectIndex = 0;
              setState(() {});
              orderEntity.payWithCash = true;
          } ,
          isSelected: selectIndex == 0,
          title: "الدفع عند الاستلام",
          subtitle: "التسليم من المكان",
          price: (orderEntity.cartEntity.calculateTotalPrice() + 30).toString(),
        ),
        16.verticalSpace,
        ShippingItem(
          onTap: () {
              selectIndex = 1;
              setState(() {});
              orderEntity.payWithCash = false;
          },
          isSelected: selectIndex == 1,
          title: "الدفع اونلاين",
          subtitle: "يرجي تحديد طريقه الدفع",
          price: orderEntity.cartEntity.calculateTotalPrice().toString(),
        ),
      ],
    );
  }

  @override
  // to keep the widget alive or to keep state
  bool get wantKeepAlive => true;
}
