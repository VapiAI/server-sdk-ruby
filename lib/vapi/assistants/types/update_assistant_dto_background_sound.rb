# frozen_string_literal: true

module Vapi
  class Assistants
    # This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    class UpdateAssistantDtoBackgroundSound
      OFF = "off"
      OFFICE = "office"
    end
  end
end
