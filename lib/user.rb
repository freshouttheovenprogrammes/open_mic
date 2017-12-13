require_relative 'joke'
require 'csv'

class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    jokes.each do |joke|
      user.jokes << joke
    end
  end

  def learn_routine(filename)
    jokes = CSV.open filename, headers: true, header_converters: :symbol
    jokes.each do |joke|
      learn(joke)
    end
  end

end
