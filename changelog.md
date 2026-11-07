## [3.0.0] - 2026-11-07
### Breaking Changes
- **`UpdateAssistantDtoVoice`** — the `TAVUS` (`TavusVoice`) member has been removed; replace any Tavus voice usage with an alternative voice type.
- **`UpdateAssistantDtoCredentialsItem`** — the `TRIEVE` (`CreateTrieveCredentialDto`) member has been replaced by `RESON_8` (`CreateReson8CredentialDto`); update any code referencing the Trieve credential key.
- **`CreateCallDto#assistant`**, **`CreateChatDto#assistant`**, **`OpenAiResponsesRequest#assistant`** — field type changed from `CreateAssistantDto` to `TransientAssistantDto`; update any code constructing these objects directly.

### Added
- **Simulation platform** — five new clients (`SimulationPersonalitiesClient`, `SimulationScenariosClient`, `SimulationRunsClient`, `SimulationSuitesClient`, `SimulationsClient`) with full CRUD and onboarding-generation operations for building and running AI agent simulations.
- **Assistant and tool versioning** — `AssistantDraft`, `AssistantVersion`, `ToolDraft`, and `ToolVersion` types with supporting DTOs and paginated responses enable draft/publish workflows.
- **Traffic allocations and guardrails** — `TrafficAllocationsClient`, `GuardrailRulesClient`, and `GuardrailPacksClient` support A/B traffic splitting and content guardrail management.
- **New transcriber and voice providers** — `XaiTranscriber`, `Reson8Transcriber`, `VapiTranscriber`, `MicrosoftVoice`, `XaiVoice`, and their fallback variants are now available across assistant, workflow, and fallback configurations.
- **New platform capabilities** — `KnowledgeBasesV2Client`, `BoardClient`, `CallHealthDashboard` analytics DTOs, `CampaignSummary` with v2 campaign APIs, `TransientAssistantDto`, `CallTransport` union, and `S3CompatibleStorageCredential`/`MicrosoftCredential` are all now available.
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

