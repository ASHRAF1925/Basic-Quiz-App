class Question {
  late int question_id;
  late String question_description;
  late String option1;
  late String option2;
  late String option3;
  late String option4;
  late String image1;
  late String image2;
  late String image3;
  late String image4;
  late String correct_ans;
  late String answered_ans;
  late bool answered;
  late bool right_answered;
  late bool not_touched;

  Question(
      this.question_id,
      this.question_description,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.correct_ans,
      this.answered_ans,
      this.answered,
      this.right_answered,
      this.not_touched);
}
