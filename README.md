# CME-Quest-Adventure

## Set-up gdlint pre-commit hook
1. Install [Python 3](https://www.python.org/downloads/) (includes pip)
   **Make sure to check `Add Python to $PATH` in the installer**. Restart your terminal when done.
2. Install [gdtoolkit](https://github.com/Scony/godot-gdscript-toolkit) using the following command
```bash
pip3 install "gdtoolkit==4.*"
```
3. Run the following command from the project root directory (`rover_game`)
```bash
sh install_hooks.sh
```
4. Hook should now be installed! Will automatically run `gdlint .` on commit.
