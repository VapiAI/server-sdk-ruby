# frozen_string_literal: true

module Vapi
  module Types
    # This is spoken to the customer before connecting them to the destination.
    #
    # Usage:
    # - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
    # - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful
    # when transferring between assistants in a squad. In this scenario, you likely also want to set
    # `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
    #
    # This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for
    # different languages through the `contents` field.
    class TransferDestinationNumberMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Vapi::Types::CustomMessage }
    end
  end
end
