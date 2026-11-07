# frozen_string_literal: true

module Vapi
  module Types
    class BoardItemPosition < Internal::Types::Model
      field :x, -> { Integer }, optional: false, nullable: false
      field :y, -> { Integer }, optional: false, nullable: false
    end
  end
end
