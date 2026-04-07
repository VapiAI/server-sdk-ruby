# frozen_string_literal: true

module Vapi
  module Types
    class StructuredDataMultiPlan < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :plan, -> { Vapi::Types::StructuredDataPlan }, optional: false, nullable: false
    end
  end
end
