SHELL_FOLDER=$(pwd)
echo "module.exports = {
    // mongoUrl: 'mongodb://localhost:27017/baduk_online',
    mongoUrl: 'mongodb+srv://baduk:baduk@cluster0.319wl.mongodb.net/baduk_online?retryWrites=true&w=majority',
    JWT_SECRET: 'my secret'
}" > $SHELL_FOLDER/Baduk-Online-Backend/env.js