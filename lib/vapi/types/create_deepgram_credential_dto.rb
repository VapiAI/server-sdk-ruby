# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating speech recognition and voice synthesis requests with Deepgram, with an optional API
    # URL for an on-premises instance.
    class CreateDeepgramCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :api_url, -> { String }, optional: true, nullable: false, api_name: "apiUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
