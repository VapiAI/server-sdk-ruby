# frozen_string_literal: true

module Vapi
  module Types
    # This is the background sound in the call. Default for phone calls is 'office' and default for web calls is 'off'.
    # You can also provide a custom sound by providing a URL to an audio file.
    class WorkflowUserEditableBackgroundSound < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::WorkflowUserEditableBackgroundSoundZero }
      member -> { String }
    end
  end
end
