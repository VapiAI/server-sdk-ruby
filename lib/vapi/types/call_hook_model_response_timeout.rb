# frozen_string_literal: true

module Vapi
  module Types
    class CallHookModelResponseTimeout < Internal::Types::Model
      field :on, -> { Vapi::Types::CallHookModelResponseTimeoutOn }, optional: false, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::CallHookModelResponseTimeoutDoItem] }, optional: false, nullable: false, api_name: "do"
    end
  end
end
