require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_that_class_exists
    joke = Joke.new({id: 1,
                    question: "Why did the strawberry cross the road?",
                    answer: "Because his mother was in a jam."})

    assert_instance_of Joke, joke
  end

end
