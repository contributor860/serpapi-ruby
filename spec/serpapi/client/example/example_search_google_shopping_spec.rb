require 'spec_helper'

describe 'example: google_shopping search' do
  it 'prints shopping_results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_shopping', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      q: 'Macbook M4'
    })
    expect(results[:shopping_results]).not_to be_nil, "No shopping results found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:shopping_results]
    # doc: https://serpapi.com/google-shopping-api
  end
end
