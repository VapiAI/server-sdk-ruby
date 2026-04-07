# frozen_string_literal: true

module Vapi
  module Types
    class VapiPronunciationDictionaryLocator < Internal::Types::Model
      field :pronunciation_dict_id, -> { String }, optional: false, nullable: false, api_name: "pronunciationDictId"
      field :version_id, -> { String }, optional: true, nullable: false, api_name: "versionId"
    end
  end
end
