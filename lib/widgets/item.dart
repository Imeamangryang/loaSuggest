import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Card(
          color: Colors.white, // 배경색 설정
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '건의 진행 중',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '건의일 : 2024-11-03',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // 버튼 클릭 시 실행될 동작
                  },
                  child: const Text(
                    '건의 소제목',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 버튼 클릭 시 실행될 함수 (예: 추천 수 증가)
                      },
                      child: const Icon(Icons.thumb_up), // 엄지척 아이콘
                    ),
                    Spacer(),
                    Text('추천 수 : 1234',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), // 추천 수
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
