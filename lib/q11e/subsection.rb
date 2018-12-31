class Subsection
  attr_accessor :id, :default_next_subsection

  def initialize(id)
    @id = name
    @questions = []
    @subsections = []
  end

  def make_page
    @page = true
  end

  def new_subsection(id)
    subsection = Subsection.define(id)
    yield(subsection)
  end

  def set_default_next_subsection(next_subsection)
    @default_next_subsection = next_subsection
  end

  def pretty_print
    puts "Subsection ID: #{id}"
  end

  def validate
    errors = []
    errors << 'Subsection: Subsections can only have questions or connect to other subsections' if !questions.empty? && !subsections.empty?
    questions_validate(errors) unless questions.empty?
    subsections_validate(errors) unless subsections.empty?
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
  end
end
