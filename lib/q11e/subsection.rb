class Subsection
  attr_reader :id, :default_next_subsection, :questions

  def initialize(id)
    @id = id
    @questions = []
  end

  # def make_page
  #   @page = true
  # end

  # def new_subsection(id)
  #   subsection = Subsection.define(id)
  #   yield(subsection)
  # end

  def add_question(id, type)
    question = nil
    case type
    when :boolean
      # byebug
      question = Boolean.new(id)
      # yield question
    when :multiple_choice
      question = MultipleChoice.new(id)
      # yield question
    else
      raise Exception "No question type defined"
    end
    raise Exception "An error occured in defining the question" if question.nil?
    yield question
    questions << question
  end

  def set_default_next_subsection(next_subsection)
    @default_next_subsection = next_subsection
  end

  def pretty_print
    puts "Subsection ID: #{id}"
  end

  def validate
    errors = []
    errors << 'Subsection: Subsections can only have questions or connect to other subsections' if !questions.empty? # && !subsections.empty?
    questions_validate(errors) unless questions.empty?
    # subsections_validate(errors) unless subsections.empty?
  end

  def to_hash
    hash = Hash.new
    hash[:subsection_id] = id
    question_hash = Hash.new
    questions.each do |question|
      question_hash[question.id] = question.to_hash
    end
    hash[:questions]  = question_hash
    hash
  end

  private

  def questions_validate(errors)
    questions.each do |question|
      errors << question.validate
    end
    errors
  end

  def subsections_validate(errors)
    subsections.each do |subsection|
      errors << subsection.validate
    end
    errors
  end
end
