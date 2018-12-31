questionaire = Questionaire.define("name", "1.2.3", "date") do |q|
  q.new_section("section1") do |s|
    s.new_subsection("subsection1") do |subsection|
      subsection.new_question("question1", :type) do |question|
        question.question("text")
        question.next_section(SkipLogicClass("next_subsection_id", "condition"))
      end
      subsection.new_subsection("subsection2") do |subsection|
        subsection.new_question("question2", :type) do |question|
          question.question("text")
          question.next_section(SkipLogicClass("next_subsection_id", "condition"))
      end
    end
  end
  q.new_section("section2") do |s|
    s.new_subsection("subsection3") do |subsection|
      subsection.new_question("question3", :type) do |question|
      end
    end
  end
end
