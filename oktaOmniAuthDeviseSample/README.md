# README
Project use Rails 5.1

in the cmd line: Bundle install

in the cmd line: rake db:create


in the cmd line: bundle exec figaro install // generates appication.yaml file for ENV varaibles


Go into the project config/application.yml and add these values from your okta tenant

```application.yaml values
OKTA_CLIENT_ID: "your clientId value"

OKTA_CLIENT_SECRET: "your client Secret value"

OKTA_ORG: "typically the name before okta.com so if your url is yourcompany.okta.com then simply leave yourcompany" 
OKTA_DOMAIN: "okta"

OKTA_URL: "your full okta tenant url"

OKTA_ISSUER: "your auth server url"

OKTA_AUTH_SERVER_ID: "the custom server id if you are using one if not leave blank"

OKTA_REDIRECT_URI: "http://localhost:3000/users/auth/oktaoauth/callback"
```

How to generate values in Okta.  Go to top header applications > create app.

<a href="https://drive.google.com/uc?export=view&id=1f3Zb_aPA3IBbMtACDl71ZtXF6OC3pKEl"><img src="https://drive.google.com/uc?export=view&id=1f3Zb_aPA3IBbMtACDl71ZtXF6OC3pKEl"> 
  
  ### For the callback make sure you use whatever port you are running on, to use the default you should use 3000.
  
 <a href="https://drive.google.com/uc?export=view&id=1B9X6CVdUyb3pI5OShr6QaIMUYEYzSTAG"><img src="https://drive.google.com/uc?export=view&id=1B9X6CVdUyb3pI5OShr6QaIMUYEYzSTAG"> 
  
 <a href="https://drive.google.com/uc?export=view&id=1FQwV3hdADFcAOHjmGtuN6leqVfvPaVIc"><img src="https://drive.google.com/uc?export=view&id=1FQwV3hdADFcAOHjmGtuN6leqVfvPaVIc"> 
  
  To learn about where to get the auth server value go to https://developer.okta.com/authentication-guide/implementing-authentication/set-up-authz-server

in the cmd line: rake db:migrate

in the cmd line: rails s


# Disclaimer

If you have any odd SSL error from Devise when using Custom url with Okta make sure your cert is legitimate. By default line 3 (congig/initializers.rb with OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?) is uncommented for POC purposes if your cert associated with your custom domain has issues, but this is strictly for dev purposes.


