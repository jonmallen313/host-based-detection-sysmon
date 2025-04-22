# 🛠️ Setup Checklist – Sysmon Host-Based Detection Lab

This checklist outlines all the steps taken to set up and execute the Windows 11 Sysmon detection project using Olaf Hartong’s modular config.

---

## 🔧 Environment Setup

- [x] Install **VirtualBox**
- [x] Create a **Windows 11 VM**
- [x] Allocate minimum 2 CPUs, 4GB RAM
- [x] Enable internal network if testing with additional VMs (optional)

---

## 📦 Tool Installation

- [x] Download `Sysmon64.exe` and `Sysmon64.sys` from [Sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon)
- [x] Clone Olaf Hartong’s modular Sysmon config:  
  `git clone https://github.com/olafhartong/sysmon-modular.git`
- [x] Combine desired config modules using Olaf’s merge script or use pre-merged file

---

## 📝 Configure and Install Sysmon

- [x] Launch PowerShell as Administrator
- [x] Install Sysmon with Olaf’s config:  
  `.\Sysmon64.exe -accepteula -i sysmonconfig.xml`
- [x] Verify Sysmon is logging:  
  Open **Event Viewer** → `Applications and Services Logs` → `Microsoft` → `Windows` → `Sysmon`

---

## ⚔️ Simulate Suspicious Activity

- [x] Simulate scheduled task creation (persistence technique)
- [x] Simulate `.exe` execution via PowerShell (test process creation logging)

---

## 📊 Analyze Logs

- [x] Use **Event Viewer** to inspect Event IDs (e.g., 1, 7, 10, 11, 13)
- [x] Correlate processes (e.g., powershell → schtasks → registry entry)
- [x] Assess logs for **MITRE ATT&CK Techniques** (T1053, T1059)
- [x] Optionally load logs into Splunk and search by Event ID, Image path, CommandLine

---

## 🧾 Documentation

- [x] Create markdown log assessments
- [x] Save key screenshots
- [x] Organize `/resources`, `/screenshots`, and `/notes`
