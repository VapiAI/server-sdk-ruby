# frozen_string_literal: true

require_relative "voice_library_gender"
require "date"
require "ostruct"
require "json"

module Vapi
  class VoiceLibrary
    # @return [Hash{String => Object}] This is the voice provider that will be used.
    attr_reader :provider
    # @return [String] The ID of the voice provided by the provider.
    attr_reader :provider_id
    # @return [String] The unique slug of the voice.
    attr_reader :slug
    # @return [String] The name of the voice.
    attr_reader :name
    # @return [String] The language of the voice.
    attr_reader :language
    # @return [String] The language code of the voice.
    attr_reader :language_code
    # @return [String] The model of the voice.
    attr_reader :model
    # @return [String] The supported models of the voice.
    attr_reader :supported_models
    # @return [Vapi::VoiceLibraryGender] The gender of the voice.
    attr_reader :gender
    # @return [String] The accent of the voice.
    attr_reader :accent
    # @return [String] The preview URL of the voice.
    attr_reader :preview_url
    # @return [String] The description of the voice.
    attr_reader :description
    # @return [String] The credential ID of the voice.
    attr_reader :credential_id
    # @return [String] The unique identifier for the voice library.
    attr_reader :id
    # @return [String] The unique identifier for the organization that this voice library belongs to.
    attr_reader :org_id
    # @return [Boolean] The Public voice is shared accross all the organizations.
    attr_reader :is_public
    # @return [Boolean] The deletion status of the voice.
    attr_reader :is_deleted
    # @return [DateTime] The ISO 8601 date-time string of when the voice library was created.
    attr_reader :created_at
    # @return [DateTime] The ISO 8601 date-time string of when the voice library was last updated.
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Hash{String => Object}] This is the voice provider that will be used.
    # @param provider_id [String] The ID of the voice provided by the provider.
    # @param slug [String] The unique slug of the voice.
    # @param name [String] The name of the voice.
    # @param language [String] The language of the voice.
    # @param language_code [String] The language code of the voice.
    # @param model [String] The model of the voice.
    # @param supported_models [String] The supported models of the voice.
    # @param gender [Vapi::VoiceLibraryGender] The gender of the voice.
    # @param accent [String] The accent of the voice.
    # @param preview_url [String] The preview URL of the voice.
    # @param description [String] The description of the voice.
    # @param credential_id [String] The credential ID of the voice.
    # @param id [String] The unique identifier for the voice library.
    # @param org_id [String] The unique identifier for the organization that this voice library belongs to.
    # @param is_public [Boolean] The Public voice is shared accross all the organizations.
    # @param is_deleted [Boolean] The deletion status of the voice.
    # @param created_at [DateTime] The ISO 8601 date-time string of when the voice library was created.
    # @param updated_at [DateTime] The ISO 8601 date-time string of when the voice library was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VoiceLibrary]
    def initialize(id:, org_id:, is_public:, is_deleted:, created_at:, updated_at:, provider: OMIT, provider_id: OMIT, slug: OMIT, name: OMIT, language: OMIT, language_code: OMIT,
                   model: OMIT, supported_models: OMIT, gender: OMIT, accent: OMIT, preview_url: OMIT, description: OMIT, credential_id: OMIT, additional_properties: nil)
      @provider = provider if provider != OMIT
      @provider_id = provider_id if provider_id != OMIT
      @slug = slug if slug != OMIT
      @name = name if name != OMIT
      @language = language if language != OMIT
      @language_code = language_code if language_code != OMIT
      @model = model if model != OMIT
      @supported_models = supported_models if supported_models != OMIT
      @gender = gender if gender != OMIT
      @accent = accent if accent != OMIT
      @preview_url = preview_url if preview_url != OMIT
      @description = description if description != OMIT
      @credential_id = credential_id if credential_id != OMIT
      @id = id
      @org_id = org_id
      @is_public = is_public
      @is_deleted = is_deleted
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "providerId": provider_id,
        "slug": slug,
        "name": name,
        "language": language,
        "languageCode": language_code,
        "model": model,
        "supportedModels": supported_models,
        "gender": gender,
        "accent": accent,
        "previewUrl": preview_url,
        "description": description,
        "credentialId": credential_id,
        "id": id,
        "orgId": org_id,
        "isPublic": is_public,
        "isDeleted": is_deleted,
        "createdAt": created_at,
        "updatedAt": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VoiceLibrary
    #
    # @param json_object [String]
    # @return [Vapi::VoiceLibrary]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      provider_id = parsed_json["providerId"]
      slug = parsed_json["slug"]
      name = parsed_json["name"]
      language = parsed_json["language"]
      language_code = parsed_json["languageCode"]
      model = parsed_json["model"]
      supported_models = parsed_json["supportedModels"]
      gender = parsed_json["gender"]
      accent = parsed_json["accent"]
      preview_url = parsed_json["previewUrl"]
      description = parsed_json["description"]
      credential_id = parsed_json["credentialId"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      is_public = parsed_json["isPublic"]
      is_deleted = parsed_json["isDeleted"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        provider: provider,
        provider_id: provider_id,
        slug: slug,
        name: name,
        language: language,
        language_code: language_code,
        model: model,
        supported_models: supported_models,
        gender: gender,
        accent: accent,
        preview_url: preview_url,
        description: description,
        credential_id: credential_id,
        id: id,
        org_id: org_id,
        is_public: is_public,
        is_deleted: is_deleted,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of VoiceLibrary to a JSON object
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
      obj.provider&.is_a?(Hash) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.provider_id&.is_a?(String) != false || raise("Passed value for field obj.provider_id is not the expected type, validation failed.")
      obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.language_code&.is_a?(String) != false || raise("Passed value for field obj.language_code is not the expected type, validation failed.")
      obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.supported_models&.is_a?(String) != false || raise("Passed value for field obj.supported_models is not the expected type, validation failed.")
      obj.gender&.is_a?(Vapi::VoiceLibraryGender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
      obj.accent&.is_a?(String) != false || raise("Passed value for field obj.accent is not the expected type, validation failed.")
      obj.preview_url&.is_a?(String) != false || raise("Passed value for field obj.preview_url is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.credential_id&.is_a?(String) != false || raise("Passed value for field obj.credential_id is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.is_public.is_a?(Boolean) != false || raise("Passed value for field obj.is_public is not the expected type, validation failed.")
      obj.is_deleted.is_a?(Boolean) != false || raise("Passed value for field obj.is_deleted is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
