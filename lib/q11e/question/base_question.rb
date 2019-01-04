class BaseQuestion
  attr_reader :id, :question_text, :more_info, :type

  def initialize(question_id, type)
    @id = question_id
    @type = type
  end

  def set_question_text(question_text)
    @question_text = question_text
  end

  def validate
    errors = []
    errors << 'Question: Questions require a type' if type.nil?
    errors << 'Question: Questions require a question text' if question_text.nil?
    errors
  end
end
