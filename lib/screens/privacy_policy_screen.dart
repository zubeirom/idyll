import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/screens/search_screen.dart';
import 'package:idyll/widgets/screen_header.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const routeName = "/privacy-policy";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(SearchScreen.routeName)},
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
        title: AutoSizeText(
          'Idyll',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Plaster', fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader("Privacy Policy"),
              SizedBox(height: 20),
              Text(
                "Zubeir Mohamed built the Idyll app as a Free app. This SERVICE is provided by Zubeir Mohamed at no cost and is intended for use as is. This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service. If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy. The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Idyll unless otherwise defined in this Privacy Policy.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Information Collection and Use",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way. The app does use third party services that may collect information used to identify you. Link to privacy policy of third party service providers used by the app",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 10),
              Text(
                " - Google Analytics for Firebase",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                " - Firebase Crashlytics",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Log Data",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Cookies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory. This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Service Providers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "I may employ third-party companies and individuals due to the following reasons: To facilitate Service;To provide the Service on our behalf; To perform Service-related services; or To assist us in analyzing how our Service is used. I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Security",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Links to Other Sites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Children’s Privacy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Changes to This Privacy Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page. This policy is effective as of 2021-01-31.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at zubeir.mohamed@outlook.de.",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
