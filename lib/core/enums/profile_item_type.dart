enum ProfileItemType {
  name,
  phone,
  email,
  about,
  photo,
}

extension ProfileItemTypeExtension on ProfileItemType {
  String get heading {
    switch (this) {
      case ProfileItemType.name:
        return "What's your name?";
      case ProfileItemType.phone:
        return "What's your phone number?";
      case ProfileItemType.email:
        return "What's your email?";
      case ProfileItemType.about:
        return 'What type of passenger are you?';
      case ProfileItemType.photo:
        return 'Upload a photo of yourself';
    }
  }
}
