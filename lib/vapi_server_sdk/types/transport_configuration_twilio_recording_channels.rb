# frozen_string_literal: true

module Vapi
# The number of channels in the final recording.
#  Can be: `mono` or `dual`.
#  The default is `mono`.
#  `mono` records both legs of the call in a single channel of the recording file.
#  `dual` records each leg to a separate channel of the recording file.
#  The first channel of a dual-channel recording contains the parent call and the
#  second channel contains the child call.
#  @default 'mono'
  class TransportConfigurationTwilioRecordingChannels

    MONO = "mono"
    DUAL = "dual"

  end
end