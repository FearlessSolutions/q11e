class Question
  attr_accessor :question_id, :type

  def initialize(question_id)
    @question_id = question_id
    type # booleen | multiple choice | date range | etc
  end

  def define_question(type)
    case type
    when :boolean
      @question = Boolean.new
      yield @question
    when :multiple_choice
      @question = MultipleChoice.new
      yield @question
    else
      raise Excpetion "No question type defined"
    end
  end

  def validate
    errors = []
    errors
  end
end
