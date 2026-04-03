# Atlas Intelligence Report — Project Memory

## Owner
Michael Street, Fidelity Home Inspection (San Antonio + Austin, TX)
- License #22402, 5,000+ inspections, CPI certified
- Phone: (210) 961-5700
- Database: 3,377 South Texas inspections

## What This Is
A personalized inbound sales system that converts leads into booked inspections. The entry form generates a data-driven sales page showing the lead exactly what's at risk in their specific home, with dynamic pricing and package comparison.

The long-term vision expands this into a full client lifecycle ecosystem: pre-inspection sales → inspection-day deliverables → post-inspection gifts → ongoing HomeScore+ membership.

## Live URLs
- Entry form: https://fidelityinspect.github.io/homescore/atlas-entry.html
- Sales page: https://fidelityinspect.github.io/homescore/inbound-sales.html
- Existing quote site: https://quote.fidelityinspect.com

## Branch Strategy
- `claude/create-sales-webpage-G5BVZ` — feature development branch
- `gh-pages` — deployed to GitHub Pages (copy files from feature branch)
- `main` — has CSV database files

## Tech Stack
- Single-file HTML with inline CSS/JS
- Mobile-first (440px max width)
- No framework, no build step
- Data passed via URL `?d=` param (JSON encoded) + sessionStorage fallback
- Deployed on GitHub Pages
- Future: PythonAnywhere Flask API for dynamic features + Claude API for Atlas chat

## Dynamic Pricing Formula
```javascript
bp = max(499, round((499 + sqft * 0.07) * (1 + age * 0.002)))  // Standard
op = max(799, round(bp * 1.67) - 100)                            // Optimized
cp = max(1099, round(bp * 2.67) - 200)                           // Comprehensive
```
Price floors: $499 / $799 / $1,099

## Gap Cost Formula
```javascript
gapCost = sum(cost * probability / 100)  // for specialty-tool defects only (o:1)
```

## Structure Pricing (Additional Structures)
```javascript
base = max(79, round(sqft * 0.375 - 51))  // $249@800sqft, $399@1200sqft
+ Casita: $350
+ Kitchen: $100
+ Bath: $75
```

## Three Packages
1. **Comprehensive Risk Elimination** ($cp) — All 7 specialty services included, rush scheduling, guarantee
2. **Optimized Value Pack** ($op) — 3 of 7: Foundation, Infrared, Termite
3. **Standard Inspection** ($bp) — Visual inspection only

## 7 Risk Factor Services (Comprehensive)
1. Foundation Settlement Plotting — $199
2. Infrared Thermography (Leak/Insulation Audit) — $199
3. Sewer Line Scope — $199
4. Ductwork Camera Inspection — $199
5. Safety Audit (CO2/Gas, Fire, Fall, Break-in) — $99
6. Termite / WDI Investigation — $199
7. Indoor Air Quality Test — $99

## Additional Comprehensive Services
- Top Seller-Paid Repairs & Deferred Maintenance — $299
- Drinking Water Filtration Needs Assessment — $49
- On-Site Report Delivery — Included
- Inspector Consultation On-Site/Phone — Included
- Immediate Repair Cost Averages — Included
- Home Score Letter Grade (Buy/Deal/Walk) — $199
- Itemized Repair Quotes — $199
- Repair Request Builder — $149

## Optional Add-On Services (all packages)
- Pool & Spa Inspection: $199 — Complete pool equipment evaluation
- Septic System Evaluation: $350 — Tank and drain field analysis
- Well Water Lab Testing: $399 — Water quality and flow testing
- Radon Testing: $399 — 48-hour continuous monitoring
- Crawlspace Inspection: $199 — Moisture, pests, and structural issues
- Sprinkler Inspection: $99 — Sprinkler system zones and components
- Drain Line Inspection: $199 — Sewer camera scope of main drain line
- Additional Structure: from $79 — Detached buildings, casitas, workshops (sqft + options)

## Package Bonuses
- **Comprehensive**: 24-hour third-party repair quotes, Agent-ready repair request with photos, Property grade report with inspector consultation
- **Optimized**: Inspector consultation
- **Standard**: (none)

## Comprehensive Guarantee
"If we don't find qualified repair items in excess of your inspection cost, we will refund you the difference."

## Risk Map (7 services → defect data)
| Service | Maps To | Example (21-30yr) |
|---------|---------|-------------------|
| Foundation Plotting | Foundation Settlement | 41% / $12,000 |
| Infrared Thermography | Moisture Damages | 83% / $2,303 |
| Sewer Camera | Main Drain Issues | 72% / $2,211 |
| Ductwork Camera | Plumbing Leak Detected | 34% / $6,696 |
| Safety Audit | Electrical Wiring Deficiencies | 48% / $702 |
| Termite / WDI | Rodent/Pest Access | 75% / $1,500 |
| Air Quality | Failed Window Seals | 71% / $5,314 |

## Data Architecture
- IG object: Defect probabilities by age bracket (0-2, 21-30, 31-50, 51+)
- PEERS object: Percentile distributions by age bracket (8 brackets)
- NB array: 4 nearby inspection properties (hardcoded, future API)
- Reviews: 4 client reviews with photos and dollar amounts saved
- All data currently hardcoded as JS objects in HTML files
- CSV database files on main branch: packages, services, package_service_mapping, defect_cost_mapping, properties (3,377 records), zip_codes

