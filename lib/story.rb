require 'date'
require 'json'
class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo
  def initialize(section, subsection, title, abstract, link, published, photo = "No Photo Available")
    @section = section
    @subsection = subsection
    @title = title
    @abstract = abstract
    @link = link
    @published = published
    @photo = photo
  end

  def self.json_to_story_array
    json_nytimes = File.read("./data/nytimes.json")
    parsed_nytimes = JSON.parse(json_nytimes)
    story_array = parsed_nytimes["results"].map do |story|
      Story.new(story["section"], story["subsection"], story["title"], story["abstract"], story["url"], Date.parse(story["published_date"]).strftime("%B %d, %Y"), story["multimedia"][0]["url"])
    end
    story_array
  end


end
