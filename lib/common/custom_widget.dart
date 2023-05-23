import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

class CustomWidget {
  final Function(dynamic) onChange;
  final dynamic initialValue;
  final dynamic map;
  final String value;
  final String title;



  const CustomWidget({required this.onChange, this.initialValue,this.map,required this.value,required this.title});


  dynamic dropdown() {
    DropdownButtonHideUnderline(
      child: DropdownButton2(
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColor.black,
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          scrollbarAlwaysShow: true,
          scrollbarThickness: 8.0,
          dropdownMaxHeight: 200,
          selectedItemHighlightColor: AppColor.blue,
          itemPadding: EdgeInsets.only(left: 10),
          isDense: true,
          items: map((item) {
            return DropdownMenuItem(
              value: item.value,
              child: Text(item.title),
            );
          }).toList(),
          onChanged: (v) => onChange(v),
          value: initialValue,
      ),
    );
  }
}