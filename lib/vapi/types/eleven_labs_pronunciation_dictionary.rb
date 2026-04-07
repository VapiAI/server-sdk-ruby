# frozen_string_literal: true

module Vapi
  module Types
    class ElevenLabsPronunciationDictionary < Internal::Types::Model
      field :pronunciation_dictionary_id, -> { String }, optional: false, nullable: false, api_name: "pronunciationDictionaryId"
      field :dictionary_name, -> { String }, optional: false, nullable: false, api_name: "dictionaryName"
      field :created_by, -> { String }, optional: false, nullable: false, api_name: "createdBy"
      field :creation_time_unix, -> { Integer }, optional: false, nullable: false, api_name: "creationTimeUnix"
      field :version_id, -> { String }, optional: false, nullable: false, api_name: "versionId"
      field :version_rules_num, -> { Integer }, optional: false, nullable: false, api_name: "versionRulesNum"
      field :permission_on_resource, -> { Vapi::Types::ElevenLabsPronunciationDictionaryPermissionOnResource }, optional: true, nullable: false, api_name: "permissionOnResource"
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
