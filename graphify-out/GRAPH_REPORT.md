# Graph Report - spotlight  (2026-10-20)

## Corpus Check
- Corpus is ~39,636 words - fits in a single context window. You may not need a graph.

## Summary
- 334 nodes · 316 edges · 88 communities (10 shown, 78 thin omitted)
- Extraction: 91% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 28 edges (avg confidence: 0.84)
- Token cost: 167,107 input · 0 output

## Community Hubs (Navigation)
- Password Reset Flow
- Architecture & Infra Docs
- Auth Concern & Base Controller
- Domain Models
- Spots CRUD Controller
- Stimulus Controllers
- Test Fixtures
- Action Cable Connection
- Users Controller
- Static Error Pages
- CardComponent
- Rails Application Config
- Mapbox Integration
- CardComponent Test
- ApplicationComponent
- ApplicationJob
- Migration: Users
- Migration: Sessions
- Migration: Spots
- Migration: Tags
- Migration: Spots-Tags Join
- Migration: Photos
- Migration: Reviews
- Migration: Collections
- Migration: Collections-Spots Join
- Migration: Visit Statuses
- Migration: Videos
- System Test Base
- Home Controller Test
- Spots Controller Test
- Users Controller Test
- User Mailer Preview
- User Mailer Test
- Collection Model Test
- Photo Model Test
- Review Model Test
- Spot Model Test
- Tag Model Test
- User Model Test
- VisitStatus Model Test
- Test Helper
- Graphify Tooling
- Dependabot & Test CI
- Lint CI (RuboCop)
- Security CI (Brakeman)
- ApplicationHelper
- HomeHelper
- SpotsHelper
- UsersHelper
- Project README
- App Icon
- Robots.txt Policy
- Dependabot Bundler
- JS Audit CI
- English Locale

## God Nodes (most connected - your core abstractions)
1. `User` - 12 edges
2. `SpotsController` - 11 edges
3. `ApplicationRecord` - 11 edges
4. `Authentication` - 10 edges
5. `ApplicationController` - 9 edges
6. `Spot entity` - 9 edges
7. `UsersController` - 8 edges
8. `Current` - 8 edges
9. `PasswordsController` - 7 edges
10. `Video` - 7 edges

## Surprising Connections (you probably didn't know these)
- `graphify usage rules` --references--> `graphify skill (/graphify trigger)`  [INFERRED]
  CLAUDE.md → .claude/CLAUDE.md
- `CI job lint (RuboCop)` --references--> `RuboCop Rails Omakase style`  [INFERRED]
  .github/workflows/ci.yml → .rubocop.yml
- `Active Storage services (Disk test/local)` --conceptually_related_to--> `Photo entity`  [INFERRED]
  config/storage.yml → PROJECT_OVERVIEW.md
- `Solid Queue dispatchers/workers config (JOB_CONCURRENCY)` --implements--> `Solid Queue background jobs`  [INFERRED]
  config/queue.yml → PROJECT_OVERVIEW.md
- `Recurring tasks config (all commented out)` --conceptually_related_to--> `Solid Queue background jobs`  [INFERRED]
  config/recurring.yml → PROJECT_OVERVIEW.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Solid Queue/Cache/Cable backed by separate production SQLite DBs** — config_database_sqlite_config, config_queue_solid_queue_workers, config_cache_store_options, config_cable_solid_cable_adapter [EXTRACTED 1.00]
- **CI quality and security gates** — _github_workflows_ci_scan_ruby, _github_workflows_ci_scan_js, _github_workflows_ci_lint, _github_workflows_ci_test [EXTRACTED 1.00]
- **Spot-centric domain model** — project_overview_spot, project_overview_tag, project_overview_collection, project_overview_review, project_overview_photo, project_overview_visitstatus, project_overview_user [EXTRACTED 1.00]
- **Spot+User Scoped Fixtures (photos, reviews, visit statuses)** — test_fixtures_photos, test_fixtures_reviews, test_fixtures_visit_statuses, test_fixtures_spots, test_fixtures_users [EXTRACTED 1.00]
- **Rails Public HTTP Error Pages** — public_400, public_404, public_406_unsupported_browser, public_422, public_500 [INFERRED 0.95]

