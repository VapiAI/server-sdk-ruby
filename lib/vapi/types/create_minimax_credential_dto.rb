# frozen_string_literal: true

module Vapi
  module Types
    class CreateMinimaxCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :group_id, -> { String }, optional: false, nullable: false, api_name: "groupId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
