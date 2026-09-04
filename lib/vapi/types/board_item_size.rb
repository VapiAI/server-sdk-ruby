# frozen_string_literal: true

module Vapi
  module Types
    class BoardItemSize < Internal::Types::Model
      field :width, -> { Integer }, optional: false, nullable: false
      field :height, -> { Integer }, optional: false, nullable: false
    end
  end
end
