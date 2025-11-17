# frozen_string_literal: true

module Vapi
  # This is the model that will be used. Options are 'speech-02-hd' and
  #  'speech-02-turbo'.
  #  speech-02-hd is optimized for high-fidelity applications like voiceovers and
  #  audiobooks.
  #  speech-02-turbo is designed for real-time applications with low latency.
  #  @default "speech-02-turbo"
  class FallbackMinimaxVoiceModel
    SPEECH_02_HD = "speech-02-hd"
    SPEECH_02_TURBO = "speech-02-turbo"
    SPEECH_25_TURBO_PREVIEW = "speech-2.5-turbo-preview"
  end
end
