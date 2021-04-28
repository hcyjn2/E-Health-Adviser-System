import 'package:flutter/material.dart';
import 'package:main_menu/components/ReferencesPage/referencebg.dart';


class ReferenceBody extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ReferenceBG(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "REFERENCES",
              style: const TextStyle(
                fontFamily: 'DejaVuSerif',
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text('  American Psychological Association (May 2019). Stress in America 2020. Stress in the Times of COVID-19, Volume One. https://www.apa.org/news/press/releases/stress/2020/report',
            style: const TextStyle(
            fontSize: 12,
            ),
            ),
            SizedBox(height: size.height * 0.03),
            Text('  American Psychological Association (October 28, 2020). What’s the difference between stress and anxiety? Knowing the difference can ensure you get the help you need. https://www.apa.org/topics/stress-anxiety- difference#:~:text=People%20under%20stress%20experience%20mental,the%20absence%20of%20a%20stressor',
            style: const TextStyle(
            fontSize: 12,
            ),
            ),
            SizedBox(height: size.height * 0.03),
            Text('  Anxiety and Depression Association of America (2020). About ADAA. Facts and Statistics. https://adaa.org/about-adaa/press-room/facts-statistics',
            style: const TextStyle(
            fontSize: 12,
            ),
            ),
            SizedBox(height: size.height * 0.03),
            Text('  Anxiety and Depression Association of America (2020). Find Help. ADAA Reviewed Mental Health Apps. https://adaa.org/finding-help/mobile-apps',
            style: const TextStyle(
            fontSize: 12,
            ),
            ),
            SizedBox(height : size.height * 0.03),
            Text('  Richter, F. (Jun 2, 2020). Pandemic Causes Spike in Anxiety & Depression. https://www.statista.com/chart/21878/impact-of-coronavirus-pandemic-on- mental-health/',
            style: const TextStyle(
            fontSize: 12,
            ),
            ),
            SizedBox(height : size.height * 0.03),
            Text('  Spitzer, R. L., Kroenke, K., Williams, J. B., & Löwe, B. (2006). A brief measure forassessing generalized anxiety disorder: the GAD-7. Archives of internal medicine, 166(10), 1092–1097. https://doi.org/10.1001/archinte.166.10.1092',
            style: const TextStyle(
            fontSize: 12,
            ),
            ),
            SizedBox(height : size.height * 0.155),
            ],
        ),
      ),
    );
  }
}
