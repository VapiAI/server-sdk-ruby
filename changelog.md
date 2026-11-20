## [3.0.0] - 2026-11-20
### Breaking Changes
- **`assistant` field** — type changed from `CreateAssistantDto` to `TransientAssistantDto` in `CreateCallDto`, `CreateChatDto`, and `OpenAiResponsesRequest`; update any code constructing these objects to pass a `TransientAssistantDto` instance instead.

### Added
- **Simulation clients** — new `Vapi::Simulations`, `Vapi::SimulationPersonalities`, `Vapi::SimulationScenarios`, `Vapi::SimulationRuns`, and `Vapi::SimulationSuites` clients for end-to-end simulation and onboarding workflows.
- **`Vapi::Board::Client`** and **`Vapi::TrafficAllocations::Client`** — new top-level clients for managing reporting boards and assistant traffic-allocation history.
- **`Vapi::KnowledgeBasesV2::Client`** — new client for v2 knowledge-base CRUD with file attach, detach, and retry support.
- **Call artifact download methods** — seven new download methods on `Vapi::Calls::Client` for mono/stereo/video recordings, customer/assistant recordings, PCAP, and call logs.
- **`TransientAssistantDto`** and **`CallTransport`** — new types for fully inline assistant configuration and typed call-transport specification across providers (Vapi WebSocket, Vonage, Twilio, Vapi SIP, Telnyx, Daily).
- **Assistant versioning and drafts** — new `AssistantVersion`, `AssistantDraft`, `LegacyAssistantVersion`, `ToolVersion`, `ToolDraft`, and `TrafficAllocation` types with full CRUD and conflict-response support.
- **New voice and transcriber providers** — `MicrosoftVoice`, `XaiTranscriber`, `Reson8Transcriber`, and `VapiTranscriber` added across assistant, workflow, and conversation-node union types.
- **`sort_by` and filter parameters** — new `sort_by`, `id_any`, `search`, and `purpose` query parameters added to paginated list endpoints across Chats, Eval, Insight, Campaigns, PhoneNumbers, ProviderResources, Squads, and StructuredOutputs clients.
- **New enum values** — background sounds (`white-noise`, `city`, `crowd`, `farm`), Azure regions (`switzerlandnorth`, `switzerlandwest`), GPT-5.6/4.1 model variants, 40+ new `CallEndedReason` values, and `CALL_ARTIFACT_UPLOAD` server message event added across relevant enums.
- See full changelog for all changes

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

