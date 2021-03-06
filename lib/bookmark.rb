require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id  = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")

    # The result object contains the Bookmark, each of which is a hash of the bookmark ID,  bookmark URL and bookmark title. We map each hash to the url key of the hash. This gives us an array of the bookmark URLs and titles.

    # we return the correct data, wrapped in a Bookmark instance. e.g
    #  => [#<Bookmark:0x00007f8d6f023d30 @id="78", @url="http://www.google.com", @title="Google">, #<Bookmark:0x00007f8d6f023678 @id="79", @url="http://www.bbc.co.uk", @title="BBC">, #<Bookmark:0x00007f8d6e0606f0 @id="80", @url="http://www.yahoo.com", @title="Yahoo">]

    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    # We are RETURNING the ID and URL from the bookmark we just inserted into the database and then wrapping it to a Bookmark instance e.g
    # => #<Bookmark:0x00007fe866135500 @id="95", @url="http://www.bbc.co.uk", @title="bbc">
    return false unless is_url?(params[:url])
      result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{params[:url]}', '#{params[:title]}') RETURNING id, url, title")
      Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def self.delete(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("DELETE FROM bookmarks WHERE id = #{params[:id]}")
  end

  def self.update(id, options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("UPDATE bookmarks SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{id}'")
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks WHERE id = '#{id}'")

    # the result object look's like this:
    # [#<Bookmark:0x00007fe8660ad5b0 @id="94", @url="http://www.ebay.com", @title="ebay">]

    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }.first
  end


  def comments
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM comments WHERE bookmark_id = #{@id}")
    result.map { |comment| Comment.new(comment['id'], comment['text']) }
  end

  def tags
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    # TODO , get explanation about this query
    result = connection.exec("SELECT tags.id, content FROM bookmark_tags INNER JOIN tags ON tags.id = bookmark_tags.tag_id WHERE bookmark_tags.bookmark_id = #{@id}")
    result.map { |tag| Tag.new(tag['id'], tag['content']) }
  end

  def ==(other)
    @id == other.id
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
