require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_user_has_no_jokes_to_start_with
    melissa = User.new("Melissa")

    assert_equal [], melissa.jokes
  end

  def test_user_can_learn_a_couple_jokes
    amber = User.new("Amber")
    joke_1 = Joke.new({id: 3,
                    question: "What do you call a cow with a twitch?",
                    answer: "Beef jerky"})
    joke_2 = Joke.new({id: 4,
                    question: "What is the best way to keep water from running?",
                    answer: "Don’t pay the water bill"})
    amber.learn(joke_1)
    amber.learn(joke_2)
    assert_equal [joke_1, joke_2], amber.jokes
  end

  def test_user_can_tell_another_user_a_joke
    joe = User.new("Joe")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 3,
                    question: "What do you call a cow with a twitch?",
                    answer: "Beef jerky"})
    joe.learn(joke_1)
    joe.tell(josh, joke_1)

    assert_equal [joke_1], josh.jokes
    assert_equal 1, josh.jokes.count
  end

  def test_user_can_preform_a_routine_for_another_user
    jimmy = User.new("Jimmy")
    john = User.new("John")
    joke_1 = Joke.new({id: 3,
                    question: "What do you call a cow with a twitch?",
                    answer: "Beef jerky"})
    joke_2 = Joke.new({id: 6,
                    question: "Why did the farmer bury all his money?",
                    answer: "To make his soil rich"})
    jimmy.learn(joke_1)
    jimmy.learn(joke_2)

    assert_equal 2, jimmy.jokes.count
    assert_equal [joke_1, joke_2], jimmy.jokes

    jimmy.perform_routine_for(john)

    assert_equal 2, john.jokes.count
    assert_equal [joke_1, joke_2], john.jokes
  end
end
