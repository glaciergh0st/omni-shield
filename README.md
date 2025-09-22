# OMNI Shield — MITRE-Aligned Multi-Layered Defense System (MLDS)

**Project OMNI Shield** is a Splunk-led, MITRE ATT&CK–aligned multi-layered defense system.  
It provides an end-to-end Detect → Triage → Resolve (D2R) pipeline by combining:

- **Splunk ES + SOAR + MLTK + AI (RAG)** as the central defense hub  
- **Multi-layer telemetry** (Osquery, Zeek, EDR, identity, cloud, deception, DFIR)  
- **Portable detections** (Sigma rules with Splunk SPL as the primary execution layer)  
- **UBA/UEBA analytics** to detect insider threats and risky users  
- **Purple-team validation** (Atomic Red Team, Havoc, Caldera integration)  

---

## Objectives
- Detect stealthy C2, persistence, and advanced attacker tradecraft  
- Automate triage & containment with SOAR playbooks and DFIR tooling  
- Enable AI-assisted retrieval, explanations, and tuning with Splunk RAG  
- Incorporate UBA/UEBA to detect insider threats and anomalous user behavior  
- Continuously improve MITRE ATT&CK coverage with purple-team exercises  

---

## Architecture Overview

```markdown
[Telemetry: Osquery, Zeek, EDR, Identity, Cloud, Deception]
          ↓
   [Splunk ES (SIEM) + MLTK models]
          ↓
   [Splunk AI (RAG assistant)]
          ↓
   [UBA / UEBA analytics layer]
          ↓
   [Splunk SOAR playbooks]
          ↓
[Containment: EDR isolate, Palo Alto block, Okta disable, Velociraptor triage]
          ↓
   [Case Mgmt: ServiceNow / TheHive]

omni-shield/
├─ README.md               # Project front page
├─ docs/                   # Architecture, roadmap, MITRE matrix
├─ detections/             # Sigma, SPL, YARA, KQL detections
├─ osquery/                # Osquery packs and queries
├─ uba/                    # User & Entity Behavior Analytics rules & models
├─ playbooks/              # Splunk SOAR and XSOAR playbooks
├─ mltk/                   # Splunk MLTK models (beaconing, anomaly detection)
├─ ai/                     # RAG configs, prompts, embeddings
├─ dfir/                   # Volatility, Velociraptor, forensic scripts
├─ infra/                  # Terraform, Ansible for deployment
├─ labs/                   # Atomic Red Team, Havoc, Caldera scenarios
├─ kpis/                   # Dashboards & reporting (Splunk, Grafana)
├─ threat-intel/           # Feeds, enrichment, sharing integrations
├─ deception/              # Canary configs, honeytokens
├─ compliance/             # NIST, ISO, SOC2 mappings
├─ training/               # SOC runbooks, purple-team exercises
└─ tools/                  # Parsers, collectors, helper scripts
```


## Roadmap (high-level)
```
Phase 0: Lab foundation (Splunk, FleetDM, Zeek, MITRE baseline)

Phase 1: Baseline detections + Osquery pack + minimal playbook

Phase 2: Beacon anomaly models + UBA baseline + pipeline health checks

Phase 3: Automated playbooks (Falcon isolate, Okta disable, Velociraptor triage)

Phase 4: AI Assistant (RAG) + ATT&CK heatmaps + feedback loops

Ongoing: Weekly retrain, monthly tuning, continuous purple-team exercises
```



## Long-Term Vision
```

Hardware and firmware attestation (TPM/HVI)

Quantum-resistant cryptography detection

SOC Tier-1-2 AI copilot with Splunk RAG

OMNi Shield as an open-source SOC + observability reference framework

```
