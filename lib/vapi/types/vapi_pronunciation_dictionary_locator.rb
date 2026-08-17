# frozen_string_literal: true

module Vapi
  module Types
    # Identifies a pronunciation dictionary and optional version used for voice synthesis.
    class VapiPronunciationDictionaryLocator < Internal::Types::Model
      field :pronunciation_dict_id, -> { String }, optional: false, nullable: false, api_name: "pronunciationDictId"
      field :version_id, -> { String }, optional: true, nullable: false, api_name: "versionId"
      field :provider, -> { Vapi::Types::VapiPronunciationDictionaryLocatorProvider }, optional: true, nullable: false
    end
  end
end
