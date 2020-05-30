class IntroModel {
  String title;
  String subtitile;
  String image;

  IntroModel({this.title, this.subtitile, this.image});
}

IntroModel one = IntroModel(
    image: "assets/intro_three_image.png",
    title: 'Connect',
    subtitile: 'We are glad to have you on board');
IntroModel two = IntroModel(
    image: "assets/intro_three_image.png",
    title: 'Party',
    subtitile: 'We are glad to have you on board');
IntroModel three = IntroModel(
    image: "assets/intro_three_image.png",
    title: 'Experience',
    subtitile: 'We are glad to have you on board');

List<IntroModel> intros = [one, two, three];
