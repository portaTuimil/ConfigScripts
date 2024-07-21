#!/bin/bash

npm init -y
mkdir src && touch src/index.html src/styles.css src/index.js webpack.config.js index.html .gitignore && mkdir src/assets
npm install webpack webpack-cli
npm install --save-dev html-webpack-plugin
npm install --save-dev style-loader css-loader
sed -i '6 i \\ \ \ \ "watch\": \"webpack --watch\",' package.json
sed -i '6 i \\ \ \ \ "build\": \"webpack --mode=development\",' package.json
#fill webpack.config.js

echo "const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = { 
    entry: './src/index.js',
    output: {
      filename: 'main.js',
      clean: true,
      path: path.resolve(__dirname, 'dist'),
      assetModuleFilename: 'assets/[hash][ext][query]'
    },
    plugins: [
        new HtmlWebpackPlugin({
            filename: 'index.html',
            /*favicon: "",*/ //Path to icon
            inject: true,
            template: path.resolve(__dirname, 'src', 'index.html'),
          }),
    ],
    module: {
      rules: [
        {
          test: /\.css$/,
          use: ['style-loader', 'css-loader']
        },
        {
          test: /\.(png|jpg|jpeg|svg|gif)$/,
          type: 'asset/resource',
        },
        {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: 'asset/resource',
        },
      ]
    }
  }" > webpack.config.js 
#fill the html deflector

echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <meta http-equiv=\"refresh\" content=\"0; url=./dist/index.html\">
    <title>deflector</title>
</head>
<body>
</body>
</html>" > index.html 

echo "import './styles.css';" > src/index.js
#fill src/index.html

echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"description\" content=\"\">
    <meta name=\"author\" content=\"\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title></title>
    <script src="index.js" defer></script>
    <link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">
    <link rel=\"icon\" type=\"image/x-icon\" href=\"\">
</head>
<body>

</body>
</html>" > src/index.html 

echo "node_modules" > .gitignore
