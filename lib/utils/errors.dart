part of 'utils.dart';

final myErrors = Errors.instance;

class Errors {
  Errors._();

  static Errors instance = Errors._();

  String telRequired = "tel.is.required";
  String firstNameRequired = "first.name.required";
  String lastNameRequired = "last.name.required";
  String groupRequired = "group.required";
  String selectFeature = "select.feature";
  String branchRequired = "branch.required";

  String weakPassword = "Weak password";
  String userNotFound = "user.not.found";
  String wrongPassword = "wrong.password";
  String unknownError = "unknown.error";
}
