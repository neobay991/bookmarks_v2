require 'bookmarks'

describe Bookmarks do
  subject(:bookmarks) { described_class.new }
  describe '#all' do
    it 'show all bookmarks' do
      expect(bookmarks.all).to eq bookmarks.list
    end
  end
end
