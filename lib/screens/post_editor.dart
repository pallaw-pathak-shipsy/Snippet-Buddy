import 'package:flutter/material.dart';

import 'package:html_editor_enhanced/html_editor.dart';

class PostEditor extends StatefulWidget {
  const PostEditor({Key? key}) : super(key: key);

  @override
  State<PostEditor> createState() => _PostEditorState();
}

class _PostEditorState extends State<PostEditor> {
  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Edit"),
        actions: [
          IconButton(
              onPressed: () async {
                final vari = await controller.getText();
                print(await controller.getText());

                controller.setText("");

                controller.insertHtml("""<code>
#include<stdio.h>
int main() {
    printf("Hello Geeks");
}
<!--code Tag starts here -->
      </code>""");

                ;
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: HtmlEditor(
        controller: controller, //required

        htmlToolbarOptions:
            HtmlToolbarOptions(toolbarType: ToolbarType.nativeGrid),
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Your text here...",
          //initalText: "text content initial, if any",
        ),
        otherOptions: OtherOptions(
          height: 400,
        ),
      ),
    );
  }
}
