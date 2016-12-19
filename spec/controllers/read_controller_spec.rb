require 'rails_helper'

RSpec.describe Api::V1::ReadsController do
  it "creates a read" do
    read = {link_id: 1, link_url: "http://example.com", link_title: "foobar"}

    post :create, read

    response_read = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(response_read).to eq(read)
    expect(Read.count).to eq(1)
  end
end
