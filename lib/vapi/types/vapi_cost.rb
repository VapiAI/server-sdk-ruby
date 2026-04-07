# frozen_string_literal: true

module Vapi
  module Types
    class VapiCost < Internal::Types::Model
      field :sub_type, -> { Vapi::Types::VapiCostSubType }, optional: false, nullable: false, api_name: "subType"
      field :minutes, -> { Integer }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
