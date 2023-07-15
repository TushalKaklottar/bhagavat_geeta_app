class GitaModal {

  // Attribute

 final int chapter_number;
 final String chapter_summary;
 final String chapter_summary_hindi;
 final int id;
 final String  imageName;
 final String name;
 final String name_meaning;
 final String name_translation;
 final String name_transliterated;
 final int verses_count;


 // Parameterized Constructor

 GitaModal ({
   required this.chapter_number,
   required this.chapter_summary,
   required this.chapter_summary_hindi,
   required this.id,
   required this.imageName,
   required this.name,
   required this.name_meaning,
   required this.name_translation,
   required this.name_transliterated,
   required this.verses_count,
});

 // factory Constructor

factory GitaModal.fromMap({required Map data}) {
  return GitaModal(
      chapter_number: data['chapter_number'],
      chapter_summary:  data['chapter_summary'],
      chapter_summary_hindi:  data['chapter_summary_hindi'],
      id:  data['id'],
      imageName:  data['imageName'],
      name:  data['name'],
      name_meaning:  data['name_meaning'],
      name_translation:  data['name_translation'],
      name_transliterated:  data['name_transliterated'],
      verses_count:  data['verses_count']
  );
}
}