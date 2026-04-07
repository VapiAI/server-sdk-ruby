# frozen_string_literal: true

module Vapi
  module Types
    class JwtResponse < Internal::Types::Model
      field :access_token, -> { String }, optional: false, nullable: false, api_name: "accessToken"
      field :aud, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
