# frozen_string_literal: true
module Mrthumb
  class Configuration
    attr_reader :access_id, :secret_id

    def initialize(access_id:, secret_id:)
      @access_id = access_id
      @secret_id = secret_id
    end
  end
end
