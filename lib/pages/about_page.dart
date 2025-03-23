import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about-page';

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context)
        .textScaler
        .scale(MediaQuery.of(context).size.width >= 380 ? 20 : 15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Mosque Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: 'about-mosque-dashboard',
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        child: Image.asset('assets/images/logo.png'),
                        onTap: () {
                          // try {
                          //   launchUrl(Uri.http('http://quicksynclab.in'));
                          // } catch (error) {
                          //   FunctionUtil.showErrorSnackBar(context);
                          // }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                child: Text(
                  'quicksynclab.in',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  // try {
                  //   launchUrl(Uri.http('http://quicksynclab.in'));
                  // } catch (error) {
                  //   FunctionUtil.showErrorSnackBar(context);
                  // }
                },
              ),
              const Divider(
                height: 40,
              ),
              InkWell(
                child: Text(
                  'mohammad.mujeeb@gmail.com',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  // try {
                  //   launchUrl(Uri.http('mailto:mohammad.mujeeb@gmail.com'));
                  // } catch (error) {
                  //   FunctionUtil.showErrorSnackBar(context);
                  // }
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                child: Text(
                  '+91 9880506766',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  // try {
                  //   launchUrl(Uri.http('tel:+919880506766'));
                  // } catch (error) {
                  //   FunctionUtil.showErrorSnackBar(context);
                  // }
                },
              ),
              const Divider(
                height: 40,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      return Theme.of(context).primaryColor;
                    },
                  ),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: fontSize),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
