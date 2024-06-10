import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/components/logo_component/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'open_a_ichatadvisorpage_model.dart';
export 'open_a_ichatadvisorpage_model.dart';

class OpenAIchatadvisorpageWidget extends StatefulWidget {
  const OpenAIchatadvisorpageWidget({super.key});

  @override
  State<OpenAIchatadvisorpageWidget> createState() =>
      _OpenAIchatadvisorpageWidgetState();
}

class _OpenAIchatadvisorpageWidgetState
    extends State<OpenAIchatadvisorpageWidget> {
  late OpenAIchatadvisorpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenAIchatadvisorpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(
        context,
        FFAppState().isDarkMode ? ThemeMode.dark : ThemeMode.light,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 16.0),
          child: FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: const AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: const SizedBox(
                      height: 680.0,
                      width: 360.0,
                      child: AiChatComponentWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.question_answer_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'KSIU Acadmic Advisor Assistant',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Lato',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                    child: AutoSizeText(
                      'Academic Advisor AI Assistant, your place to ask any questions related to your program and relative to King Salman International University.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.6,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.logoComponentModel,
                updateCallback: () => setState(() {}),
                child: const LogoComponentWidget(),
              ),
            ),
          ]
              .divide(const SizedBox(height: 24.0))
              .addToStart(const SizedBox(height: 32.0))
              .addToEnd(const SizedBox(height: 32.0)),
        ),
      ),
    );
  }
}
