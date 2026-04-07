# frozen_string_literal: true

module Vapi
  module Types
    class CallHookCustomerSpeechTimeout < Internal::Types::Model
      field :on, -> { String }, optional: false, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::CallHookCustomerSpeechTimeoutDoItem] }, optional: false, nullable: false, api_name: "do"
      field :options, -> { Vapi::Types::CustomerSpeechTimeoutOptions }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
