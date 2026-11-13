# frozen_string_literal: true

module Vapi
  module Types
    # Lists backup voice configurations that can be used if the primary voice provider fails.
    class FallbackPlan < Internal::Types::Model
      field :voices, -> { Internal::Types::Array[Vapi::Types::FallbackPlanVoicesItem] }, optional: false, nullable: false
    end
  end
end
