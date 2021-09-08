require 'rails_helper'

RSpec.describe ::UsersController, type: :request do
  it 'be expected values' do
    # post "/user/new", params => { :widget => {:name => "My Widget"} }
    post "/user/new", params => { }
    expect(response).to render_template(:new)
    expect(response.body).to include('{ "status": 200 }')
  end
end
