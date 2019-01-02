class Questionnaire
  attr_reader :name, :version, :starting_state, :ending_states, :sections

  def initialize(name, version)
    @name = name
    @version = version
    @sections = []
  end

  def self.define(name, version)
    q = Questionnaire.new(name, version)
    yield q
    q
  end

  def date_published(date)
    @date_published = date
  end

  def add_section(section_name, type)
    section = Section.new(section_name, type)
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

  def to_hash
    hash = Hash.new
    hash[:name] = @name
    hash[:version] = @version
    sections_hash = Hash.new
    sections.each do |section|
      sections_hash[section.section_name.to_sym] = section.to_hash
    end
    hash[:sections] = sections_hash
    hash
  end

  def to_json
    JSON.generate(to_hash)
  end

  def validate
    errors = []
    return false if @sections.empty?
    @sections.each do |section|
      errors << section.validate
    end
    errors.empty? ? true : print_errors(errors) && false
  end

  def print_errors(errors)
  end
end
