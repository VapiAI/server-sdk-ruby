# frozen_string_literal: true

module Vapi
  module Types
    class RelayRequest < Internal::Types::Model
      field :source, -> { String }, optional: false, nullable: false
      field :target, -> { Vapi::Types::RelayRequestTarget }, optional: false, nullable: false
      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"
      field :commands, -> { Internal::Types::Array[Vapi::Types::RelayRequestCommandsItem] }, optional: false, nullable: false
    end
  end
end
