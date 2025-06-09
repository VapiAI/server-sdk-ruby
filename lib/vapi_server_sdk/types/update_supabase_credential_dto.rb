# frozen_string_literal: true
require_relative "supabase_bucket_plan"
require "ostruct"
require "json"

module Vapi
  class UpdateSupabaseCredentialDto
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [Vapi::SupabaseBucketPlan] 
    attr_reader :bucket_plan
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of credential. This is just for your reference.
    # @param bucket_plan [Vapi::SupabaseBucketPlan] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateSupabaseCredentialDto]
    def initialize(name: OMIT, bucket_plan: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "bucketPlan": bucket_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateSupabaseCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateSupabaseCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["bucketPlan"].nil?
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::SupabaseBucketPlan.from_json(json_object: bucket_plan)
      else
        bucket_plan = nil
      end
      new(
        name: name,
        bucket_plan: bucket_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateSupabaseCredentialDto to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.bucket_plan.nil? || Vapi::SupabaseBucketPlan.validate_raw(obj: obj.bucket_plan)
    end
  end
end