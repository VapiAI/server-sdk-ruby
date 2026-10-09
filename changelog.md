## [3.0.0] - 2026-10-09
### Breaking Changes
- **`TrieveCredential`**, **`TrieveCredentialProvider`**, and **`CreateTrieveCredentialDto`** have been removed and replaced by **`MicrosoftCredential`**, **`MicrosoftCredentialProvider`**, and **`CreateMicrosoftCredentialDto`** respectively. Update all references to use the new names; `CreateMicrosoftCredentialDto` also gains an optional `region` field.
- **`GladiaTranscriberLanguages`** has been renamed to **`GladiaTranscriberLanguagesItem`** and **`FallbackGladiaTranscriberLanguages`** to **`FallbackGladiaTranscriberLanguagesItem`**. Update any references to use the new names.
- **`InviteUserDtoRole`** and **`UpdateUserRoleDtoRole`** have changed from plain `Enum` modules to `Union` classes. Code that references enum constants (e.g., `InviteUserDtoRole::ADMIN`) will break; use the new union member types instead.
- **`GhlToolType`** has been renamed to **`UpdateGhlToolDtoType`**, **`CreateSimulationRunDtoSimulationsItem`** to **`SimulationRunListItemSimulationsItem`**, and **`CreateSimulationRunDtoTarget`** to **`SimulationRunListItemTarget`**. Update all references accordingly.
- **`SbcConfiguration`** has changed from an empty `Model` class to a free-form JSON passthrough module; code that instantiates or inherits from the old class will break.

### Added
- **xAI and Vapi native transcribers** — new `Vapi::Types::XaiTranscriber`, `Vapi::Types::VapiTranscriber`, and their fallback variants, with associated language and model enums.
- **Microsoft and xAI voice providers** — new `Vapi::Types::MicrosoftVoice`, `Vapi::Types::XaiVoice`, `Vapi::Types::MicrosoftCredential`, and fallback variants for use in assistant and workflow voice configuration.
- **OpenAI Reasoner model and speaker types** — new `Vapi::Types::OpenAiReasoner`, `Vapi::Types::OpenAiSpeaker`, `Vapi::Types::OpenAiModelServiceTier`, and `Vapi::Types::OpenAiModelReasoningEffort` for advanced model configuration.
- **Assistant and tool draft/version management** — new types for `AssistantDraft`, `AssistantVersion`, `ToolDraft`, `ToolVersion`, `SquadVersion`, and their paginated responses, DTOs, and conflict response types.
- **Traffic allocations, boards, knowledge base v2, and simulation clients** — new client modules for `TrafficAllocations`, `Board`, `KnowledgeBasesV2`, `SimulationPersonalities`, `SimulationScenarios`, `SimulationRuns`, `SimulationSuites`, and `Simulations` with full CRUD support.
- See full changelog for all changes

### Breaking Changes
- **`UpdateAssistantDtoCredentialsItem`** — the `TRIEVE` credential variant (`CreateTrieveCredentialDto`) has been removed. Remove any usage of `TRIEVE` credentials from assistant credential lists.
- **`CreateCallDto#transport`** — the field type changed from a generic `Hash[String, Object]` to the typed `Vapi::Calls::Types::CreateCallDtoTransport`. Update any code constructing a raw hash for `transport` to use the new typed object.

### Added
- **`CreateS3CompatibleCredentialDto`** and **`CreateMicrosoftCredentialDto`** — two new credential variants (`S_3_COMPATIBLE` and `MICROSOFT`) are now supported in `UpdateAssistantDtoCredentialsItem`.
- **`sort_by` query parameter** — added to list/paginated endpoints across Chats, Eval, Insight, ObservabilityScorecard, PhoneNumbers, ProviderResources, and Sessions clients for finer-grained result ordering.
- **`CreateCallDto`** — new optional fields `assistant_version` and `squad_version` allow pinning a specific assistant or squad version when creating a call.
- **`Files#list` and `Files#create`** — `list` now accepts a `purpose` filter; `create` now accepts `purpose` and `metadata` multipart fields.
- **Sessions and Eval runs** — Sessions list gains `id_any` and `squad_overrides` filter params; Eval runs paginated endpoint gains `search` and `sort_by` params.

