# Report Generator

import pandas as pd
import subprocess

subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", "collect_information.ps1"])
subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", "collect_logins.ps1"])
subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", "collect_proccesses.ps1"])
subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", "collect_connections.ps1"])



