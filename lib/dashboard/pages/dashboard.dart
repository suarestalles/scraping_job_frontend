import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/dashboard/controllers/dashboard_controller.dart';
import 'package:scraping_job_front/utils/constants.dart';
import 'package:scraping_job_front/utils/my_colors.dart';
import 'package:scraping_job_front/utils/widgets/my_text_field.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DashboardController());
    return GetBuilder(
      init: Get.find<DashboardController>(),
      builder: (controller) {
        return FutureBuilder(
          future: controller.fetchJobs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final jobs = snapshot.data?['result'] as List<dynamic>?;
                return Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      MyTextField(
                        controller.searchController,
                        hintText: 'Search for jobs...',
                        suffixIcon: InkWell(
                          onTap: () => controller.update(),
                          child: Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.search, color: Colors.white,)
                          )
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: jobs?.map((job) => InkWell(
                            onTap: () => controller.openJobDescription(job),
                            child: Card(
                              color: cardColor,
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                padding: const EdgeInsets.only(
                                  left: defaultPadding,
                                  right: defaultPadding,
                                  bottom: defaultPadding,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: defaultPadding),
                                    Row(
                                      spacing: defaultPadding,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.network(
                                            job['employer_logo'] ?? 'https://static.vecteezy.com/system/resources/previews/002/375/040/non_2x/modern-white-background-free-vector.jpg',
                                            fit: BoxFit.cover,
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(job['job_title'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: tertiaryColor), overflow: TextOverflow.ellipsis),
                                              Text("Enterprise: ${job['employer_name']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: tertiaryColor, overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Text(job['job_description'].toString().replaceAll('\n', ' '), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54), overflow: TextOverflow.ellipsis, maxLines: 6)),
                                    Row(
                                      children: [
                                        Text(job['job_salary'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryColor)),
                                      ],
                                    ),
                                    Text('Remote: ${job['job_is_remote'] == true ? 'Yes' : 'No'}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(8, 8, 99, 1))),
                                    Text('Country: ${job['job_location']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(8, 8, 99, 1))),
                                    Text('Type: ${job['job_employment_type'] ?? "No specified"}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: tertiaryColor)),
                                    Text('Salary: ${job['job_min_salary'] ?? "No specified"} ${job['job_salary_period'] ?? ""}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: tertiaryColor)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                            ).toList() ?? [],
                          ),
                        ),
                      )
                      // ListView.builder(
                      //   itemCount: jobs?.length ?? 0,
                      //   padding: EdgeInsets.all(defaultPadding),
                      //   itemBuilder: (content, index) => InkWell(
                      //     onTap: () => controller.openJobDescription(jobs?[index]),
                      //     child: Card(
                      //       color: cardColor,
                      //       elevation: 3,
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width,
                      //         height: 200,
                      //         padding: const EdgeInsets.only(
                      //           left: defaultPadding,
                      //           right: defaultPadding,
                      //           bottom: defaultPadding,
                      //         ),
                      //         child: Column(
                      //           children: [
                      //             const SizedBox(height: defaultPadding),
                      //             Row(
                      //               spacing: defaultPadding,
                      //               children: [
                      //                 ClipRRect(
                      //                   borderRadius: BorderRadius.circular(50),
                      //                   child: Image.network(
                      //                     jobs?[index]['employer_logo'] ?? 'https://static.vecteezy.com/system/resources/previews/002/375/040/non_2x/modern-white-background-free-vector.jpg',
                      //                     fit: BoxFit.cover,
                      //                     width: 50,
                      //                     height: 50,
                      //                   ),
                      //                 ),
                      //                 Expanded(
                      //                   child: Column(
                      //                     crossAxisAlignment: CrossAxisAlignment.start,
                      //                     children: [
                      //                       Text(jobs?[index]['job_title'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: tertiaryColor), overflow: TextOverflow.ellipsis),
                      //                       Text("Enterprise: ${jobs?[index]['employer_name']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: tertiaryColor)),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             Expanded(child: Text(jobs?[index]['job_description'].toString().replaceAll('\n', ' ') ?? '', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54), overflow: TextOverflow.ellipsis, maxLines: 6)),
                      //             Row(
                      //               children: [
                      //                 Text(jobs?[index]['job_salary'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryColor)),
                      //               ],
                      //             ),
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text('Remote: ${jobs?[index]['job_is_remote'] == true ? 'Yes' : 'No'}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(8, 8, 99, 1))),
                      //                 Text('Country: ${jobs?[index]['job_location']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(8, 8, 99, 1))),
                      //                 Text('Type: ${jobs?[index]['job_employment_type']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: tertiaryColor)),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text('No jobs found', style: TextStyle(color: Colors.white)));
              }
            } else {
              return Center(child: CircularProgressIndicator(color: primaryColor));
            }
          }
        );
      }
    );
  }
}