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

  def test_default_attributes
    joke = Joke.new({id: 2,
                    question: "How do you keep a lion from charging?",
                    answer: "Take away its credit cards."})

    assert_equal 2, joke.id
    assert_equal "How do you keep a lion from charging?", joke.question
    assert_equal "Take away its credit cards.", joke.answer
  end

end
