# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class OAuth2AuthenticationPlan
  # @return [String] This is the OAuth2 URL.
    attr_reader :url
  # @return [String] This is the OAuth2 client ID.
    attr_reader :client_id
  # @return [String] This is the OAuth2 client secret.
    attr_reader :client_secret
  # @return [String] This is the scope of the OAuth2 token.
    attr_reader :scope
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param url [String] This is the OAuth2 URL.
    # @param client_id [String] This is the OAuth2 client ID.
    # @param client_secret [String] This is the OAuth2 client secret.
    # @param scope [String] This is the scope of the OAuth2 token.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::OAuth2AuthenticationPlan]
    def initialize(url:, client_id:, client_secret:, scope: OMIT, additional_properties: nil)
      @url = url
      @client_id = client_id
      @client_secret = client_secret
      @scope = scope if scope != OMIT
      @additional_properties = additional_properties
      @_field_set = { "url": url, "clientId": client_id, "clientSecret": client_secret, "scope": scope }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OAuth2AuthenticationPlan
    #
    # @param json_object [String] 
    # @return [Vapi::OAuth2AuthenticationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      url = parsed_json["url"]
      client_id = parsed_json["clientId"]
      client_secret = parsed_json["clientSecret"]
      scope = parsed_json["scope"]
      new(
        url: url,
        client_id: client_id,
        client_secret: client_secret,
        scope: scope,
        additional_properties: struct
      )
    end
# Serialize an instance of OAuth2AuthenticationPlan to a JSON object
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
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.client_id.is_a?(String) != false || raise("Passed value for field obj.client_id is not the expected type, validation failed.")
      obj.client_secret.is_a?(String) != false || raise("Passed value for field obj.client_secret is not the expected type, validation failed.")
      obj.scope&.is_a?(String) != false || raise("Passed value for field obj.scope is not the expected type, validation failed.")
    end
  end
end