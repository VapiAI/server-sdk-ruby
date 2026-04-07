# frozen_string_literal: true

module Vapi
  module Types
    class ElevenLabsPronunciationDictionaryLocator < Internal::Types::Model
      field :pronunciation_dictionary_id, -> { String }, optional: false, nullable: false, api_name: "pronunciationDictionaryId"
      field :version_id, -> { String }, optional: false, nullable: false, api_name: "versionId"
    end
  end
end
