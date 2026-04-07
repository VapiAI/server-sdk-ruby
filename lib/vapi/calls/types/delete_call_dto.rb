# frozen_string_literal: true

module Vapi
  module Calls
    module Types
      class DeleteCallDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
