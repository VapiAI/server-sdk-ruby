# frozen_string_literal: true

module Vapi
  module Types
    class ChatCostsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ModelCost }, key: "MODEL"
      member -> { Vapi::Types::ChatCost }, key: "CHAT"
    end
  end
end
