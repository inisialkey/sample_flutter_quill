import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController.basic();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quill Editor'),
        ),
        // Quill Editor
        body: Column(
          children: [
            QuillToolbar(
              configurations: const QuillToolbarConfigurations(
                buttonOptions: QuillSimpleToolbarButtonOptions(
                  base: QuillToolbarBaseButtonOptions(
                    iconSize: 20,
                    iconButtonFactor: 1.4,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    QuillToolbarHistoryButton(
                      isUndo: true,
                      controller: controller,
                    ),
                    QuillToolbarHistoryButton(
                      isUndo: false,
                      controller: controller,
                    ),
                    QuillToolbarToggleStyleButton(
                      options: const QuillToolbarToggleStyleButtonOptions(),
                      controller: controller,
                      attribute: Attribute.bold,
                    ),
                    QuillToolbarToggleStyleButton(
                      options: const QuillToolbarToggleStyleButtonOptions(),
                      controller: controller,
                      attribute: Attribute.italic,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.underline,
                    ),
                    QuillToolbarClearFormatButton(
                      controller: controller,
                    ),
                    const VerticalDivider(),
                    QuillToolbarColorButton(
                      controller: controller,
                      isBackground: false,
                    ),
                    QuillToolbarColorButton(
                      controller: controller,
                      isBackground: true,
                    ),
                    const VerticalDivider(),
                    QuillToolbarToggleCheckListButton(
                      controller: controller,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.ol,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.ul,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.inlineCode,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.blockQuote,
                    ),
                    QuillToolbarIndentButton(
                      controller: controller,
                      isIncrease: true,
                    ),
                    QuillToolbarIndentButton(
                      controller: controller,
                      isIncrease: false,
                    ),
                    const VerticalDivider(),
                    QuillToolbarLinkStyleButton(controller: controller),
                  ],
                ),
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: controller,
                  readOnly: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('id'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