### Added
- **`Vapi::Board::Client`** — new reporting client supporting list, create, find, update, delete, and metrics-overview operations against the `reporting/board` endpoint.
- **Call artifact download methods** — seven new methods on `Vapi::Calls::Client` (`call_artifact_controller_mono_recording_download`, `stereo_recording_download`, `video_recording_download`, `customer_recording_download`, `assistant_recording_download`, `pcap_download`, `call_logs_download`) for downloading per-call artifacts by ID.
- **`Vapi::Calls::Types::CreateCallDtoTransport`** — new union type for specifying call transport provider (VAPI_WEBSOCKET, VONAGE, TWILIO, VAPI_SIP, TELNYX, DAILY).
- **`CampaignControllerFindAllRequest#sort_by`** — new optional `sort_by` field (createdAt, duration, cost) on the campaign list request, plus new `cancelled` and `archived` status enum values.
- **`CampaignControllerFindAllV2Request`** — new v2 campaign list request type with `include_counters`, `sort_by`, and full timestamp filter support.

### Added
- **`Vapi::KnowledgeBasesV2::Client`** — new client for managing v2 knowledge bases, including CRUD operations and file attach/detach/retry methods.
- **Simulation clients** — `Vapi::SimulationPersonalities::Client`, `Vapi::SimulationScenarios::Client`, `Vapi::SimulationRuns::Client`, `Vapi::SimulationSuites::Client`, and `Vapi::Simulations::Client` are now accessible from the top-level client.
- **`Vapi::TrafficAllocations::Client`** and **`Vapi::Board::Client`** — new top-level client namespaces for traffic allocation and board resources.
- **`sort_by` field** — optional `sort_by` parameter added to paginated list request types across Chats, Eval, Insight, ObservabilityScorecard, and PhoneNumbers namespaces.
- **`ListFilesRequest`** and **`CreateFilesRequestPurpose`** / **`ListFilesRequestPurpose`** enums — new file listing request type and purpose enums including `knowledge-base-v2` support; `assistant_id` added to `InsightRunDto` and `id_any` added to `ListChatsRequest`.

### Added
- **`Vapi::SimulationPersonalities::Client`** — new client for managing simulation personalities, supporting list, create, get, update, and delete operations against the `eval/simulation/personality` endpoint.
- **`Vapi::SimulationRuns::Client`** — new client for managing simulation runs and run items, including starting runs, cancelling groups or individual items, and generating AI improvement suggestions.
- **`sort_by`** optional field on `ProviderResourceControllerGetProviderResourcesPaginatedRequest` and `ListSessionsRequest`, backed by new `SortBy` enums with values `createdAt`, `duration`, and `cost`.
- **`squad_overrides`** and **`id_any`** optional filter fields on `ListSessionsRequest` for more granular session querying.

### Added
- **`Vapi::SimulationScenarios::Client`** — new client for managing simulation scenarios, with methods to list, create, retrieve, update, and delete scenarios via the `eval/simulation/scenario` API.
- **`Vapi::SimulationScenarios::Types::UpdateScenarioDto`** — request type for updating a scenario, supporting fields such as `name`, `instructions`, `evaluations`, `hooks`, `target_overrides`, `tool_mocks`, `latency_expectations`, and `path`.
- **`Vapi::SimulationScenarios::Types::UpdateScenarioDtoHooksItem`** — union type discriminated by `on`, supporting `SIMULATION_RUN_STARTED` and `SIMULATION_RUN_ENDED` hook variants.
- **`Vapi::SimulationRuns::Types`** — new request/response types for simulation run management, including `CreateSimulationRunDtoSimulationsItem`, `CreateSimulationRunDtoTarget`, cancel/find/generate-suggestions request models, and associated status, sort-by, and sort-order enums.
- **New enum modules** across `SimulationScenarios` and `SimulationRuns` namespaces, including `SimulationRunControllerFindAllRequestStatus`, `SimulationRunControllerFindItemsRequestStatus`, `SimulationRunControllerFindAllRequestFilterStatus`, and sort-related enums.

