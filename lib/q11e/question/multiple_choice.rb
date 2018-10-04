module Question
  class MultipleChoice < BaseQuestion
    attr_accessor :selections

    def initialize(question_id)
      super(question_id)
      @selections = []
    end

    def set_selection(text)
    end
  end
end
