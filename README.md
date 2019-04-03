# Okta_Rails_and_You
This repo is just a simple demo of how to use Okta with ruby on rails apps. One app is a user facing app that uses Okta for authentication. The other app is an API that uses Okta for JWT verfication and authorization. 

# Setup
You will need to have an Okta account setup with an authorization server with at least one app mapped to it.
In the root of the repo you will plug in the authorization server url and the client id into the environment variables.
Run these commands:
docker-compose build
docker-compose up

You should be good to go and play around with Okta

# Sidenotes
You might have to change the scope configuration and other values the app asks for. To do this go to the devise.rb file located in ./oktaOmniAuthDeviseSample/config/initializers.
