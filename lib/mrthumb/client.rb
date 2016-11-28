# frozen_string_literal: true
require_relative 'authentication'
require_relative 'http'

module Mrthumb
  class Client
    include HTTP
    include Authentication

    HOST = 'http://localhost:3000/'

    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def create_image(url:, transformations:)
      request = create_request(
        path: '/api/v1/images',
        params: {
          image: {
            url: url,
            transformations: transformations
          }
        }
      )

      authenticate!(request, configuration)

      perform_request(host: HOST, request: request)
    end
  end
end
