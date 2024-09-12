import 'package:flutter/material.dart';

class LoginModel {
  late bool passwordCreateVisibility = false;
  LoginModel() {
    emailAddressTextControllerValidator = emailValidator;
    passwordTextControllerValidator = passwordValidator;
    passwordCreateVisibility = false;
    passwordVisibility = false;
  }

  ///  State fields for stateful widgets in this page.
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  String? Function(String?)? emailAddressTextControllerValidator;
  String? Function(String?)? passwordTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
  emailAddressCreateTextControllerValidator;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // A basic email validation pattern
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Return null if the email is valid
  }

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; // Return null if the password is valid
  }


  String? Function(BuildContext, String?)?
  passwordCreateTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  // String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  // TextEditingController? passwordTextController;
  late bool passwordVisibility;
  // String? Function(BuildContext, String?)? passwordTextControllerValidator;

  void initState(BuildContext context) {

    passwordCreateVisibility = false;
    passwordVisibility = false;
  }

  void dispose() {
    tabBarController?.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController.dispose();
  }
}

// import 'package:flutter/material.dart';
//
//
//
// class LoginModel  {
//   ///  State fields for stateful widgets in this page.
//   TextEditingController emailTextController = TextEditingController();
//   TextEditingController passwordTextController = TextEditingController();
//
//   String? Function(String?)? emailAddressTextControllerValidator;
//   String? Function(String?)? passwordTextControllerValidator;
//
//
//
//   String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email cannot be empty';
//     }
//     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Enter a valid email address';
//     }
//     return null;
//   }
//
//   String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password cannot be empty';
//     } else if (value.length < 6) {
//       return 'Password must be at least 6 characters long';
//     }
//     return null;
//   }
// }
//
//   // State field(s) for TabBar widget.
//   TabController? tabBarController;
//   int get tabBarCurrentIndex =>
//       tabBarController != null ? tabBarController!.index : 0;
//
//   // State field(s) for emailAddress_Create widget.
//   FocusNode? emailAddressCreateFocusNode;
//   TextEditingController? emailAddressCreateTextController;
//   String? Function(BuildContext, String?)?
//   emailAddressCreateTextControllerValidator;
//   // State field(s) for password_Create widget.
//   FocusNode? passwordCreateFocusNode;
//   TextEditingController? passwordCreateTextController;
//   late bool passwordCreateVisibility;
//   String? Function(BuildContext, String?)?
//   passwordCreateTextControllerValidator;
//   // State field(s) for emailAddress widget.
//   FocusNode? emailAddressFocusNode;
//   TextEditingController? emailAddressTextController;
//   String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
//
//
//
//   // State field(s) for password widget.
//   FocusNode? passwordFocusNode;
//   TextEditingController? passwordTextController;
//   late bool passwordVisibility;
//   String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password cannot be empty';
//     } else if (value.length < 6) {
//       return 'Password must be at least 6 characters long';
//     }
//     return null; // Return null if the password is valid
//   }
//
//   String? Function(String?)? passwordTextControllerValidator;
//
//
//   LoginModel() {
//     // Initialize fields
//     passwordCreateVisibility = false;
//     passwordVisibility = false;
//     passwordCreateTextController = TextEditingController();
//     passwordCreateFocusNode = FocusNode();
//   }
//   // @override
//   // void initState(BuildContext context) {
//   //   passwordCreateVisibility = false;
//   //   passwordVisibility = false;
//   // }
//
//   void dispose() {
//     tabBarController?.dispose();
//     emailAddressCreateFocusNode?.dispose();
//     emailAddressCreateTextController?.dispose();
//
//     passwordCreateFocusNode?.dispose();
//     passwordCreateTextController?.dispose();
//
//     emailAddressFocusNode?.dispose();
//     emailAddressTextController?.dispose();
//
//     passwordFocusNode?.dispose();
//     passwordTextController?.dispose();
//   }
//
//
// class FlutterFlowModel {
// }