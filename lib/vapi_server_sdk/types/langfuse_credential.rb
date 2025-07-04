# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class LangfuseCredential
    # @return [String]
    attr_reader :provider
    # @return [String] The public key for Langfuse project. Eg: pk-lf-...
    attr_reader :public_key
    # @return [String] The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the
    #  API.
    attr_reader :api_key
    # @return [String] The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    attr_reader :api_url
    # @return [String] This is the unique identifier for the credential.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this credential belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    attr_reader :updated_at
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param public_key [String] The public key for Langfuse project. Eg: pk-lf-...
    # @param api_key [String] The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the
    #  API.
    # @param api_url [String] The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::LangfuseCredential]
    def initialize(provider:, public_key:, api_key:, api_url:, id:, org_id:, created_at:, updated_at:, name: OMIT,
                   additional_properties: nil)
      @provider = provider
      @public_key = public_key
      @api_key = api_key
      @api_url = api_url
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "publicKey": public_key,
        "apiKey": api_key,
        "apiUrl": api_url,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LangfuseCredential
    #
    # @param json_object [String]
    # @return [Vapi::LangfuseCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      public_key = parsed_json["publicKey"]
      api_key = parsed_json["apiKey"]
      api_url = parsed_json["apiUrl"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      new(
        provider: provider,
        public_key: public_key,
        api_key: api_key,
        api_url: api_url,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of LangfuseCredential to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.public_key.is_a?(String) != false || raise("Passed value for field obj.public_key is not the expected type, validation failed.")
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.api_url.is_a?(String) != false || raise("Passed value for field obj.api_url is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
