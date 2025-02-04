import 'package:loapetition/constants/lostarkdata.dart';
import 'package:survey_kit/survey_kit.dart';

Future<Task> getSampleTask(String className) {
  final NavigableTask task = NavigableTask(
    id: TaskIdentifier(),
    steps: <Step>[
      InstructionStep(
        // 0
        title: '클래스 만족도 설문조사',
        text: '$className 클래스에 대한 만족도 설문조사입니다.',
        buttonText: '시작하기',
      ),
      QuestionStep(
        // 1
        title: '직업 각인',
        text: '어느 직업 각인을 주로 사용하고 계신가요?',
        isOptional: false,
        answerFormat: SingleChoiceAnswerFormat(
          textChoices: classList[className]!
              .map((subclass) => TextChoice(text: subclass, value: subclass))
              .toList(),
        ),
      ),
      QuestionStep(
        // 2
        title: '직업 각인',
        text: '${classList[className]![0]} 각인을 주로 사용하는 이유는 무엇인가요?',
        isOptional: false,
        answerFormat: const SingleChoiceAnswerFormat(
          textChoices: <TextChoice>[
            TextChoice(text: '컨셉이 마음에 듦.', value: '컨셉'),
            TextChoice(text: '플레이 스타일이 좋음.', value: '스타일'),
            TextChoice(text: '딜이 강해서 좋음.', value: '딜'),
            TextChoice(text: '유틸리티(체방, 기믹 등)가 좋음.', value: '유틸리티'),
            TextChoice(text: '다른 직업 각인이 마음에 들지 않음.', value: '강제'),
          ],
        ),
      ),
      QuestionStep(
        // 3
        title: '직업 각인',
        text: '${classList[className]![1]} 각인을 주로 사용하는 이유는 무엇인가요?',
        isOptional: false,
        answerFormat: const SingleChoiceAnswerFormat(
          textChoices: <TextChoice>[
            TextChoice(text: '컨셉이 마음에 듦.', value: '컨셉'),
            TextChoice(text: '플레이 스타일이 좋음.', value: '스타일'),
            TextChoice(text: '딜이 강해서 좋음.', value: '딜'),
            TextChoice(text: '유틸리티(체방, 기믹 등)가 좋음.', value: '유틸리티'),
            TextChoice(text: '다른 직업 각인이 마음에 들지 않음.', value: '강제'),
          ],
        ),
      ),
      QuestionStep(
        // 4
        title: '개선점',
        text: '클래스에서 개선되었으면 하는 점을 골라주세요.(중복가능)',
        isOptional: false,
        answerFormat: const MultipleChoiceAnswerFormat(
          textChoices: <TextChoice>[
            TextChoice(text: '아이덴티티', value: '아이덴티티'),
            TextChoice(text: '시너지', value: '시너지'),
            TextChoice(text: '딜', value: '딜'),
            TextChoice(text: '유틸리티', value: '유틸리티'),
            TextChoice(text: '스킬 이펙트', value: '스킬'),
            TextChoice(text: '사전 작업 및 족쇄', value: '사전작업'),
            TextChoice(text: '스탯 효과(특화)', value: '스탯'),
            TextChoice(text: '트라이포드', value: '트라이포드'),
          ],
        ),
      ),
      QuestionStep(
        // 4
        title: '개선점',
        text: '스킬 중 가장 개선이 필요하다고 생각되는 스킬을 하나 골라주세요.',
        isOptional: false,
        answerFormat: SingleChoiceAnswerFormat(
          textChoices: skillList[className]!
              .map((subclass) => TextChoice(text: subclass, value: subclass))
              .toList(),
        ),
      ),
      QuestionStep(
        title: '클래스의 전체적인 만족도 점수를 평가해주세요.',
        answerFormat: const ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 100,
          defaultValue: 50,
          minimumValueDescription: '1',
          maximumValueDescription: '100',
        ),
      ),
      CompletionStep(
        stepIdentifier: StepIdentifier(id: '321'),
        text: '클래스 만족도 설문조사에 참여해주셔서 감사합니다.',
        title: '설문 완료!',
        buttonText: 'Submit survey',
      ),
    ],
  );
  task.addNavigationRule(
    forTriggerStepIdentifier: task.steps[1].stepIdentifier,
    navigationRule: ConditionalNavigationRule(
      resultToStepIdentifierMapper: (String? input) {
        if (classList[className]!.contains(input)) {
          return task.steps[classList[className]!.indexOf(input!) + 2].stepIdentifier;
        }
        return null;
      },
    ),
  );
  task.addNavigationRule(
    forTriggerStepIdentifier: task.steps[2].stepIdentifier,
    navigationRule: DirectNavigationRule(
      task.steps[4].stepIdentifier,
    ),
  );
  return Future<Task>.value(task);
}
