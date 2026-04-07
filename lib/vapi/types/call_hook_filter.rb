# frozen_string_literal: true

module Vapi
  module Types
    class CallHookFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::CallHookFilterType }, optional: false, nullable: false
      field :key, -> { String }, optional: false, nullable: false
      field :one_of, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "oneOf"
    end
  end
end
