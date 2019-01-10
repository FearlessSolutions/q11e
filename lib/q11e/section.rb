class Section
  attr_reader :section_name, :type, :subsections

  def initialize(section_name, type)
    @section_name = section_name
    @type = type # firm | personal
    @subsections = []
  end

  def add_subsection(subsection_name)
    subsection = Subsection.new(subsection_name)
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

  def to_hash
    hash = Hash.new
    hash[:section_name] = @section_name
    hash[:type] = @type
    subsection_hash = Hash.new
    subsections.each do |subsection|
      subsection_hash[subsection.id] = subsection.to_hash
    end
    hash[:subsections] = subsection_hash
    hash
  end

  def validate
    errors = []
    errors << 'Section: No section name present' unless !section_name.empty?
    # errors << 'Section: Incorrect section type' unless section.eql? :firm || section.eql? :personal
    return false if subsections.empty?
    subsections.each do |subsection|
      errors << subsection.validate
    end
    errors
  end
end
