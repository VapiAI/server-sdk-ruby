# frozen_string_literal: true

module Vapi
  module Types
    class GenerateScenariosDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
    end
  end
end
