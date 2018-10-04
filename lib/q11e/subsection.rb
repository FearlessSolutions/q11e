class Subsection
  attr_accessor :name, :default_next_subsection

  def initialize(name)
    @name = name
    @questions = []
    @subsections = []
    @page = false
  end

  def self.define(name)
    subsection = Subsection.new(name)
    yield(subsection)
  end

  def make_page
    @page = true
  end

  def new_subsection(name)
    subsection = Subsection.define(name)
    yield(subsection)
  end

  def set_default_next_subsection(next_subsection)
    @default_next_subsection = next_subsection
  end

  def pretty_print
    puts "Subsection Name: #{@name}"
  end
end
