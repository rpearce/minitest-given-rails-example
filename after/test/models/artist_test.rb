require 'test_helper'

describe Artist do
  Given(:artist) { Artist.new(name: 'The Testers') }
  Then { artist.valid? }

  describe 'relationships' do
    Then { artist.respond_to?(:songs) }
    And { assert_instance_of Song, artist.songs.new }
  end

  describe 'validations' do
    When { artist.name = '' }
    Then { artist.invalid? }
    And { artist.errors.keys.include?(:name) }
  end
end

#describe Artist do
#  let(:artist) { Artist.new(name: 'The Testers') }

#  it 'is a valid object' do
#    assert artist.valid?
#  end

#  describe 'relationships' do
#    it 'has many songs' do
#      assert_respond_to artist, :songs
#      assert_instance_of Song, artist.songs.new
#    end
#  end

#  describe 'validations' do
#    it 'must have a name' do
#      artist.name = ''
#      refute artist.valid?
#      assert artist.errors.keys.include?(:name)
#    end
#  end
#end
