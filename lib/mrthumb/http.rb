# frozen_string_literal: true
require 'json'

module Mrthumb
  module HTTP
    def create_request(path:, params:)
      request = Net::HTTP::Post.new(path)

      request.body = params.to_json
      request['Content-Type'] = 'application/json'

      request
    end

    def perform_request(host:, request:)
      uri = URI.parse(host)

      Net::HTTP
        .new(uri.host, uri.port)
        .request(request)
        .response
        .body
    end
  end
end
