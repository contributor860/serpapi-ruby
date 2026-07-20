require 'spec_helper'

describe 'example: google_ai_mode search' do
  it 'prints reconstructed_markdown' do
    # Confirm that the environment variable for SERPAPI_KEY has been set properly.
    # Your SerpApi key can be obtained at this URL: https://serpapi.com
    api_key = ENV['SERPAPI_KEY']
    skip('SERPAPI_KEY not set. Please set your SerpApi API key.') if api_key.nil?

    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_ai_mode', api_key: api_key)
    # run a search using serpapi service
    results = client.search({ q: 'best coffee maker' })
    expect(results[:reconstructed_markdown]).not_to be_nil, "No reconstructed markdown found! keys available: #{results.keys}"

    # print the output of the response in formatted Markdown
    # pp results[:reconstructed_markdown]
    # doc: https://serpapi.com/google-ai-mode-api
  end
end
