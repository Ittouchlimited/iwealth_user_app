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
    title: "Track everything you own on the go",
    image: "assets/images/o1.png",
    desc: "",
  ),
  OnboardingContents(
    title: "Be ready for all emergencies",
    image: "assets/images/o2.png",
    desc: "",
  ),
  OnboardingContents(
    title: "Secure wealth tracking with Safe Deposit Box",
    image: "assets/images/o1.png",
    desc: "",
  ),
];
