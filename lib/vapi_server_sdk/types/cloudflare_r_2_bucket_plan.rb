# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CloudflareR2BucketPlan
  # @return [String] Cloudflare R2 Access key ID.
    attr_reader :access_key_id
  # @return [String] Cloudflare R2 access key secret. This is not returned in the API.
    attr_reader :secret_access_key
  # @return [String] Cloudflare R2 base url.
    attr_reader :url
  # @return [String] This is the name of the bucket.
    attr_reader :name
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

    # @param access_key_id [String] Cloudflare R2 Access key ID.
    # @param secret_access_key [String] Cloudflare R2 access key secret. This is not returned in the API.
    # @param url [String] Cloudflare R2 base url.
    # @param name [String] This is the name of the bucket.
    # @param path [String] This is the path where call artifacts will be stored.
#  Usage:
#  - To store call artifacts in a specific folder, set this to the full path. Eg.
#  "/folder-name1/folder-name2".
#  - To store call artifacts in the root of the bucket, leave this blank.
#  @default "/"
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CloudflareR2BucketPlan]
    def initialize(access_key_id: OMIT, secret_access_key: OMIT, url: OMIT, name:, path: OMIT, additional_properties: nil)
      @access_key_id = access_key_id if access_key_id != OMIT
      @secret_access_key = secret_access_key if secret_access_key != OMIT
      @url = url if url != OMIT
      @name = name
      @path = path if path != OMIT
      @additional_properties = additional_properties
      @_field_set = { "accessKeyId": access_key_id, "secretAccessKey": secret_access_key, "url": url, "name": name, "path": path }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CloudflareR2BucketPlan
    #
    # @param json_object [String] 
    # @return [Vapi::CloudflareR2BucketPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      access_key_id = parsed_json["accessKeyId"]
      secret_access_key = parsed_json["secretAccessKey"]
      url = parsed_json["url"]
      name = parsed_json["name"]
      path = parsed_json["path"]
      new(
        access_key_id: access_key_id,
        secret_access_key: secret_access_key,
        url: url,
        name: name,
        path: path,
        additional_properties: struct
      )
    end
# Serialize an instance of CloudflareR2BucketPlan to a JSON object
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
      obj.access_key_id&.is_a?(String) != false || raise("Passed value for field obj.access_key_id is not the expected type, validation failed.")
      obj.secret_access_key&.is_a?(String) != false || raise("Passed value for field obj.secret_access_key is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.path&.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
    end
  end
end