class Bookmarks
  attr_reader :list
  def initialize
    @list = ['Makers Academy', 'Google']
  end

  def all
    @list.join(', ')
  end
end
