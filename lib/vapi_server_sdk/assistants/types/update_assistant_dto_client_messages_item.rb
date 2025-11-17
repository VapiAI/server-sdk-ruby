# frozen_string_literal: true

module Vapi
  class Assistants
    class UpdateAssistantDtoClientMessagesItem
      CONVERSATION_UPDATE = "conversation-update"
      FUNCTION_CALL = "function-call"
      FUNCTION_CALL_RESULT = "function-call-result"
      HANG = "hang"
      LANGUAGE_CHANGED = "language-changed"
      METADATA = "metadata"
      MODEL_OUTPUT = "model-output"
      SPEECH_UPDATE = "speech-update"
      STATUS_UPDATE = "status-update"
      TRANSCRIPT = "transcript"
      TOOL_CALLS = "tool-calls"
      TOOL_CALLS_RESULT = "tool-calls-result"
      TOOL_COMPLETED = "tool.completed"
      TRANSFER_UPDATE = "transfer-update"
      USER_INTERRUPTED = "user-interrupted"
      VOICE_INPUT = "voice-input"
      WORKFLOW_NODE_STARTED = "workflow.node.started"
      ASSISTANT_STARTED = "assistant.started"
    end
  end
end
