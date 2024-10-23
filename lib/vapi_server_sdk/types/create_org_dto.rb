# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CreateOrgDto
    # @return [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
    #  the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    #  When HIPAA is enabled, only OpenAI/Custom LLM or Azure Providers will be
    #  available for LLM and Voice respectively.
    #  This is due to the compliance requirements of HIPAA. Other providers may not
    #  meet these requirements.
    attr_reader :hipaa_enabled
    # @return [String] This is the name of the org. This is just for your own reference.
    attr_reader :name
    # @return [Float] This is the monthly billing limit for the org. To go beyond $1000/mo, please
    #  contact us at support@vapi.ai.
    attr_reader :billing_limit
    # @return [String] This is the URL Vapi will communicate with via HTTP GET and POST Requests. This
    #  is used for retrieving context, function calling, and end-of-call reports.
    #  All requests will be sent with the call object among other things relevant to
    #  that message. You can find more details in the Server URL documentation.
    attr_reader :server_url
    # @return [String] This is the secret you can set that Vapi will send with every request to your
    #  server. Will be sent as a header called x-vapi-secret.
    attr_reader :server_url_secret
    # @return [Float] This is the concurrency limit for the org. This is the maximum number of calls
    #  that can be active at any given time. To go beyond 10, please contact us at
    #  support@vapi.ai.
    attr_reader :concurrency_limit
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param hipaa_enabled [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
    #  the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    #  When HIPAA is enabled, only OpenAI/Custom LLM or Azure Providers will be
    #  available for LLM and Voice respectively.
    #  This is due to the compliance requirements of HIPAA. Other providers may not
    #  meet these requirements.
    # @param name [String] This is the name of the org. This is just for your own reference.
    # @param billing_limit [Float] This is the monthly billing limit for the org. To go beyond $1000/mo, please
    #  contact us at support@vapi.ai.
    # @param server_url [String] This is the URL Vapi will communicate with via HTTP GET and POST Requests. This
    #  is used for retrieving context, function calling, and end-of-call reports.
    #  All requests will be sent with the call object among other things relevant to
    #  that message. You can find more details in the Server URL documentation.
    # @param server_url_secret [String] This is the secret you can set that Vapi will send with every request to your
    #  server. Will be sent as a header called x-vapi-secret.
    # @param concurrency_limit [Float] This is the concurrency limit for the org. This is the maximum number of calls
    #  that can be active at any given time. To go beyond 10, please contact us at
    #  support@vapi.ai.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateOrgDto]
    def initialize(hipaa_enabled: OMIT, name: OMIT, billing_limit: OMIT, server_url: OMIT, server_url_secret: OMIT,
                   concurrency_limit: OMIT, additional_properties: nil)
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @name = name if name != OMIT
      @billing_limit = billing_limit if billing_limit != OMIT
      @server_url = server_url if server_url != OMIT
      @server_url_secret = server_url_secret if server_url_secret != OMIT
      @concurrency_limit = concurrency_limit if concurrency_limit != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "hipaaEnabled": hipaa_enabled,
        "name": name,
        "billingLimit": billing_limit,
        "serverUrl": server_url,
        "serverUrlSecret": server_url_secret,
        "concurrencyLimit": concurrency_limit
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateOrgDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateOrgDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      hipaa_enabled = parsed_json["hipaaEnabled"]
      name = parsed_json["name"]
      billing_limit = parsed_json["billingLimit"]
      server_url = parsed_json["serverUrl"]
      server_url_secret = parsed_json["serverUrlSecret"]
      concurrency_limit = parsed_json["concurrencyLimit"]
      new(
        hipaa_enabled: hipaa_enabled,
        name: name,
        billing_limit: billing_limit,
        server_url: server_url,
        server_url_secret: server_url_secret,
        concurrency_limit: concurrency_limit,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateOrgDto to a JSON object
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
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.billing_limit&.is_a?(Float) != false || raise("Passed value for field obj.billing_limit is not the expected type, validation failed.")
      obj.server_url&.is_a?(String) != false || raise("Passed value for field obj.server_url is not the expected type, validation failed.")
      obj.server_url_secret&.is_a?(String) != false || raise("Passed value for field obj.server_url_secret is not the expected type, validation failed.")
      obj.concurrency_limit&.is_a?(Float) != false || raise("Passed value for field obj.concurrency_limit is not the expected type, validation failed.")
    end
  end
end
