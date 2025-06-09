# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class GcpKey
  # @return [String] This is the type of the key. Most likely, this is "service_account".
    attr_reader :type
  # @return [String] This is the ID of the Google Cloud project associated with this key.
    attr_reader :project_id
  # @return [String] This is the unique identifier for the private key.
    attr_reader :private_key_id
  # @return [String] This is the private key in PEM format.
#  Note: This is not returned in the API.
    attr_reader :private_key
  # @return [String] This is the email address associated with the service account.
    attr_reader :client_email
  # @return [String] This is the unique identifier for the client.
    attr_reader :client_id
  # @return [String] This is the URI for the auth provider's authorization endpoint.
    attr_reader :auth_uri
  # @return [String] This is the URI for the auth provider's token endpoint.
    attr_reader :token_uri
  # @return [String] This is the URL of the public x509 certificate for the auth provider.
    attr_reader :auth_provider_x_509_cert_url
  # @return [String] This is the URL of the public x509 certificate for the client.
    attr_reader :client_x_509_cert_url
  # @return [String] This is the domain associated with the universe this service account belongs to.
    attr_reader :universe_domain
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the key. Most likely, this is "service_account".
    # @param project_id [String] This is the ID of the Google Cloud project associated with this key.
    # @param private_key_id [String] This is the unique identifier for the private key.
    # @param private_key [String] This is the private key in PEM format.
#  Note: This is not returned in the API.
    # @param client_email [String] This is the email address associated with the service account.
    # @param client_id [String] This is the unique identifier for the client.
    # @param auth_uri [String] This is the URI for the auth provider's authorization endpoint.
    # @param token_uri [String] This is the URI for the auth provider's token endpoint.
    # @param auth_provider_x_509_cert_url [String] This is the URL of the public x509 certificate for the auth provider.
    # @param client_x_509_cert_url [String] This is the URL of the public x509 certificate for the client.
    # @param universe_domain [String] This is the domain associated with the universe this service account belongs to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GcpKey]
    def initialize(type:, project_id:, private_key_id:, private_key:, client_email:, client_id:, auth_uri:, token_uri:, auth_provider_x_509_cert_url:, client_x_509_cert_url:, universe_domain:, additional_properties: nil)
      @type = type
      @project_id = project_id
      @private_key_id = private_key_id
      @private_key = private_key
      @client_email = client_email
      @client_id = client_id
      @auth_uri = auth_uri
      @token_uri = token_uri
      @auth_provider_x_509_cert_url = auth_provider_x_509_cert_url
      @client_x_509_cert_url = client_x_509_cert_url
      @universe_domain = universe_domain
      @additional_properties = additional_properties
      @_field_set = { "type": type, "projectId": project_id, "privateKeyId": private_key_id, "privateKey": private_key, "clientEmail": client_email, "clientId": client_id, "authUri": auth_uri, "tokenUri": token_uri, "authProviderX509CertUrl": auth_provider_x_509_cert_url, "clientX509CertUrl": client_x_509_cert_url, "universeDomain": universe_domain }
    end
# Deserialize a JSON object to an instance of GcpKey
    #
    # @param json_object [String] 
    # @return [Vapi::GcpKey]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      project_id = parsed_json["projectId"]
      private_key_id = parsed_json["privateKeyId"]
      private_key = parsed_json["privateKey"]
      client_email = parsed_json["clientEmail"]
      client_id = parsed_json["clientId"]
      auth_uri = parsed_json["authUri"]
      token_uri = parsed_json["tokenUri"]
      auth_provider_x_509_cert_url = parsed_json["authProviderX509CertUrl"]
      client_x_509_cert_url = parsed_json["clientX509CertUrl"]
      universe_domain = parsed_json["universeDomain"]
      new(
        type: type,
        project_id: project_id,
        private_key_id: private_key_id,
        private_key: private_key,
        client_email: client_email,
        client_id: client_id,
        auth_uri: auth_uri,
        token_uri: token_uri,
        auth_provider_x_509_cert_url: auth_provider_x_509_cert_url,
        client_x_509_cert_url: client_x_509_cert_url,
        universe_domain: universe_domain,
        additional_properties: struct
      )
    end
# Serialize an instance of GcpKey to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.project_id.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.private_key_id.is_a?(String) != false || raise("Passed value for field obj.private_key_id is not the expected type, validation failed.")
      obj.private_key.is_a?(String) != false || raise("Passed value for field obj.private_key is not the expected type, validation failed.")
      obj.client_email.is_a?(String) != false || raise("Passed value for field obj.client_email is not the expected type, validation failed.")
      obj.client_id.is_a?(String) != false || raise("Passed value for field obj.client_id is not the expected type, validation failed.")
      obj.auth_uri.is_a?(String) != false || raise("Passed value for field obj.auth_uri is not the expected type, validation failed.")
      obj.token_uri.is_a?(String) != false || raise("Passed value for field obj.token_uri is not the expected type, validation failed.")
      obj.auth_provider_x_509_cert_url.is_a?(String) != false || raise("Passed value for field obj.auth_provider_x_509_cert_url is not the expected type, validation failed.")
      obj.client_x_509_cert_url.is_a?(String) != false || raise("Passed value for field obj.client_x_509_cert_url is not the expected type, validation failed.")
      obj.universe_domain.is_a?(String) != false || raise("Passed value for field obj.universe_domain is not the expected type, validation failed.")
    end
  end
end