# Admin Dashboard Patterns & Architecture

This reference outlines concrete patterns for building and refactoring high-efficiency admin dashboard panels in technical web applications.

---

## Pattern 1: Control-Plane Status Bar

The status bar sits above the main dashboard metrics and grounds the operator in the current runtime environment.

### Required Elements:
- **Environment / Gateway Status**: Shows whether Cloudflare AI Gateway parameters are loaded.
- **GitOps Config Origin**: Explicit display of the remote config URL and current version tag.
- **Safety Mode Invariant**: Clear tag indicating the cost policy (e.g. `FREE_ONLY - 100% Zero-Cost Guarantee`).
- **Auto-Poll Indicator**: Subtle pulsating emerald dot when polling is active.

---

## Pattern 2: Executive Telemetry Cards (Metric Tiles)

Metric tiles should never be static decorations. They must be actionable summary blocks.

### Composition:
```text
┌────────────────────────────────────────┐
│ [Icon] Title Label          [Status]   │
│ 24 (or 100%, 0.00$)                    │
│ Sub-label / Context breakdown          │
│ [Link/Action Arrow ->]                 │
└────────────────────────────────────────┘
```

### LLMFreeway Standard Metrics:
1. **Active Dynamic Routes**: Total logical roles registered (e.g., 9 roles, 8 enabled). Clicking navigates to Roles View.
2. **Zero-Cost Coverage Ratio**: Percentage of roles that have a verified $0.00 zero-price primary model (e.g. 100% Free-First).
3. **Discovered Model Fleet**: Total upstream model offers, segmented by Free ($0.00) vs Allowance vs Paid Fallback. Clicking navigates to Models Registry.
4. **Cloudflare Gateway Readiness**: Number of models with verified Cloudflare endpoint readiness. Warns if any candidate in a role is unconfigured.
5. **Fleet P50 Latency**: Estimated average response time across primary free models (e.g. Groq 180ms, CF Workers AI 250ms).
6. **Fallback Depth**: Total candidate models in the failover chains, showing redundancy safety.

---

## Pattern 3: Command Bar / Quick Actions Strip

Place high-frequency operator tasks in a prominent bar:
- **Sync From GitOps**: Triggers fresh fetch from `/config/roles.json` or remote GitHub raw URL.
- **Apply Free-First Policy**: Automatically marks all 9 free models as ready in Cloudflare AI Gateway.
- **Run Edge Simulation**: Launches the route simulator for quick stress-testing.
- **Compile & Export**: Opens the route compiler to download Cloudflare dynamic route JSON.
- **Reset to Defaults**: Clear local storage and revert to factory baseline with confirmation dialog.

---

## Pattern 4: Interactive Route Topology Matrix

A dense, high-contrast visual grid representing all logical roles and their active candidates.
- Displays: Role ID (`coder`, `architect`, `planner`), primary model, candidate count, fallback depth, and readiness dot.
- Clicking any role card immediately opens the Master-Detail editor with that role pre-selected.

---

## Pattern 5: Provider Fleet & Cost Allocation

Visual representation of upstream AI providers:
- Cloudflare Workers AI (@cf/...)
- Groq Cloud (Free Llama/DeepSeek)
- Google Gemini (Gemini 2.0 Flash Free Tier)
- OpenRouter (Free Mistral/Qwen tiers)
- DeepSeek API (Paid Fallback)

---

## Pattern 6: Real-Time Audit Log & Event Stream

A chronological log of recent control-plane operations:
- Config sync pulls with version timestamps.
- Fallback chain reordering events.
- Gateway configuration toggles.
- Simulation test runs.
