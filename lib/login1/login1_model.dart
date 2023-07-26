import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldmail widget.
  TextEditingController? textFieldmailController;
  String? Function(BuildContext, String?)? textFieldmailControllerValidator;
  // State field(s) for TextFieldcomtrase widget.
  TextEditingController? textFieldcomtraseController;
  late bool textFieldcomtraseVisibility;
  String? Function(BuildContext, String?)? textFieldcomtraseControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldcomtraseVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldmailController?.dispose();
    textFieldcomtraseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
