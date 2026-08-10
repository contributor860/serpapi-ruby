require 'spec_helper'

describe 'example: naver search' do
  it 'prints ads_results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'naver', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      query: 'coffee'
    })
    expect(results[:ads_results]).not_to be_nil, "No ads results found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:ads_results]
    # doc: https://serpapi.com/naver-search-api
  end
end
