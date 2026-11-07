# frozen_string_literal: true

module Vapi
  module Board
    module Types
      class BoardControllerRemoveRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
