# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating assistant model and voice synthesis requests with MiniMax, including the MiniMax
    # group identifier.
    class CreateMinimaxCredentialDto < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :group_id, -> { String }, optional: false, nullable: false, api_name: "groupId"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