### Added
- **`Vapi::Simulations::Client`** — new client for managing simulations, with methods to list, create, find, update, delete, and check concurrency, plus AI-powered scenario generation via `simulation_generate_controller_generate`.
- **`Vapi::SimulationSuites::Client`** — new client for managing simulation suites, with full CRUD support and a `simulation_suite_controller_duplicate` method for cloning suites.
- **Supporting DTO and enum types** for both modules, including `CreateSimulationDto`, `UpdateSimulationDto`, `GenerateScenariosDto`, `CreateSimulationSuiteDto`, `UpdateSimulationSuiteDto`, and sort/filter enums.
- **`ListSquadsRequest#id_any`** — new optional field for filtering squads by a comma-separated list of IDs.

### Added
- **`Vapi::TrafficAllocations::Client`** — new client for managing assistant traffic splitting (beta), with methods to list allocation history, create allocations, retrieve the current allocation, and fetch a single allocation by ID.
- **`KnowledgeBaseTool`** and **`GhlTool`** — added as new union members to all tool response types (`GetToolsResponse`, `CreateToolsResponse`, `DeleteToolsResponse`, `UpdateToolsResponse`, `ListToolsResponseItem`); `CreateCodeToolDto` and `UpdateCodeToolDto` added to create/update request unions.
- **`tool_refs`** field (`ToolRef[]`) — new optional field on `AnthropicModel`, `AnthropicBedrockModel`, and `AnyscaleModel` for referencing tools by reference rather than inline definition.
- **`fallback_models`** field — new optional field on `AnthropicBedrockModel` specifying fallback model variants to use when the primary model is unavailable.
- **New structured output types** — `StructuredOutputControllerRunResponse`, `StructuredOutputControllerRunResponseOne`, `UpdateStructuredOutputDtoConditionsItem`, and `StructuredOutputControllerFindAllRequestSortBy` (with `createdAt`, `duration`, `cost` values); new Anthropic model enum values `claude-sonnet-5` and `global.anthropic.claude-haiku-4-5-20251001-v1:0`; new `eu-central-1` region for `AnthropicBedrockCredential`.

### Added
- **`AssistantDraft`** — new resource type representing a versioned draft of an assistant configuration, with full supporting types including `AssistantDraftPaginatedResponse`, `AssistantDraftConflictResponseDto`, and `AssistantPinnedConflictResponseDto`.
- **`AssemblyAiTranscriberMode`** and **`AssemblyAiTranscriberLanguageCodesItem`** — new enums supporting `mode`, `prompt`, `agent_context`, `agent_context_auto_update_enabled`, and `language_codes` optional fields on `AssemblyAiTranscriber`.
- **New speech models** `universal-3-5-pro` and `universal-3-6-pro` added to `AssemblyAiTranscriberSpeechModel`.
- **`VapiModel`** added as a union member to `AssistantModel` and `AssistantOverridesModel`; `XaiTranscriber` and `VapiTranscriber` added to `AssistantOverridesTranscriber`; `XaiVoice` and `MicrosoftVoice` added to `AssistantOverridesVoice`.
- **`latest_version`** and **`model_deprecations`** optional fields added to `Assistant`; **`assistant_version`** and **`squad_version`** optional fields added to `AssistantActivation`; `call.artifact.upload` added to `AssistantOverridesServerMessagesItem`.

### Added
- **`AssistantVersion`** and its full suite of supporting types (`AssistantVersionTranscriber`, `AssistantVersionModel`, `AssistantVersionVoice`, `AssistantVersionPaginatedMetadata`, and more) for managing versioned assistant configurations.
- **`XaiTranscriber`** and **`VapiTranscriber`** added as transcriber options in `AssistantTranscriber` and `AssistantVersionTranscriber` unions; **`XaiVoice`** and **`MicrosoftVoice`** added to `AssistantVoice` and `AssistantVersionVoice` unions.
- **`CALL_ARTIFACT_UPLOAD`** enum value added to `AssistantServerMessagesItem` and `AssistantVersionServerMessagesItem`.
- **New Azure regions** (`switzerlandnorth`, `switzerlandwest`) and **new Azure OpenAI models** (`gpt-5.6-luna-2026-07-09`, `gpt-5.6-terra-2026-07-09`, `gpt-5.6-sol-2026-07-09`, `gpt-4o`, `gpt-4.1`, `gpt-5.4-mini-2026-03-17`) added to their respective enums.
- **`Board`**, **`AudioFormat`**, **`BackgroundSoundUrlValidationResult`**, and **`AssistantPinnedConflictResponseDtoError`** new types added; `latestVersion` field added to `BashTool` and `systemKey` field added to `BarInsight`.

