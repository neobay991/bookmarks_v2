require 'bookmark_tag'

describe BookmarkTag do
  describe '.create' do
    it 'creates a new join between links and tags' do
      bookmark = Bookmark.create(url: 'http://testexample.com', title: 'Test Link')
      tag = Tag.create(tag_content: 'Test Tag')
      bookmark_tag = BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)

      expect(bookmark_tag.id).not_to be_nil
    end
  end
end
