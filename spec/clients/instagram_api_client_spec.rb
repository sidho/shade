require 'rails_helper'

describe 'InstagramApiClient' do
  subject { InstagramApiClient.new }

  describe 'get_media' do
    let(:valid_user)   { ENV['TEST_INSTAGRAM_USER'] }
    let(:invalid_user) { 'clearlyafakeuser1293102209' }
    it 'should return OK' do
      response = subject.get_media(username: valid_user)
      expect(response.code).to be(200)
      expect(response['status']).to eq('ok')
    end

    it 'should raise a UserNotFound error if it cannot find the user' do
      expect { subject.get_media(username: invalid_user) }
          .to raise_error(InstagramError::UserNotFound, "Cannot find user: #{invalid_user}")
    end
  end
end