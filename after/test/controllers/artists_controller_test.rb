require 'test_helper'

describe ArtistsController do
  Given!(:artist) { artists(:one) }

  describe 'GET #index' do
    context 'HTML request' do
      When { get :index }
      Then { assert_response :success }
    end

    context 'JSON request' do
      When { get :index, format: :json }
      Then { assert_response :success }
    end
  end

  describe 'GET #new' do
    When { get :new }
    Then { assert_response :success }
  end

  describe 'GET #edit' do
    When { get :edit, id: artist }
    Then { assert_response :success }
  end

  describe 'GET #show' do
    context 'HTML request' do
      When { get :show, id: artist }
      Then { assert_response :success }
    end

    context 'JSON request' do
      When { get :show, id: artist, format: :json }
      Then { assert_response :success }
    end
  end

  describe 'POST #create' do
    context 'HTML request' do
      context 'with valid attributes' do
        When {
          assert_difference('Artist.count', 1) do
            post :create, artist: { name: 'Nickelback' }
          end
        }
        Then { assert_redirected_to artist_path(assigns(:artist)) }
      end

      context 'with invalid attributes' do
        When {
          assert_no_difference('Artist.count') do
            post :create, artist: { name: '' }
          end
        }
        Then { assert_template :new }
      end
    end

    context 'JSON request' do
      context 'with valid attributes' do
        When {
          assert_difference('Artist.count', 1) do
            post :create, artist: { name: 'Nickelback' }, format: :json
          end
        }
        Then { response.status == 201 }
      end

      context 'with invalid attributes' do
        When {
          assert_no_difference('Artist.count') do
            post :create, artist: { name: '' }, format: :json
          end
        }
        Then { response.status == 422 }
      end
    end
  end

  describe 'PATCH #update' do
    context 'HTML request' do
      context 'with valid attributes' do
        Given!(:old_name) { artist.name }
        Given!(:old_bio) { artist.bio }
        Given(:new_name) { 'Creed' }
        Given(:new_bio) { "We're all like in my own prison, man" }
        When {
          patch :update, id: artist, artist: { name: new_name, bio: new_bio }
          artist.reload
        }
        Then { artist.name != old_name }
        And { artist.bio != old_bio }
        And { new_name == artist.name }
        And { new_bio == artist.bio }
        And { assert_redirected_to artist_path(artist) }
      end

      context 'with invalid attributes' do
        Given!(:old_name) { artist.name }
        Given(:new_name) { '' }
        When {
          patch :update, id: artist, artist: { name: new_name }
          artist.reload
        }
        Then { artist.name != new_name }
        And { old_name == artist.name }
        And { assert_template :edit }
      end
    end

    context 'JSON request' do
      context 'with valid attributes' do
        Given!(:old_name) { artist.name }
        Given!(:old_bio) { artist.bio }
        Given(:new_name) { 'Creed' }
        Given(:new_bio) { "We're all like in my own prison, man" }
        When {
          patch :update, id: artist, artist: { name: new_name, bio: new_bio }, format: :json
          artist.reload
        }
        Then { artist.name != old_name }
        And { artist.bio != old_bio }
        And { new_name == artist.name }
        And { new_bio == artist.bio }
        And { response.status == 200 }
      end

      context 'with invalid attributes' do
        Given!(:old_name) { artist.name }
        Given(:new_name) { '' }
        When {
          patch :update, id: artist, artist: { name: new_name }, format: :json
          artist.reload
        }
        Then { artist.name != new_name }
        And { artist.name == old_name }
        And { response.status == 422 }
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'HTML request' do
      When {
        assert_difference('Artist.count', -1) do
          delete :destroy, id: artist
        end
      }
      Then { assert_redirected_to artists_path }
    end

    context 'JSON request' do
      When {
        assert_difference('Artist.count', -1) do
          delete :destroy, id: artist, format: :json
        end
      }
      Then { response.status == 204 }
    end
  end
end

#describe ArtistsController do
#  let!(:artist) { artists(:one) }

#  describe 'GET #index' do
#    context 'HTML request' do
#      it 'is successful' do
#        get :index
#        assert_response :success
#      end
#    end

