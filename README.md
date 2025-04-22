🛡️ Windows Host-Based Detection Project
(Sysmon + Olaf Config)

🧠 Project Goal
The purpose of this project was to simulate suspicious behavior on a Windows 11 virtual machine and analyze how it's detected using Sysmon paired with Olaf Hartong’s modular config. I wanted to better understand host-based detection, log analysis, and Windows hardening — all directly aligned with Security+ (SYO-701) exam objectives.

🛠️ Tools & Environment
🧱 Virtual Machine: Windows 11 running on VirtualBox

🔍 Sysmon: Installed via Microsoft Sysinternals

🧩 Olaf Modular Config: Pulled from Olaf Hartong’s GitHub

🖥️ Log Viewers: Windows Event Viewer, optionally Splunk

💥 Simulated Attacks: Scheduled Task creation, PowerShell execution, Portable .exe execution

🎯 Simulated Suspicious Behavior
🗓️ Scheduled Task Created via PowerShell
powershell
Copy
Edit
schtasks /create /tn TestTaskExe /tr C:\Windows\System32\notepad.exe /sc once /st 12:30
This creates a task that opens Notepad at a specified time. It mimics a persistence technique often used by attackers.

💻 Running a Portable Executable
powershell
Copy
Edit
Start-Process "C:\Windows\System32\notepad.exe"
Used this to verify Sysmon logs .exe execution correctly — even for benign programs.

🧾 Sysmon Events Captured

Event ID	Timestamp	Process	Details	Technique ID	Assessment
10	4/22/2025 12:20:47 PM	powershell.exe	Called schtasks.exe	–	✅ True Positive – Simulated Attack
11	4/22/2025 12:20:34 PM	svchost.exe	Created scheduled task file	FileCreate	✅ True Positive – Simulated Attack
1	4/22/2025 12:20:47 PM	schtasks.exe	Created task TestTaskExe for Notepad	T1053.005 (Task/Job)	✅ True Positive – Simulated Attack
7	4/22/2025 12:20:47 PM	schtasks.exe	Loaded taskschd.dll	T1053 (Scheduled Task)	✅ True Positive – Simulated Attack
13	4/22/2025 12:20:25 PM	svchost.exe	Modified registry: TaskCache\Tree\TestTaskExe	RegistryEvent	✅ True Positive – Simulated Attack
1	4/22/2025 12:22:00 PM	notepad.exe	Notepad process execution	T1059 (Scripting)	✅ True Positive – Simulated .exe Launch

🧠 Key Takeaways
Sysmon + Modular Config gives deep visibility into host-based behavior.

Correlating Events (e.g., PowerShell spawning schtasks → new registry key → task file created) is critical for understanding attack flow.

MITRE ATT&CK Mapping makes detection actionable (T1053: Scheduled Task, T1059: Scripting Execution).

Ties directly into Security+ Section 1.4 — interpreting logs to support incident detection and response.

✅ Outcome
This project gave me real-world, hands-on experience in process monitoring, log analysis, and host-based threat detection. I walked through a full attacker simulation from execution to log review — the kind of workflow expected in an entry-level SOC analyst role.

🔄 What’s Next?
🔗 Integrate logs into Splunk, build dashboards and detection alerts

🎯 Simulate other techniques like privilege escalation or fileless malware

💡 Explore extending detection to remote code execution or PowerShell obfuscation

Thanks for checking out the project!
📬 Feel free to fork, share feedback, or ask questions.
