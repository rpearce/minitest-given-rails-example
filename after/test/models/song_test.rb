require 'test_helper'

describe Song do
  Given(:artist) { Artist.create!(name: 'The Testers') }
  Given(:song) { artist.songs.new(title: 'Testing the Test') }

  Then { song.valid? }

  describe 'relationships' do
    Then { song.respond_to?(:artist) }
    And { assert_instance_of Artist, song.artist }
  end

  describe 'validations' do
    When { song.artist_id = nil }
    Then { song.invalid? }
    And { song.errors.keys.include?(:artist_id) }
  end
end

#describe Song do
#  let(:artist) { artists(:one) }
#  let(:song) { artist.songs.new(title: 'Testing the Test') }

#  it 'is a valid object' do
#    assert song.valid?
#  end

#  describe 'relationships' do
#    it 'belongs to artist' do
#      assert_respond_to song, :artist
#      assert_instance_of Artist, song.artist
#    end
#  end

#  describe 'validations' do
#    it 'must have an artist_id' do
#      song.artist_id = nil
#      refute song.valid?
#      assert song.errors.keys.include?(:artist_id)
#    end
#  end
#end
