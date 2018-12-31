class BaseQuestion
  attr_accessor :id, :question_text, :more_info

  def initialize(question_id)
    @id = question_id
  end

  def set_question_text(question_text)
    @question_text = question_text
  end
end
