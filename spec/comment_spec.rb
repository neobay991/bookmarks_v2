require 'comment'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(url: 'http://www.testlink.com', title: 'testlink')
      comment = Comment.create(bookmark_id: bookmark.id, text: 'Test comment')

      expect(comment.id).not_to be_nil
    end
  end
end
