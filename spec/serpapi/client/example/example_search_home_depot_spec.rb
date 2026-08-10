require 'spec_helper'

describe 'example: home_depot search' do
  it 'prints products' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'home_depot', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      q: 'table'
    })
    expect(results[:products]).not_to be_nil, "No products found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:products]
    # doc: https://serpapi.com/home-depot-search-api
  end
end
