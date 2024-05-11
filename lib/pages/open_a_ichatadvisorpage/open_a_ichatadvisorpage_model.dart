import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/components/logo_component/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'open_a_ichatadvisorpage_widget.dart' show OpenAIchatadvisorpageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
