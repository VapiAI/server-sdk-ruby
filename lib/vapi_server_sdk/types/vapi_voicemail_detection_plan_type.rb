# frozen_string_literal: true

module Vapi
  # This is the detection type to use for voicemail detection.
  #  - 'audio': Uses native audio models (default)
  #  - 'transcript': Uses ASR/transcript-based detection
  #  @default 'audio' (audio detection)
  class VapiVoicemailDetectionPlanType
    AUDIO = "audio"
    TRANSCRIPT = "transcript"
  end
end
