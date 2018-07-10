require 'pg'
require_relative './bookmark'
require_relative './tag'

class BookmarkTag
  attr_reader :id

  def initialize(id)
    @id = id
  end

  # We are RETURNING the ID and text from the Tag we just inserted into the database and then wrapping it to a Tag instance

  def self.create(params)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmark_tags (bookmark_id, tag_id) VALUES('#{params[:bookmark_id]}', '#{params[:tag_id]}') RETURNING id")
    BookmarkTag.new(result.first['id'])
  end
end
