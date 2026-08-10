require 'spec_helper'

describe 'example: amazon search' do
  it 'prints organic_results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'amazon', api_key: api_key)
    # run a search using serpapi service
    results = client.search(
      k: 'coffee'
    )
    expect(results[:organic_results]).not_to be_nil, "No organic results found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:organic_results]
    # doc: https://serpapi.com/amazon-search-api
  end
end
