import 'package:flutter/material.dart';
import 'package:itasker/presentation/screens/auth_screen/forgot/forgot_screen.dart';
import 'package:itasker/presentation/screens/auth_screen/forgot/password_success.dart';
import 'package:itasker/presentation/screens/auth_screen/login_screen.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_instruction.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_onboarding.dart';
import 'package:itasker/presentation/screens/auth_screen/register_boarding/register_screen.dart';
import 'package:itasker/presentation/screens/landing_screen/landing_screen.dart';
import 'package:itasker/presentation/screens/message_screen/tasker_chat_screen/tasker_chat_screen.dart';
import 'package:itasker/presentation/screens/my_task_screen/finish_task_screen.dart';
import 'package:itasker/presentation/screens/my_task_screen/success_screen/success_screen.dart';
import 'package:itasker/presentation/screens/my_task_screen/success_screen/success_screen_2.dart';
import 'package:itasker/presentation/screens/my_task_screen/withdraw_offer_screen.dart';
import 'package:itasker/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/billing_screen/billing_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/my_datas_screen/my_datas_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/my_interest_group_screen/my_interest_group_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/my_profile_screen/my_profile_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/my_profile_screen/my_reputation_screen/my_reputation_screen.dart';
import 'package:itasker/presentation/screens/profile_screen/my_profile_screen/view_profile_as_user/view_profile_as_user.dart';
import 'package:itasker/presentation/screens/profile_screen/security/delete_account.dart';
import 'package:itasker/presentation/screens/profile_screen/security/update_password/verify_identity.dart';
import 'package:page_transition/page_transition.dart';

