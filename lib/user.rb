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
    joke_csv = CSV.open(filename, headers: true, header_converters: :symbol)
      joke_csv.to_a.map do |joke|
      self.jokes << joke.to_hash
    end
  end

end
