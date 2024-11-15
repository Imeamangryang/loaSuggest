import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:loapetition/widgets/layout.dart';

class SuggestionWritePage extends StatefulWidget {
  const SuggestionWritePage({super.key});

  @override
  State<SuggestionWritePage> createState() => _SuggestionWritePageState();
}

class _SuggestionWritePageState extends State<SuggestionWritePage> {
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        child: Center(
            child: Column(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '건의사항',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // 상단 실선
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Divider(color: Colors.black, thickness: 3.0)),
        // 문의 제목 입력
        const Row(
          children: [
            SizedBox(width: 16.0),
            Text(' * 제목 '),
            SizedBox(width: 32.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '제목을 입력해주세요.',
                ),
              ),
            ),
            SizedBox(width: 16.0),
          ],
        ),

        QuillSimpleToolbar(
          controller: _controller,
          configurations: const QuillSimpleToolbarConfigurations(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: QuillEditor.basic(
                controller: _controller,
                configurations: const QuillEditorConfigurations(
                    placeholder: '건의사항을 작성해주세요.', padding: EdgeInsets.all(8.0)),
                scrollController: ScrollController(),
                focusNode: FocusNode(),
              ),
            ),
          ),
        ),
        // 빈 공간
        const SizedBox(height: 32.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          // 취소 버튼
          ElevatedButton(
              onPressed: () {
                // 작성한 건의사항을 서버에 전송
                Navigator.pop(context);
              },
              child: Text('취소')),
          const SizedBox(width: 16.0),
          // 작성 완료 버튼
          ElevatedButton(
              onPressed: () {
                // 작성한 건의사항을 서버에 전송
                Navigator.pop(context);
              },
              child: Text('작성 완료')),
        ]),

        const SizedBox(height: 32.0),
      ],
    )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
