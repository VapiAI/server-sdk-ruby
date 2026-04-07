# frozen_string_literal: true

module Vapi
  module Types
    class AwsStsAuthenticationArtifact < Internal::Types::Model
      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"
    end
  end
end
