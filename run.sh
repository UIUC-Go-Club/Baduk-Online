SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
echo npm start --prefix $SHELL_FOLDER/Baduk-Online-Frontend
echo npm start --prefix $SHELL_FOLDER/Baduk-Online-Backend
npm start --prefix $SHELL_FOLDER/Baduk-Online-Frontend &
npm start --prefix $SHELL_FOLDER/Baduk-Online-Backend &
wait