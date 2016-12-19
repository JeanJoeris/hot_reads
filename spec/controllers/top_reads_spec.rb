require 'rails_helper'

RSpec.describe Api::V1::ReadsController do
  it "displays top reads in order" do
    Read.create(link_id: 3, link_url: "http://google.com", link_title: "Best website you have never heard of")
    Read.create(link_id: 3, link_url: "http://google.com", link_title: "Best website you have never heard of")
    Read.create(link_id: 3, link_url: "http://google.com", link_title: "Best website you have never heard of")

    post :create, read

    response_read = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(response_read).to eq(read)
    expect(Read.count).to eq(1)
  end

  it "only returns top ten reads" do
    
  end
end
