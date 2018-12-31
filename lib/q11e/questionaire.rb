class Questionaire
  attr_accessor :name, :version, :starting_state, :ending_states, :sections

  def initialize(name, version)
    @name = name
    @version = version
    @sections = []
  end

  def define(name, version)
    q = Questionaire(name, version)
    yield(q)
  end

  def date_published(date)
    @date_published = date
  end

  def make_section(section_name)
    section = Section.new(section_name)
    yield section
    sections << section
  end

  def pretty_print
    puts "Name: #{@name}"
    puts "Version: #{@version}"
    sections.each do |section|
      section.pretty_print
    end
  end

  def validate
    errors = []
    return false if section.empty?
    sections.each do |section|
      errors << section.validate
    end
    errors.empty? ? true : print_errors(errors) && false
  end

  def print_errors(errors)
  end
end
