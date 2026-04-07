# frozen_string_literal: true

module Vapi
  module Types
    class UpdateDeepgramCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
      field :api_url, -> { String }, optional: true, nullable: false, api_name: "apiUrl"
    end
  end
end
