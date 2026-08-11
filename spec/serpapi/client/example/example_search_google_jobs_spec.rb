require 'spec_helper'

describe 'example: google_jobs search' do
  it 'prints jobs_results' do
    # initialize the serp api client
    client = SerpApi::Client.new(engine: 'google_jobs', api_key: api_key)
    # run a search using serpapi service
    results = client.search(
      q: 'coffee'
    )
    expect(results[:jobs_results]).not_to be_nil, "No jobs results found! keys available: #{results.keys}"

    # print the output of the response in formatted JSON
    # pp results[:jobs_results]
    # doc: https://serpapi.com/google-jobs-api
  end
end
