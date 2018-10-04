class Question
  def initialize(question_name, type)
    question_name
    type # booleen | multiple choice | date range | etc
  end

  def self.define(name, type)
    q = Question.new(name, type)
    yield(q)
  end
end
