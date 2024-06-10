import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chat_g_p_t_component/writing_indicator_component/writing_indicator_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_chat_component_widget.dart' show AiChatComponentWidget;
import 'package:flutter/material.dart';

class AiChatComponentModel extends FlutterFlowModel<AiChatComponentWidget> {
  ///  Local state fields for this component.

  bool aiResponding = false;

  String threadId = ' ';

  List<ContentStruct> chatHistory = [];
  void addToChatHistory(ContentStruct item) => chatHistory.add(item);
  void removeFromChatHistory(ContentStruct item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, ContentStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(ContentStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for WritingIndicatorComponent component.
  late WritingIndicatorComponentModel writingIndicatorComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Chat)] action in IconButton widget.
  ApiCallResponse? apiChatResult;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    writingIndicatorComponentModel =
        createModel(context, () => WritingIndicatorComponentModel());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    writingIndicatorComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
