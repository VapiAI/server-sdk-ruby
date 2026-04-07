# frozen_string_literal: true

module Vapi
  module Types
    class VapiSipTransportMessage < Internal::Types::Model
      field :sip_verb, -> { Vapi::Types::VapiSipTransportMessageSipVerb }, optional: false, nullable: false, api_name: "sipVerb"
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :body, -> { String }, optional: true, nullable: false
    end
  end
end