### Added
- **Board types** (`BoardInsightItem`, `BoardItemPosition`, `BoardItemSize`, `BoardItemsItem`, `BoardLayout`, `BoardMetricWidgetItem`, `BoardMetricWidgetItemType`, `BoardPaginatedResponse`) — new types for managing and paginating dashboard boards.
- **Campaign contact types** (`CampaignContact`, `CampaignContactCounters`, `CampaignContactPaginatedResponse`, `CampaignContactWithOutcome`, `CampaignContactWithOutcomeStatus`, `CampaignCallMetrics`, `CampaignPredialPlan`, `CampaignServerMessagesItem`) — full contact lifecycle and metrics support for outbound campaigns.
- **`CallTransport`** — new union type representing the transport layer of a call (Vapi WebSocket, Vonage, Twilio, Vapi SIP, Telnyx, Daily).
- **`CallArtifactUploadItem` / `CallArtifactUploadItemType`** — new types tracking per-artifact upload results (recording, log, PCAP, end-of-call report, etc.).
- **New optional fields** on `Campaign` (`max_concurrency`, `assistant_overrides`, `squad_overrides`, `server`, `server_messages`, `predial_plan`) and on `BotMessage` (`assistant_name`, `assistant_id`); new `cancelled` and `archived` values on `CampaignStatus`; expanded `CallEndedReason` enum with xAI, Microsoft, Cartesia, and other provider error codes.

### Added
- **`CampaignSummary`**, **`CampaignSummaryPaginatedResponse`**, **`CampaignSummaryStatus`**, **`CampaignSummaryEndedReason`**, and **`CampaignSummaryServerMessagesItem`** — new types for tracking campaign lifecycle state and metrics.
- **`ClientInboundMessageAppendContext`** and **`ClientInboundMessageAppendContextKind`** — new inbound message type (`APPEND_CONTEXT`) for appending commentary, thinking, or instructions context during a call.
- **`assistant_version`** optional field added to all `ClientMessage*` types; **`ClientMessageTranscript`** also gains `assistant_id`, `assistant_name`, `confidence`, and `confidence_source` fields.
- **`CartesiaVoiceModel::SONIC_35`** and **`SONIC_3520260504`** enum values added; **`CartesiaTranscriberModel::INK_2`** added; **`CartesiaCredential`** gains an optional `api_url` field.
- **`CerebrasModel`** gains an optional `tool_refs` field for referencing tools by reference alongside inline tool definitions.

### Added
- **`CreateAssistantDraftDto`** — new type (and full suite of supporting types) for creating assistant drafts, including transcriber, model, voice, hooks, credentials, and voicemail detection configuration.
- **`XaiTranscriber` and `VapiTranscriber`** — new transcriber provider members added to `CreateAssistantDtoTranscriber` and `ConversationNodeTranscriber` unions.
- **`XaiVoice` and `MicrosoftVoice`** — new voice provider members added to `CreateAssistantDtoVoice` and `ConversationNodeVoice` unions.
- **`ConflictErrorBody`** — new union type representing tool conflict errors, with `ToolPinnedConflictResponseDto` and `ToolWriteConflictResponseDto` members.
- **New enum values and types** — `ContextEngineeringPlanPreviousAssistantMessages`, `EU_CENTRAL_1` region for Anthropic Bedrock, `VapiModel` in model unions, and `CALL_ARTIFACT_UPLOAD` in server message enums.

