import 'package:get/get.dart';
import '../../../core/common/constants/icons_path.dart';
import '../model/onboarding_personality_model.dart';

class OnboardingController extends GetxController {
  final selectedIndex = Rx<int?>(null);

  final List<PersonalityOption> options = [
    PersonalityOption(
      title: "I'm Starting From Zero",
      description: "Starting to build a solid financial habit.",
      iconPath: Iconpath.startIcon,
    ),
    PersonalityOption(
      title: "I'm a Spender",
      description: "Build your savings and emergency fund",
      iconPath: Iconpath.spenderIcon,
    ),
    PersonalityOption(
      title: "I'm Drowning in Debt",
      description: "Eliminate debt and build financial stability",
      iconPath: Iconpath.debtIcon,
    ),
    PersonalityOption(
      title: "I'm Ready to Build Wealth",
      description: "Grow investments and long-term assets",
      iconPath: Iconpath.wealthIcon,
    ),
  ];

  var currentStep = 1.obs;
  var totalSteps = 4;
  var xp = 10.obs;

  // Step content mapping
  final Map<int, Map<String, String>> stepContent = {
    1: {
      'title': 'Personality Check',
      'subtitle': "What's your main financial focus right now?",
    },
    2: {
      'title': 'Set the finance source',
      'subtitle': 'Help us personalize your money journey',
    },
    3: {
      'title': 'Choose Your Coach',
      'subtitle': 'How should we motivate you?',
    },
    4: {
      'title': 'Unlock Your Full Money Potential',
      'subtitle': 'Join 50,000+ people who transformed their finances with Monev8 Premium.',
    },
  };

  String getStepTitle() => stepContent[currentStep.value]?['title'] ?? '';
  String getStepSubtitle() => stepContent[currentStep.value]?['subtitle'] ?? '';

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void nextStep() {
    if (currentStep.value < totalSteps) {
      currentStep.value++;
      xp.value += 10;
    }
  }
}
