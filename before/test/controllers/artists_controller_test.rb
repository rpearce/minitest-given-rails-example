require 'test_helper'

describe ArtistsController do
  let(:artist) { artists(:one) }

  describe 'GET #index' do
    context 'HTML request' do
      it 'is successful' do
        get :index
        assert_response :success
      end
    end

    context 'JSON request' do
      it 'is successful' do
        get :index, format: :json
        assert_response :success
      end
    end
  end

  describe 'GET #new' do
    it 'is successful' do
      get :new
      assert_response :success
    end
  end

  describe 'GET #edit' do
    it 'is successful' do
      get :edit, id: artist
      assert_response :success
    end
  end

  describe 'GET #show' do
    context 'HTML request' do
      it 'is successful'
    end

    context 'JSON request' do
      it 'is successful' do
        get :show, id: artist, format: :json
        assert_response :success
      end
    end
  end

  describe 'POST #create' do
    context 'HTML request' do
      context 'with valid attributes' do
        it 'creates and redirects'
      end

      context 'with invalid attributes' do
        it 'renders the new template'
      end
    end

    context 'JSON request' do
      context 'with valid attributes' do
        it 'creates and returns 201'
      end

      context 'with invalid attributes' do
        it 'returns 422'
      end
    end
  end

  describe 'PATCH #update' do
    context 'HTML request' do
      context 'with valid attributes' do
        it 'updates and redirects' do
          old_name = artist.name
          old_bio = artist.bio
          new_name = 'Creed'
          new_bio = "We're all like in my own prison, man"
          patch :update, id: artist, artist: { name: new_name, bio: new_bio }
          artist.reload
          refute artist.name == old_name
          refute artist.bio == old_bio
          assert_equal new_name, artist.name
          assert_equal new_bio, artist.bio
          assert_redirected_to artist_path(artist)
        end
      end

      context 'with invalid attributes' do
        it 'renders the edit template' do
          old_name = artist.name
          new_name = ''
          patch :update, id: artist, artist: { name: new_name }
          artist.reload
          refute artist.name == new_name
          assert_equal old_name, artist.name
          assert_template :edit
        end
      end
    end

    context 'JSON request' do
      context 'with valid attributes' do
        it 'updates and returns 200' do
          old_name = artist.name
          old_bio = artist.bio
          new_name = 'Creed'
          new_bio = "We're all like in my own prison, man"
          patch :update, id: artist, artist: { name: new_name, bio: new_bio }, format: :json
          artist.reload
          refute artist.name == old_name
          refute artist.bio == old_bio
          assert_equal new_name, artist.name
          assert_equal new_bio, artist.bio
          assert_equal 200, response.status
        end
      end

      context 'with invalid attributes' do
        it 'returns 422' do
          old_name = artist.name
          new_name = ''
          patch :update, id: artist, artist: { name: new_name }, format: :json
          artist.reload
          refute artist.name == new_name
          assert_equal old_name, artist.name
          assert_equal 422, response.status
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    before do

    end
    context 'HTML request' do
      it 'destroys and redirects' do
        assert_difference('Artist.count', -1) do
          delete :destroy, id: artist
        end
        assert_redirected_to artists_path
      end
    end

    context 'JSON request' do
      it 'destroys and returns 204' do
        assert_difference('Artist.count', -1) do
          delete :destroy, id: artist, format: :json
        end
        assert_equal 204, response.status
      end
    end
  end
end
