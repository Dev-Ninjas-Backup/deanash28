import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/icons_path.dart';
import '../model/onboarding_personality_model.dart';

class OnboardingController extends GetxController {
  final selectedIndex = Rx<int?>(null);
  final selectedCheckInVibeIndex = Rx<int?>(null);
  final showYouAreAllSetDialog = false.obs;
  final selectedBillingCycle = Rx<String?>('monthly');
  final isLimitedFreeVersion = false.obs;

  // Step 2 TextControllers
  final monthlyIncomeController = TextEditingController();
  final totalDebtController = TextEditingController();
  final currentBalanceController = TextEditingController();

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
      'subtitle':
          'Join 50,000+ people who transformed their finances with Monev8 Premium.',
    },
  };

  // Step-specific options
  late final Map<int, List<PersonalityOption>> stepOptions = {
    1: [
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
    ],
    2: [],
    3: [
      PersonalityOption(
        title: "Friendly",
        description: "Supportive and understanding guidance",
        subDescription: "\"Great job! Every small step counts 💪\"",
        iconPath: Iconpath.friendlyIcon,
      ),
      PersonalityOption(
        title: "Motivational",
        description: "Push-me enthusiastically from the momentum 🚀",
        subDescription: "\"You're crushing it! Keep that momentum! 🔥\"",

        iconPath: Iconpath.motivationalIcon,
      ),
      PersonalityOption(
        title: "Strict",
        description: "Direct and accountability-focused no-nonsense 💪",
        subDescription: "\"No excuses. Stick to the plan. 💼\"",

        iconPath: Iconpath.strictIcon,
      ),
    ],
    4: [],
  };

  // Check-in vibe options
  final List<Map<String, String>> checkInVibeOptions = [
    {'title': 'Crushed it!', 'subtitle': 'Completed', 'emoji': '😊'},
    {'title': 'Okay day', 'subtitle': 'XP Earned', 'emoji': '😐'},
    {'title': 'Slipped up', 'subtitle': 'Completed', 'emoji': '😬'},
    {'title': 'Rough day', 'subtitle': 'XP Earned', 'emoji': '😩'},
  ];

  List<PersonalityOption> get currentStepOptions =>
      stepOptions[currentStep.value] ?? [];

  String getStepTitle() {
    if (currentStep.value == 4 && isLimitedFreeVersion.value) {
      return 'Continue With Free';
    }
    return stepContent[currentStep.value]?['title'] ?? '';
  }

  String getStepSubtitle() {
    if (currentStep.value == 4 && isLimitedFreeVersion.value) {
      return 'Limited access to overall features';
    }
    return stepContent[currentStep.value]?['subtitle'] ?? '';
  }

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void selectCheckInVibe(int index) {
    selectedCheckInVibeIndex.value = index;
  }

  void selectBillingCycle(String cycle) {
    selectedBillingCycle.value = cycle;
  }

  void nextStep() {
    if (currentStep.value == 3) {
      showYouAreAllSetDialog.value = true;
    } else if (currentStep.value < totalSteps) {
      currentStep.value++;
      selectedIndex.value = null;
      xp.value += 10;
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
      selectedIndex.value = null;
      selectedCheckInVibeIndex.value = null;
      isLimitedFreeVersion.value = false;
    }
    if(currentStep.value == 1){
            selectedIndex.value = null;
      selectedCheckInVibeIndex.value = null;
      isLimitedFreeVersion.value = false;
      Get.back();
    }
  }

  void proceedToStep4() {
    if (currentStep.value == 3) {
      currentStep.value++;
      selectedIndex.value = null;
      selectedCheckInVibeIndex.value = null;
      showYouAreAllSetDialog.value = false;
      xp.value += 10;
    }
  }

  @override
  void onClose() {
    monthlyIncomeController.dispose();
    totalDebtController.dispose();
    currentBalanceController.dispose();
    super.onClose();
  }
}
