require 'spec_helper'

describe 'example: google_trends search' do
  it 'prints interest_over_time' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_trends', api_key: api_key)
    # run a search using serpapi service
    results = client.search(
      q: 'coffee,milk,bread,pasta,steak',
      data_type: 'TIMESERIES'
    )
    expect(results[:interest_over_time]).not_to be_nil, "No interest over time found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:interest_over_time]
    # doc: https://serpapi.com/google-trends-api
  end
end
