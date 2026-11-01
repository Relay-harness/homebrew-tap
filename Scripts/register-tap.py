#!/usr/bin/env python3
"""Register the public tap and audit the proposed cask, without launching Miso."""
from pathlib import Path
import shutil
import subprocess

root = Path(__file__).resolve().parent.parent
subprocess.run(["brew", "tap", "relay-harness/tap"], check=True)
trust_supported = subprocess.run(
    ["brew", "help", "trust"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
).returncode == 0
if trust_supported:
    subprocess.run(["brew", "trust", "--cask", "relay-harness/tap/miso-track"], check=True)
tap = Path(subprocess.check_output(["brew", "--repository", "relay-harness/tap"], text=True).strip())
shutil.copyfile(root / "Casks/miso-track.rb", tap / "Casks/miso-track.rb")
