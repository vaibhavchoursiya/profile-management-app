import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:profile_management_app/constant/degrees.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_bloc.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_event.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

class MtextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;

  const MtextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          validator: (value) {
            return validator(value, labelText);
          },
          keyboardType: textInputType,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

class MtextPasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final Function validator;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final bool isShowPassword;
  final Function onTapSuffixIcon;

  const MtextPasswordFormField({
    super.key,
    required this.controller,
    this.passwordController,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
    required this.isShowPassword,
    required this.onTapSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (passwordController != null) {
              return validator(value, labelText, passwordController!.text);
            }

            return validator(value);
          },
          keyboardType: textInputType,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          obscureText: !isShowPassword,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: () {
                onTapSuffixIcon();
              },
              icon:
                  isShowPassword
                      ? Icon(Icons.lock)
                      : Icon(Icons.remove_red_eye_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

class MdateFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;

  const MdateFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          readOnly: true,
          onTap: () async {
            DateTime? datePicker = await showDatePicker(
              context: context,
              firstDate: DateTime(1990),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
            );

            if (datePicker != null) {
              controller.text = DateFormat("dd-MM-yyyy").format(datePicker);
            }
          },
          controller: controller,
          validator: (value) {
            return validator(value, labelText);
          },
          keyboardType: textInputType,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

class MdegreeDropMenu extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const MdegreeDropMenu({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  State<MdegreeDropMenu> createState() => _MdegreeDropMenuState();
}

class _MdegreeDropMenuState extends State<MdegreeDropMenu> {
  GlobalKey<FormState> degreeDropdowmFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8.0),

        FormField(
          key: degreeDropdowmFormKey,
          validator: (value) {
            if (value == null || value == "") {
              return "Select degree is required";
            } else if (!eligibleDegreesDropdownList.contains(value)) {
              return "Select degree from dropdown";
            }
            return null;
          },
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu(
                  width: double.infinity,
                  controller: widget.controller,
                  requestFocusOnTap: true,
                  onSelected: (value) {
                    final ProfileManagementBloc profileManagementBloc =
                        context.read<ProfileManagementBloc>();
                    if (value != null) {
                      widget.controller.text = value;

                      profileManagementBloc.add(
                        ProfileManagementDegreeSelected(selectedDegree: value),
                      );
                    } else {
                      widget.controller.text = "";
                    }
                    field.didChange(value);
                  },
                  enableSearch: true,
                  hintText: widget.hintText,
                  enableFilter: true,
                  enabled: true,
                  menuHeight: HelperMethods.getResponsiveHeight(context) * 0.5,
                  inputDecorationTheme: Theme.of(context).inputDecorationTheme,
                  dropdownMenuEntries:
                      eligibleDegreesDropdownList.map((e) {
                        return DropdownMenuEntry(value: e, label: e);
                      }).toList(),
                ),

                if (field.hasError)
                  Text(
                    field.errorText!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
