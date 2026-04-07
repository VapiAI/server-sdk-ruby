# frozen_string_literal: true

module Vapi
  module Types
    class SessionCreatedHook < Internal::Types::Model
      field :on, -> { Vapi::Types::SessionCreatedHookOn }, optional: false, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::ToolCallHookAction] }, optional: false, nullable: false, api_name: "do"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
