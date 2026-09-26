# frozen_string_literal: true

module Vapi
  module Types
    class ModelDeprecationNotice < Internal::Types::Model
      field :slot, -> { String }, optional: false, nullable: false
      field :provider, -> { String }, optional: false, nullable: false
      field :model, -> { String }, optional: false, nullable: false
      field :deprecation_date, -> { String }, optional: false, nullable: false, api_name: "deprecationDate"
      field :retirement_date, -> { String }, optional: false, nullable: false, api_name: "retirementDate"
      field :replacement_model, -> { String }, optional: false, nullable: false, api_name: "replacementModel"
    end
  end
end
