# frozen_string_literal: true

module Vapi
  module Types
    class BoardLayout < Internal::Types::Model
      field :columns, -> { Integer }, optional: false, nullable: false
    end
  end
end
