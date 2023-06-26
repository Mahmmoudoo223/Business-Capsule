class Doctor{
  late final String name;
  late final List<String>? pdfImagesPath; // to upload images of screenshots
  late final String? imagePath;
  Doctor(this.name,[this.imagePath,this.pdfImagesPath]);
}