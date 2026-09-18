# frozen_string_literal: true

module Vapi
  module Types
    # Identifies a specific version of an ElevenLabs pronunciation dictionary.
    class ElevenLabsPronunciationDictionaryLocator < Internal::Types::Model
      field :pronunciation_dictionary_id, -> { String }, optional: false, nullable: false, api_name: "pronunciationDictionaryId"
      field :version_id, -> { String }, optional: true, nullable: false, api_name: "versionId"
    end
  end
end
