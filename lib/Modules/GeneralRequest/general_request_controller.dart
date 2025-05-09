import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/service_model.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';

class GeneralRequestServiceController extends ControllerMVC {
  // singleton
  factory GeneralRequestServiceController() {
    _this ??= GeneralRequestServiceController._();
    return _this!;
  }

  static GeneralRequestServiceController? _this;

  GeneralRequestServiceController._();

  bool loading = false;
  late TextEditingController
  dateController,
      locationController,
      writeAnyThingController;
  int materialServiceSelection = 1;
  int quality = 1;

  @override
  void initState() {
    dateController = TextEditingController();
    locationController = TextEditingController();
    writeAnyThingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    locationController.dispose();
    writeAnyThingController.dispose();
    super.dispose();
  }
  List<ServiceModel> mainServices = [];

  void initializeServices(List<ServiceModel> services) {
    mainServices = services;
  }

  // Toggle selection of a main service
  void toggleServiceSelection(int index) {
    mainServices[index].isSelected = !mainServices[index].isSelected;
    setState(() {});
  }

  // Get selected main services
  List<String> getSelectedMainServices() {
    return mainServices
        .where((service) => service.isSelected)
        .map((service) => service.name)
        .toList();
  }
  List<String> getAllSelectedServices() {
    List<String> selected = [];

    for (var service in mainServices) {
      if (service.isSelected) {
        selected.add(service.name);

        if (service.subServices != null) {
          selected.addAll(
            service.subServices!
                .where((s) => s.isSelected)
                .map((s) => s.name),
          );
        }
      }
    }

    return selected;
  }
  // Get selected sub-services for a specific main service
  List<String> getSelectedSubServices(int mainServiceIndex) {
    if (mainServices[mainServiceIndex].subServices != null) {
      return mainServices[mainServiceIndex].subServices!
          .where((subService) => subService.isSelected)
          .map((subService) => subService.name)
          .toList();
    }
    return [];
  }

  // List<ServiceModel> mainServices = [
  //   ServiceModel(name: Strings.eventMakeUp.tr),
  //   ServiceModel(name: Strings.bridalMakeup.tr),
  //   ServiceModel(name: Strings.eyeBrow.tr),
  // ];
  //
  // void initializeServices(List<String> serviceNames) {
  //   mainServices =
  //       serviceNames.map((name) => ServiceModel(name: name)).toList();
  // }
  //
  // void toggleServiceSelection(int index) {
  //   mainServices[index].isSelected = !mainServices[index].isSelected;
  //   setState(() {});
  // }
  // List<String> getSelectedServices() {
  //   return mainServices
  //       .where((service) => service.isSelected)
  //       .map((service) => service.name)
  //       .toList();
  // }

  Map<String, dynamic> getSelectedServicesForAPI() {
    Map<String, dynamic> payload = {};

    for (var mainService in mainServices) {
      if (mainService.isSelected) {
        List<String> selectedSubServices = [];

        if (mainService.subServices != null) {
          selectedSubServices = mainService.subServices!
              .where((sub) => sub.isSelected)
              .map((sub) => sub.name)
              .toList();
        }

        // You can choose to send as:
        // - Just the list of sub-service names
        // OR
        // - A boolean if no sub-services are selected (like "Hair Services": true)

        if (selectedSubServices.isNotEmpty) {
          payload[mainService.name] = selectedSubServices;
        } else {
          payload[mainService.name] = true; // just the main service was selected
        }
      }
    }

    return payload;
  }




  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ThemeClass.of(context).primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: ThemeClass.of(context).background, // Background color of the calendar
              onSurface: Colors.black, // Text color of the calendar
            ),
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }

  void updateMaterialServiceSelection(int value) {
    materialServiceSelection = value;
    setState(() {});
  }

  // Add this to get the material service selection status
  bool get isMaterialServiceSelected {
    return materialServiceSelection == 1;
  }

  void updateMaterialQuality(int value) {
    quality = value;
    setState(() {});
  }

  // Add this to get the material service selection status
  //for api
  bool get isHighQuality {
    return quality == 1;
  }
}