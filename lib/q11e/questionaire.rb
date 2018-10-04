class Questionaire
  attr_accessor :name, :version, :starting_state, :ending_states

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
    s = Section.define(section_name)
    @sections.push s
    yield(s)
  end

  def pretty_print
    puts "Name: #{@name}"
    puts "Version: #{@version}"
    @sections.each do |section|
      section.pretty_print
    end
  end
end
