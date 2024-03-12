require "rails_helper"

RSpec.describe 'Creating new attachment' do
  include ActionDispatch::TestProcess::FixtureFile

  it 'creates a new record in the DB for the first user' do
    expect(User.all).to be_empty
    patch user_path(User.last),
          params: { user: { attachment: file_fixture_upload('test.jpg', 'image/jpeg') } }
    expect(User.last.attachments).to be_attached
  end

  it 'redirects to homepage with a success message including the url' do
    patch user_path(User.last),
          params: { user: { attachment: file_fixture_upload('test.jpg', 'image/jpeg') } }
    expect(response).to redirect_to(root_path)
    follow_redirect!
    expect(response.body).to include('>this url</a>')
  end
end
