# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating Vapi integrations with Make, including team, region, and API key.
    class CreateMakeCredentialDto < Internal::Types::Model
      field :team_id, -> { String }, optional: false, nullable: false, api_name: "teamId"
      field :region, -> { String }, optional: false, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
