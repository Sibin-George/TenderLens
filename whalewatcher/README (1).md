<div align="center">
    <img alt="verbwire" src="resources/verbwire_logo_gh.png"/>
</div>

# Simple NFT Whale Watcher App
This simple app was built using the Verbwire API. The App shows you how to retrieve NFT ownership data for the top holders of a given NFT project. For more details on using the Verbwire API you can access the full API docs [here](https://docs.verbwire.com/docs)

## Requirements
1. You'll need a Verbwire API Key. You can sign up for a free API key [HERE](https://www.verbwire.com/auth/register)

## Steps to run program locally
1. Inser your API Key in the file, whaleWatcher.js. Replace the text "YOUR API KEY GOES HERE" with your actual API key. See image in the additional section below.

2. From you command prompt, type in *npm i* to install node modules

3. From you command prompt, type in *node whaleWatcher.js* to start the program 

4. Open your browser and goto localhost:8080 to see the program running

Your output should look like this:

<div align="center">
    <img alt="whaleWatcherOutput" src="resources/sample_output_simple_whale-watcher.jpg"/>
</div>


## Additional Info
### 1. Showing where to input your API Key
<div align="center">
    <img alt="inputApiKeyHere" src="resources/input_api_key_here_.jpg"/>
</div>

### 2. Showing optional parameters you can change
(i)  In the file, whaleWatcher.js you can change the NFT slug name to any project you want. See image  
(ii) To return more than 10 elements you can change the limit parameter in whaleWatcher.js. See image

<div align="center">
    <img alt="parametersChangeCodeImage" src="resources/code_simple_whale-watcher_.jpg"/>
</div>
