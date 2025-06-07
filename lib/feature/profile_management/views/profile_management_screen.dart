import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/validators/validators.dart';
import 'package:profile_management_app/shared/widgets/header_widget.dart';
import 'package:profile_management_app/shared/widgets/mtext_form_field.dart';

class ProfileManagementScreen extends StatelessWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: HelperMethods.getResponsiveHeight(context) * 0.04),
            HeaderWidget(
              onTap: () {
                context.pop();
              },
              iconData: Icons.arrow_back,
              titleText: "Manage profile",
            ),
            ProfileFormWidget(),
          ],
        ),
      ),
    );
  }
}

class ProfileFormWidget extends StatefulWidget {
  const ProfileFormWidget({super.key});

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState extends State<ProfileFormWidget> {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dOBController = TextEditingController();
  final TextEditingController degreeMenuController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController institutionNameController =
      TextEditingController();
  final TextEditingController yearOfPassingController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();

  final TextEditingController companyNameController = TextEditingController();

  final TextEditingController experienceController = TextEditingController();

  Future pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: imageSource);

    if (file != null) {
      print(file.path);
    }
  }

  showImageSourceDialogBox() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SizedBox(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () async {
                    context.pop();
                    await pickImage(ImageSource.camera);
                  },
                  leading: Icon(Icons.camera),
                  title: Text(
                    "Camera",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    context.pop();
                    await pickImage(ImageSource.gallery);
                  },
                  leading: Icon(Icons.browse_gallery),
                  title: Text(
                    "Gallery",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTypography.bodyPaddingHorizontal,
        vertical: AppTypography.bodyPaddingVertical,
      ),
      child: Form(
        key: profileFormKey,
        child: Column(
          children: [
            SizedBox(height: AppTypography.heightBetweenHeaderAndForm),
            Row(
              children: [
                Container(width: 50.0, height: 50.0, color: Colors.green),
                const SizedBox(width: 20.0),
                ElevatedButton.icon(
                  onPressed: () async {
                    await showImageSourceDialogBox();
                  },
                  icon: Icon(Icons.upload),
                  label: Text(
                    "Upload profile image",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),

            MtextFormField(
              controller: nameController,
              validator: Validators.notEmptyValidator,
              hintText: "Enter Your Name",
              labelText: "Name",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),

            MdateFormField(
              controller: dOBController,
              validator: Validators.dOBValidator,
              hintText: "Select DOB",
              labelText: "DOB",
              textInputType: TextInputType.text,
            ),

            SizedBox(height: AppTypography.textFormFieldSpace),

            MtextFormField(
              controller: addressController,
              validator: Validators.notEmptyValidator,
              hintText: "Enter Your Address",
              labelText: "Address",
              textInputType: TextInputType.text,
            ),

            SizedBox(height: AppTypography.textFormFieldSpace),

            MtextFormField(
              controller: yearOfPassingController,
              validator: Validators.passingYearValidator,
              hintText: "Enter Your Passing year",
              labelText: "Passing year",
              textInputType: TextInputType.number,
            ),

            SizedBox(height: AppTypography.textFormFieldSpace),

            MtextFormField(
              controller: jobTitleController,
              validator: Validators.notEmptyValidator,
              hintText: "Enter Job Title",
              labelText: "Job title",
              textInputType: TextInputType.text,
            ),

            SizedBox(height: AppTypography.textFormFieldSpace),

            MtextFormField(
              controller: companyNameController,
              validator: Validators.notEmptyValidator,
              hintText: "Enter Company Name",
              labelText: "Company name",
              textInputType: TextInputType.text,
            ),

            SizedBox(height: AppTypography.textFormFieldSpace),

            MtextFormField(
              controller: experienceController,
              validator: Validators.notEmptyValidator,
              hintText: "Enter year of experience",
              labelText: "Experience",
              textInputType: TextInputType.number,
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),

            MdegreeDropMenu(
              controller: degreeMenuController,
              hintText: "Search Degree",
              labelText: "Degree",
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),

            Row(
              children: [
                RadioMenuButton(
                  value: "Female",
                  groupValue: "Male",
                  onChanged: (value) {},
                  child: Text("Male", style: GoogleFonts.roboto()),
                ),

                RadioMenuButton(
                  value: "Female",
                  groupValue: "Female",
                  onChanged: (value) {},
                  child: Text("Female", style: GoogleFonts.roboto()),
                ),
              ],
            ),

            SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              height: AppTypography.btnHeight,
              child: ElevatedButton(
                onPressed: () {
                  if (profileFormKey.currentState!.validate()) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Login",
                  style: AppTypography.formBtnTextStyle(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
