# frozen_string_literal: true

require_relative "hmac_authentication_plan_algorithm"
require_relative "hmac_authentication_plan_signature_encoding"
require "ostruct"
require "json"

module Vapi
  class HmacAuthenticationPlan
    # @return [String] This is the HMAC secret key used to sign requests.
    attr_reader :secret_key
    # @return [Vapi::HmacAuthenticationPlanAlgorithm] This is the HMAC algorithm to use for signing.
    attr_reader :algorithm
    # @return [String] This is the header name where the signature will be sent. Defaults to
    #  'x-signature'.
    attr_reader :signature_header
    # @return [String] This is the header name where the timestamp will be sent. Defaults to
    #  'x-timestamp'.
    attr_reader :timestamp_header
    # @return [String] This is the prefix for the signature. For example, 'sha256=' for GitHub-style
    #  signatures.
    attr_reader :signature_prefix
    # @return [Boolean] Whether to include a timestamp in the signature payload. Defaults to true.
    attr_reader :include_timestamp
    # @return [String] Custom payload format. Use {body} for request body, {timestamp} for timestamp,
    #  {method} for HTTP method, {url} for URL, {svix-id} for unique message ID.
    #  Defaults to '{timestamp}.{body}'.
    attr_reader :payload_format
    # @return [String] This is the header name where the unique message ID will be sent. Used for
    #  Svix-style webhooks.
    attr_reader :message_id_header
    # @return [Vapi::HmacAuthenticationPlanSignatureEncoding] The encoding format for the signature. Defaults to 'hex'.
    attr_reader :signature_encoding
    # @return [Boolean] Whether the secret key is base64-encoded and should be decoded before use.
    #  Defaults to false.
    attr_reader :secret_is_base_64
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param secret_key [String] This is the HMAC secret key used to sign requests.
    # @param algorithm [Vapi::HmacAuthenticationPlanAlgorithm] This is the HMAC algorithm to use for signing.
    # @param signature_header [String] This is the header name where the signature will be sent. Defaults to
    #  'x-signature'.
    # @param timestamp_header [String] This is the header name where the timestamp will be sent. Defaults to
    #  'x-timestamp'.
    # @param signature_prefix [String] This is the prefix for the signature. For example, 'sha256=' for GitHub-style
    #  signatures.
    # @param include_timestamp [Boolean] Whether to include a timestamp in the signature payload. Defaults to true.
    # @param payload_format [String] Custom payload format. Use {body} for request body, {timestamp} for timestamp,
    #  {method} for HTTP method, {url} for URL, {svix-id} for unique message ID.
    #  Defaults to '{timestamp}.{body}'.
    # @param message_id_header [String] This is the header name where the unique message ID will be sent. Used for
    #  Svix-style webhooks.
    # @param signature_encoding [Vapi::HmacAuthenticationPlanSignatureEncoding] The encoding format for the signature. Defaults to 'hex'.
    # @param secret_is_base_64 [Boolean] Whether the secret key is base64-encoded and should be decoded before use.
    #  Defaults to false.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::HmacAuthenticationPlan]
    def initialize(secret_key:, algorithm:, signature_header: OMIT, timestamp_header: OMIT, signature_prefix: OMIT,
                   include_timestamp: OMIT, payload_format: OMIT, message_id_header: OMIT, signature_encoding: OMIT, secret_is_base_64: OMIT, additional_properties: nil)
      @secret_key = secret_key
      @algorithm = algorithm
      @signature_header = signature_header if signature_header != OMIT
      @timestamp_header = timestamp_header if timestamp_header != OMIT
      @signature_prefix = signature_prefix if signature_prefix != OMIT
      @include_timestamp = include_timestamp if include_timestamp != OMIT
      @payload_format = payload_format if payload_format != OMIT
      @message_id_header = message_id_header if message_id_header != OMIT
      @signature_encoding = signature_encoding if signature_encoding != OMIT
      @secret_is_base_64 = secret_is_base_64 if secret_is_base_64 != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "secretKey": secret_key,
        "algorithm": algorithm,
        "signatureHeader": signature_header,
        "timestampHeader": timestamp_header,
        "signaturePrefix": signature_prefix,
        "includeTimestamp": include_timestamp,
        "payloadFormat": payload_format,
        "messageIdHeader": message_id_header,
        "signatureEncoding": signature_encoding,
        "secretIsBase64": secret_is_base_64
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of HmacAuthenticationPlan
    #
    # @param json_object [String]
    # @return [Vapi::HmacAuthenticationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      secret_key = parsed_json["secretKey"]
      algorithm = parsed_json["algorithm"]
      signature_header = parsed_json["signatureHeader"]
      timestamp_header = parsed_json["timestampHeader"]
      signature_prefix = parsed_json["signaturePrefix"]
      include_timestamp = parsed_json["includeTimestamp"]
      payload_format = parsed_json["payloadFormat"]
      message_id_header = parsed_json["messageIdHeader"]
      signature_encoding = parsed_json["signatureEncoding"]
      secret_is_base_64 = parsed_json["secretIsBase64"]
      new(
        secret_key: secret_key,
        algorithm: algorithm,
        signature_header: signature_header,
        timestamp_header: timestamp_header,
        signature_prefix: signature_prefix,
        include_timestamp: include_timestamp,
        payload_format: payload_format,
        message_id_header: message_id_header,
        signature_encoding: signature_encoding,
        secret_is_base_64: secret_is_base_64,
        additional_properties: struct
      )
    end

    # Serialize an instance of HmacAuthenticationPlan to a JSON object
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
      obj.secret_key.is_a?(String) != false || raise("Passed value for field obj.secret_key is not the expected type, validation failed.")
      obj.algorithm.is_a?(Vapi::HmacAuthenticationPlanAlgorithm) != false || raise("Passed value for field obj.algorithm is not the expected type, validation failed.")
      obj.signature_header&.is_a?(String) != false || raise("Passed value for field obj.signature_header is not the expected type, validation failed.")
      obj.timestamp_header&.is_a?(String) != false || raise("Passed value for field obj.timestamp_header is not the expected type, validation failed.")
      obj.signature_prefix&.is_a?(String) != false || raise("Passed value for field obj.signature_prefix is not the expected type, validation failed.")
      obj.include_timestamp&.is_a?(Boolean) != false || raise("Passed value for field obj.include_timestamp is not the expected type, validation failed.")
      obj.payload_format&.is_a?(String) != false || raise("Passed value for field obj.payload_format is not the expected type, validation failed.")
      obj.message_id_header&.is_a?(String) != false || raise("Passed value for field obj.message_id_header is not the expected type, validation failed.")
      obj.signature_encoding&.is_a?(Vapi::HmacAuthenticationPlanSignatureEncoding) != false || raise("Passed value for field obj.signature_encoding is not the expected type, validation failed.")
      obj.secret_is_base_64&.is_a?(Boolean) != false || raise("Passed value for field obj.secret_is_base_64 is not the expected type, validation failed.")
    end
  end
end
