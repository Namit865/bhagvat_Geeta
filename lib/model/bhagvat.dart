class bhagvat {
  int id;
  int chapter_number;
  String chapter_summary;
  String chapter_summary_hindi;
  String name_hindi;
  String name;
  int verses_count;
  String image;

  bhagvat(
      {required this.chapter_number,
      required this.chapter_summary,
      required this.chapter_summary_hindi,
      required this.id,
      required this.image,
      required this.name,
      required this.name_hindi,
      required this.verses_count
      });
}
