# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutputFilterDto < Internal::Types::Model
      field :eq, -> { String }, optional: true, nullable: false
      field :neq, -> { String }, optional: true, nullable: false
      field :gt, -> { String }, optional: true, nullable: false
      field :gte, -> { String }, optional: true, nullable: false
      field :lt, -> { String }, optional: true, nullable: false
      field :lte, -> { String }, optional: true, nullable: false
      field :contains, -> { String }, optional: true, nullable: false
      field :not_contains, -> { String }, optional: true, nullable: false, api_name: "notContains"
    end
  end
end
