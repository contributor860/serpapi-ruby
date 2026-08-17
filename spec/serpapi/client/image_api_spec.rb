require 'spec_helper'
require 'stringio'
require 'tempfile'

describe 'Image API' do
  let(:response) do
    double(
      status: 200,
      body: '{"message":"Image uploaded successfully.","image_id":"test-image-id"}'
    )
  end
  let(:socket) { double }
  let(:client) { SerpApi::Client.new(api_key: api_key) }

  before do
    allow(HTTP).to receive(:persistent).and_return(socket)
    allow(response).to receive(:flush)
  end

  it 'uploads an image from a file path' do
    Tempfile.create(['image', '.png']) do |image|
      expect(socket).to receive(:post) do |endpoint, options|
        uploaded_image = options[:form][:image]

        expect(endpoint).to eq('/image')
        expect(uploaded_image.filename).to end_with('.png')
        response
      end

      result = client.upload_image(image.path)

      expect(result[:message]).to eq('Image uploaded successfully.')
      expect(result[:image_id]).to eq('test-image-id')
    end
  end

  it 'uploads an image from an IO object' do
    image = StringIO.new('image data')

    expect(socket).to receive(:post) do |endpoint, options|
      expect(endpoint).to eq('/image')
      response
    end

    expect(client.upload_image(image)[:image_id]).to eq('test-image-id')
  end
end
