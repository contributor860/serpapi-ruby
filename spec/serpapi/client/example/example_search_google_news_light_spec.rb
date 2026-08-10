require 'spec_helper'

describe 'example: google_news_light search' do
  it 'prints news_results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_news_light', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      q: 'pizza'
    })
    expect(results[:news_results]).not_to be_nil, "No news results found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:news_results]
    # doc: https://serpapi.com/google-news-light-api
  end
end
