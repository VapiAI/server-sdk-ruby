# frozen_string_literal: true

module Vapi
  module Types
    class CallHookCallEnding < Internal::Types::Model
      field :on, -> { Vapi::Types::CallHookCallEndingOn }, optional: false, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::CallHookCallEndingDoItem] }, optional: false, nullable: false, api_name: "do"
      field :filters, -> { Internal::Types::Array[Vapi::Types::CallHookFilter] }, optional: true, nullable: false
    end
  end
end
