import '/components/logo_component/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'open_a_ichatadvisorpage_widget.dart' show OpenAIchatadvisorpageWidget;
import 'package:flutter/material.dart';

class OpenAIchatadvisorpageModel
    extends FlutterFlowModel<OpenAIchatadvisorpageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LogoComponent component.
  late LogoComponentModel logoComponentModel;

  @override
  void initState(BuildContext context) {
    logoComponentModel = createModel(context, () => LogoComponentModel());
  }

  @override
  void dispose() {
    logoComponentModel.dispose();
  }
}
