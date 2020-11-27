SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
npm start --prefix $SHELL_FOLDER/Baduk-Online-Frontend &
npm start --prefix $SHELL_FOLDER/Baduk-Online-Backend &