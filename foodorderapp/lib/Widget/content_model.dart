class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'Pick Your Food from our Menu\n   More than 35 times',
      image: "images/start.png",
      title: 'Select from Our\n   Best Menu'),
  UnboardingContent(
      description:
          'You can pay cash on  delivery and\n      Card payment is available',
      image: "images/png.png",
      title: 'Easy and Online Payment'),
  UnboardingContent(
      description: 'Deliver your food at your\n     Doorstep',
      image: "images/end.jpg",
      title: 'Quick Delivery at your Doorstep')
];
