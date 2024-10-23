# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Server
    # @return [Float] This is the timeout in seconds for the request to your server. Defaults to 20
    #  seconds.
    #  @default 20
    attr_reader :timeout_seconds
    # @return [String] API endpoint to send requests to.
    attr_reader :url
    # @return [String] This is the secret you can set that Vapi will send with every request to your
    #  server. Will be sent as a header called x-vapi-secret.
    #  Same precedence logic as server.
    attr_reader :secret
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timeout_seconds [Float] This is the timeout in seconds for the request to your server. Defaults to 20
    #  seconds.
    #  @default 20
    # @param url [String] API endpoint to send requests to.
    # @param secret [String] This is the secret you can set that Vapi will send with every request to your
    #  server. Will be sent as a header called x-vapi-secret.
    #  Same precedence logic as server.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Server]
    def initialize(url:, timeout_seconds: OMIT, secret: OMIT, additional_properties: nil)
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @url = url
      @secret = secret if secret != OMIT
      @additional_properties = additional_properties
      @_field_set = { "timeoutSeconds": timeout_seconds, "url": url, "secret": secret }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Server
    #
    # @param json_object [String]
    # @return [Vapi::Server]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timeout_seconds = parsed_json["timeoutSeconds"]
      url = parsed_json["url"]
      secret = parsed_json["secret"]
      new(
        timeout_seconds: timeout_seconds,
        url: url,
        secret: secret,
        additional_properties: struct
      )
    end

    # Serialize an instance of Server to a JSON object
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
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.secret&.is_a?(String) != false || raise("Passed value for field obj.secret is not the expected type, validation failed.")
    end
  end
end
