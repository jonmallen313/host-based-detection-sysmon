# Host-Based Detection with Sysmon

This project focuses on leveraging **Sysmon** (System Monitor) for host-based detection of various attack techniques. By simulating real-world adversary behavior using **MITRE ATT&CK** tactics and techniques, this project demonstrates how Sysmon can be configured to log and detect these activities on a Windows machine. The goal is to build a comprehensive set of detections for a wide range of attack vectors, from **persistence** and **execution** to **lateral movement** and **defense evasion**.

This project is an **extension** of my previous work, where I simulated brute-force login attempts via RDP and SSH and collected alerts through a SIEM system (ELK Stack). By expanding this to include additional attack techniques like persistence, execution, lateral movement, and defense evasion, this repository now provides a complete pipeline for detecting host-based attacks on a Windows system using Sysmon.

## Project Overview

This repository contains the following:
- **Sysmon Configuration**: A customized Sysmon configuration (using Olaf Hartong’s config) to capture relevant event IDs that indicate potential malicious activity.
- **PowerShell Attack Simulation Scripts**: Scripts that simulate common adversary behaviors like persistence, execution, lateral movement, and defense evasion.
- **Detection Setup**: Instructions on setting up Sysmon and how to monitor the events in the Windows Event Viewer, specifically focusing on key Event IDs that are indicative of attack activity.
- **MITRE ATT&CK Mapping**: A detailed mapping of Sysmon event IDs to their corresponding MITRE ATT&CK techniques to better understand the detection and response process.
- **Sample Logs and Screenshots**: Demonstrations of how the logs appear in Sysmon and the Windows Event Viewer during these simulated attack scenarios.

## Simulated Attack Techniques

The following attack techniques were simulated as part of this project, with Sysmon logging the corresponding event IDs:

| Tactic               | Technique                                          | Sysmon Event ID(s) | Description                                                                 |
|----------------------|----------------------------------------------------|--------------------|-----------------------------------------------------------------------------|
| **Persistence**       | Registry Run Key (T1547.001)                       | 13                 | Added a registry key to simulate persistence via startup programs.          |
| **Execution**         | Command and Scripting Interpreter (T1059)          | 1, 7               | Executed `calc.exe` to simulate malicious code execution.                   |
| **Lateral Movement**  | Remote Services: SMB/Windows Admin Shares (T1021.002) | 17, 18             | Created and connected to **dummy named pipes** to simulate lateral movement (Event ID 17). |
| **Defense Evasion**   | Indicator Removal on Host (T1070.004)             | 26                 | Deleted a file to simulate log and artifact removal.                        |

### **Important Note on Lateral Movement Simulation:**
For lateral movement, the attack simulation involved creating and connecting to **dummy named pipes**. These pipes were not used for actual data transfer or communication but were created purely to **trigger Event ID 17**. In a real attack scenario, the pipes would be used for actual lateral movement, where an attacker might execute malicious code remotely or attempt to transfer files between systems.

---

## Tools & Configuration

- **Sysmon**: Configured with Olaf Hartong’s Sysmon config file to capture the necessary event logs for detecting attack techniques.
- **PowerShell**: Scripts used to simulate attack behavior on the host system (e.g., registry modifications, process executions, named pipe creations).
- **Windows Event Viewer**: Used to monitor Sysmon logs for detecting specific attack-related event IDs.
- **MITRE ATT&CK Framework**: Used for mapping the observed Sysmon event IDs to known attack techniques, ensuring that the detection methods are aligned with industry-standard tactics.

---

## Setup & Usage

### Prerequisites
1. **Sysmon Installation**: Ensure that Sysmon is installed on your Windows machine. You can download Sysmon from [Microsoft Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon).
2. **Olaf Hartong Sysmon Config**: Download and apply Olaf Hartong’s Sysmon config for detailed logging.
3. **PowerShell Execution Policy**: Set PowerShell’s execution policy to allow the scripts to run. This can be done with:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Running the Attack Simulations
Clone this repository to your local machine:

bash
Copy
Edit
git clone https://github.com/jonmallen313/host-based-detection-sysmon.git
cd host-based-detection-sysmon
Run the PowerShell scripts to simulate various attacks:

Persistence (Registry Run Key):

powershell
Copy
Edit
.\scripts\simulate_registry_persistence.ps1
Execution (Launch Payload):

powershell
Copy
Edit
.\scripts\simulate_execution.ps1
Lateral Movement (Named Pipes):

powershell
Copy
Edit
.\scripts\simulate_named_pipes.ps1
Defense Evasion (File Deletion):

powershell
Copy
Edit
.\scripts\simulate_file_deletion.ps1
After running each script, monitor the logs in Event Viewer under Applications and Services Logs > Microsoft > Windows > Sysmon > Operational.

The key event IDs to look for are:

Event ID 1 (Execution)

Event ID 7 (Image Load)

Event ID 13 (Registry Run Key - Persistence)

Event ID 17 (Named Pipe Creation)

Event ID 18 (Named Pipe Connection)

Event ID 26 (File Deletion)

Sample Logs
The repository includes sample logs and screenshots showing the logs generated from the simulated attack scenarios. These are located in the /screenshots directory.

MITRE ATT&CK Mapping
This section maps the Sysmon event IDs generated during the attack simulations to corresponding techniques in the MITRE ATT&CK framework. The table below provides a detailed overview of the attack techniques we simulated and their corresponding event IDs.


Tactic	Technique	Sysmon Event ID(s)	Description
Persistence	Registry Run Key (T1547.001)	13	Added a registry key to simulate persistence via startup programs.
Execution	Command and Scripting Interpreter (T1059)	1, 7	Executed calc.exe to simulate malicious code execution.
Lateral Movement	Remote Services: SMB/Windows Admin Shares (T1021.002)	17, 18	Created and connected to dummy named pipes to simulate lateral movement (Event ID 17).
Defense Evasion	Indicator Removal on Host (T1070.004)	26	Deleted a file to simulate log and artifact removal.
For a more detailed overview of these techniques, visit the MITRE ATT&CK Framework.

