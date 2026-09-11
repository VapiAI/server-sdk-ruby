# frozen_string_literal: true

module Vapi
  module Types
    class MinMessagesCondition < Internal::Types::Model
      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