import '../../application/exceptions/route_exception.dart';
import '../screens/add_task_screen/add_task_screen.dart';
import '../screens/add_task_screen/category_detail_screen.dart';
import '../screens/add_task_screen/choose_task_categories_screen.dart';
import '../screens/add_task_screen/task_summary.dart';
import '../screens/auth_screen/forgot/pin_code_screen.dart';
import '../screens/auth_screen/forgot/update_password.dart';
import '../screens/list_screen/filter_screen.dart';
import '../screens/list_screen/list_screen.dart';
import '../screens/list_screen/notification_screen.dart';
import '../screens/message_screen/offeror_chat_screen/offeror_chat_budget_screen.dart';
import '../screens/message_screen/offeror_chat_screen/offeror_chat_screen.dart';
import '../screens/message_screen/offeror_chat_screen/que_ans_Screen.dart';
import '../screens/message_screen/tasker_chat_screen/apply_to_task_screen.dart';
import '../screens/message_screen/tasker_chat_screen/tasker_chat_ budget_screen.dart';
import '../screens/my_task_screen/accept_screen.dart';
import '../screens/my_task_screen/cancelled_screen.dart';
import '../screens/my_task_screen/cancle_task.dart';
import '../screens/my_task_screen/check_out_screen.dart';
import '../screens/my_task_screen/completion_code_screen.dart';
import '../screens/my_task_screen/decline_screen.dart';
import '../screens/my_task_screen/diposit_now_screen.dart';
import '../screens/my_task_screen/finish_homework_screen.dart';
import '../screens/my_task_screen/finish_screen.dart';
import '../screens/my_task_screen/in_progress_screen.dart';
import '../screens/my_task_screen/offer_and_counteroffer_screen.dart';
import '../screens/my_task_screen/qualify_screen.dart';
import '../screens/my_task_screen/success_screen/success_screen_3.dart';
import '../screens/my_task_screen/success_screen/success_screen_4.dart';
import '../screens/my_task_screen/success_screen/success_screen_5.dart';
import '../screens/my_task_screen/task_detais_screen.dart';
import '../screens/profile_screen/about_screen/about_screen.dart';
import '../screens/profile_screen/about_screen/terms_condition_data_policy/terms_condition_data_policy.dart';
import '../screens/profile_screen/billing_screen/deposit_history_screen/deposit_history_screen.dart';
import '../screens/profile_screen/billing_screen/my_mercado_pago_account_screen/my_mercado_pago_account_screen.dart';
import '../screens/profile_screen/my_datas_screen/verify_my_datas_screen/change_email_screen.dart';
import '../screens/profile_screen/my_datas_screen/verify_my_datas_screen/email_code_screen.dart';
import '../screens/profile_screen/my_datas_screen/verify_my_datas_screen/verify_your_identity_screen.dart';
import '../screens/profile_screen/performance_as_tasker_screen/performance_as_tasker_screen.dart';
import '../screens/profile_screen/security/security_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRouter {
  static const String splash = 'splash';
  static const String register = 'Register';
  static const String login = 'Login';
  static const String onBoarding = 'OnBoarding';
  static const String forgotScreen = 'ForgotScreen';
  static const String pinCodeScreen = 'PinCodeScreen';
  static const String updatePasswordScreen = 'UpdatePasswordScreen';
  static const String passwordSuccess = 'PasswordSuccess';
  static const String registerInstruction = 'RegisterInstruction';
  static const String registerScreen = 'RegisterScreen';
  static const String registerOnboarding = 'RegisterOnboarding';
  static const String landingScreen = 'LandingScreen';
  static const String securityScreen = 'SecurityScreen';
  static const String verifyIdentity = 'VerifyIdentity';
  static const String deleteAccountScreen = 'DeleteAccountScreen';
  static const String myProfileScreen = 'MyProfileScreen';
  static const String myDatasScreen = 'MyDatasScreen';
  static const String myInterestGroupScreen = 'MyInterestGroupScreen';
  static const String myReputationScreen = 'MyReputationScreen';
  static const String viewProfileAsUserScreen = 'ViewProfileAsUserScreen';
  static const String verifyYourIdentityScreen = 'VerifyYourIdentityScreen';
  static const String changeEmailScreen = 'ChangeEmailScreen';
  static const String emailCodeScreen = 'EmailCodeScreen';
  static const String aboutScreen = 'AboutScreen';
  static const String termsCcnditionDataPolicyScreen =
      'TermsCcnditionDataPolicyScreen';
  static const String performanceAsTaskerScreen = 'PerformanceAsTaskerScreen';
  static const String billingScreen = 'BillingScreen';
  static const String depositHistoryScreen = 'DepositHistoryScreen';
  static const String myMercadoPagoAccountScreen = 'MyMercadoPagoAccountScreen';
  static const String taskerChatScreen = 'TaskerChatScreen';
  static const String offerorChatScreen = 'OfferorChatScreen';
  static const String taskerChatBudgetScreen = 'TaskerChatBudgetScreen';
  static const String offerorChatBudgetScreen = 'OfferorChatBudgetScreen';
  static const String questionAnswerScreen = 'QuestionAnswerScreen';
  static const String applyToTaskScreen = 'ApplyToTaskScreen';
  static const String finishTaskScreen = 'FinishTaskScreen';
  static const String finishHomeWorkScreen = 'FinishHomeWorkScreen';
  static const String cancleTaskScreen = 'CancleTaskScreen';
  static const String withDrawOfferScreen = 'WithDrawOfferScreen';
  static const String listScreen = 'ListScreen';
  static const String filterScreen = 'FilterScreen';
  static const String notificationScreen = 'NotificationScreen';
  static const String taskDetailScreen = 'TaskDetailScreen';
  static const String offerAndCounterOfferScreen = 'OfferAndCounterOfferScreen';
  static const String declineScreen = 'DeclineScreen';
  static const String acceptScreen = 'AcceptScreen';
  static const String checkOutScreen = 'CheckOutScreen';
  static const String dipositNowScreen = 'DipositNowScreen';
  static const String finishedScreen = 'FinishedScreen';
  static const String qualifyScreen = 'QualifyScreen';
  static const String cancelledScreen = 'CancelledScreen';
  static const String completionCodeScreen = 'CompletionCodeScreen';
  static const String inProgressScreen = 'InProgressScreen';
  static const String addTaskScreen = 'AddTaskScreen';
  static const String chooseTaskCategoriesScreen = 'ChooseTaskCategoriesScreen';
  static const String categoryDetailsScreen = 'CategoryDetailsScreen';
  static const String taskSummaryScreen = 'TaskSummaryScreen';
  static const String successScreen = 'SuccessScreen';
  static const String successScreen2 = 'SuccessScreen2';
  static const String successScreen3 = 'SuccessScreen3';
  static const String successScreen4 = 'SuccessScreen4';
  static const String successScreen5 = 'SuccessScreen5';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return PageTransition(
            child: const SplashScreen(), type: PageTransitionType.leftToRight);
      case register:
        return PageTransition(
            child: const RegisterScreen(),
            type: PageTransitionType.leftToRight);
      case login:
        return PageTransition(
            child: const LoginScreen(), type: PageTransitionType.leftToRight);
      case onBoarding:
        return PageTransition(
            child: const OnBoarding(), type: PageTransitionType.leftToRight);
      case forgotScreen:
        return PageTransition(
            child: ForgotScreen(), type: PageTransitionType.leftToRight);
      case pinCodeScreen:
        return PageTransition(
            child: const PinCodeScreen(), type: PageTransitionType.leftToRight);
      case updatePasswordScreen:
        return PageTransition(
            child: const UpdatePasswordScreen(),
            type: PageTransitionType.leftToRight);
      case passwordSuccess:
        Map<String, dynamic> register =
            settings.arguments as Map<String, dynamic>;
        return PageTransition(
            child: PasswordSuccess(
                isRegister: register['isRegister'] as bool,
                name: (register['name'] as String)),
            type: PageTransitionType.leftToRight);
      case registerInstruction:
        return PageTransition(
            child: const RegisterInstruction(),
            type: PageTransitionType.leftToRight);
      case registerOnboarding:
        return PageTransition(
            child: const RegisterOnboarding(),
            type: PageTransitionType.leftToRight);
      case landingScreen:
        int ind = (settings.arguments) != null ? settings.arguments as int : 0;
        return PageTransition(
            child: LandingScreen(selectedInd: ind),
            type: PageTransitionType.leftToRight);
      case securityScreen:
        return PageTransition(
            child: const SecurityScreen(),
            type: PageTransitionType.leftToRight);
      case verifyIdentity:
        bool isAcDel = settings.arguments as bool;
        return PageTransition(
            child: VerifyIdentity(isDelAc: isAcDel),
            type: PageTransitionType.leftToRight);
      case deleteAccountScreen:
        return PageTransition(
            child: const DeleteAccountScreen(),
            type: PageTransitionType.leftToRight);
      case myProfileScreen:
        return PageTransition(
            child: const MyProfileScreen(),
            type: PageTransitionType.leftToRight);
      case myDatasScreen:
        return PageTransition(
            child: const MyDatasScreen(), type: PageTransitionType.leftToRight);
      case myInterestGroupScreen:
        return PageTransition(
            child: MyInterestGroupScreen(),
            type: PageTransitionType.bottomToTop);
      case myReputationScreen:
        return PageTransition(
            child: const MyReputationScreen(),
            type: PageTransitionType.bottomToTop);
      case viewProfileAsUserScreen:
        bool isShow = settings.arguments as bool;
        return PageTransition(
            child: ViewProfileAsUserScreen(isShow: isShow),
            type: PageTransitionType.bottomToTop);
      case verifyYourIdentityScreen:
        return PageTransition(
            child: const VerifyYourIdentityScreen(),
            type: PageTransitionType.leftToRight);
      case changeEmailScreen:
        return PageTransition(
            child: ChangeEmailScreen(), type: PageTransitionType.leftToRight);
      case emailCodeScreen:
        return PageTransition(
            child: const EmailCodeScreen(),
            type: PageTransitionType.leftToRight);

      case aboutScreen:
        return PageTransition(
            child: const AboutScreen(), type: PageTransitionType.leftToRight);
      case termsCcnditionDataPolicyScreen:
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
        return PageTransition(
            child: TermsCcnditionDataPolicyScreen(
                title: data['title'], desc: data['desc']),
            type: PageTransitionType.bottomToTop);
      case performanceAsTaskerScreen:
        return PageTransition(
            child: const PerformanceAsTaskerScreen(),
            type: PageTransitionType.leftToRight);
      case billingScreen:
        return PageTransition(
            child: const BillingScreen(), type: PageTransitionType.leftToRight);
      case depositHistoryScreen:
        return PageTransition(
            child: const DepositHistoryScreen(),
            type: PageTransitionType.leftToRight);
      case myMercadoPagoAccountScreen:
        return PageTransition(
            child: MyMercadoPagoAccountScreen(),
            type: PageTransitionType.leftToRight);
      case taskerChatScreen:
        String data = settings.arguments.toString();
        return PageTransition(
            child: TaskerChatScreen(text: data),
            type: PageTransitionType.topToBottom);
      case offerorChatScreen:
        return PageTransition(
            child: const OfferorChatScreen(),
            type: PageTransitionType.topToBottom);
      case taskerChatBudgetScreen:
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
        return PageTransition(
            child: TaskerChatBudgetScreen(
              buttonText: data['text'],
              isShow: data['isShow'],
              isCommentShow: data['isComment'] ?? true,
            ),
            type: PageTransitionType.topToBottom);
      case offerorChatBudgetScreen:
        return PageTransition(
            child: const OfferorChatBudgetScreen(),
            type: PageTransitionType.topToBottom);
      case questionAnswerScreen:
        return PageTransition(
            child: const QuestionAnswerScreen(),
            type: PageTransitionType.bottomToTop);
      case applyToTaskScreen:
        return PageTransition(
            child: const ApplyToTaskScreen(),
            type: PageTransitionType.bottomToTop);

      case finishTaskScreen:
        return PageTransition(
            child: const FinishTaskScreen(),
            type: PageTransitionType.bottomToTop);
      case finishHomeWorkScreen:
        return PageTransition(
            child: FinishHomeWorkScreen(),
            type: PageTransitionType.bottomToTop);
      case cancleTaskScreen:
        return PageTransition(
            child: CancleTaskScreen(), type: PageTransitionType.bottomToTop);
      case withDrawOfferScreen:
        return PageTransition(
            child: const WithDrawOfferScreen(),
            type: PageTransitionType.bottomToTop);
      case listScreen:
        return PageTransition(
            child: const ListScreen(), type: PageTransitionType.rightToLeft);
      case filterScreen:
        return PageTransition(
            child: const FilterScreen(), type: PageTransitionType.rightToLeft);
      case notificationScreen:
        return PageTransition(
            child: const NotificationScreen(),
            type: PageTransitionType.rightToLeft);
      case taskDetailScreen:
        return PageTransition(
            child: const TaskDetailScreen(),
            type: PageTransitionType.bottomToTop);
      case offerAndCounterOfferScreen:
        return PageTransition(
            child: const OfferAndCounterOfferScreen(),
            type: PageTransitionType.rightToLeft);
      case declineScreen:
        return PageTransition(
            child: const DeclineScreen(), type: PageTransitionType.bottomToTop);
      case acceptScreen:
        return PageTransition(
            child: const AcceptScreen(), type: PageTransitionType.bottomToTop);
      case checkOutScreen:
        return PageTransition(
            child: const CheckOutScreen(),
            type: PageTransitionType.rightToLeft);
      case dipositNowScreen:
        return PageTransition(
            child: const DipositNowScreen(),
            type: PageTransitionType.bottomToTop);
      case finishedScreen:
        bool isShow = settings.arguments as bool;
        return PageTransition(
            child: FinishedScreen(isShow: isShow),
            type: PageTransitionType.rightToLeft);
      case qualifyScreen:
        bool isTrue = settings.arguments as bool;
        return PageTransition(
            child: QualifyScreen(isTrue: isTrue),
            type: PageTransitionType.rightToLeft);
      case cancelledScreen:
        return PageTransition(
            child: const CancelledScreen(),
            type: PageTransitionType.rightToLeft);
      case successScreen:
        return PageTransition(
            child: const SuccessScreen(), type: PageTransitionType.leftToRight);
      case successScreen2:
        return PageTransition(
            child: const SuccessScreen2(),
            type: PageTransitionType.bottomToTop);
      case successScreen3:
        bool isTrue = settings.arguments as bool;
        return PageTransition(
            child: SuccessScreen3(isTrue: isTrue),
            type: PageTransitionType.bottomToTop);
      case successScreen4:
        return PageTransition(
            child: const SuccessScreen4(),
            type: PageTransitionType.bottomToTop);
      case successScreen5:
        return PageTransition(
            child: const SuccessScreen5(),
            type: PageTransitionType.bottomToTop);
      case completionCodeScreen:
        return PageTransition(
            child: const CompletionCodeScreen(),
            type: PageTransitionType.bottomToTop);
      case inProgressScreen:
        return PageTransition(
            child: const InProgressScreen(),
            type: PageTransitionType.rightToLeft);
      case addTaskScreen:
        return PageTransition(
            child: const AddTaskScreen(), type: PageTransitionType.bottomToTop);
      case chooseTaskCategoriesScreen:
        bool isTrue = settings.arguments as bool;

        return PageTransition(
            child: ChooseTaskCategoriesScreen(isTaskSummary: isTrue),
            type: PageTransitionType.rightToLeft);
      case categoryDetailsScreen:
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;

        return PageTransition(
            child: CategoryDetailsScreen(isSummary: data["isSummary"] ?? false),
            type: PageTransitionType.rightToLeft);
      case taskSummaryScreen:
        return PageTransition(
            child: const TaskSummaryScreen(),
            type: PageTransitionType.rightToLeft);

      default:
        throw const RouteException('Route not found!');
    }
  }
}
