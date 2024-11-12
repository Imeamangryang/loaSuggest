import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  List<int> likes = List<int>.filled(10, 0);
  List<bool> isLiked = List<bool>.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        // 건의 사항들을 리스트화하여 보여주는 페이지
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 건의사항 텍스트 왼쪽 상단에 위치
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '건의사항',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // 건의사항 작성 버튼 오른쪽 상단에 위치
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // 건의사항 작성 페이지로 이동
                    Navigator.pushNamed(context, '/suggestion');
                  },
                  child: Text('건의사항 작성'),
                ),
              ),
            ),
            // 건의사항 리스트
            for (var i = 0; i < 10; i++)
              ExpansionTile(
                  // title에서도 좋아요 수가 보이도록 수정
                  title: Text('건의사항 ${i + 1}'),
                  subtitle: Text('좋아요 ${likes[i]}'),
                  children: <Widget>[
                    ListTile(
                      title: Text('건의사항 내용'),
                      onTap: () {},
                    ),
                    // 좋아요 버튼 누르면 좋아요 수 증가 및 빨간색 표시
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('좋아요 ${likes[i]}'),
                        IconButton(
                          icon: Icon(
                            isLiked[i]
                                ? Icons.thumb_up
                                : Icons.thumb_up_off_alt,
                            color: isLiked[i] ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked[i] = !isLiked[i];
                              likes[i] += isLiked[i] ? 1 : -1;
                            });
                          },
                        ),
                      ],
                    ),
                  ]),
            // 건의사항 작성 버튼
          ],
        ),
      ),
    ));
  }
}
