# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      class SimulationRunControllerGenerateSuggestionsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :item_id, -> { String }, optional: false, nullable: false, api_name: "itemId"
        field :force, -> { String }, optional: false, nullable: false
        field :persist, -> { String }, optional: true, nullable: false
      end
    end
  end
end
