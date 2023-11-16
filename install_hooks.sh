pip install pip-tools
pip install gdtoolkit==4.*

echo "Installed packages!"

#!/bin/sh
cp hooks/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit