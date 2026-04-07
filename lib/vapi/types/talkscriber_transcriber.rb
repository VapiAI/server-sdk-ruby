# frozen_string_literal: true

module Vapi
  module Types
    class TalkscriberTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::TalkscriberTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::TalkscriberTranscriberLanguage }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
