# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTestSuiteRunDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
