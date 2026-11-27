## [3.0.0] - 2026-11-27
### Breaking Changes
- **`Vapi::Client`** — several new top-level clients (`Board`, `TrafficAllocations`, `KnowledgeBasesV2`, `Simulations`, `SimulationPersonalities`, `SimulationScenarios`, `SimulationRuns`, `SimulationSuites`) are now registered on the root client, which may conflict with any monkey-patching or client subclasses that define methods of the same name; update any such customizations accordingly.

### Added
- **Simulation clients** — five new clients (`Vapi::Simulations::Client`, `Vapi::SimulationRuns::Client`, `Vapi::SimulationScenarios::Client`, `Vapi::SimulationPersonalities::Client`, `Vapi::SimulationSuites::Client`) plus onboarding helpers for AI-drafted test suites and full CRUD on simulation resources.
- **`Vapi::TrafficAllocations::Client`** and **`Vapi::Board::Client`** — new clients for managing A/B assistant traffic splits with per-version call metrics, and for managing reporting dashboard boards.
- **New transcriber and voice providers** — `XaiTranscriber`, `Reson8Transcriber`, and `VapiTranscriber` added as transcriber options; `MicrosoftVoice` and `XaiVoice` added as voice options, with corresponding credential and fallback types.
- **Assistant versioning and drafts** — `AssistantDraft`, `AssistantVersion`, `AssistantSaveResponse`, `AssistantGoal`, and related DTOs enable draft-based authoring and version-pinning workflows.
- **`Vapi::KnowledgeBasesV2::Client`** — new client for v2 knowledge bases with CRUD and file attach/detach/retry operations.
- **Call artifact download methods** — seven new download methods on `Vapi::Calls::Client` for mono/stereo/video/customer/assistant recordings, pcap, and call logs.
- **New model and enum values** — new OpenAI GPT-5/6 variants, Anthropic Claude Sonnet 5/Haiku 5.5, Gemini 3.x, and Azure GPT-6 model constants added across model and eval types; 40+ new `CallEndedReason` enum values covering guardrail, Microsoft, xAI, Reson8, ElevenLabs, and SIP failure codes.
- **Guardrail and tool versioning types** — `GuardrailRule`, `GuardrailPack`, `ToolDraft`, `ToolVersion`, `ToolRef`, and related conflict-response DTOs added for guardrail authoring and tool version management.
- See full changelog for all changes

### Changed
- **`provider` field** — added as an optional field to all `Update*CredentialDto` types, each backed by a new provider enum, enabling explicit provider identification on credential updates.
- **`sort_by` and `id_any` filter fields** — added to paginated list request types across Chats, Evals, Sessions, Squads, PhoneNumbers, StructuredOutputs, and Campaign modules.
- **`assistant_version` field** — added to all server message types and `ClientMessage*` types to expose the active assistant version on every event.
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

