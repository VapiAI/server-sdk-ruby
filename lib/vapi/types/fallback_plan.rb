# frozen_string_literal: true

module Vapi
  module Types
    class FallbackPlan < Internal::Types::Model
      field :voices, -> { Internal::Types::Array[Vapi::Types::FallbackPlanVoicesItem] }, optional: false, nullable: false
    end
  end
end
