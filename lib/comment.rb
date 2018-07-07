require 'pg'

class Comment
  attr_reader :id, :text

  def initialize(id, text)
    @id = id
    @text = text
  end

  # We are RETURNING the ID and URL from the bookmark we just inserted into the database and then wrapping it to a Bookmark instance e.g
  # => #<Bookmark:0x00007fe866135500 @id="95", @url="http://www.bbc.co.uk", @title="bbc">

  def self.create(params)
    result = DatabaseConnection.query("INSERT INTO comments (bookmark_id, text) VALUES('#{params[:link_id]}', '#{params[:text]}') RETURNING id, text")
    Comment.new(result.first['id'], result.first['text'])
  end
end
