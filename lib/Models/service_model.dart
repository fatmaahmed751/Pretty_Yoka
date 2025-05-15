class ServiceModel {
  final String name;
  List<ServiceModel>? subServices;
  bool isSelected = false; // Tracks if the main service is selected
  bool isExpanded = false; // Tracks if the sub-services are expanded

  ServiceModel({
    required this.name,
    this.subServices,
    this.isSelected = false,
    this.isExpanded = false,
  });
}