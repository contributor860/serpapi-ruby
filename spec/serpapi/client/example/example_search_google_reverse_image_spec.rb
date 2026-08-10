require 'spec_helper'

describe 'example: google_reverse_image search' do
  it 'prints image_sizes' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_reverse_image', api_key: api_key)
    # run a search using serpapi service
    results = client.search({
      image_url: 'https://i.imgur.com/5bGzZi7.jpg'
    })
    expect(results[:image_sizes]).not_to be_nil, "No image sizes found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:image_sizes]
    # doc: https://serpapi.com/google-reverse-image
  end
end
