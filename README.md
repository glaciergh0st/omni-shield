# Project OMNi Shield — MITRE-Aligned Multi-Layered Defense System (MLDS)

**Project OMNi Shield** is a Splunk-led, MITRE ATT&CK–aligned multi-layered defense system.  
It provides an end-to-end Detect → Triage → Resolve (D2R) pipeline by combining:

- Splunk ES + SOAR + MLTK + AI (RAG) as the central defense hub  
- Multi-layer telemetry (Osquery, Zeek, EDR, identity, cloud, deception, DFIR)  
- Portable detections (Sigma rules with Splunk SPL as the primary execution layer)  
- Purple-team validation (Atomic Red Team, Havoc, Caldera integration)  

---

## Objectives
- Detect stealthy C2, persistence, and advanced attacker tradecraft  
- Automate triage & containment with SOAR playbooks and DFIR tooling  
- Enable AI-assisted retrieval, explanations, and tuning with Splunk RAG  
- Continuously improve MITRE ATT&CK coverage with purple-team exercises  

---
## Architecture Overview
```
[Telemetry: Osquery, Zeek, EDR, Identity, Cloud, Deception]
↓
[Splunk ES (SIEM) + MLTK models]
↓
[Splunk AI (RAG assistant)]
↓
[Splunk SOAR playbooks]
↓
[Containment: EDR isolate, Palo Alto block, Okta disable, Velociraptor triage]
↓
[Case Mgmt: ServiceNow / TheHive]

---

## Repository Structure

omni-shield/
├─ docs/               # Architecture, roadmap, MITRE matrix
├─ detections/         # Sigma rules, Splunk SPL rules, YARA, KQL/EQL
├─ osquery/            # Osquery packs and queries
├─ playbooks/          # Splunk SOAR and XSOAR playbooks
├─ mltk/               # Splunk MLTK anomaly/beaconing models
├─ ai/                 # RAG assistant configs and embeddings
├─ dfir/               # Volatility, Velociraptor, triage scripts
├─ infra/              # Terraform / Ansible for lab or enterprise scale
├─ labs/               # Adversary simulations (Atomic Red Team, Havoc, Caldera)
└─ kpis/               # Splunk dashboards and reports

---

## Roadmap (high-level)
- Phase 0: Lab foundation (Splunk, FleetDM, Zeek, MITRE baseline)  
- Phase 1: Baseline detections + Osquery pack + minimal playbook  
- Phase 2: Beacon anomaly models + pipeline health checks  
- Phase 3: Automated playbooks (Falcon isolate, Okta disable, Velociraptor triage)  
- Phase 4: AI Assistant (RAG) + ATT&CK heatmaps + feedback loops

