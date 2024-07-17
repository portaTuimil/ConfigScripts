#!/bin/bash

#npm init -y
#mkdir src && touch src/index.html && touch webpack.config.js && touch index.html && mkdir src/assets
#npm install webpack webpack-cli
#npm install --save-dev html-webpack-plugin
#npm install --save-dev style-loader css-loader
#sed -i '6 i \\ \ \ \ "watch\": \"webpack --watch\",' package.json
#sed -i '6 i \\ \ \ \ "build\": \"webpack --mode=development\",' package.jsoni
: '
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
  }" > webpack.config.js '
