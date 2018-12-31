class Section
  attr_accessor :section_name, :type, :subsections

  def initialize(section_name, type)
    @section_name = section_name
    @type = type # firm | personal
    @subsections = []
  end

  def make_subsection(subsection_name)
    subsection = Subsection.define(subsection_name)
    yield(subsection)
    subsections << subsection
  end

  def pretty_print
    puts "Section Name: #{section_name}"
    puts "Section Type: #{type}"
    subsections.each do |subsection|
      subsection.pretty_print
    end
  end

  def validate
    errors = []
    errors << 'Section: No section name present' unless section_name.present?
    errors << 'Section: Incorrect section type' unless section.eql? :firm || section.eql? :personal
    return false if section.empty?
    subsections.each do |subsection|
      errors << subsection.validate
    end
    errors
  end
end
