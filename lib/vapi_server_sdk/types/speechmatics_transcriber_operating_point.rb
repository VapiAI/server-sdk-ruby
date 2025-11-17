# frozen_string_literal: true

module Vapi
  # This is the operating point for the transcription. Choose between `standard` for
  #  faster turnaround with strong accuracy or `enhanced` for highest accuracy when
  #  precision is critical.
  #  @default 'enhanced'
  class SpeechmaticsTranscriberOperatingPoint
    STANDARD = "standard"
    ENHANCED = "enhanced"
  end
end
