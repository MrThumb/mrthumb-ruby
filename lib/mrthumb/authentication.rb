# frozen_string_literal: true
module Mrthumb
  module Authentication
    def authenticate!(request, configuration)
      ApiAuth.sign!(request, configuration.access_id, configuration.secret_id)
    end
  end
end
