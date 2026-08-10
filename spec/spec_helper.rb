# code coverage
require 'simplecov'
SimpleCov.add_filter '/spec/'
SimpleCov.start

require 'benchmark'
require 'http'

# load libary
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'serpapi'

module SerpApiSpecHelpers
  def api_key
    ENV.fetch('SERPAPI_KEY') do
      fail('Missing ENV SERPAPI_KEY. Get your SerpApi API key at https://serpapi.com.')
    end
  end
end

RSpec.configure do |config|
  config.include SerpApi
  config.include SerpApiSpecHelpers

  config.before(:each) do
    api_key
  end
end

