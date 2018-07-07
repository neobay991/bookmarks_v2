require 'pg'

class Bookmarks
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

    # The result object contains the bookmarks, each of which is a hash of the bookmark ID and bookmark URL. We map each hash to the url key of the hash. This gives us an array of the bookmark URLs.

    # we return the correct data, wrapped in an Bookmarks instance. e.g
    #  => [#<Bookmarks:0x00007f8d6f023d30 @id="78", @url="http://www.google.com", @title="Google">, #<Bookmarks:0x00007f8d6f023678 @id="79", @url="http://www.bbc.co.uk", @title="BBC">, #<Bookmarks:0x00007f8d6e0606f0 @id="80", @url="http://www.yahoo.com", @title="Yahoo">]

    result.map { |bookmark| Bookmarks.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test2')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    return false unless is_url?(params[:url])
      result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{params[:url]}', '#{params[:title]}') RETURNING id, url, title")
      Bookmarks.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def ==(other)
    @id == other.id
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
