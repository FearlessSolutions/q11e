class Boolean < BaseQuestion
  attr_reader :option_1, :option_2

  def initialize(question_id)
    super(question_id, :boolean)
    @option_1 = "True"
    @option_2 = "False"
  end

  def set_options(option_1, option_2)
    @option_1 = option_1
    @option_2 = option_2
  end

  def to_hash
    hash = Hash.new
    hash[:question_id] = id
    hash[:question_text] = question_text
    hash[:question_type] = type
    hash[:option_1] = option_1
    hash[:option_2] = option_2
    hash
  end
end
