# frozen_string_literal: true

module Vapi
  module Types
    class UpdateMakeCredentialDto < Internal::Types::Model
      field :team_id, -> { String }, optional: true, nullable: false, api_name: "teamId"
      field :region, -> { String }, optional: true, nullable: false
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
