import 'dart:convert';
import 'dart:io';

import 'package:Pretty/core/Language/locales.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/service_model.dart';
import '../../Models/user_model.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/strings.dart';
import '../../generated/assets.dart';

class ServiceProviderEditServiceController extends ControllerMVC {
  // singleton
  factory ServiceProviderEditServiceController() {
    _this ??= ServiceProviderEditServiceController._();
    return _this!;
  }

  static ServiceProviderEditServiceController? _this;

  ServiceProviderEditServiceController._();

  bool loading = false,
      autoValidate = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  int selectedJobIndex = -1;

  void setSelectedJob(int index) {
    // Reset all expansion states first
    for (var service in allMainService) {
      service.isSelected = false;
      service.isExpanded = false;
    }

    // If clicking the same item that's already selected, deselect it
    if (selectedJobIndex == index) {
      mainServices.clear();
      selectedJobIndex = -1;
      notifyListeners();
      return;
    }

    // Set new selection
    selectedJobIndex = index;
    allMainService[index].isSelected = true;
    allMainService[index].isExpanded = true;

    mainServices.clear();// Add this line

    // Handle each service type
    switch (allMainService[index].name) {
      case "Beauty Specialist":
        mainServices.addAll([
          ServiceModel(
            name: "Hair services",
            subServices: [
              ServiceModel(name: "Haircuts & trims"),
              ServiceModel(name: "Wedding hair styling"),
              ServiceModel(name: "Hair coloring & highlights"),
              ServiceModel(name: "Hair treatments"),
              ServiceModel(name: "Hair extensions & weaving"),
              ServiceModel(name: "Hair style for party or event"),
            ],
          ),
          ServiceModel(
            name: "Nail services",
            subServices: [
              ServiceModel(name: "Manicure"),
              ServiceModel(name: "Pedicure"),
              ServiceModel(name: "Gel & Acrylic Nails"),
              ServiceModel(name: "Nail Art & Design"),
              ServiceModel(name: "Nail Repair & Strengthening"),
            ],
          ),
          ServiceModel(
            name: "Skincare & facial treatments",
            subServices: [
              ServiceModel(name: "Deep Cleansing Facial"),
              ServiceModel(name: "Hydrating & Anti-aging Facial"),
              ServiceModel(name: "Chemical Peels"),
              ServiceModel(name: "Microdermabrasion"),
              ServiceModel(name: "Skin Whitening & Brightening Treatments"),
            ],
          ),
          ServiceModel(
            name: "Makeup services",
            subServices: [
              ServiceModel(name: "Party & Event Makeup"),
              ServiceModel(name: "Bridal Makeup"),
              ServiceModel(name: "Eyebrow Shaping & Tinting"),
              ServiceModel(name: "Eyelash Extensions"),
            ],
          ),
          ServiceModel(
            name: "Body & Spa Treatments",
            subServices: [
              ServiceModel(name: "Massage"),
              ServiceModel(name: "Body Scrubs"),
              ServiceModel(name: "Moroccan Bath"),
              ServiceModel(name: "Turkish Bath"),
              ServiceModel(name: "Waxing"),
            ],
          ),
          // ... other beauty specialist services
        ]);
        break;
      case "Hair Stylist":
        mainServices.add(ServiceModel(
          name: "Hair services",
          subServices: [
            ServiceModel(name: "Haircuts & trims"),
            ServiceModel(name: "Wedding hair styling"),
            ServiceModel(name: "Hair coloring & highlights"),
            ServiceModel(name: "Hair treatments"),
            ServiceModel(name: "Hair extensions & weaving"),
            ServiceModel(name: "Hair style for party or event"),
          ],
        ));
        break;
      case "Makeup Artist":
        mainServices.add(ServiceModel(
          name: "Makeup services",
          subServices: [
            ServiceModel(name: "Party & Event Makeup"),
            ServiceModel(name: "Bridal Makeup"),
            ServiceModel(name: "Eyebrow Shaping & Tinting"),
            ServiceModel(name: "Eyelash Extensions"),
          ],
        ));
        break;

      case "Nail Technician":
        mainServices.add(ServiceModel(
          name: "Nail services",
          subServices: [
            ServiceModel(name: "Manicure"),
            ServiceModel(name: "Pedicure"),
            ServiceModel(name: "Gel & Acrylic Nails"),
            ServiceModel(name: "Nail Art & Design"),
            ServiceModel(name: "Nail Repair & Strengthening"),
          ],
        ));
        break;
      case "Skincare Specialist":
        mainServices.add(ServiceModel(
          name: "Skincare & Facial Treatments",
          subServices: [
            ServiceModel(name: "Deep Cleansing Facial"),
            ServiceModel(name: "Hydrating & Anti-aging Facial"),
            ServiceModel(name: "Chemical Peels"),
            ServiceModel(name: "Microdermabrasion"),
            ServiceModel(name: "Skin Whitening & Brightening Treatments"),
          ],
        ));
        break;
      case "beauty salon":
        mainServices.addAll([
        ServiceModel(
        name: "Hair services",
        subServices: [
        ServiceModel(name: "Haircuts & trims"),
        ServiceModel(name: "Wedding hair styling"),
        ServiceModel(name: "Hair coloring & highlights"),
        ServiceModel(name: "Hair treatments"),
        ServiceModel(name: "Hair extensions & weaving"),
        ServiceModel(name: "Hair style for party or event"),
        ],
        ),
        ServiceModel(
        name: "Nail services",
        subServices: [
        ServiceModel(name: "Manicure"),
    ServiceModel(name: "Pedicure"),
    ServiceModel(name: "Gel & Acrylic Nails"),
    ServiceModel(name: "Nail Art & Design"),
    ServiceModel(name: "Nail Repair & Strengthening"),
    ],
    ),
    ServiceModel(
    name: "Skincare & facial treatments",
    subServices: [
    ServiceModel(name: "Deep Cleansing Facial"),
    ServiceModel(name: "Hydrating & Anti-aging Facial"),
    ServiceModel(name: "Chemical Peels"),
    ServiceModel(name: "Microdermabrasion"),
    ServiceModel(name: "Skin Whitening & Brightening Treatments"),
    ],
    ),
    ServiceModel(
    name: "Makeup services",
    subServices: [
    ServiceModel(name: "Party & Event Makeup"),
    ServiceModel(name: "Bridal Makeup"),
    ServiceModel(name: "Eyebrow Shaping & Tinting"),
    ServiceModel(name: "Eyelash Extensions"),
    ],
    ),
    ServiceModel(
    name: "Body & Spa Treatments",
    subServices: [
    ServiceModel(name: "Massage"),
    ServiceModel(name: "Body Scrubs"),
    ServiceModel(name: "Moroccan Bath"),
    ServiceModel(name: "Turkish Bath"),
    ServiceModel(name: "Waxing"),
    ],
    ),
    // ... other beauty specialist services
    ]);

        break;
      default:
       // mainServices=[];
      // Handle other cases or provide default subservices
        break;
    }

    notifyListeners();
  }

