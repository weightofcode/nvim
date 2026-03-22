import os
import platform
import shutil
import subprocess
import sys
from datetime import datetime
from pathlib import Path


def run_command(cmd):
    try:
        subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"NVIM_CONFIG_ERROR: Command failed: {cmd}")
        sys.exit(e.returncode)

def get_nvim_config_path():
    os_name = platform.system()
    if os_name == "Windows":
        localappdata = os.environ.get("LOCALAPPDATA")
        if not localappdata:
            print(f"NVIM_CONFIG_ERROR: LOCALAPPDATA not set.")
            sys.exit(1)
        return Path(localappdata) / "nvim"
    elif os_name in ("Linux", "Darwin"):
        return Path.home() / ".config" / "nvim"
    else:
        print(f"NVIM_CONFIG_ERROR: Unsupported OS: {os_name}")
        sys.exit(1)

def backup_existing_config(target_path):
    if not target_path.exists():
        print(f"NVIM_CONFIG_ERROR: Neovim config path does not exist: {target_path}")
        return
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = target_path.parent / f"nvim_backup_{timestamp}"

def main():
    repo_root = Path(__file__).resolve().parent
    os_name = platform.system()
    print(f"NVIM_CONFIG_INFO: Detected OS: {os_name}")

    target_path = get_nvim_config_path()
    print(f"NVIM_CONFIG_INFO: Target path: {target_path}")
    if os_name == "Windows":
        script = repo_root / "setup" / "setup.ps1"
        run_command( [
            "powershell",
            "-ExecutionPolicy", "Bypass",
            "-File", str(script)] )
    elif os_name in ("Linux", "Darwin"):
        script = repo_root / "setup" / "setup.sh"
        run_command( ["bash", str(script)] )
    else: 
        print(f"NVIM_CONFIG_ERROR: Unsupported OS: {os_name}")
        sys.exit(1)

if __name__ == "__main__":
    main()
