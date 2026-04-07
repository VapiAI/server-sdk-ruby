# frozen_string_literal: true

module Vapi
  module Types
    class RelayTargetSquad < Internal::Types::Model
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad_name, -> { String }, optional: true, nullable: false, api_name: "squadName"
    end
  end
end
