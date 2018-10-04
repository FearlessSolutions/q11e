class Section
  def initialize(section_name, type)
    @section_name = section_name
    @type = type # firm | personal
    @subsections = []
  end

  def self.define(section_name)
    s = Section.new(section_name)
    yield(s)
  end

  def make_subsection(subsection_name)
    subsection = Subsection.define(subsection_name)
    @subsections.push subsection
    yield(subsection)
  end

  def pretty_print
    puts "Section Name: #{@name}"
    puts "Section Type: #{@type}"
    @subsections.each do |subsection|
      subsection.pretty_print
    end
  end
end