### Added
- **`CreateCampaignDto`** and **`CreateCampaignDtoServerMessagesItem`** — new types for creating and configuring outbound calling campaigns with assistant, squad, or workflow routing, scheduling, and server message subscriptions.
- **`CreateElevenLabsCredentialDtoApiUrl`** — new enum for selecting the ElevenLabs API endpoint (standard or EU residency); exposed as an optional `api_url` field on `CreateElevenLabsCredentialDto`.
- **Optional `api_url` field** on `CreateCartesiaCredentialDto` — allows specifying a custom Cartesia API endpoint.
- **Optional `squad_overrides` field** on `CreateCustomerDto` — enables per-customer squad-level assistant overrides.
- **New Azure region and model enum values** — `SWITZERLANDNORTH` and `SWITZERLANDWEST` added to Azure region enums; `gpt-5.6-luna`, `gpt-5.6-terra`, `gpt-5.6-sol`, `gpt-4o`, `gpt-4.1`, and `gpt-5.4-mini-2026-03-17` added to `CreateAzureOpenAiCredentialDtoModelsItem`.

### Added
- **`CreateSimulationRunResponse`** — new type representing the response from creating a simulation run, including status, timing, item counts, and a `CreateSimulationRunResponseStatus` enum (`queued`, `running`, `ended`).
- **`CreateToolDraftDto`** — new type for creating tool drafts, with supporting enums `CreateToolDraftDtoType`, `CreateToolDraftDtoMethod`, and `CreateToolDraftDtoVerb`.
- **`CreateS3CompatibleCredentialDto`** — new credential type for S3-compatible storage backends, alongside `CreateOutboundCallDtoTransport` for specifying outbound call transport providers.
- **`CreateTrafficAllocationTargetDto`** and **`CreateStructuredOutputDtoConditionsItem`** — new supporting types for traffic allocation and structured output trigger conditions.
- Optional fields added to existing types: `latency_expectations` on `CreateScenarioDto`, `conditions` on `CreateStructuredOutputDto`, and `api_url` on `CreateSonioxCredentialDto`.

### Added
- **`CreateWebCallDto`** gains optional `assistant_version` and `squad_version` fields for versioned assistant and squad targeting.
- **`tool_refs`** optional field (array of `ToolRef`) added to `CustomLlmModel`, `DeepInfraModel`, and `DeepSeekModel` for referencing tools by reference.
- **`DeepgramVoice`** gains optional `speed` and `expressivity` fields; `DeepgramVoiceId` adds 43 new voice identifiers; `DeepgramVoiceModel` adds the `FLUX` variant.
- **`ElevenLabsCredential`** gains an optional `api_url` field backed by the new `ElevenLabsCredentialApiUrl` enum (standard and EU-residency endpoints).
- **New types** `EndedReasonCondition`, `EndedReasonConditionOperator`, `DeepgramTranscriberRedactionItem`, and `CustomerSpeechTimeoutOptionsTriggerResetMode` introduced; new voice/transcriber providers `XaiVoice`, `MicrosoftVoice`, `XaiTranscriber`, and `VapiTranscriber` added to workflow union types; new model enum values added across `DeepSeekModelModel`, `ElevenLabsVoiceModel`, `EvalAnthropicModelModel`, `EvalOpenAiModelModel`, and `EvalGoogleModelModel`.

### Added
- **`FallbackMicrosoftVoice`** — new fallback voice provider for Microsoft Azure speech synthesis, with support for voice ID, style, role, speed, and chunk plan configuration.
- **`FallbackXaiVoice` and `FallbackMicrosoftVoice`** registered as members of **`FallbackPlanVoicesItem`**, making them available in fallback voice plans.
- **`sort_by` and `id_any`** optional fields added to **`ExportChatDto`** and **`ExportSessionDto`** for more flexible chat and session export filtering and ordering.
- **`FallbackAssemblyAiTranscriber`** gains optional `mode`, `prompt`, `agent_context`, `agent_context_auto_update_enabled`, and `language_codes` fields for richer transcription configuration.
- **New enum values** added across multiple types: Deepgram voice IDs (40+ new voices), OpenAI voice IDs (`ash`, `coral`, `verse`, and more), Cartesia/Rime AI models, Google transcriber models (`gemini-3.5-flash`, `gemini-3.1-flash-lite`), ElevenLabs model (`eleven_v4_turbo`), and Deepgram voice model (`flux`).

