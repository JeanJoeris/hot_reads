require 'rails_helper'

RSpec.describe Api::V1::ReadsController do
  it "creates a read" do
    reading = {link_id: 1, link_url: "http://example.com", link_title: "foobar"}

    post :create, reading
    response_read = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(response_read[:link_id]).to eq(reading[:link_id])
    expect(response_read[:link_url]).to eq(reading[:link_url])
    expect(response_read[:link_title]).to eq(reading[:link_title])
    expect(response_read[:read_count]).to eq(1)
    expect(Read.count).to eq(1)
  end

  it "increments read count" do
    reading = {link_id: 2, link_url: "http://foo.com", link_title: "fasdfsad"}

    post :create, reading
    post :create, reading

    response_read = JSON.parse(response.body, symbolize_names: true)

    expect(response_read[:read_count]).to eq(2)
  end
end
