require 'pg'

class Tag
  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  # We are RETURNING the ID and text from the Tag we just inserted into the database and then wrapping it to a Tag instance

  def self.create(params)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO tags (content) VALUES('#{params[:tag_content]}') RETURNING id, content")
    Tag.new(result.first['id'], result.first['content'])
  end
end
