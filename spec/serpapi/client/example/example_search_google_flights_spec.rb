require 'date'
require 'spec_helper'

describe 'example: google_flights search' do
  it 'prints flight results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_flights', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      departure_id: 'LAX',
      arrival_id: 'AUS',
      outbound_date: (Date.today + 30).iso8601,
      return_date: (Date.today + 37).iso8601
    })
    flights = results[:best_flights] || results[:other_flights]
    expect(flights).not_to be_nil, "No flights found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp flights
    # doc: https://serpapi.com/google-flights-api
  end
end
