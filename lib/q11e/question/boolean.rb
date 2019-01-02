# module Question
  class Boolean < BaseQuestion
    attr_reader :option_1, :option_2

    def initialize(question_id)
      super(question_id, :boolean)
      option_1 = "True"
      option_2 = "False"
    end

    def set_options(option_1, option_2)
      option_1 = option_1
      option_2 = option_2
    end
  end
# end
