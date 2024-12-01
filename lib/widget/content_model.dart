class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description:
          "Find parking spots easily with\ndetailed locations and availability",
      image: "images/screen1.png",
      title: "Locate Parking Spots"),
  UnboardingContent(
      description:
          "Pay for your parking seamlessly\nwith multiple payment options",
      image: "images/screen2.png",
      title: "Hassle-Free Payment"),
  UnboardingContent(
      description: "Navigate directly to your\nreserved parking spot",
      image: "images/screen3.png",
      title: "Quick Navigation to Parking")
];
