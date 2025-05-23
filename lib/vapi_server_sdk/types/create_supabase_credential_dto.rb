# frozen_string_literal: true

require_relative "supabase_bucket_plan"
require "ostruct"
require "json"

module Vapi
  class CreateSupabaseCredentialDto
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

    # @param bucket_plan [Vapi::SupabaseBucketPlan]
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateSupabaseCredentialDto]
    def initialize(bucket_plan: OMIT, name: OMIT, additional_properties: nil)
      @bucket_plan = bucket_plan if bucket_plan != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bucketPlan": bucket_plan, "name": name }.reject do |_k, v|
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
      if parsed_json["bucketPlan"].nil?
        bucket_plan = nil
      else
        bucket_plan = parsed_json["bucketPlan"].to_json
        bucket_plan = Vapi::SupabaseBucketPlan.from_json(json_object: bucket_plan)
      end
      name = parsed_json["name"]
      new(
        bucket_plan: bucket_plan,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateSupabaseCredentialDto to a JSON object
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
      obj.bucket_plan.nil? || Vapi::SupabaseBucketPlan.validate_raw(obj: obj.bucket_plan)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
