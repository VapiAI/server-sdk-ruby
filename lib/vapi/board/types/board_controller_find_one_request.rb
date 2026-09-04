# frozen_string_literal: true

module Vapi
  module Board
    module Types
      class BoardControllerFindOneRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
