<<<<<<< HEAD
# Architecture — Project OMNi Shield
=======
>>>>>>> 77eb9c7a1269e567dd3ce7b4d436fbdcd2ce5b69
# Project OMNi Shield — Architecture

## 1. Purpose
**Project OMNi Shield** is a Splunk-led, MITRE ATT&CK–aligned **Multi-Layered Defense System (MLDS)**.  
Its mission is to deliver an end-to-end **Detect → Triage → Resolve (D2R)** pipeline that scales to enterprises while remaining testable in lab environments.  

---

## 2. Design Principles
1. **Splunk-first** — Splunk ES, SOAR, and MLTK are the backbone.  
2. **MITRE ATT&CK–aligned** — every detection/playbook maps to a TTP.  
3. **Multi-visibility** — host (osquery), network (zeek), EDR, identity, cloud, deception, DFIR, TI, UBA.  
4. **AI assistance** — Splunk RAG powers contextual detection & triage support.  
5. **Continuous validation** — purple-team testing + retrain loop ensures resilience.  

---

## 3. High-Level Data Flow

```text
[Telemetry Sources]
   ├─ Osquery (endpoint, persistence, kernel signals)
   ├─ Zeek & Suricata (network: conn, ssl, dns, http)
   ├─ EDR/XDR (Falcon, SentinelOne, MDE)
   ├─ Identity (Okta, Entra ID, AD)
   ├─ Cloud (AWS GuardDuty/CloudTrail, Azure Defender, GCP SCC)
   ├─ DNS/Proxy (web logs, tunneling, JA3/JA4 fingerprints)
   ├─ Deception (canaries, honeytokens, decoy accounts)
   └─ Threat Intel (OTX, GreyNoise, AbuseIPDB, Recorded Future, MISP)

        ↓

[Collection & Ingest]
   ├─ Cribl / Fluentd / Kafka pipelines
   └─ Normalization into Splunk (primary SIEM)

        ↓

[Detection & Analytics]
   ├─ Splunk SPL correlation searches
   ├─ Sigma-converted rules (portable detections)
   ├─ YARA rules for memory/disk artifacts
   ├─ MLTK models (beaconing, anomaly detection, supervised scoring)
   └─ UBA detections (impossible travel, MFA bypass, insider threat)

        ↓

[Decision & Automation]
   ├─ Splunk SOAR playbooks (native)
   ├─ Cortex XSOAR variants (secondary)
   ├─ IOC/TI enrichment (VT, GreyNoise, AbuseIPDB, APIs)
   ├─ Evidence collection (osquery queries, Velociraptor, Zeek PCAPs)
   └─ Policy-driven containment (Falcon isolate, Palo Alto block, Okta disable)

        ↓

[Case Management & Reporting]
   ├─ ServiceNow SecOps / TheHive
   ├─ Splunk dashboards (KPIs, MITRE heatmap)
   ├─ Grafana panels (infra, costs)
   └─ Compliance mapping (NIST 800-61, ISO 27001, SOC2)

        ↓

[Validation & Improvement]
   ├─ Labs (Atomic Red Team, Caldera, Havoc C2)
   ├─ Retro-hunting automation
   ├─ Purple-team testing cycles
   └─ Weekly retrain & detection tuning
```
---


## 4. Repo Module Breakdown
```
### detections/
- **Sigma** → YAML rules, portable to SPL/KQL/Elastic  
- **Splunk SPL** → correlation searches for Splunk ES  
- **YARA** → memory and disk signatures  
- **KQL** → Microsoft Sentinel detections  

### osquery/
- **omni_pack.conf** → baseline pack (persistence, unsigned drivers, suspicious processes)  
- Scheduled packs for fleet-wide queries  
- On-demand queries triggered by SOAR  

### uba/
- UBA rules → impossible travel, MFA bypass, risky user behavior  
- UEBA baseline models  

### playbooks/
- Splunk SOAR playbooks (native)  
- Cortex XSOAR versions (optional/secondary)  
- Workflows for enrichment, triage, containment, rollback  

### mltk/
- Splunk MLTK models for:  
  - Beaconing detection  
  - Endpoint/network anomalies  
  - Ensemble scoring with SHAP explainability  

### ai/
- Splunk RAG configurations (retrieval + embeddings)  
- Prompt templates for AI-assisted detections  

### dfir/
- Velociraptor collection configs  
- Volatility workflows for memory analysis  
- Chain-of-custody DFIR scripts  

### infra/
- Terraform → cloud & infra provisioning  
- Ansible → config management & agent rollouts  

### labs/
- Atomic Red Team scenarios  
- MITRE Caldera profiles  
- Havoc C2 stealth campaigns  

### kpis/
- Splunk dashboards → MTTD, MTTR, FP rates  
- Grafana panels → infra & cost metrics  

### threat-intel/
- Feeds (OTX, GreyNoise, AbuseIPDB, Recorded Future)  
- IOC enrichment scripts  
- MISP/STIX/TAXII configs for sharing  

### deception/
- Canary (Thinkst) configs  
- Canarytokens (links, AWS keys, docs)  
- Decoy accounts  

### compliance/
- NIST 800-61 mappings  
- ISO 27001 mappings  
- SOC2 coverage  

### training/
- SOC runbooks (triage, escalation, containment)  
- Purple-team exercise templates  
- Analyst onboarding materials  

### tools/
- Log parsers & normalizers  
- Collector configs (forwarders, Cribl)  
- Helper scripts (Python/PowerShell)  
```
---


## 5. Implementation Phases
```
**Phase 0 — Foundation (Weeks 0–2)**  
- Stand up Splunk (lab or enterprise)  
- Deploy Zeek + Osquery fleet  
- Ingest logs into Splunk  

**Phase 1 — Baseline (Weeks 2–6)**  
- JA3 anomaly rule in Splunk  
- Deploy `omni_pack.conf`  
- Minimal SOAR playbook for osquery triage  
- Run initial Atomic Red Team tests  

**Phase 2 — Analytics (Weeks 6–12)**  
- Beaconing anomaly models in MLTK  
- UBA baseline rules  
- Add threat intel enrichment  

**Phase 3 — Automation (Weeks 12–18)**  
- Expand playbooks: Falcon isolate, Okta disable, Velociraptor triage  
- Add rollback & approval gates  
- Integrate deception triggers  

**Phase 4 — AI & Validation (Weeks 18–24)**  
- Deploy Splunk RAG assistant  
- ATT&CK coverage dashboards  
- Purple-team validation (Havoc, Caldera)  

**Ongoing**  
- Weekly retrain  
- Monthly purple-team  
- Continuous detection engineering backlog
```  
---

## 6. Security & Compliance
```
- Encrypt logs/artifacts at rest & in transit  
- RBAC for playbooks and DFIR evidence access  
- Approval workflow for memory capture & auto-containment  
- Compliance mapping → NIST, ISO, SOC2  
```
---

## 7. Long-Term Extensions
```
- Hypervisor introspection (HVI) for rootkit detection  
- TPM/secure boot attestation  
- Post-quantum crypto readiness  
- Autonomous SOC copilot (Splunk RAG powered)  
```
<<<<<<< HEAD

=======
>>>>>>> 77eb9c7a1269e567dd3ce7b4d436fbdcd2ce5b69
