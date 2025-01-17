import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/widget/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              24.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  context.read<OrderEntity>().shippingAddressEntity.name = value;
                },
                  hintText: "الاسم كامل",
                  keyboardInputType: TextInputType.text,),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  context.read<OrderEntity>().shippingAddressEntity.email = value;
                },
                hintText: "البريد الإلكتروني",
                keyboardInputType: TextInputType.text,),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  context.read<OrderEntity>().shippingAddressEntity.address = value;
                },
                  hintText: " العنوان",
                  keyboardInputType: TextInputType.emailAddress,),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  context.read<OrderEntity>().shippingAddressEntity.city = value;
                },
                  hintText: "المدينه ",
                  keyboardInputType: TextInputType.text,),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  context.read<OrderEntity>().shippingAddressEntity.floor = value;
                },
                  hintText: "رقم الطابق , رقم الشقه .. ",
                  keyboardInputType: TextInputType.text,),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  context.read<OrderEntity>().shippingAddressEntity.phone = value;
                },
                  hintText: "رقم الهاتف ",
                  keyboardInputType: TextInputType.phone,),
        
            ],
          ),
        ),
      ),
    );
  }
}