### Added
- **`KnowledgeBaseV2`**, **`KnowledgeBaseV2WithFiles`**, **`KnowledgeBaseV2File`**, and **`KnowledgeBaseV2FileStatus`** — new types for managing v2 knowledge bases and their associated files, including indexing status tracking.
- **`KnowledgeBaseTool`**, **`KnowledgeBaseToolFunction`**, and **`KnowledgeBaseToolMessagesItem`** — new reusable tool type that queries a knowledge base during assistant conversations.
- **`LatencyExpectation`** and **`LatencyEvaluationResult`** — new types for defining and evaluating latency thresholds (mean, median, p95, max) across turn, model, and voice metrics.
- **`tool_refs`** field added to **`GoogleModel`**, **`GroqModel`**, and **`InflectionAiModel`** — allows referencing tools by `ToolRef` in addition to inline tool definitions.
- **New Gemini model variants** (`GEMINI_35_FLASH`, `GEMINI_31_FLASH_LITE`) added to `GoogleModelModel`, `GoogleTranscriberModel`, and `KnowledgeBaseModel` enums; new event constants added to `JsonQueryOnEventsTableOn`; `PREVIOUS_ASSISTANT_MESSAGES` added to handoff context engineering plan unions; `latest_version` field added to `GoogleSheetsRowAppendTool` and `HandoffTool`; `system_key` added to `Insight`; and `InviteUserDtoRoleZero` enum introduced.

### Added
- **`MicrosoftVoice`** — new TTS voice provider backed by Azure, with `MicrosoftVoiceRole`, `MicrosoftVoiceStyle`, `MicrosoftVoiceVoiceId`, and `MicrosoftCredentialProvider` supporting types.
- **`OpenAiModelModel` / `OpenAiModelFallbackModelsItem`** — new GPT-5.5, GPT-5.6-*, GPT-6-luna, `gpt-realtime-2`, and region-specific Azure model variants; new `OpenAiModelServiceTier` and `OpenAiModelReasoningEffort` enums; new `service_tier`, `reasoning_effort`, `speaker`, and `reasoner` fields on `OpenAiModel`.
- **`LegacyAssistantVersion`** and **`LegacyAssistantVersionPaginatedResponse`** — types for retrieving paginated historical assistant snapshots.
- **`ModelDeprecationNotice`** — new type exposing deprecation and retirement dates, replacement status, and replacement model for a given provider model.
- **New condition and metric types** — `MinCallDurationCondition`, `MinMessagesCondition`, `NumberComparatorScorecardMetricCondition`, and `LatencyExpectationMetric` for richer call-evaluation rules; optional `latest_version` on `MakeTool`/`McpTool`, `tool_refs` on `OpenAiModel`/`MinimaxLlmModel`, and `reasoning_tokens`/`seconds`/`usage_complete` on `ModelCost`.

### Added
- **`ServerMessageCallArtifactUpload`** — new server message type for call artifact upload events, including associated phone number and type enums.
- **`ServerMessageCampaignPredial`** — new server message type for campaign pre-dial events, including associated phone number and type enums.
- **`assistant_version`** — new optional field added to all `ServerMessage*` model types, exposing the assistant version associated with each server message.
- **`Scenario#latency_expectations`** — new optional field on `Scenario` for specifying `LatencyExpectation` entries.
- **New enum values** added to `ServerMessageEndOfCallReportEndedReason` covering xAI and Microsoft voice/transcriber errors, Cartesia transcriber failures, ElevenLabs concurrent-request and voice-disabled errors, SIP outbound codes, assistant/squad version validation errors, and additional Vapi pipeline error codes.
- **`S3CompatibleStorageCredentialProvider`**, **`SayHookActionExact`**, **`ScenarioInUseConflictResponseDto`**, and **`ScorecardMetricConditionsItem`** — new types added to the SDK.

