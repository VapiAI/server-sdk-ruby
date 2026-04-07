# frozen_string_literal: true

module Vapi
  module Types
    class RelayCommandNote < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
