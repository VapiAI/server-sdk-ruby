# frozen_string_literal: true

require_relative "file_status"
require "date"
require "ostruct"
require "json"

module Vapi
  class File
    # @return [String]
    attr_reader :object
    # @return [Vapi::FileStatus]
    attr_reader :status
    # @return [String] This is the name of the file. This is just for your own reference.
    attr_reader :name
    # @return [String]
    attr_reader :original_name
    # @return [Float]
    attr_reader :bytes
    # @return [String]
    attr_reader :purpose
    # @return [String]
    attr_reader :mimetype
    # @return [String]
    attr_reader :key
    # @return [String]
    attr_reader :path
    # @return [String]
    attr_reader :bucket
    # @return [String]
    attr_reader :url
    # @return [String]
    attr_reader :parsed_text_url
    # @return [Float]
    attr_reader :parsed_text_bytes
    # @return [Hash{String => Object}]
    attr_reader :metadata
    # @return [String] This is the unique identifier for the file.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this file belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the file was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the file was last updated.
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object [String]
    # @param status [Vapi::FileStatus]
    # @param name [String] This is the name of the file. This is just for your own reference.
    # @param original_name [String]
    # @param bytes [Float]
    # @param purpose [String]
    # @param mimetype [String]
    # @param key [String]
    # @param path [String]
    # @param bucket [String]
    # @param url [String]
    # @param parsed_text_url [String]
    # @param parsed_text_bytes [Float]
    # @param metadata [Hash{String => Object}]
    # @param id [String] This is the unique identifier for the file.
    # @param org_id [String] This is the unique identifier for the org that this file belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the file was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the file was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::File]
    def initialize(id:, org_id:, created_at:, updated_at:, object: OMIT, status: OMIT, name: OMIT, original_name: OMIT, bytes: OMIT, purpose: OMIT,
                   mimetype: OMIT, key: OMIT, path: OMIT, bucket: OMIT, url: OMIT, parsed_text_url: OMIT, parsed_text_bytes: OMIT, metadata: OMIT, additional_properties: nil)
      @object = object if object != OMIT
      @status = status if status != OMIT
      @name = name if name != OMIT
      @original_name = original_name if original_name != OMIT
      @bytes = bytes if bytes != OMIT
      @purpose = purpose if purpose != OMIT
      @mimetype = mimetype if mimetype != OMIT
      @key = key if key != OMIT
      @path = path if path != OMIT
      @bucket = bucket if bucket != OMIT
      @url = url if url != OMIT
      @parsed_text_url = parsed_text_url if parsed_text_url != OMIT
      @parsed_text_bytes = parsed_text_bytes if parsed_text_bytes != OMIT
      @metadata = metadata if metadata != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "object": object,
        "status": status,
        "name": name,
        "originalName": original_name,
        "bytes": bytes,
        "purpose": purpose,
        "mimetype": mimetype,
        "key": key,
        "path": path,
        "bucket": bucket,
        "url": url,
        "parsedTextUrl": parsed_text_url,
        "parsedTextBytes": parsed_text_bytes,
        "metadata": metadata,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of File
    #
    # @param json_object [String]
    # @return [Vapi::File]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      object = parsed_json["object"]
      status = parsed_json["status"]
      name = parsed_json["name"]
      original_name = parsed_json["originalName"]
      bytes = parsed_json["bytes"]
      purpose = parsed_json["purpose"]
      mimetype = parsed_json["mimetype"]
      key = parsed_json["key"]
      path = parsed_json["path"]
      bucket = parsed_json["bucket"]
      url = parsed_json["url"]
      parsed_text_url = parsed_json["parsedTextUrl"]
      parsed_text_bytes = parsed_json["parsedTextBytes"]
      metadata = parsed_json["metadata"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        object: object,
        status: status,
        name: name,
        original_name: original_name,
        bytes: bytes,
        purpose: purpose,
        mimetype: mimetype,
        key: key,
        path: path,
        bucket: bucket,
        url: url,
        parsed_text_url: parsed_text_url,
        parsed_text_bytes: parsed_text_bytes,
        metadata: metadata,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of File to a JSON object
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
      obj.object&.is_a?(String) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.status&.is_a?(Vapi::FileStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.original_name&.is_a?(String) != false || raise("Passed value for field obj.original_name is not the expected type, validation failed.")
      obj.bytes&.is_a?(Float) != false || raise("Passed value for field obj.bytes is not the expected type, validation failed.")
      obj.purpose&.is_a?(String) != false || raise("Passed value for field obj.purpose is not the expected type, validation failed.")
      obj.mimetype&.is_a?(String) != false || raise("Passed value for field obj.mimetype is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.path&.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
      obj.bucket&.is_a?(String) != false || raise("Passed value for field obj.bucket is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.parsed_text_url&.is_a?(String) != false || raise("Passed value for field obj.parsed_text_url is not the expected type, validation failed.")
      obj.parsed_text_bytes&.is_a?(Float) != false || raise("Passed value for field obj.parsed_text_bytes is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
