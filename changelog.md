## [3.0.0] - 2026-11-13
### Breaking Changes
- **`UpdateAssistantDtoVoice`** — `TavusVoice` (key `"TAVUS"`) has been removed from the voice union; replace any construction or pattern-matching on this variant.
- **`UpdateAssistantDtoCredentialsItem`** — `CreateTrieveCredentialDto` (key `"TRIEVE"`) has been replaced by `CreateReson8CredentialDto` (key `"RESON_8"`); update all references to use the new type and key.
- **`CreateCallDto#assistant`**, **`CreateChatDto#assistant`**, **`OpenAiResponsesRequest#assistant`** — the `assistant` field type changed from `CreateAssistantDto` to `TransientAssistantDto`; update any code constructing these objects directly.

### Added
- **Simulation platform** — new `Vapi::Simulations`, `Vapi::SimulationSuites`, `Vapi::SimulationScenarios`, `Vapi::SimulationRuns`, and `Vapi::SimulationPersonalities` clients with full CRUD, onboarding, and AI-suggestion workflows.
- **`Vapi::Board::Client`** and **`Vapi::TrafficAllocations::Client`** — new top-level clients for managing reporting boards and A/B traffic splits across assistant versions, including per-version call metrics.
- **`Vapi::KnowledgeBasesV2::Client`** — new client for the KnowledgeBase V2 API with CRUD and file attach/detach/retry operations; `KnowledgeBaseV2`, `KnowledgeBaseTool`, and related types introduced.
- **New transcriber and voice providers** — `XaiTranscriber`, `Reson8Transcriber`, `VapiTranscriber`, `MicrosoftVoice`, `FallbackMicrosoftVoice`, `FallbackXaiTranscriber`, `FallbackReson8Transcriber`, and `FallbackXaiVoice` added across all relevant unions.
- **Assistant and tool versioning** — `AssistantDraft`, `AssistantVersion`, `ToolDraft`, `ToolVersion`, `ToolRef`, and supporting paginated/conflict response types added for versioned management of assistants and tools.
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

