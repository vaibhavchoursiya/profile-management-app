import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_api/user_api.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 4.0,
              ),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                // vertical: 12.0,
              ),
              leading: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              title: Text(
                user.name,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              subtitle: Text(
                user.jobTitle,
                style: GoogleFonts.roboto(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
              children: [
                Divider(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.2),
                ),
                const SizedBox(height: 10.0),

                Table(
                  children: [
                    TableRow(
                      children: iconLabelTextWidget(
                        text: user.name,
                        iconData: Icons.person,
                        labelText: "Name",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.address,
                        iconData: Icons.location_city,
                        labelText: "Address",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.companyName,
                        iconData: Icons.workspace_premium_outlined,
                        labelText: "Company",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.dateOfBirth,
                        iconData: Icons.date_range,
                        labelText: "DOB",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.degree,
                        iconData: Icons.school,
                        labelText: "Degree",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.gender,
                        iconData:
                            user.gender == "Male" ? Icons.male : Icons.female,
                        labelText: "Degree",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.institutionName,
                        iconData: Icons.account_balance_rounded,
                        labelText: "Institute",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.experience.toString(),
                        iconData: Icons.numbers,
                        labelText: "Experience",
                      ),
                    ),

                    TableRow(
                      decoration: BoxDecoration(),
                      children: iconLabelTextWidget(
                        text: user.createdAt,
                        iconData: Icons.create,
                        labelText: "Created At",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconLabelWidget extends StatelessWidget {
  const IconLabelWidget({
    super.key,
    required this.iconData,
    required this.text,
    required this.labelText,
  });
  final IconData iconData;
  final String text;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 8.0),
        Text(
          "$labelText :",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

iconLabelTextWidget({
  required String text,
  required IconData iconData,
  required String labelText,
}) {
  return <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconLabelWidget(
        iconData: iconData,
        text: text,
        labelText: labelText,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
    ),
  ];
}
