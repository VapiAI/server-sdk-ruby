# frozen_string_literal: true

require_relative "cloudflare_r_2_bucket_plan"
require "ostruct"
require "json"

module Vapi
  class UpdateCloudflareCredentialDto
    # @return [String] Cloudflare Account Id.
    attr_reader :account_id
    # @return [String] Cloudflare API Key / Token.
    attr_reader :api_key
    # @return [String] Cloudflare Account Email.
    attr_reader :account_email
    # @return [Float] This is the order in which this storage provider is tried during upload retries.
    #  Lower numbers are tried first in increasing order.
    attr_reader :fallback_index
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [Vapi::CloudflareR2BucketPlan] This is the bucket plan that can be provided to store call artifacts in R2
    attr_reader :bucket_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param account_id [String] Cloudflare Account Id.
    # @param api_key [String] Cloudflare API Key / Token.
    # @param account_email [String] Cloudflare Account Email.
    # @param fallback_index [Float] This is the order in which this storage provider is tried during upload retries.
    #  Lower numbers are tried first in increasing order.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param bucket_plan [Vapi::CloudflareR2BucketPlan] This is the bucket plan that can be provided to store call artifacts in R2
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateCloudflareCredentialDto]
    def initialize(account_id: OMIT, api_key: OMIT, account_email: OMIT, fallback_index: OMIT, name: OMIT,
                   bucket_plan: OMIT, additional_properties: nil)
      @account_id = account_id if account_id != OMIT
      @api_key = api_key if api_key != OMIT
      @account_email = account_email if account_email != OMIT
      @fallback_index = fallback_index if fallback_index != OMIT
      @name = name if name != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "accountId": account_id,
        "apiKey": api_key,
        "accountEmail": account_email,
        "fallbackIndex": fallback_index,
        "name": name,
        "bucketPlan": bucket_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateCloudflareCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateCloudflareCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      account_id = parsed_json["accountId"]
      api_key = parsed_json["apiKey"]
      account_email = parsed_json["accountEmail"]
      fallback_index = parsed_json["fallbackIndex"]
      name = parsed_json["name"]
      if parsed_json["bucketPlan"].nil?
        bucket_plan = nil
      else
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::CloudflareR2BucketPlan.from_json(json_object: bucket_plan)
      end
      new(
        account_id: account_id,
        api_key: api_key,
        account_email: account_email,
        fallback_index: fallback_index,
        name: name,
        bucket_plan: bucket_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateCloudflareCredentialDto to a JSON object
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
      obj.account_id&.is_a?(String) != false || raise("Passed value for field obj.account_id is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.account_email&.is_a?(String) != false || raise("Passed value for field obj.account_email is not the expected type, validation failed.")
      obj.fallback_index&.is_a?(Float) != false || raise("Passed value for field obj.fallback_index is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.bucket_plan.nil? || Vapi::CloudflareR2BucketPlan.validate_raw(obj: obj.bucket_plan)
    end
  end
end
