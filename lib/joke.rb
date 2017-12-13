class Joke

  def initialize(joke_data)
    @id       = joke_data[:id]
    @question = joke_data[:question]
    @answer   = joke_data[:answer]
  end

end
