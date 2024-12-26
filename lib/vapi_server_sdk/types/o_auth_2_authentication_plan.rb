# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class OAuth2AuthenticationPlan
    # @return [String]
    attr_reader :type
    # @return [String] This is the OAuth2 URL.
    attr_reader :url
    # @return [String] This is the OAuth2 client ID.
    attr_reader :client_id
    # @return [String] This is the OAuth2 client secret.
    attr_reader :client_secret
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param url [String] This is the OAuth2 URL.
    # @param client_id [String] This is the OAuth2 client ID.
    # @param client_secret [String] This is the OAuth2 client secret.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::OAuth2AuthenticationPlan]
    def initialize(type:, url:, client_id:, client_secret:, additional_properties: nil)
      @type = type
      @url = url
      @client_id = client_id
      @client_secret = client_secret
      @additional_properties = additional_properties
      @_field_set = { "type": type, "url": url, "clientId": client_id, "clientSecret": client_secret }
    end

    # Deserialize a JSON object to an instance of OAuth2AuthenticationPlan
    #
    # @param json_object [String]
    # @return [Vapi::OAuth2AuthenticationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      url = parsed_json["url"]
      client_id = parsed_json["clientId"]
      client_secret = parsed_json["clientSecret"]
      new(
        type: type,
        url: url,
        client_id: client_id,
        client_secret: client_secret,
        additional_properties: struct
      )
    end

    # Serialize an instance of OAuth2AuthenticationPlan to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.client_id.is_a?(String) != false || raise("Passed value for field obj.client_id is not the expected type, validation failed.")
      obj.client_secret.is_a?(String) != false || raise("Passed value for field obj.client_secret is not the expected type, validation failed.")
    end
  end
end
