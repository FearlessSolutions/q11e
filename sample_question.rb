quest = Questionnaire.define("Test Questionnaire", "1.2.3") do |q|
  q.add_section("section1", :firm) do |s|
    s.add_subsection("subsection1") do |subsection|
      subsection.add_question("question1", :boolean) do |question|
        # question.question_type(:boolean)
        question.set_question_text("Some question about stuff")
        question.set_options("Yes", "No")
        # question.next_section(SkipLogicClass("next_subsection_id", "condition"))
      end
      # subsection.new_subsection("subsection2") do |subsection|
      #   subsection.new_question("question2", :type) do |question|
      #     question.question("text")
      #     question.next_section(SkipLogicClass("next_subsection_id", "condition"))
      #   end
      # end
    end
  end
  # q.new_section("section2") do |s|
  #   s.new_subsection("subsection3") do |subsection|
  #     subsection.new_question("question3", :type) do |question|
  #     end
  #   end
  # end
end