  // void setSelectedJob(int index) {
  //   if (selectedJobIndex == index) {
  //     // If already selected, deselect it
  //     mainServices.clear();
  //     selectedJobIndex = -1;
  //
  //     // Reset expansion state
  //     for (var service in allMainService) {
  //       service.isExpanded = false;
  //     }
  //
  //     notifyListeners();
  //     return;
  //   }
  //
  //   selectedJobIndex = index;
  //
  //   // Clear previous services
  //   mainServices.clear();
  //
  //   final selectedJob = allMainService[index];
  //   selectedJob.isExpanded = true;
  //   if (selectedJob.name == "Beauty Specialist") {
  //     mainServices.addAll([
  //       ServiceModel(name: "Hair services",  subServices: [
  //         ServiceModel(name: "Haircuts & trims"),
  //         ServiceModel(name: "Wedding hair styling"),
  //         ServiceModel(name: "Hair coloring & highlights"),
  //         ServiceModel(name: "Hair treatments"),
  //         ServiceModel(name: "Hair extensions & weaving"),
  //         ServiceModel(name: "Hair style for party or event"),
  //       ],),
  //       ServiceModel(name: "Nail services", subServices: [
  //           ServiceModel(name: "Manicure"),
  //       ServiceModel(name: "Pedicure"),
  //       ServiceModel(name: "Gel & Acrylic Nails"),
  //       ServiceModel(name: "Nail Art & Design"),
  //       ServiceModel(name: "Nail Repair & Strengthening"),
  //     ],),
  //       ServiceModel(name: "Skincare & facial treatments", subServices: [ ServiceModel(name: "Deep Cleansing Facial"),
  //         ServiceModel(name: "Hydrating & Anti-aging Facial"),
  //         ServiceModel(name: "Chemical Peels"),
  //         ServiceModel(name: "Microdermabrasion"),
  //         ServiceModel(name: "Skin Whitening & Brightening Treatments"),]),
  //       ServiceModel(name: "Makeup services", subServices: [ ServiceModel(name: "Party & Event Makeup"),
  //         ServiceModel(name: "Bridal Makeup"),
  //         ServiceModel(name: "Eyebrow Shaping & Tinting"),
  //         ServiceModel(name: "Eyelash Extensions"),]),
  //       ServiceModel(name: "Body & Spa Treatments", subServices: [ ServiceModel(name: "Massage"),
  //         ServiceModel(name: "Body Scrubs"),
  //         ServiceModel(name: "Moroccan Bath"),
  //         ServiceModel(name: "Turkish Bath"),
  //         ServiceModel(name: "Waxing"),]),
  //     ]);
  //   } else if (selectedJob.name == "Hair Stylist") {
  //     mainServices.add(ServiceModel(
  //       name: "Hair services",
  //       subServices: [
  //         ServiceModel(name: "Haircuts & trims"),
  //       ServiceModel(name: "Wedding hair styling"),
  //       ServiceModel(name: "Hair coloring & highlights"),
  //       ServiceModel(name: "Hair treatments"),
  //       ServiceModel(name: "Hair extensions & weaving"),
  //       ServiceModel(name: "Hair style for party or event"),
  //       ],
  //     ));
  //   }
  //   notifyListeners();
  // }
   List<ServiceModel> mainServices = [

  ];
  final List<ServiceModel> allMainService = [
    ServiceModel(name: "Beauty Specialist"),
    ServiceModel(name: "Hair Stylist"),
    ServiceModel(name: "Makeup Artist"),
    ServiceModel(name: "Nail Technician"),
    ServiceModel(name: "Skincare Specialist"),
    ServiceModel(name: "beauty salon"),
  ];

  void initializeServices(List<ServiceModel> services) {
    mainServices = services;
  }

  void toggleServiceSelection(int index) {
    final service = mainServices[index];
    service.isSelected = !service.isSelected;
    service.isExpanded = service.isSelected;
    notifyListeners();
  }
}

