# frozen_string_literal: true

module Vapi
  module Types
    class VapiTranscriber < Internal::Types::Model
      field :version, -> { Vapi::Types::VapiTranscriberVersion }, optional: true, nullable: false
      field :language, -> { Vapi::Types::VapiTranscriberLanguage }, optional: true, nullable: false
      field :languages, -> { Internal::Types::Array[Vapi::Types::VapiTranscriberLanguagesItem] }, optional: true, nullable: false
      field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :turn_taking, -> { Vapi::Types::VapiTranscriberTurnTaking }, optional: true, nullable: false, api_name: "turnTaking"
    end
  end
end