### Added
- **`ServerMessageResponseCampaignPredial`** — new server message response type with an `eligible` boolean field, registered as a variant of `ServerMessageResponseMessageResponse`.
- **`assistant_version` field** — optional string field added to all server message types (`ServerMessageSessionCreated`, `ServerMessageSessionDeleted`, `ServerMessageSessionUpdated`, `ServerMessageSpeechUpdate`, `ServerMessageStatusUpdate`, `ServerMessageToolCalls`, `ServerMessageTranscript`, `ServerMessageTransferDestinationRequest`, `ServerMessageTransferUpdate`, `ServerMessageUserInterrupted`, `ServerMessageVoiceInput`, `ServerMessageVoiceRequest`) to expose the assistant version on every server event.
- **`ServerMessageTranscript` enrichment** — new optional fields `assistant_id`, `assistant_name`, `confidence`, and `confidence_source` (with new `ServerMessageTranscriptConfidenceSource` enum: `provider`, `derived`) added to transcript messages.
- **Simulation run list types** — new classes `SimulationRunListItem`, `SimulationRunListSource`, `SimulationRunListSummary`, `SimulationRunsPaginatedResponse`, `SimulationRunPaymentRequiredResponse`, and supporting enums (`SimulationRunListItemStatus`, `SimulationRunListSourceType`, `SimulationRunPaymentRequiredResponseReason`, `SimulationSuiteTargetAssignment`, `SimulationSuiteTargetAssignmentTargetType`) for paginated simulation run listing.
- **New `ServerMessageStatusUpdateEndedReason` values** — added constants for xAI and Microsoft voice/transcriber errors, Cartesia transcriber failures, SIP outbound unallocated number and carrier-released scenarios, ElevenLabs concurrent/disabled voice errors, assistant/squad version validation errors, and additional call-forwarding and worker-not-available codes.

### Added
- **`SquadVersion`**, **`SquadVersionPaginatedResponse`**, and **`SquadVersionPaginatedMetadata`** — new types for managing and paginating squad configuration versions.
- **`SkippedStructuredOutput`**, **`StructuredOutputRerunResponse`**, **`StructuredOutputRunPreviewResponse`**, **`StructuredOutputRunResult`**, and **`StructuredOutputCostBreakdown`** — new types supporting structured output execution, preview, and cost tracking.
- **`SonioxTranscriber`** gains `languages`, `endpointSensitivity`, `endpointLatencyAdjustmentLevel`, `contextGeneral`, and `confidenceThreshold` fields; **`SonioxTranscriberModel`** adds the `stt-rt-v5` value; **`SonioxTranscriberLanguagesItem`** enum provides full ISO 639-1 language coverage.
- **`latestVersion`** field added to **`SlackSendMessageTool`**, **`SmsTool`**, and **`TextEditorTool`**; **`Squad`** gains `latestVersion` and `modelDeprecations`; **`SquadMemberDto`** gains `assistantVersion`.
- **`TelnyxTransport`**, **`SubscriptionBillingCollectionMethod`**, and **`StructuredOutputConditionsItem`** types added; `xai` and `microsoft` providers added to **`SyncVoiceLibraryDtoProvidersItem`**; `conditions` added to **`StructuredOutput`**; `systemKey` added to **`TextInsight`**.

### Added
- **`ToolVersion`** and **`ToolVersionPaginatedResponse`** — new types for managing versioned snapshots of tools, including full configuration and pagination support.
- **`ToolDraft`** and **`ToolDraftPaginatedResponse`** — new types supporting tool draft workflows, with associated enums `ToolDraftType`, `ToolDraftMethod`, and `ToolDraftVerb`.
- **`TrafficAllocation`** and **`TrafficAllocationTarget`** — new types for routing assistant traffic across versions, with conflict response DTOs and pagination support.
- **`ToolRef`** — new type for referencing a tool by ID and version; exposed as optional `tool_refs` field on `TogetherAiModel`.
- **`ToolCallResultMessageWarning`** and **`ToolMessageFailedRole`** — new type and enum for tool call result warnings (e.g. oversized responses) and role assignment on failed tool messages; `warnings` field added to `ToolCallResultMessage` and `role` field added to `ToolMessageFailed`.

