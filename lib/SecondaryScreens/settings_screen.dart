import 'package:flutter/material.dart';
import 'package:taste_application/SecondaryScreens/login_screen.dart';

class TasteSettingsPage extends StatefulWidget {
  const TasteSettingsPage({super.key});

  @override
  State<TasteSettingsPage> createState() => _TasteSettingsPageState();
}

class _TasteSettingsPageState extends State<TasteSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        ExpansionTile(
          initiallyExpanded: true,
          trailing: const Icon(Icons.account_circle_outlined),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
          title: Text(
            "Account",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            SettingsListTile(
                "Edit Profile", Icons.edit, "Change Your profile Info"),
            SettingsListTile("Payment Method", Icons.credit_card,
                "Edit or delete a payment method"),
            SettingsListTile("Latest Orders", Icons.update,
                "Check out Your order and give us a feedBack"),
            SettingsListTile("Connected Accounts", Icons.handshake,
                "Instagram , faceBook and more .."),
            SettingsListTile(
                "Deactivate Account", Icons.face, "Delete Your Account"),
          ],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          trailing: const Icon(Icons.phone),
          title: Text(
            "Contact Us",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            SettingsListTile(
                "Support", Icons.support_agent, "Talk with our agents"),
            SettingsListTile(
                "Bussines inquirments", Icons.done_all, "Sponsors and Ad's"),
            SettingsListTile("Report", Icons.report, "Raise A report ticket"),
          ],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          trailing: const Icon(Icons.more_horiz),
          title: Text(
            "More",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          children: [
            SettingsListTile("Work with us ! ", Icons.work,
                "Apply to start working with us"),
            SettingsListTile(
                "Employees support",
                Icons.contact_support_outlined,
                "Raise a ticket to get the support"),
            SettingsListTile("Balance", Icons.money, "Check how much you have"),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                          pageBuilder: (_, __, ___) =>
                              Material(child: TasteLoginScreen())));
                },
                child: SettingsListTile("Logout", Icons.logout, "")),
          ],
        ),
      ],
    )));
  }

  ListTile SettingsListTile(String title, IconData icon, String subtitle) {
    return ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        leading: Icon(icon),
        subtitle: Text(subtitle));
  }
}
