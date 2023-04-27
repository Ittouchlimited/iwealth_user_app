class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your money and get the result",
    image: "assets/images/image1.png",
    desc: "Remember to keep track of your income & expenses.",
  ),
  OnboardingContents(
    title: "Fastest & More secured",
    image: "assets/images/image2.png",
    desc: "Best way to get the result from your credit or debit transactions.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/image3.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
