# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      class SimulationRunControllerCancelItemRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :item_id, -> { String }, optional: false, nullable: false, api_name: "itemId"
      end
    end
  end
end
