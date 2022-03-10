class EmployeeModel {
  final String image;
  final String name;
  final String email;
  final String designation;

  EmployeeModel({this.name, this.email, this.designation, this.image});
}

List<EmployeeModel> employeeList = [
  EmployeeModel(
      name: 'Sami Ahmed',
      email: 'sami@gmail.com',
      designation: 'UI/UX Designer',
      image: 'assets/images/photo.png'),
  EmployeeModel(
      name: 'Mahdi Ahmed',
      email: 'mahdi@gmail.com',
      designation: 'UX Researcher',
      image: 'assets/images/photoImg2.png'),
  EmployeeModel(
      name: 'Sayem Ahmed',
      email: 'sayem@gmail.com',
      designation: 'Web Designer',
      image: 'assets/images/avatar3.png'),
  EmployeeModel(
      name: 'Sayem Ahmed',
      email: 'sayem@gmail.com',
      designation: 'Web Designer',
      image: 'assets/images/avatar3.png'),
];