### Added
- **`TransferArtifact`** — new type capturing the outcome of a call transfer, including destination, mode, transcript, status, and messages.
- **`TransientTwilioPhoneNumber`** — new type for configuring a transient Twilio phone number with routing, hooks, and fallback destination support.
- **`TwilioTransport`** — new type exposing Twilio transport details (conversation type, account SID, call SID, call token, forwarded-from) on a call.
- **`UpdateAssistantDraftDto`** — new DTO for updating assistant drafts, with the full set of assistant configuration fields.
- **New optional fields** added to `TransferDestinationAssistant`, `TransferDestinationNumber`, and `TransferDestinationSip` (`name`); `TransferCallTool` (`latestVersion`); and multiple `UpdateXxxCredentialDto` types (`provider`). New `eu-central-1` region added to `UpdateAnthropicBedrockCredentialDtoRegion`. `XaiTranscriber`, `VapiTranscriber`, `XaiVoice`, and `MicrosoftVoice` added as members of the `TransferAssistantTranscriber` and `TransferAssistantVoice` unions.

### Added
- **`UpdateCampaignDto`** and **`UpdateCampaignDtoStatus`** — new types for updating outbound calling campaigns, including name, assistant/workflow/squad assignment, phone number, dial plan, schedule, and status (`ended` / `cancelled`).
- **`UpdateAssistantVersionMetadataDto`** — new type for updating assistant version metadata with optional `versionName` and `versionDescription` fields.
- **`UpdateAssistantDraftDtoModel`**, **`UpdateAssistantDraftDtoTranscriber`**, **`UpdateAssistantDraftDtoVoice`**, **`UpdateAssistantDraftDtoServerMessagesItem`**, and related voicemail-detection types — new union/enum types for configuring assistant drafts.
- **`provider` field** added as an optional field to all credential and knowledge-base update DTOs (Azure, Cartesia, Cerebras, Cloudflare, Custom, DeepInfra, DeepSeek, Deepgram, Email, GCP, Gladia, and more), each backed by a new single-value provider enum.
- **New enum values** across several types: Azure OpenAI models (`gpt-5.6-luna-2026-07-09`, `gpt-5.6-terra-2026-07-09`, `gpt-5.6-sol-2026-07-09`, `gpt-4o`, `gpt-4.1`, `gpt-5.4-mini-2026-03-17`), Azure regions (`switzerlandnorth`, `switzerlandwest`), and ElevenLabs API URLs (`UpdateElevenLabsCredentialDtoApiUrl`).

### Added
- **`provider` field** added as a new optional field to 20+ existing `Update*CredentialDto` types (e.g., `UpdateGoHighLevelCredentialDto`, `UpdateGoogleCredentialDto`, `UpdateGroqCredentialDto`, `UpdateOpenAiCredentialDto`, and others), each backed by a corresponding provider enum module.
- **`UpdateMicrosoftCredentialDto`** and **`UpdateMicrosoftCredentialDtoProvider`** — new types for managing Microsoft credential update payloads.
- **`UpdateS3CompatibleCredentialDto`**, **`UpdateS3CompatibleCredentialDtoProvider`**, and **`UpdateS3CompatibleBucketPlanDto`** — new types for managing S3-compatible storage credential update payloads.
- **`UpdateKnowledgeBaseToolDto`** and **`UpdateKnowledgeBaseToolDtoMessagesItem`** — new types for updating knowledge base tool configurations.
- **`type` field** added as a new optional field to `UpdateMakeToolDto` and `UpdateOutputToolDto`, each backed by a corresponding enum module.

## 2.0.0 - 2026-06-24
### Breaking Changes
* **`Vapi::Types::CartesiaExperimentalControlsSpeedZero`** has been renamed to **`Vapi::Types::CartesiaSpeedControlZero`**. Update any references to use the new name.
* **`Vapi::Types::FallbackAzureVoiceVoiceIdZero`** has been renamed to **`Vapi::Types::FallbackAzureVoiceIdZero`**. Update any references to use the new name.

## 1.1.0 - 2026-04-22
### Added
* **`Call#subscription_limits`** — new optional field exposing `SubscriptionLimits` data directly on `Call` objects.

## 0.0.3 - 2026-04-11
* chore: remove User-Agent header from HTTP client
* Remove the hardcoded `User-Agent` header from the default headers sent
* with every SDK request. This is an internal SDK header change with no
* impact on public API surface or consumer code.
* Key changes:
* Remove `"User-Agent" => "vapi-server-sdk/0.0.2"` from default request headers
* 🌿 Generated with Fern

## 0.0.1 - 2026-04-07
* Initial SDK generation
* 🌿 Generated with Fern