#    context 'JSON request' do
#      it 'is successful' do
#        get :index, format: :json
#        assert_response :success
#      end
#    end
#  end

#  describe 'GET #new' do
#    it 'is successful' do
#      get :new
#      assert_response :success
#    end
#  end

#  describe 'GET #edit' do
#    it 'is successful' do
#      get :edit, id: artist
#      assert_response :success
#    end
#  end

#  describe 'GET #show' do
#    context 'HTML request' do
#      it 'is successful' do
#        get :show, id: artist
#        assert_response :success
#      end
#    end

#    context 'JSON request' do
#      it 'is successful' do
#        get :show, id: artist, format: :json
#        assert_response :success
#      end
#    end
#  end

# describe 'POST #create' do
#   context 'HTML request' do
#     context 'with valid attributes' do
#       it 'creates and redirects'
#         assert_difference('Artist.count', 1) do
#           post :create, artist: { name: 'Nickelback' }
#         end
#         assert_redirected_to artist_path(assigns(:artist))
#       end
#     end
#
#     context 'with invalid attributes' do
#       it 'renders the new template' do
#         assert_no_difference('Artist.count') do
#           post :create, artist: { name: '' }
#         end
#         assert_template :new
#       end
#     end
#   end
#
#   context 'JSON request' do
#     context 'with valid attributes' do
#       it 'creates and redirects' do
#         assert_difference('Artist.count', 1) do
#           post :create, artist: { name: 'Nickelback' }, format: :json
#         end
#         assert_equal 201, response.status
#       end
#     end
#
#     context 'with invalid attributes' do
#       it 'returns 422' do
#         assert_no_difference('Artist.count') do
#           post :create, artist: { name: '' }, format: :json
#         end
#         assert_equal 422, response.status
#       end
#     end
#   end
# end

#  describe 'PATCH #update' do
#    context 'HTML request' do
#      context 'with valid attributes' do
#        it 'updates and redirects' do
#          old_name = artist.name
#          old_bio = artist.bio
#          new_name = 'Creed'
#          new_bio = "We're all like in my own prison, man"
#          patch :update, id: artist, artist: { name: new_name, bio: new_bio }
#          artist.reload
#          refute artist.name == old_name
#          refute artist.bio == old_bio
#          assert_equal new_name, artist.name
#          assert_equal new_bio, artist.bio
#          assert_redirected_to artist_path(artist)
#        end
#      end

#      context 'with invalid attributes' do
#        it 'renders the edit template' do
#          old_name = artist.name
#          new_name = ''
#          patch :update, id: artist, artist: { name: new_name }
#          artist.reload
#          refute artist.name == new_name
#          assert_equal old_name, artist.name
#          assert_template :edit
#        end
#      end
#    end

#    context 'JSON request' do
#      context 'with valid attributes' do
#        it 'updates and returns 200' do
#          old_name = artist.name
#          old_bio = artist.bio
#          new_name = 'Creed'
#          new_bio = "We're all like in my own prison, man"
#          patch :update, id: artist, artist: { name: new_name, bio: new_bio }, format: :json
#          artist.reload
#          refute artist.name == old_name
#          refute artist.bio == old_bio
#          assert_equal new_name, artist.name
#          assert_equal new_bio, artist.bio
#          assert_equal 200, response.status
#        end
#      end

#      context 'with invalid attributes' do
#        it 'returns 422' do
#          old_name = artist.name
#          new_name = ''
#          patch :update, id: artist, artist: { name: new_name }, format: :json
#          artist.reload
#          refute artist.name == new_name
#          assert_equal old_name, artist.name
#          assert_equal 422, response.status
#        end
#      end
#    end
#  end

#  describe 'DELETE #destroy' do
#    before do

#    end
#    context 'HTML request' do
#      it 'destroys and redirects' do
#        assert_difference('Artist.count', -1) do
#          delete :destroy, id: artist
#        end
#        assert_redirected_to artists_path
#      end
#    end

#    context 'JSON request' do
#      it 'destroys and returns 204' do
#        assert_difference('Artist.count', -1) do
#          delete :destroy, id: artist, format: :json
#        end
#        assert_equal 204, response.status
#      end
#    end
#  end
#end
