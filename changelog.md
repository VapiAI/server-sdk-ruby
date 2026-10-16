## [3.0.0] - 2026-10-16
### Breaking Changes

- **`UpdateAssistantDtoCredentialsItem`** — the `TRIEVE` credential variant (`CreateTrieveCredentialDto`) has been removed from the union. Update any code passing a Trieve credential to use an alternative credential type.

### Added

- **`UpdateAssistantDtoCredentialsItem`** — two new credential variants: `CreateS3CompatibleCredentialDto` (key `S_3_COMPATIBLE`) and `CreateMicrosoftCredentialDto` (key `MICROSOFT`).
- **`CreateCallDto`** — new optional fields `assistant_version`, `squad_version`, and a typed `transport` field (replacing the previous untyped hash).
- **`sort_by` parameter** — added to list/paginated endpoints across `Chats`, `Eval`, `Insight`, `ObservabilityScorecard`, `PhoneNumbers`, `ProviderResources`, and `Sessions` clients for finer-grained result ordering.
- **New filter parameters** — `id_any` on Chats and Sessions list; `squad_overrides` on Sessions list; `search` on eval runs pagination; `purpose` on Files list and upload; `metadata` on file upload.
- **`Vapi::Board::Client`** — new reporting client with full CRUD support for boards (`board_controller_find_all`, `board_controller_create`, `board_controller_find_one`, `board_controller_remove`, `board_controller_update`) and a `board_controller_metrics_overview_ensure` method for the default metrics-overview board.
- **Call artifact download methods** — seven new methods on `Vapi::Calls::Client` for downloading call recordings and logs: `call_artifact_controller_mono_recording_download`, `stereo_recording_download`, `video_recording_download`, `customer_recording_download`, `assistant_recording_download`, `pcap_download`, and `call_logs_download`.
- **New transcriber and voice providers** — `XaiTranscriber` and `VapiTranscriber` added to `UpdateAssistantDtoTranscriber`; `XaiVoice` and `MicrosoftVoice` added to `UpdateAssistantDtoVoice`.
- **New enum values** — `CALL_ARTIFACT_UPLOAD` added to `UpdateAssistantDtoServerMessagesItem`; `CANCELLED` and `ARCHIVED` added to `CampaignControllerFindAllRequestStatus`; `sort_by` field and `CampaignControllerFindAllRequestSortBy` enum added to campaign list requests.
- **`Vapi::KnowledgeBasesV2::Client`** — new client for managing v2 knowledge bases, including CRUD operations and file attachment, detachment, and retry methods.
- **`Vapi::Simulations::Client`** and related clients (`SimulationPersonalities`, `SimulationScenarios`, `SimulationRuns`, `SimulationSuites`) — new clients for simulation workflows.
- **`Vapi::TrafficAllocations::Client`** and **`Vapi::Board::Client`** — new top-level namespace clients accessible directly from the root `Vapi::Client`.
- **`sort_by`** optional field added to `ListChatsRequest`, `EvalControllerGetPaginatedRequest`, and `InsightControllerFindAllRequest`; **`id_any`** filter field added to `ListChatsRequest`.
- **`ListFilesRequest`** and **`CreateFilesRequestPurpose`** — new types for filtering files by purpose (`assistant`, `composer-attachment`, `knowledge-base-v2`); **`assistant_id`** optional field added to `InsightRunDto`.
- **`Vapi::SimulationPersonalities::Client`** — new client for managing simulation personalities, with methods to list, create, retrieve, update, and delete personalities used in AI tester simulations.
- **`sort_by` field** — new optional `sort_by` parameter (values: `createdAt`, `duration`, `cost`) added to `ScorecardControllerGetPaginatedRequest`, `PhoneNumberControllerFindAllPaginatedRequest`, `ProviderResourceControllerGetProviderResourcesPaginatedRequest`, and `ListSessionsRequest` for finer-grained result ordering.
- **`ListSessionsRequest#squad_overrides`** — new optional field for filtering sessions by squad overrides.
- **`ListSessionsRequest#id_any`** — new optional field for filtering sessions by any matching ID.
- **`Vapi::SimulationScenarios::Client`** — new client for managing simulation scenarios, supporting list, create, get, update, and delete operations against the `eval/simulation/scenario` endpoint.
- **`Vapi::SimulationSuites::Client`** — new client for managing simulation suites, supporting list, create, duplicate, get, update, and delete operations against the `eval/simulation/suite` endpoint.
- **`Vapi::SimulationSuites::Types::CreateSimulationSuiteDto`** and **`UpdateSimulationSuiteDto`** — request DTOs for creating and updating simulation suites, including fields for `name`, `slack_webhook_url`, `simulation_ids`, `target_assignments`, and `path`.
- **`Vapi::SimulationScenarios::Types::UpdateScenarioDto`** — request DTO for updating scenarios, including `instructions`, `evaluations`, `hooks`, `target_overrides`, `tool_mocks`, and `latency_expectations`.
- **New enum types** `ScenarioControllerFindAllRequestSortBy`, `ScenarioControllerFindAllRequestSortOrder`, `SimulationSuiteControllerFindAllRequestSortBy`, and `SimulationSuiteControllerFindAllRequestSortOrder` for filtering and sorting list results.
- **`Vapi::Simulations::Client`** — new client for the Simulations API, supporting scenario generation (`simulation_generate_controller_generate`), listing (`simulation_controller_find_all`), creating (`simulation_controller_create`), fetching (`simulation_controller_find_one`), deleting (`simulation_controller_remove`), updating (`simulation_controller_update`), and concurrency checks (`simulation_controller_get_concurrency`).
- **`KnowledgeBaseTool`** and **`GhlTool`** — added as new union members to all tool response types (`GetToolsResponse`, `ListToolsResponseItem`, `CreateToolsResponse`, `DeleteToolsResponse`, `UpdateToolsResponse`).
- **`CreateCodeToolDto`** and **`UpdateCodeToolDto`** — added as new `CODE` union members to `CreateToolsRequest` and `UpdateToolsRequestBody` respectively.
- **`StructuredOutputControllerRunResponse`**, **`StructuredOutputControllerFindAllRequestSortBy`**, and **`UpdateStructuredOutputDtoConditionsItem`** — new types supporting structured output run results and filtering.
- **`id_any`** filter field on `ListSquadsRequest` and **`sort_by`** field on `StructuredOutputControllerFindAllRequest` — new optional query parameters for finer-grained list filtering.
- **`Vapi::TrafficAllocations::Client`** — new client for the beta traffic-splitting API, supporting paginated history, creating allocations, fetching the latest allocation, and retrieving a single allocation by ID.
- **`tool_refs` and `reasoning_effort` fields** — added as optional fields on `AnthropicModel`, `AnthropicBedrockModel`, and `AnyscaleModel` to support tool references and reasoning-effort control; `AnthropicBedrockModel` also gains `fallback_models`.
- **`AssemblyAiTranscriber` enhancements** — new optional fields `mode`, `prompt`, `agent_context`, `agent_context_auto_update_enabled`, and `language_codes`; new `AssemblyAiTranscriberMode` (`max_accuracy`, `min_latency`, `balanced`) and `AssemblyAiTranscriberLanguageCodesItem` enums; new speech models `universal-3-5-pro` and `universal-3-6-pro`.
- **`Assistant#latest_version` and `Assistant#model_deprecations`** — new optional fields exposing the assistant's latest published version string and any model deprecation notices.
- **New enum values and type fields** — `AnthropicModelModel` gains `claude-sonnet-5` and `claude-haiku-5-5`; `AnthropicBedrockCredentialRegion` gains `eu-central-1`; `AnalysisCost` gains `structured_output_breakdown`; `AssistantActivation` gains `assistant_version` and `squad_version`.
- **`AssistantDraft`** — new type representing a versioned draft of an assistant, with full paginated response support via `AssistantDraftPaginatedResponse` and `AssistantDraftPaginatedMetadata`.
- **Conflict response types** — `AssistantDraftConflictResponseDto`, `AssistantManagedConflictResponseDto`, and `AssistantPinnedConflictResponseDto` for handling draft conflict scenarios.
- **`VapiModel`** — added as a new provider member to `AssistantModel` and `AssistantOverridesModel` unions.
- **`XaiTranscriber` and `VapiTranscriber`** — added as new provider members to `AssistantTranscriber` and `AssistantOverridesTranscriber` unions; `XaiVoice` and `MicrosoftVoice` added to `AssistantOverridesVoice`.
- **`CALL_ARTIFACT_UPLOAD`** — new enum value added to `AssistantServerMessagesItem` and `AssistantOverridesServerMessagesItem`.
- **`AssistantVersion`** and supporting types (`AssistantVersionTranscriber`, `AssistantVersionModel`, `AssistantVersionVoice`, `AssistantVersionVoicemailDetection`, `AssistantVersionPaginatedMetadata`, and related enums) for managing versioned assistant configurations.
- **`Board`**, **`BoardInsightItem`**, **`BoardItemPosition`**, and **`BoardItemSize`** types for dashboard board support, including layout and time-range override fields.
- **`AudioFormat`** and **`BackgroundSoundUrlValidationResult`** types, along with their associated enum modules (`AudioFormatFormat`, `BackgroundSoundUrlValidationResultReason`).
- New enum values across several types: GPT-5.6 and GPT-4.1 model variants in `AzureOpenAiCredentialModelsItem`; `switzerlandnorth` and `switzerlandwest` in `AzureCredentialRegion` and `AzureOpenAiCredentialRegion`; `XAI` and `MICROSOFT` voice providers in `AssistantVoice`.
- New optional fields `latest_version` and `baseline_version` on **`BashTool`**, and `system_key` on **`BarInsight`** and **`Board`**.
- **`CampaignContact`**, **`CampaignContactWithOutcome`**, **`CampaignContactCounters`**, **`CampaignContactPaginatedResponse`**, **`CampaignSummary`**, **`CampaignCallMetrics`**, **`CampaignPredialPlan`**, and **`CampaignServerMessagesItem`** — new types for managing campaign contacts and tracking campaign progress.
- **`BoardItemsItem`**, **`BoardLayout`**, **`BoardMetricWidgetItem`**, **`BoardMetricWidgetItemType`**, and **`BoardPaginatedResponse`** — new types for analytics board and metric widget support.
- **`BooleanComparatorScorecardMetricCondition`** and related enum types — new types for defining boolean scorecard metric conditions.
- **`CallTransport`** — new union type discriminated by `provider`, supporting `VAPI_WEBSOCKET`, `VONAGE`, `TWILIO`, `VAPI_SIP`, `TELNYX`, and `DAILY` transport variants.
- **`CallEndedReason`** — extended with new values for xAI/Microsoft voice and transcriber errors, Cartesia transcriber failures, SIP outbound scenarios, ElevenLabs concurrent-request and voice-disabled errors, squad/version validation errors, and more; **`CampaignStatus`** gains `CANCELLED` and `ARCHIVED` values; **`BotMessage`** gains optional `assistant_name` and `assistant_id` fields; **`Campaign`** gains optional `max_concurrency`, `assistant_overrides`, `squad_overrides`, `server`, `server_messages`, and `predial_plan` fields.
- **`CampaignSummaryPaginatedResponse`**, **`CampaignSummaryServerMessagesItem`**, and **`CampaignSummaryStatus`** — new types supporting campaign management with paginated results and status/event enumerations.
- **`ClientInboundMessageAppendContext`** — new inbound message type (with `kind` and `content` fields) registered as the `APPEND_CONTEXT` variant in the `ClientInboundMessageMessage` union.
- **`assistant_version`** — new optional field added to all `ClientMessage*` types; `ClientMessageTranscript` also gains `assistant_id`, `assistant_name`, `confidence`, and `confidence_source` fields.
- **New Cartesia capabilities** — `CartesiaVoiceModel` gains `sonic-3.5` and `sonic-3.6` model variants; `CartesiaTranscriberModel` gains `ink-2`; `CartesiaVoiceLanguage` gains Odia (`or`) and Urdu (`ur`); `CartesiaCredential` gains an optional `api_url` field.
- **`tool_refs`** on `CerebrasModel` and **`latest_version`/`baseline_version`** on `CodeTool` — new optional fields for tool reference linking and version tracking.
- **`CreateAssistantDraftDto`** — new type (and full suite of supporting union/enum types) for creating assistant drafts with configurable transcriber, model, voice, and behavior fields.
- **`XaiTranscriber` and `VapiTranscriber`** — new transcriber options available in `CreateAssistantDtoTranscriber` and `ConversationNodeTranscriber`.
- **`XaiVoice` and `MicrosoftVoice`** — new voice provider options available in `CreateAssistantDtoVoice` and `ConversationNodeVoice`.
- **`ConflictErrorBody`** — new union type discriminating between `TOOL_PINNED` and `TOOL_WRITE_CONFLICT` conflict error responses.
- **New region and field additions** — `eu-central-1` added to `CreateAnthropicBedrockCredentialDtoRegion`; `switzerlandnorth`/`switzerlandwest` added to `CreateAzureCredentialDtoRegion`; `latestVersion` and `baselineVersion` optional fields added to `ComputerTool`; `VapiModel` added to `CreateAssistantDtoModel`.
- **`CreateCampaignDto`** — new type for configuring outbound calling campaigns with assistant, squad, or workflow selection, customer lists, dial plans, and scheduling.
- **`CreateCampaignDtoServerMessagesItem`** — new enum covering campaign and contact lifecycle server-message events (e.g. `campaign.started`, `contact.dispatched`).
- **`CreateElevenLabsCredentialDtoApiUrl`** — new enum for selecting the ElevenLabs API endpoint, including EU residency; exposed as optional `api_url` on `CreateElevenLabsCredentialDto`.
- **New enum values** added to `CreateAzureOpenAiCredentialDtoModelsItem` (GPT-5.6 Luna/Terra/Sol, GPT-4o, GPT-4.1, GPT-5.4-mini-2026-03-17) and `CreateAzureOpenAiCredentialDtoRegion` (`switzerlandnorth`, `switzerlandwest`).
- **Optional fields** `api_url` on `CreateCartesiaCredentialDto` and `squad_overrides` on `CreateCustomerDto` for finer-grained credential and customer configuration.
- **`CreateSimulationRunResponse`** — new type representing the response from creating a simulation run, including status, timing, item counts, target, and transport fields.
- **`CreateToolDraftDto`** — new type for creating draft tools, with supporting enum types `CreateToolDraftDtoType`, `CreateToolDraftDtoMethod`, and `CreateToolDraftDtoVerb`.
- **`CreateS3CompatibleCredentialDto`** — new credential type for configuring S3-compatible storage buckets.
- **`CreateOutboundCallDtoTransport`** and **`CreateTrafficAllocationTargetDto`** — new types for outbound call transport selection and assistant version traffic allocation.
- **`CreateStructuredOutputDto#conditions`**, **`CreateScenarioDto#latency_expectations`**, **`CreateSonioxCredentialDto#api_url`**, and **`CreateWebCallDto#assistant_version`/`squad_version`** — new optional fields on existing DTOs.
- **`XaiVoice` and `MicrosoftVoice`** added as voice options in `CreateWorkflowDtoVoice`; **`XaiTranscriber`** and **`VapiTranscriber`** added to `CreateWorkflowDtoTranscriber`.
- **`latestVersion` and `baselineVersion`** optional fields added to `DtmfTool` and `EndCallTool`; **`toolRefs`** optional field added to `CustomLlmModel`, `DeepInfraModel`, and `DeepSeekModel`.
- **`ElevenLabsCredentialApiUrl`** enum and **`api_url`** optional field added to `ElevenLabsCredential` for EU residency endpoint support; **`speed`** and **`expressivity`** optional fields added to `DeepgramVoice`; 43 new Deepgram voice IDs added to `DeepgramVoiceId`.
- **New enum values** added across `DeepSeekModelModel` (`deepseek-flash`, `deepseek-flash-thinking`), `EvalAnthropicModelModel` (`claude-sonnet-5`, `claude-haiku-5-5`), `EvalGoogleModelModel` (Gemini 3.x variants), `EvalOpenAiModelModel` (GPT-5.x and regional variants), and `DeepgramVoiceModel` (`flux`).
- **New types** `CustomerSpeechTimeoutOptionsTriggerResetMode`, `DeepgramTranscriberRedactionItem`, `EndedReasonCondition`, `EndedReasonConditionOperator`, and `ExportChatDtoSortBy` added; **`path`** field added to `EvaluationPlanItem`; **`sortBy`** and **`idAny`** fields added to `ExportChatDto`.
- **`FallbackMicrosoftVoice`** — new fallback voice provider for Microsoft Azure TTS, supporting voice ID, style, style degree, role, speed, and chunk plan configuration; registered as a `MICROSOFT` member in `FallbackPlanVoicesItem`.
- **`FallbackXaiVoice`** — new `XAI` fallback voice option added to `FallbackPlanVoicesItem`.
- **`FallbackAssemblyAiTranscriber`** — new optional fields `mode`, `prompt`, `agentContext`, `agentContextAutoUpdateEnabled`, and `languageCodes` added, along with new `FallbackAssemblyAiTranscriberMode` and `FallbackAssemblyAiTranscriberLanguageCodesItem` enums.
- **`FallbackDeepgramVoice`** — new optional `speed` and `expressivity` fields; `FallbackDeepgramVoiceId` expanded with 43 new voice IDs; `FallbackDeepgramVoiceModel` gains `flux`; `FallbackDeepgramTranscriberRedactionItem` enum added.
- **New enum values and fields** across `ExportSessionDto` (`idAny`, `sortBy`), `FallbackSonioxTranscriber` (`languages`, `endpointSensitivity`, `endpointLatencyAdjustmentLevel`, `contextGeneral`, `confidenceThreshold`), Cartesia voice models (`sonic-3.5`, `sonic-3.6` series), Rime AI voice IDs and models (`coda`, `mistv3`), Google transcriber models (`gemini-3.x` series), ElevenLabs `eleven_v4_turbo`, and OpenAI voice IDs.
- **`tool_refs`** — new optional field on `GoogleModel`, `GroqModel`, and `InflectionAiModel` for referencing tools by `ToolRef` objects.
- **`KnowledgeBaseTool`, `KnowledgeBaseV2`, `KnowledgeBaseV2File`, `KnowledgeBaseV2WithFiles`** — new types for managing knowledge bases and their associated files via the v2 API.
- **`LatencyEvaluationResult`** — new type (with `LatencyEvaluationResultMetric` and `LatencyEvaluationResultAggregation` enums) for representing latency evaluation outcomes.
- **New Gemini model enum values** (`GEMINI_38_FLASH`, `GEMINI_35_FLASH`, `GEMINI_31_FLASH_LITE`) added to `GoogleModelModel`, `GoogleTranscriberModel`, and `KnowledgeBaseModel`.
- **New event constants** added to `JsonQueryOnEventsTableOn`, including `SERVER_MESSAGE_REQUEST_SUCCEEDED`, `SERVER_MESSAGE_REQUEST_FAILED`, `ASSISTANT_KNOWLEDGE_BASE_REQUEST_SUCCEEDED`, `ASSISTANT_MODEL_RESPONSE_EMPTY`, and analysis/pipeline events; `ContextEngineeringPlanPreviousAssistantMessages` added to handoff destination context engineering plan unions.
- **`MicrosoftVoice`** — new voice provider type for Microsoft Azure TTS, with support for `MicrosoftVoiceVoiceId`, `MicrosoftVoiceStyle`, `MicrosoftVoiceRole`, and `MicrosoftCredentialProvider`.
- **`LatencyExpectation`**, **`LatencyExpectationMetric`**, and **`LatencyExpectationAggregation`** — new types for defining and evaluating call latency thresholds by metric and aggregation method.
- **`ModelDeprecationNotice`** and **`ModelDeprecationNoticeReplacementStatus`** — new types for surfacing model deprecation and retirement information.
- **`LegacyAssistantVersion`** and **`LegacyAssistantVersionPaginatedResponse`** — new types for retrieving paginated assistant version history.
- **New fields on existing types** — `OpenAiModel` gains `tool_refs`, `speaker`, `reasoner`, `service_tier`, and `reasoning_effort`; `ModelCost` gains `seconds`, `usage_complete`, `reasoning_tokens`, and `service_tier_breakdown`; `MakeTool` and `McpTool` gain `latest_version` and `baseline_version`; `LineInsight` gains `system_key`; new GPT-5.x/6 variants added to `OpenAiModelFallbackModelsItem`.
- **`S3CompatibleStorageCredential`**, **`S3CompatibleBucketPlan`**, and **`S3CompatibleStorageCredentialProvider`** — new types enabling S3-compatible storage credential configuration.
- **`ServerMessageCampaignPredial`** and **`ServerMessageCallArtifactUpload`** — new server message types for campaign pre-dial events and call artifact upload notifications.
- **`assistant_version`** — new optional field added to all server message types (e.g. `ServerMessageAssistantRequest`, `ServerMessageEndOfCallReport`, `ServerMessageConversationUpdate`, and others) to surface the assistant version on each event.
- **New `RimeAiVoiceIdEnum` values** (`CLEMENTINE`, `WALNUT`, `EYRE`, `BANCROFT`, `HESSE`, `BEATTY`, `GODFREY`) and **new `RimeAiVoiceModel` values** (`CODA`, `MISTV_3`) expanding Rime AI voice options.
- **New types and fields**: `RevokeInvitationResponseDto`, `ScenarioInUseConflictResponseDto`, `SayHookActionExact`, `ScorecardMetricConditionsItem`, `latency_expectations` on `Scenario`, and many new `ServerMessageEndOfCallReportEndedReason` enum values covering xAI, Microsoft, Cartesia, and SIP error scenarios.
- **`assistant_version`** — new optional field added to all `ServerMessage*` types, exposing the assistant version on every server-sent event.
- **`ServerMessageCampaignPredial`** and **`ServerMessageCallArtifactUpload`** — two new server message variants added to the `ServerMessageMessage` union; `ServerMessageResponseCampaignPredial` added to `ServerMessageResponseMessageResponse`.
- **`ServerMessageTranscript`** — new optional fields `assistant_id`, `assistant_name`, `confidence`, and `confidence_source` (typed as `ServerMessageTranscriptConfidenceSource`) for richer transcript metadata.
- **`SimulationRunListItem`**, **`SimulationRunListSummary`**, **`SimulationRunListSource`**, **`SimulationRunPaymentRequiredResponse`**, and related enums — new types supporting simulation run listing and payment-required responses.
- **`ServerMessageStatusUpdateEndedReason`** — new constants for xAI, Microsoft, Cartesia, VAPI transcriber, SIP outbound, and squad/version validation failure scenarios.
- **`ToolVersion`**, **`ToolDraft`**, and **`ToolRef`** — new types supporting tool versioning and draft management workflows, including paginated list responses (`ToolVersionPaginatedResponse`, `ToolDraftPaginatedResponse`).
- **`TrafficAllocation`** — new type for managing assistant traffic allocation, with supporting enums `TrafficAllocationActorType` and `TrafficAllocationAllocationIntent`, and `TrafficAllocationLatestResponseDto`.
- **`TelnyxTransport`** — new type exposing Telnyx call transport metadata (`conversationType`, `callControlId`, `callLegId`, `callSessionId`).
- **`ToolCallResultMessageWarning`** and **`ToolCallResultSpokenMessage`** — new types for tool call result warnings and spoken message variants; `ToolCallResultMessage` gains an optional `warnings` field.
- **New optional fields** on existing types: `tool_refs` on `TogetherAiModel`, `role` on `ToolMessageFailed`, `latest_version`/`baseline_version` on `TextEditorTool`, and `system_key` on `TextInsight`.
- **`TrafficAllocation*` types** — new `TrafficAllocationPaginatedResponse`, `TrafficAllocationTarget`, `TrafficAllocationStaleConflictResponseDto`, `TrafficAllocationVersionConflictResponseDto`, and related enum for managing traffic allocation resources.
- **`TransferArtifact` and supporting types** — `TransferArtifactDestination`, `TransferArtifactMode`, `TransferArtifactStatus`, and `TransferArtifactMessagesItem` expose call transfer metadata including destination, mode, transcript, and status.
- **`TransientTwilioPhoneNumber`** — new type (with `TransientTwilioPhoneNumberFallbackDestination` and `TransientTwilioPhoneNumberHooksItem`) for transient Twilio phone number configuration.
- **`UpdateAssistantDraftDto`** — new DTO and its full set of supporting union and enum types for updating assistant drafts.
- **`TwilioTransport` / `TranscriptWordConfidence`** — new `TwilioTransport` type for Twilio transport details and `TranscriptWordConfidence` for per-word transcription confidence data; optional `name` field added to `TransferDestinationAssistant`, `TransferDestinationNumber`, and `TransferDestinationSip`; `XAI` and `VAPI` transcriber variants and `XAI` and `MICROSOFT` voice variants added to transfer assistant unions.
- **`UpdateAssistantDraftDto` supporting types** — new union and enum types for credentials, first-message mode, hooks, model, server messages, transcriber, voice, and voicemail detection to support assistant draft updates.
- **`UpdateCampaignDto`** and **`UpdateCampaignDtoStatus`** — new types for updating outbound calling campaigns, including name, assistant/workflow/squad IDs, phone number, dial plan, schedule, and status.
- **`UpdateAssistantVersionMetadataDto`** — new type for setting `versionName` and `versionDescription` on assistant versions.
- **`provider` field** added as an optional field to all `Update*CredentialDto` types (Azure, AzureOpenAI, Cartesia, Cerebras, Cloudflare, CustomCredential, CustomLlm, DeepInfra, DeepSeek, Deepgram, Email, and others).
- **New enum values** added to `UpdateAzureOpenAiCredentialDtoModelsItem` (GPT-5.6 Luna/Terra/Sol, GPT-4o, GPT-4.1, GPT-5.4-mini) and new Switzerland region variants (`switzerlandnorth`, `switzerlandwest`) to Azure region enums.
- **`provider` field** added as an optional field to 20+ `Update*CredentialDto` types (e.g., `UpdateGcpCredentialDto`, `UpdateGoogleCredentialDto`, `UpdateOpenAiCredentialDto`, `UpdateMistralCredentialDto`, and others), each backed by a new single-value enum module.
- **`UpdateMicrosoftCredentialDto`** — new DTO for updating Microsoft credentials, with optional `provider`, `api_key`, `region`, and `name` fields.
- **`UpdateKnowledgeBaseToolDto`** — new DTO for updating knowledge-base tools, including optional `messages`, `knowledge_base_id`, `function`, and `rejection_plan` fields.
- **`type` field** added as an optional field to `UpdateGhlToolDto`, `UpdateMakeToolDto`, and `UpdateOutputToolDto`, each backed by a new enum module.
- Inline documentation comments added to several tool and insight DTO classes (e.g., `UpdateFunctionToolDto`, `UpdateMcpToolDto`, `UpdateLineInsightFromCallTableDto`).
- **`VapiTranscriber`** — new transcriber type with `version`, `language`, `languages`, `keywords`, and `turn_taking` fields; `VAPI` and `XAI` members added to `WorkflowTranscriber` and `WorkflowUserEditableTranscriber`.
- **Transport types** — `VapiSipTransport`, `VapiWebCallTransport`, `VapiWebsocketTransport`, and `VonageTransport` models added for SIP, web-call, WebSocket, and Vonage call transport metadata.
- **Voice cloning support** — `VapiVoiceCloneDto`, `VapiVoiceLanguage`, and `VapiVoiceVersion` types added; `VoiceLibrary` gains optional `is_cloned` and `clone_backend` fields; `VoiceLibraryVoiceResponseAge` union type added.
- **Version-pinning conflict types** — `VersionPinConflictResponseDto`, `VersionPinReference`, and `VersionPinReferenceSourceType` added for handling version-pin conflict responses.
- **New model enum values and `messages` field** — `messages` optional field added to all workflow model types; new GPT-5.x/6, Gemini 3.x, Claude Sonnet 5, and Claude Haiku 5.5 variants added to their respective model enums.
- **`XaiVoice`** — new voice type for xAI with support for voice ID selection, language, speed, chunk plan, and fallback plan.
- **`XaiTranscriber`** — new transcriber type for xAI with model, language, and fallback plan configuration.
- **`XaiVoiceVoiceId`**, **`XaiVoiceLanguage`**, **`XaiTranscriberModel`**, and **`XaiTranscriberLanguage`** — supporting enums for the new xAI voice and transcriber types.
- **`XaiModelModel`** — new model variants `grok-4.20-0309-reasoning`, `grok-4.20-0309-non-reasoning`, and `grok-4.3` added to the xAI model enum.
- **`WorkflowVoice`** and **`WorkflowUserEditableVoice`** — new `XAI` and `MICROSOFT` union members added; `XaiModel` gains an optional `tool_refs` field.

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

