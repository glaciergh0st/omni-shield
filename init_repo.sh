#!/bin/bash
# Initialize OMNi Shield repo structure
# READMEs only at top-level folders, .gitkeep for subfolders

set -e

# Top-level dirs with README.md
top_dirs=(
  "docs"
  "detections"
  "osquery"
  "uba"
  "playbooks"
  "mltk"
  "ai"
  "dfir"
  "infra"
  "labs"
  "kpis"
  "threat-intel"
  "deception"
  "compliance"
  "training"
  "tools"
)

# Subdirs (use .gitkeep)
sub_dirs=(
  "detections/sigma"
  "detections/splunk"
  "detections/yara"
  "detections/kql"
  "osquery/packs"
  "osquery/queries"
  "uba/detections"
  "uba/models"
  "playbooks/splunk-soar"
  "playbooks/cortex-xsoar"
  "mltk/beaconing"
  "mltk/anomaly"
  "ai/rag"
  "ai/prompts"
  "dfir/volatility"
  "dfir/velociraptor"
  "infra/terraform"
  "infra/ansible"
  "labs/atomic"
  "labs/havoc"
  "labs/caldera"
  "kpis/splunk"
  "kpis/grafana"
  "threat-intel/feeds"
  "threat-intel/enrichments"
  "threat-intel/sharing"
  "deception/canary"
  "deception/honeytokens"
  "training/soc-runbooks"
  "training/purple-team"
  "tools/parsers"
  "tools/collectors"
  "tools/scripts"
)

# Create top-level dirs + README.md
for dir in "${top_dirs[@]}"; do
  mkdir -p "$dir"
  echo "# ${dir}" > "$dir/README.md"
done

# Create subdirs + .gitkeep
for dir in "${sub_dirs[@]}"; do
  mkdir -p "$dir"
  touch "$dir/.gitkeep"
done

echo "✅ OMNi Shield repo structure synced: READMEs at top-level, .gitkeep in subfolders."

