# frozen_string_literal: true

module Vapi
  module Types
    class CreateTestSuiteRunDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
