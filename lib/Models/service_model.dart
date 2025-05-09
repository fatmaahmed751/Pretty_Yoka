class ServiceModel {
  final String name;
  bool isSelected;
  List<ServiceModel>? subServices;

  ServiceModel({
    required this.name,
    this.isSelected = false,
    this.subServices,
  });
}