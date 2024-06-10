import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'logo_component_model.dart';
export 'logo_component_model.dart';

class LogoComponentWidget extends StatefulWidget {
  const LogoComponentWidget({super.key});

  @override
  State<LogoComponentWidget> createState() => _LogoComponentWidgetState();
}

class _LogoComponentWidgetState extends State<LogoComponentWidget>
    with TickerProviderStateMixin {
  late LogoComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoComponentModel());

    animationsMap.addAll({
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 6.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: const BoxDecoration(),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        onEnter: ((event) async {
          setState(() => _model.mouseRegionHovered = true);
          if (animationsMap['textOnActionTriggerAnimation'] != null) {
            await animationsMap['textOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0);
          }
        }),
        onExit: ((event) async {
          setState(() => _model.mouseRegionHovered = false);
          if (animationsMap['textOnActionTriggerAnimation'] != null) {
            await animationsMap['textOnActionTriggerAnimation']!
                .controller
                .reverse();
          }
        }),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().isDarkMode == true) {
                  setDarkModeSetting(context, ThemeMode.light);
                } else {
                  setDarkModeSetting(context, ThemeMode.dark);
                }

                FFAppState().isDarkMode = !FFAppState().isDarkMode;
                setState(() {});
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/King-Salman-Final-New-logo-08-1.png',
                  width: 169.0,
                  height: 200.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchURL('https://ksiu.edu.eg/');
                  },
                  child: Text(
                    'King Salman International University \nMade with Love By Computer Science Department',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ).animateOnActionTrigger(
                  animationsMap['textOnActionTriggerAnimation']!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
