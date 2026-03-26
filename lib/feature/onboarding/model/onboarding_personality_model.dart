class PersonalityOption {
  final String title;
  final String description;
  final String iconPath;
  final String? subDescription;

  PersonalityOption({
    required this.title,
    required this.description,
    required this.iconPath,
    this.subDescription,
  });
}
