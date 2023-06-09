import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/extensions/string_extensions.dart';
import 'package:pinext/app/bloc/add_goal_cubit/add_goal_cubit.dart';
import 'package:pinext/app/bloc/signup_cubit/signin_cubit_cubit.dart';
import 'package:pinext/app/models/pinext_goal_model.dart';
import 'package:uuid/uuid.dart';

import '../../app_data/app_constants/fonts.dart';
import '../../app_data/theme_data/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_snackbar.dart';
import '../../shared/widgets/custom_text_field.dart';

class AddAndEditGoalsAndMilestoneScreen extends StatelessWidget {
  AddAndEditGoalsAndMilestoneScreen({
    super.key,
    required this.addingNewGoalDuringSignupProcess,
    required this.addingNewGoal,
    required this.editingGoal,
    required this.pinextGoalModel,
  });

  bool addingNewGoalDuringSignupProcess;
  bool addingNewGoal;
  bool editingGoal;
  PinextGoalModel? pinextGoalModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddGoalCubit(),
      child: AddAndEditGoalsAndMilestoneView(
        addingNewGoal: addingNewGoal,
        addingNewGoalDuringSignupProcess: addingNewGoalDuringSignupProcess,
        editingGoal: editingGoal,
        pinextGoalModel: pinextGoalModel,
      ),
    );
  }
}

class AddAndEditGoalsAndMilestoneView extends StatefulWidget {
  AddAndEditGoalsAndMilestoneView({
    super.key,
    required this.addingNewGoalDuringSignupProcess,
    required this.addingNewGoal,
    required this.editingGoal,
    required this.pinextGoalModel,
  });

  bool addingNewGoalDuringSignupProcess;
  bool addingNewGoal;
  bool editingGoal;
  PinextGoalModel? pinextGoalModel;

  @override
  State<AddAndEditGoalsAndMilestoneView> createState() =>
      _AddAndEditGoalsAndMilestoneState();
}

class _AddAndEditGoalsAndMilestoneState
    extends State<AddAndEditGoalsAndMilestoneView> {
  late TextEditingController titleController;

  late TextEditingController amountController;

  late TextEditingController descriptionController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
    if (widget.editingGoal) {
      titleController.text = widget.pinextGoalModel!.title;
      amountController.text = widget.pinextGoalModel!.amount;
      descriptionController.text = widget.pinextGoalModel!.description;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: customBlackColor,
          ),
        ),
        title: Text(
          "Adding a new goal",
          style: boldTextStyle,
        ),
        actions: [
          widget.editingGoal
              ? IconButton(
                  onPressed: () {
                    context
                        .read<AddGoalCubit>()
                        .deleteGoal(widget.pinextGoalModel!);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 18,
                  ))
              : const SizedBox.shrink()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pinext",
                  style: regularTextStyle.copyWith(
                    color: customBlackColor.withOpacity(.6),
                  ),
                ),
                Text(
                  "Goals & Milestones",
                  style: boldTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "What are your saving up for?",
                  style: boldTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: titleController,
                  hintTitle: "Ex:  a new bike....",
                  textInputType: TextInputType.text,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value.toString().isNotEmpty) {
                      return null;
                    } else {
                      return "Title can't be empty!";
                    }
                  },
                  suffixButtonAction: () {},
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "*This will be the title of you goal or milestone.",
                  style: regularTextStyle.copyWith(
                    color: customBlackColor.withOpacity(.4),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Amount",
                  style: boldTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: amountController,
                  hintTitle: "Ex: 400,000₦",
                  textInputType: TextInputType.number,
                  onChanged: (String value) {},
                  validator: (value) {
                    return InputValidation(value).isCorrectNumber();
                  },
                  suffixButtonAction: () {},
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "*This will be the title of you goal or milestone.",
                  style: regularTextStyle.copyWith(
                    color: customBlackColor.withOpacity(.4),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Detailed Description",
                  style: boldTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  numberOfLines: 5,
                  hintTitle: "Ex: Buying a new bike",
                  textInputType: TextInputType.text,
                  onChanged: (String value) {},
                  validator: (value) {
                    // return InputValidation(value).isCorrectNumber();
                    return null;
                  },
                  suffixButtonAction: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                BlocConsumer<AddGoalCubit, AddGoalState>(
                  listener: (context, state) {
                    if (state is AddGoalSuccessState) {
                      Navigator.pop(context);
                      GetCustomSnackbar(
                        title: "Pinext Goal added!!",
                        message: "A new goal has been added.",
                        snackbarType: SnackbarType.success,
                        context: context,
                      );
                    } else if (state is AddGoalErrorState) {
                      log("An error occurred while trying to add a new goal!");
                    } else if (state is UpdateGoalSuccessState) {
                      Navigator.pop(context);
                      GetCustomSnackbar(
                        title: "Pinext Goal updated!!",
                        message: "Your goal has been updated",
                        snackbarType: SnackbarType.success,
                        context: context,
                      );
                    } else if (state is DeleteGoalSuccessState) {
                      Navigator.pop(context);
                      GetCustomSnackbar(
                        title: "Pinext Goal Deleted",
                        message: "Your goal has been achieved!",
                        snackbarType: SnackbarType.success,
                        context: context,
                      );
                    }
                  },
                  builder: (context, state) {
                    return GetCustomButton(
                      title: widget.editingGoal ? "Update" : "Add",
                      titleColor: whiteColor,
                      buttonColor: customBlueColor,
                      isLoading: state is AddGoalLoadingState,
                      callBackFunction: () async {
                        if (_formKey.currentState!.validate()) {
                          if (widget.addingNewGoalDuringSignupProcess) {
                            PinextGoalModel pinextGoalModel = PinextGoalModel(
                              title: titleController.text,
                              amount: amountController.text,
                              description: descriptionController.text,
                              id: const Uuid().v4().toString(),
                            );
                            context
                                .read<SigninCubit>()
                                .addGoal(pinextGoalModel);
                            Navigator.pop(context);
                          } else if (widget.addingNewGoal) {
                            PinextGoalModel pinextGoalModel = PinextGoalModel(
                              title: titleController.text,
                              amount: amountController.text,
                              description: descriptionController.text,
                              id: const Uuid().v4().toString(),
                            );
                            context
                                .read<AddGoalCubit>()
                                .addGoal(pinextGoalModel);
                            Navigator.pop(context);
                          } else if (widget.editingGoal) {
                            PinextGoalModel pinextGoalModel = PinextGoalModel(
                              title: titleController.text,
                              amount: amountController.text,
                              description: descriptionController.text,
                              id: widget.pinextGoalModel!.id,
                            );
                            context
                                .read<AddGoalCubit>()
                                .updateGoal(pinextGoalModel);
                          }
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
