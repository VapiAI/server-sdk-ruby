# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for using LiveKit smart endpointing, including provider selection and wait-function behavior.
    class LivekitSmartEndpointingPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::LivekitSmartEndpointingPlanProvider }, optional: false, nullable: false
      field :wait_function, -> { String }, optional: true, nullable: false, api_name: "waitFunction"
    end
  end
end
