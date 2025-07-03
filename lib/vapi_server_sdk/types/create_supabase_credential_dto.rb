# frozen_string_literal: true
require_relative "supabase_bucket_plan"
require "ostruct"
require "json"

module Vapi
  class CreateSupabaseCredentialDto
  # @return [Float] This is the order in which this storage provider is tried during upload retries.
#  Lower numbers are tried first in increasing order.
    attr_reader :fallback_index
  # @return [Vapi::SupabaseBucketPlan] 
    attr_reader :bucket_plan
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_index [Float] This is the order in which this storage provider is tried during upload retries.
#  Lower numbers are tried first in increasing order.
    # @param bucket_plan [Vapi::SupabaseBucketPlan] 
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateSupabaseCredentialDto]
    def initialize(fallback_index: OMIT, bucket_plan: OMIT, name: OMIT, additional_properties: nil)
      @fallback_index = fallback_index if fallback_index != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "fallbackIndex": fallback_index, "bucketPlan": bucket_plan, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateSupabaseCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateSupabaseCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      fallback_index = parsed_json["fallbackIndex"]
      unless parsed_json["bucketPlan"].nil?
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::SupabaseBucketPlan.from_json(json_object: bucket_plan)
      else
        bucket_plan = nil
      end
      name = parsed_json["name"]
      new(
        fallback_index: fallback_index,
        bucket_plan: bucket_plan,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateSupabaseCredentialDto to a JSON object
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
      obj.fallback_index&.is_a?(Float) != false || raise("Passed value for field obj.fallback_index is not the expected type, validation failed.")
      obj.bucket_plan.nil? || Vapi::SupabaseBucketPlan.validate_raw(obj: obj.bucket_plan)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end