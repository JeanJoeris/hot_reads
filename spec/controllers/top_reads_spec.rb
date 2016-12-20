require 'rails_helper'

RSpec.describe Api::V1::ReadsController do
  it "displays top reads in order" do
    Read.create(link_id: 3, link_url: "http://google.com", link_title: "Best website you have never heard of", read_count: 4)
    Read.create(link_id: 3, link_url: "http://xkcd.com", link_title: "Great comic", read_count: 2)
    Read.create(link_id: 3, link_url: "http://4chan.org", link_title: "Stay away", read_count: 1)

    get :index

    response_reads = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(response_reads.count).to eq(3)
    expect(response_reads.first[:link_title]).to eq("Best website you have never heard of")
    expect(response_reads.last[:link_title]).to eq("Stay away")
  end

  it "only returns top ten reads" do
    11.times do |i|
      Read.create(link_id: i, link_url: "http://xkcd.com", link_title: "Great comic", read_count: 2)
    end

    get :index
    response_reads = JSON.parse(response.body, symbolize_names: true)

    expect(response_reads.count).to eq(10)
  end

  it "only returns reads from past 24 hours days" do
    Read.create(link_id: 1, link_url: "http://xkcd.com", link_title: "Great comic", read_count: 2, updated_at: 30.hours.ago)
    Read.create(link_id: 2, link_url: "http://xkcd.com", link_title: "Great comic", read_count: 2, updated_at: 23.hours.ago)

    get :index
    response_reads = JSON.parse(response.body, symbolize_names: true)

    expect(response_reads.count).to eq(1)
  end
end
