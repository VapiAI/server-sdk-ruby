# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AzureBlobStorageBucketPlan
    # @return [String] This is the blob storage connection string for the Azure resource.
    attr_reader :connection_string
    # @return [String] This is the container name for the Azure blob storage.
    attr_reader :container_name
    # @return [String] This is the path where call artifacts will be stored.
    #  Usage:
    #  - To store call artifacts in a specific folder, set this to the full path. Eg.
    #  "/folder-name1/folder-name2".
    #  - To store call artifacts in the root of the bucket, leave this blank.
    #  @default "/"
    attr_reader :path
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param connection_string [String] This is the blob storage connection string for the Azure resource.
    # @param container_name [String] This is the container name for the Azure blob storage.
    # @param path [String] This is the path where call artifacts will be stored.
    #  Usage:
    #  - To store call artifacts in a specific folder, set this to the full path. Eg.
    #  "/folder-name1/folder-name2".
    #  - To store call artifacts in the root of the bucket, leave this blank.
    #  @default "/"
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AzureBlobStorageBucketPlan]
    def initialize(connection_string:, container_name:, path: OMIT, additional_properties: nil)
      @connection_string = connection_string
      @container_name = container_name
      @path = path if path != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "connectionString": connection_string,
        "containerName": container_name,
        "path": path
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AzureBlobStorageBucketPlan
    #
    # @param json_object [String]
    # @return [Vapi::AzureBlobStorageBucketPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      connection_string = parsed_json["connectionString"]
      container_name = parsed_json["containerName"]
      path = parsed_json["path"]
      new(
        connection_string: connection_string,
        container_name: container_name,
        path: path,
        additional_properties: struct
      )
    end

    # Serialize an instance of AzureBlobStorageBucketPlan to a JSON object
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
      obj.connection_string.is_a?(String) != false || raise("Passed value for field obj.connection_string is not the expected type, validation failed.")
      obj.container_name.is_a?(String) != false || raise("Passed value for field obj.container_name is not the expected type, validation failed.")
      obj.path&.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
    end
  end
end
