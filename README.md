# Project OMNi Shield — MITRE-Aligned Multi-Layered Defense System (MLDS)
# Architecture — Project OMNi Shield (MLDS)

## Purpose
Project OMNi Shield is a Splunk-led, MITRE ATT&CK–aligned multi-layered defense system.  
It delivers an end-to-end Detect + Triage + Resolve (D2R) pipeline by unifying Splunk ES, SOAR, MLTK, and AI (RAG) with multi-layer telemetry and DFIR automation.

---

## Objectives & Success Criteria

**Objectives**
- Detect stealthy C2, persistence, privilege escalation, and lateral movement  
- Automate triage with Osquery, EDR, and Splunk SOAR playbooks  
- Provide AI-assisted detection retrieval, explanations, and tuning via RAG  
- Forecast telemetry uptime, service anomalies, and reduce alert noise  
- Achieve and maintain MITRE ATT&CK coverage with continuous purple-team validation  

**Success Metrics**
- Mean Time to Detect (MTTD) < 5 minutes for auto-triage cases  
- False Positive rate < 0.5% of notables  
- Detection precision ≥ 70%  
- Host coverage (Osquery + EDR) ≥ 90%  
- RAG retrieval accuracy ≥ 90% on MITRE queries  
- Weekly recall improvement through purple-team iterations  

---

## System Architecture

[Endpoints: Osquery, EDR]
[Network: Zeek, Suricata]
[Identity: Okta, AD, Entra]
[Cloud: AWS, Azure, GCP]
[Deception: Canarytokens]

  ↓ Collectors (Cribl/Kafka)

→ [Splunk ES: SIEM + MLTK models]
↕
→ [Splunk AI: RAG assistant]
↕
→ [Splunk SOAR: playbooks]
↕
→ [Containment: Falcon isolate, Palo Alto block, Okta disable]
↕
→ [Case Mgmt: ServiceNow / TheHive]
	•	Retro-hunt, purple-team validation, observability AI

---

## Core Components

- **Telemetry:** Osquery, Zeek/Suricata, Falcon, Okta, Cloud logs, deception sensors  
- **Detection & ML:** SPL correlation, Sigma portability, Splunk MLTK beacon models  
- **AI (RAG):** MITRE CSV retrieval, natural-language explanations, FP tuning suggestions  
- **SOAR:** Splunk SOAR playbooks for triage, containment, and memory collection  
- **DFIR:** Velociraptor, Volatility, Autopsy integrations for evidence collection  
- **Observability AI:** Forecast telemetry health, detect ingestion downtime, suppress noise  
- **Case Management:** ServiceNow or TheHive with ATT&CK heatmaps and KPIs  

---

## Deliverables

- Architecture design doc (this file)  
- Deployed telemetry baseline (Osquery + Zeek → Splunk)  
- Osquery `omni_pack` for C2/persistence queries  
- Sigma YAML detections + Splunk SPL correlation searches  
- Splunk MLTK beaconing and anomaly models  
- Splunk SOAR playbooks (triage, containment, retro-hunt)  
- AI RAG integration with MITRE ATT&CK data  
- Purple-team test plans (Atomic, Havoc, Caldera)  
- KPIs dashboards and reporting templates  

---

## Roadmap

**Phase 0 (Weeks 0–2):** Repo foundation, Splunk lab, initial telemetry ingestion  
**Phase 1 (Weeks 2–6):** Baseline detections + Osquery pack + minimal playbook  
**Phase 2 (Weeks 6–12):** MLTK anomaly models + observability health checks  
**Phase 3 (Weeks 12–18):** Automated SOAR playbooks + DFIR integrations  
**Phase 4 (Weeks 18–24):** RAG assistant + ATT&CK heatmaps + tuning workflows  

Ongoing: weekly retrain, monthly tuning, continuous purple-team exercises  

---

## KPIs

- Daily: notables, auto-triaged cases, RAG queries answered  
- Weekly: MTTD, MTTR, false positive rate, model precision/recall  
- Monthly: ATT&CK coverage %, drift detection, pipeline uptime, forecasting accuracy  

---

## Long-Term Vision

- Hardware and firmware attestation (TPM/HVI)  
- Quantum-resistant cryptography detection  
- SOC Tier-1 AI copilot  
- OMNi Shield as an open-source SOC + observability reference framework  

---
