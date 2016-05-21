# Example App

This folder contains a sample Sinatra app to test the Office365 OAuth2 flow.

## Setup

Ensure your Office365 App ID and Secret are available in the environment:

```bash
export OFFICE365_APP_ID=YOUR_APP_ID_HERE
export OFFICE365_APP_SECRET=YOUR_APP_SECRET_HERE
```

Run bundle install from the command line:

```bash
bundle install
```

## Usage

Run the app:

```bash
rackup -p 4567
```
