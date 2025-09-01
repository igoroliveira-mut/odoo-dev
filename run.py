import json
import subprocess
import os

WORKDIR = os.path.abspath("./extra-addons")
WORKSPACE_DIR = os.path.abspath("/workspace/extra-addons/")
ODOO_CONF = os.path.abspath("./odoo.conf")

os.makedirs(WORKDIR, exist_ok=True)

with open("repositories.json", "r") as f:
    repos = json.load(f)

cloned_paths = []

for repo in repos:
    url = repo["url"]
    branch = repo["branch"]
    folder_name = os.path.join(WORKDIR, url.split("/")[-1].replace(".git", ""))
    container_folder_name = os.path.join(WORKSPACE_DIR, url.split("/")[-1].replace(".git", ""))

    if os.path.exists(folder_name):
        print(f"Pasta {folder_name} já existe, pulando...")
    else:
        print(f"Clonando {url} (branch {branch})...")
        subprocess.run([
            "git", "clone", url,
            "--depth", "1",
            "--branch", branch,
            "--single-branch",
            folder_name
        ], check=True)
    
    cloned_paths.append(container_folder_name)

with open(ODOO_CONF, "r") as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if line.strip().startswith("addons_path"):
        current_paths = line.split("=")[1].strip()
        all_paths = current_paths.split(",") + cloned_paths
        all_paths = list(dict.fromkeys([p.strip() for p in all_paths]))
        lines[i] = "addons_path = " + ", ".join(all_paths) + "\n"
        break
else:
    lines.append("addons_path = " + ", ".join(cloned_paths) + "\n")

with open(ODOO_CONF, "w") as f:
    f.writelines(lines)
