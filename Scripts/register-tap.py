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
casks = sorted(path.stem for path in (root / "Casks").glob("*.rb"))
if trust_supported:
    for cask in casks:
        subprocess.run(["brew", "trust", "--cask", "relay-harness/tap/" + cask], check=True)
tap = Path(subprocess.check_output(["brew", "--repository", "relay-harness/tap"], text=True).strip())
for cask in casks:
    shutil.copyfile(root / ("Casks/" + cask + ".rb"), tap / ("Casks/" + cask + ".rb"))
exceptions = tap / "audit_exceptions"
exceptions.mkdir(exist_ok=True)
shutil.copyfile(
    root / "audit_exceptions/github_prerelease_allowlist.json",
    exceptions / "github_prerelease_allowlist.json",
)
