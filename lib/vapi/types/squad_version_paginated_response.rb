# frozen_string_literal: true

module Vapi
  module Types
    class SquadVersionPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::SquadVersion] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::SquadVersionPaginatedMetadata }, optional: false, nullable: false
    end
  end
end
