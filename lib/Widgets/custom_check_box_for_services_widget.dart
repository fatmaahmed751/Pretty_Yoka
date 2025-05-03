import 'package:flutter/material.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../Utilities/text_style_helper.dart';
class CustomCheckboxTile extends StatefulWidget {
  final String title;
  final bool isChecked;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckboxTile({
    required this.title,
    required this.value,
    required this.onChanged,
    Key? key, required this.isChecked,
  }) : super(key: key);

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile> {
  bool _isChecked = false;
  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged.call(_isChecked);
          //e.isFavourite = newValue!;
        });
      },
      // onTap: () => widget.onChanged(!widget.value),
      child: Padding(
        padding:  EdgeInsetsDirectional.symmetric(vertical: 8.h),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CustomCheckbox(selected: widget.value),
            Gap(8.w),
            Text(
              widget.title,
              style: TextStyleHelper.of(
                  context).b_16.copyWith(
                  color: ThemeClass.of(context).secondaryBlackColor
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _CustomCheckbox extends StatelessWidget {
  final bool selected;

  const _CustomCheckbox({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height:24.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: selected ? ThemeClass.of(context).primaryColor :ThemeClass.of(context).labelColor,
          width: 1,
        ),
        color: selected ?  ThemeClass.of(context).primaryColor : Colors.transparent,
      ),
      child: selected
          ? Icon(
        Icons.check,
        size: 15,
        color: ThemeClass.of(context).background,
      )
          : null,
    );
  }
}