## Communities (88 total, 78 thin omitted)

### Community 0 - "Password Reset Flow"
Cohesion: 0.08
Nodes (7): PasswordsController, RegistrationsController, ApplicationMailer, PasswordsMailer, UserMailer, User, PasswordsMailerPreview

### Community 1 - "Architecture & Infra Docs"
Cohesion: 0.10
Nodes (23): CardComponent (ViewComponent), SpotsController, Action Cable config (solid_cable in production), Solid Cache store options (256MB max), SQLite database config (primary/cache/queue/cable), Kamal deploy config (spotlight_pwa), SOLID_QUEUE_IN_PUMA, spotlight_pwa_storage persistent volume (+15 more)

### Community 2 - "Auth Concern & Base Controller"
Cohesion: 0.12
Nodes (4): ApplicationController, Authentication, HomeController, SessionsController

### Community 3 - "Domain Models"
Cohesion: 0.11
Nodes (7): ApplicationRecord, Collection, Photo, Review, Tag, Video, VisitStatus

### Community 4 - "Spots CRUD Controller"
Cohesion: 0.17
Nodes (3): SpotsController, Current, Spot

### Community 5 - "Stimulus Controllers"
Cohesion: 0.20
Nodes (5): application, autocompletionAddress(), connect(), connect(), initializeMap()

### Community 7 - "Test Fixtures"
Cohesion: 0.44
Nodes (9): ActiveRecord FixtureSet, Collections Fixtures, Photos Fixtures, Reviews Fixtures, Spots Fixtures, Tags Fixtures, Users Fixtures, BCrypt Password Digest Fixture (+1 more)

### Community 8 - "Action Cable Connection"
Cohesion: 0.29
Nodes (3): ApplicationCable, ApplicationCable::Connection, Session

### Community 11 - "Static Error Pages"
Cohesion: 0.33
Nodes (6): 400 Bad Request Error Page, 404 Not Found Error Page, 406 Unsupported Browser Error Page, 422 Unprocessable Entity Error Page, 500 Internal Server Error Page, Rails Static Error Pages

### Community 15 - "Mapbox Integration"
Cohesion: 0.50
Nodes (4): autofill_search_address_controller.js (Stimulus), map_controller.js (Stimulus), MAPBOX_ACCESS_TOKEN env var, Mapbox / Mapkick map integration

## Knowledge Gaps
- **32 isolated node(s):** `graphify skill (/graphify trigger)`, `Dependabot bundler daily updates`, `Dependabot github-actions daily updates`, `CI job scan_ruby (Brakeman)`, `CI job scan_js (importmap audit)` (+27 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 188 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **78 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApplicationRecord` connect `Domain Models` to `Action Cable Connection`, `Password Reset Flow`, `Spots CRUD Controller`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **What connects `graphify skill (/graphify trigger)`, `Dependabot bundler daily updates`, `Dependabot github-actions daily updates` to the rest of the system?**
  _32 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Password Reset Flow` be split into smaller, more focused modules?**
  _Cohesion score 0.08275862068965517 - nodes in this community are weakly interconnected._
- **Why does `User` connect `Password Reset Flow` to `Users Controller`, `Auth Concern & Base Controller`, `Domain Models`?**
  _High betweenness centrality (0.036) - this node is a cross-community bridge._
- **Should `Architecture & Infra Docs` be split into smaller, more focused modules?**
  _Cohesion score 0.09666666666666666 - nodes in this community are weakly interconnected._
- **Why does `ApplicationController` connect `Auth Concern & Base Controller` to `Password Reset Flow`, `Users Controller`, `Spots CRUD Controller`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **Should `Auth Concern & Base Controller` be split into smaller, more focused modules?**
  _Cohesion score 0.12121212121212122 - nodes in this community are weakly interconnected._