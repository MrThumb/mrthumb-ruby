# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Mrthumb::Client do
  let(:configuration) do
    Mrthumb::Configuration.new(
      access_id: 'XX',
      secret_id: 'ZZ'
    )
  end

  let(:client) do
    Mrthumb::Client.new(configuration)
  end

  describe '.create_image' do
    let(:url) { 'http://sample.com/image' }

    let(:transformations) do
      {
        resize: {
          height: 200
        }
      }
    end

    let!(:request_stub) do
      stub_request(:post, 'http://localhost:3000/api/v1/images')
        .with(
          body: {
            image: {
              url: url,
              transformations: transformations
            }
          }.to_json,
          headers: {
            'Content-Type' => 'application/json',
            'Authorization' => /^APIAuth XX:(.+)$/
          }
        )
        .to_return(
          body: '',
          status: 200
        )
    end

    it 'performs the stubbed request' do
      client.create_image(url: url, transformations: transformations)

      expect(request_stub).to have_been_requested
    end
  end
end
