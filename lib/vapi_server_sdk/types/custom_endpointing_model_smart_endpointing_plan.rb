# frozen_string_literal: true
require_relative "custom_endpointing_model_smart_endpointing_plan_provider"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class CustomEndpointingModelSmartEndpointingPlan
  # @return [Vapi::CustomEndpointingModelSmartEndpointingPlanProvider] This is the provider for the smart endpointing plan. Use
#  `custom-endpointing-model` for custom endpointing providers that are not
#  natively supported.
    attr_reader :provider
  # @return [Vapi::Server] This is where the endpointing request will be sent. If not provided, will be
#  sent to `assistant.server`. If that does not exist either, will be sent to
#  `org.server`.
#  Request Example:
#  POST https://{server.url}
#  Content-Type: application/json
#  {
#  "message": {
#  "type": "call.endpointing.request",
#  "messages": [
#  {
#  "role": "user",
#  "message": "Hello, how are you?",
#  "time": 1234567890,
#  "secondsFromStart": 0
#  }
#  ],
#  ...other metadata about the call...
#  }
#  }
#  Response Expected:
#  {
#  "timeoutSeconds": 0.5
#  }
#  The timeout is the number of seconds to wait before considering the user's
#  speech as finished. The endpointing timeout is automatically reset each time a
#  new transcript is received (and another `call.endpointing.request` is sent).
    attr_reader :server
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::CustomEndpointingModelSmartEndpointingPlanProvider] This is the provider for the smart endpointing plan. Use
#  `custom-endpointing-model` for custom endpointing providers that are not
#  natively supported.
    # @param server [Vapi::Server] This is where the endpointing request will be sent. If not provided, will be
#  sent to `assistant.server`. If that does not exist either, will be sent to
#  `org.server`.
#  Request Example:
#  POST https://{server.url}
#  Content-Type: application/json
#  {
#  "message": {
#  "type": "call.endpointing.request",
#  "messages": [
#  {
#  "role": "user",
#  "message": "Hello, how are you?",
#  "time": 1234567890,
#  "secondsFromStart": 0
#  }
#  ],
#  ...other metadata about the call...
#  }
#  }
#  Response Expected:
#  {
#  "timeoutSeconds": 0.5
#  }
#  The timeout is the number of seconds to wait before considering the user's
#  speech as finished. The endpointing timeout is automatically reset each time a
#  new transcript is received (and another `call.endpointing.request` is sent).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomEndpointingModelSmartEndpointingPlan]
    def initialize(provider:, server: OMIT, additional_properties: nil)
      @provider = provider
      @server = server if server != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "server": server }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CustomEndpointingModelSmartEndpointingPlan
    #
    # @param json_object [String] 
    # @return [Vapi::CustomEndpointingModelSmartEndpointingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      unless parsed_json["server"].nil?
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      else
        server = nil
      end
      new(
        provider: provider,
        server: server,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomEndpointingModelSmartEndpointingPlan to a JSON
#  object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.provider.is_a?(Vapi::CustomEndpointingModelSmartEndpointingPlanProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
    end
  end
end