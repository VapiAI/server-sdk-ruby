# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating transcription requests with AssemblyAI.
    class CreateAssemblyAiCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
