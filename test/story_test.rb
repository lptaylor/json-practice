require 'minitest/autorun'
require 'minitest/pride'
require './lib/story.rb'

class StoryTest < Minitest::Test

  def test_it_returns_array_of_correct_length
    result = Story.json_to_story_array.count

    assert_equal 43, result
  end

  def test_there_is_an_array
    result =  Story.json_to_story_array

    assert_instance_of Story, result[0]
  end

  def test_photo_shows_correctly_for_missing_photo
    result = Story.new("Section", "Subsection", "Title", "Abstract", "link", "published")

    assert_equal "No Photo Available", result.photo
  end

  def test_object_has_attributes
    result =  Story.json_to_story_array[0]

    assert_equal "U.S.", result.section
    assert_equal "Politics", result.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", result.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", result.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", result.link
    assert_equal "November 29, 2018", result.published
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg", result.photo
  end
end
