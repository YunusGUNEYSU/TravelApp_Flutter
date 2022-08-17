class TravelModel {
  final String title;
  final String subTitle;
  final String imageName;

  TravelModel(this.title, this.subTitle, this.imageName);

  String get imagePath=>'asset/images/$imageName.png';
  
  static final List<TravelModel> mockItems=[
    TravelModel('Sopporo', 'SopporoTower', 'discover'),
    TravelModel('Osaka', 'Osaka Castle', 'dest'),
    TravelModel('Cosentino', 'Cosantinoto', 'cosentino'),

  ];
}