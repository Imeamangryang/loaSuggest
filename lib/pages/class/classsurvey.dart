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
        title: '${classList[className]![0]}의 아크패시브 만족도 점수를 평가해주세요.',
        answerFormat: const ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 100,
          defaultValue: 50,
          minimumValueDescription: '1',
          maximumValueDescription: '100',
        ),
      ),
      QuestionStep(
        // 3
        title: '${classList[className]![1]}의 아크패시브 만족도 점수를 평가해주세요.',
        answerFormat: const ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 100,
          defaultValue: 50,
          minimumValueDescription: '1',
          maximumValueDescription: '100',
        ),
      ),
      QuestionStep(
        // 4
        title: '모험가님의 평가',
        text: '$className에 대한 평가를 자유롭게 적어주세요.',
        isOptional: false,
        answerFormat:
            const TextAnswerFormat(maxLines: 5, defaultValue: "", validationRegEx: '^(?!\s*\$).+'),
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
