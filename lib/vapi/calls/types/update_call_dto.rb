# frozen_string_literal: true

module Vapi
  module Calls
    module Types
      class UpdateCallDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
      end
    end
  end
end
