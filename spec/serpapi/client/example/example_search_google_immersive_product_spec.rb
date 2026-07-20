require 'spec_helper'

describe 'example: google_immersive_product search' do
  it 'prints product_results' do
    # Confirm that the environment variable for SERPAPI_KEY has been set properly.
    #  Your SerpApi key can be obtained at this URL http://serpapi.com
    api_key = ENV['SERPAPI_KEY']
    skip('SERPAPI_KEY not set. Please set your SerpApi API key.') if api_key.nil?

    # Find an immersive product token in Google Shopping results
    shopping_client = SerpApi::Client.new(engine: 'google_shopping', api_key: api_key)
    shopping_results = shopping_client.search({ q: 'coffee maker' })
    product = shopping_results[:shopping_results].find { |result| result[:immersive_product_page_token] }
    page_token = product[:immersive_product_page_token]

    # Fetch the selected product's details
    product_client = SerpApi::Client.new(engine: 'google_immersive_product', api_key: api_key)
    product_results = product_client.search({ page_token: page_token })
    expect(product_results[:product_results]).not_to be_nil, "No product results found! keys available: #{product_results.keys}"

    # print the output of the response in formatted JSON
    # pp product_results[:product_results]
    # doc: https://serpapi.com/google-immersive-product-api
  end
end
