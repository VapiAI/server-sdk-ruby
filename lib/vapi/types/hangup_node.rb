# frozen_string_literal: true

module Vapi
  module Types
    class HangupNode < Internal::Types::Model
      field :type, -> { Vapi::Types::HangupNodeType }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :is_start, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isStart"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
