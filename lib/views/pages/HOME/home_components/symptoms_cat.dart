import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(name: "Service 1", icon: 'assets/cat1.png'),
      CustomIcon(name: "Service 2", icon: 'assets/cat2.png'),
      CustomIcon(name: "Service 3", icon: 'assets/cat3.png'),
      CustomIcon(name: "Service 4", icon: 'assets/cat4.png'),
    ];

    List<CustomIcon> healthNeeds = [
      CustomIcon(name: "Service", icon: 'assets/appointment.png'),
      CustomIcon(name: "Service", icon: 'assets/hospital.png'),
      CustomIcon(name: "Service", icon: 'assets/virus.png'),
      CustomIcon(name: "Service", icon: 'assets/drug.png'),
    ];
    List<CustomIcon> specialisedCared = [
      CustomIcon(name: "Diabetes", icon: 'assets/blood.png'),
      CustomIcon(name: "Health Care", icon: 'assets/health_care.png'),
      CustomIcon(name: "Dental", icon: 'assets/tooth.png'),
      CustomIcon(name: "Insured", icon: 'assets/insurance.png'),
    ];

    List<CustomIcon> additionalRow = [
      CustomIcon(name: "Service 1", icon: 'assets/cat5.png'),
      CustomIcon(name: "Service 2", icon: 'assets/cat6.png'),
      CustomIcon(name: "Service 3", icon: 'assets/cat7.png'),
      CustomIcon(name: "Service 4", icon: 'assets/cat8.png'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Not feeling too well?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text("Treat common symptoms with top specialists",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: const Color.fromARGB(255, 118, 115, 115))),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(customIcons.length, (index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    if (index == customIcons.length - 1) {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (context) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            height: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // HEALTH NEEDS SECTION
                                Text(
                                  "Health Needs",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    healthNeeds.length,
                                    (index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                healthNeeds[index].icon,
                                                width: 64,
                                                height: 64,
                                                alignment:
                                                    const Alignment(0.1, 0.1),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(healthNeeds[index].name)
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                // SPECIALISED CARE SECTION

                                Text(
                                  "Specialised Care",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    specialisedCared.length,
                                    (index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                specialisedCared[index].icon,
                                                width: 64,
                                                height: 64,
                                                alignment:
                                                    const Alignment(0.1, 0.1),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(specialisedCared[index].name)
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      customIcons[index].icon,
                      width: 64,
                      height: 64,
                      alignment: const Alignment(0.1, 0.1),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(customIcons[index].name)
              ],
            );
          }),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(additionalRow.length, (index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    // Add your logic here when tapping the icons in the additional row
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      additionalRow[index].icon,
                      width: 64,
                      height: 64,
                      alignment: const Alignment(0.1, 0.1),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(additionalRow[index].name)
              ],
            );
          }),
        ),
      ],
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;

  CustomIcon({
    required this.name,
    required this.icon,
  });
}
