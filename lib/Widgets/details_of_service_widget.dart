import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/format_date_helper.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../generated/assets.dart';
import '../Modules/ServiceProviderBookings/service_provider_bookings_controller.dart';

class DetailsOfService extends StatefulWidget {
  const DetailsOfService({
    super.key,
  });

  @override
 createState() => _DetailsOfServiceState();
}

class _DetailsOfServiceState extends StateMVC<DetailsOfService> {
  _DetailsOfServiceState()   : super(ServiceProviderBookingsController()) {
  con = ServiceProviderBookingsController();
  }

  late ServiceProviderBookingsController con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 313.w,
            height:220.h,
            decoration: BoxDecoration(
              color: ThemeClass.of(context).background,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24.w, vertical: 24.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: (){
                              context.pop();
                            },
                            child: SvgPicture.asset(Assets.imagesCloseIcon)),
                      ],
                    ),
                    Gap(8.h),
                    Text(
                      Strings.requestService.tr,
                      style: TextStyleHelper.of(context)
                          .h_16
                          .copyWith(color: ThemeClass.of(context).mainBlack),
                    ),
                    Gap(4.h),
                    ...con.services.map((service) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w,
                              vertical: 4.h,),
                            child: Icon(Icons.circle, size: 5,
                              color: ThemeClass.of(context).labelColor,),
                          ),
                          Expanded(child: Text(service,
                            style:TextStyleHelper.of(context).b_16.copyWith(
                                color: ThemeClass.of(context).labelColor
                            ) ,)),
                        ],
                      ),
                    )).toList(),

                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
