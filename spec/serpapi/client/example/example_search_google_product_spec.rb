require 'spec_helper'

describe 'example: google_product search' do
  it 'prints product_results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_product', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      q: 'coffee',
      product_id: '4887235756540435899'
    })
    expect(results[:product_results]).not_to be_nil, "No product results found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:product_results]
    # doc: https://serpapi.com/google-product-api
  end
end
