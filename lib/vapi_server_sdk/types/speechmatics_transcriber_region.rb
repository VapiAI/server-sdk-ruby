# frozen_string_literal: true

module Vapi
  # This is the region for the Speechmatics API. Choose between EU (Europe) and US
  #  (United States) regions for lower latency and data sovereignty compliance.
  #  @default 'eu'
  class SpeechmaticsTranscriberRegion
    EU = "eu"
    US = "us"
  end
end
