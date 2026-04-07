# frozen_string_literal: true

module Vapi
  module Types
    class FunctionCall < Internal::Types::Model
      field :arguments, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
