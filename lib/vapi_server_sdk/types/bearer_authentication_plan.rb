# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class BearerAuthenticationPlan
    # @return [String] This is the bearer token value.
    attr_reader :token
    # @return [String] This is the header name where the bearer token will be sent. Defaults to
    #  'Authorization'.
    attr_reader :header_name
    # @return [Boolean] Whether to include the 'Bearer ' prefix in the header value. Defaults to true.
    attr_reader :bearer_prefix_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param token [String] This is the bearer token value.
    # @param header_name [String] This is the header name where the bearer token will be sent. Defaults to
    #  'Authorization'.
    # @param bearer_prefix_enabled [Boolean] Whether to include the 'Bearer ' prefix in the header value. Defaults to true.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BearerAuthenticationPlan]
    def initialize(token:, header_name: OMIT, bearer_prefix_enabled: OMIT, additional_properties: nil)
      @token = token
      @header_name = header_name if header_name != OMIT
      @bearer_prefix_enabled = bearer_prefix_enabled if bearer_prefix_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "token": token,
        "headerName": header_name,
        "bearerPrefixEnabled": bearer_prefix_enabled
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of BearerAuthenticationPlan
    #
    # @param json_object [String]
    # @return [Vapi::BearerAuthenticationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      token = parsed_json["token"]
      header_name = parsed_json["headerName"]
      bearer_prefix_enabled = parsed_json["bearerPrefixEnabled"]
      new(
        token: token,
        header_name: header_name,
        bearer_prefix_enabled: bearer_prefix_enabled,
        additional_properties: struct
      )
    end

    # Serialize an instance of BearerAuthenticationPlan to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.token.is_a?(String) != false || raise("Passed value for field obj.token is not the expected type, validation failed.")
      obj.header_name&.is_a?(String) != false || raise("Passed value for field obj.header_name is not the expected type, validation failed.")
      obj.bearer_prefix_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.bearer_prefix_enabled is not the expected type, validation failed.")
    end
  end
end