## Page Flow
```
atlas-entry.html (team fills form)
  → Validates inputs
  → Calculates age, defect bracket, predicted defects, gap cost
  → Team selects package + add-ons + structures
  → Encodes all data in URL ?d= param + sessionStorage
  → Opens inbound-sales.html

inbound-sales.html (lead sees)
  → Reads data from URL or sessionStorage
  → Personalizes: name, address, age, sqft, zip
  → Shows defect table (specialty orange / standard blue)
  → Shows nearby inspections with grades and report links
  → Risk comparison bars (Standard vs Comprehensive)
  → Gap cost box ("what standard misses")
  → Client reviews with photos and $ saved
  → 3 package cards (Comp expanded by default, or selected package)
  → Client add-on toggles with live total
  → CTA: Schedule Now + Call button
  → Inspector bar (Michael Street, CPI badge)
  → FAQ section
```

## Sales Page Section Order
1. Header (Fidelity branding)
2. Hero (client name + address + metadata)
3. Defect table (specialty tools vs standard)
4. Nearby inspections (scrollable cards with report links)
5. Risk factor comparison bars
6. Gap cost box
7. Reviews (scrollable cards with photos)
8. Package cards (YOUR QUOTE)
9. Client add-on selector with live total
10. CTA: Schedule Now
11. Inspector bar (photo, CPI badge, credentials)
12. FAQ
13. Call button
14. Footer

## Design Rules
- Dark sections: #161618 bg, #C9A96E gold accents, #fff text
- Light sections: #F0EDE6 or #F5F2EB bg, #1A1A1A text
- Gold accent: #C9A96E (Fidelity brand)
- Orange (specialty): #C17A3A
- Blue (standard): #3D6B8B
- Green (good/bonus): #3D8B5B
- Red (warning): #A63D2F
- Fonts: system-ui for body, ui-monospace for data, Georgia for editorial
- Mobile-first, 440px max width
- No emojis unless asked

## Key Design Decisions
- Numbers must be credible, not overwhelming — risk percentages + one gap cost number per package
- CTA immediately after packages, no interruption
- Inspector card is compact bar under CTA, not a full section
- Reviews show dollar amounts saved (social proof with numbers)
- Standard card shows red warning of what they miss (drives upgrade)
- Optimized shows 7-segment coverage bar (3/7 filled)
- Gift first, review ask second (post-inspection)

## Upsell Strategy (from quote site)
When lead is on Optimized, show "You are unprotected from":
- Damages in Drain Under House → Add Sewer Line Scope +$199
- Rodent Intrusion in Ductwork → Add Ductwork Camera Inspection +$199
- Weak Negotiation Position → Add Repair Request Builder +$149
- Unknown True Repair Costs → Add Itemized Repair Quotes +$199
Then: "Upgrade to Comprehensive +$400"

## Atlas Chat Vision
Atlas is NOT a chatbot — it's an intelligence tool built on real data.

**Intro messaging:**
"Atlas is built on 3,377 local inspection reports and hundreds of hours of real client conversations. It's not perfect, but it can help answer your questions when our team isn't available. Want to talk to a real person? Text us at (210) 961-5700 — we'll get back to you Mon–Sat 8am–6pm."

**Atlas has access to:**
- Nearby inspection map with plotted reports and HomeScores
- Property-specific defect probabilities
- Detailed defect info: severity, maintenance timelines, repair costs, urgency
- Service descriptions and what each service finds
- Peer comparison data
- Reviews and client conversation patterns

**Tone:** References real data, admits limits, never says "I'm an AI", gentle nudges toward scheduling, routes to live help for complex questions.

## Future Products

### HomeScore Intelligence Report (post-inspection deliverable)
Inspector uploads report → Atlas generates: overall grade (real findings), defect breakdown by severity (Safety/Structural/Maintenance/Cosmetic), peer comparison, repair costs, maintenance timeline, inspector notes. Comp gets full report, Optimized gets summary, Standard doesn't get it (upsell).

### Atlas Pricing Report (inspection day downloadable)
Every defect gets a price tag. Sent same-day alongside Spectora report. Makes on-site review faster.

### The Inspector's Gift (review engine)
Post-inspection "thank you" — gift first, review ask second.
- Comp: rush repair pricing, negotiation strategy doc, repair request builder, vendor discounts, HomeScore report
- Opt/Std: vendor discounts, lighter strategy doc, repair request builder
- All: branded page, 5-star review CTA at bottom, upsell to HomeScore+

### HomeScore+ Membership
**"Keep your score. Keep your value."**
- 1-Year Checkup: foundation re-plotting (time dimension!), system maintenance review, work verification, upgrade advisory
- Inspector Line: phone/text access to inspector
- Monthly Maintenance Schedule: personalized to their home, delivered to inbox
- Pricing: one-time annual visit (discounted if booked at inspection) or monthly membership

### GHL Integration
- Pre-inspection: GHL passes raw data in URL → page is the pricing engine
- Post-inspection: triggers report generation, sends gift page, follow-up sequence
- Custom fields: atlas_client_name, atlas_address, atlas_sqft, atlas_zip, atlas_year_built, atlas_property_type, atlas_package, atlas_addons

### PythonAnywhere API
- Nearby inspections endpoint
- Atlas chat (Claude API proxy)
- HomeScore report generation
- Monthly maintenance schedule
- Hybrid: pages work without API (static fallback)

## What's Been Built
- [x] WS1: Gap cost display — differentiated per package card
- [x] WS9: Pricing widget — package selector, add-ons, structures, live total
- [x] Entry form → sales page data flow (URL params + sessionStorage)
- [x] Dynamic pricing with floors
- [x] Client-facing add-on toggles on sales page
- [x] Structure builder with sqft + Casita/Kitchen/Bath pricing
- [x] Deployed to gh-pages

## What's Next
- [ ] Atlas chat widget (static client-side first, then Claude API)
- [ ] HomeScore report template
- [ ] Pricing report template
- [ ] Gift page
- [ ] HomeScore+ landing page
- [ ] PythonAnywhere API
- [ ] GHL integration
