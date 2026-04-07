# frozen_string_literal: true

module Vapi
  module Types
    class FallbackNeetsVoice < Internal::Types::Model
      field :voice_id, -> { Object }, optional: true, nullable: false, api_name: "voiceId"
    end
  end
end
