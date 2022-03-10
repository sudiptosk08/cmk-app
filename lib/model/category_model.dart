class CategoryModel {
  String image;
  String title;
  String subTitle;

  CategoryModel({
    this.image,
    this.title,
    this.subTitle,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(
      image: "assets/images/folder.png", title: 'E-C App', subTitle: '5 pages'),
  CategoryModel(
      image: "assets/images/greenFolder.png",
      title: 'Banking App',
      subTitle: '25 pages'),
  CategoryModel(
      image: "assets/images/cyanFolder.png",
      title: 'Food Web',
      subTitle: '15 pages'),
  CategoryModel(
      image: "assets/images/violetFolder.png",
      title: 'Behance',
      subTitle: '18 pages'),
];
