# frozen_string_literal: true

module Vapi
  module Types
    class NeetsVoice < Internal::Types::Model
      field :voice_id, -> { Object }, optional: true, nullable: false, api_name: "voiceId"
    end
  end
end
