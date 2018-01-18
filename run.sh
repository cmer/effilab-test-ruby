export HOME=`pwd`

file="adwords_api.yml"
if [ ! -f "$file" ]
then
  cat > $file <<- EOM
---
# This is an example configuration file for the AdWords API client library.
# Please fill in the required fields, and copy it over to your home directory.
:authentication:
  # Authentication method, methods currently supported:
  # OAUTH2, OAUTH2_SERVICE_ACCOUNT.
  :method: OAuth2

  # Auth parameters for OAUTH2 method.
  # Set the OAuth2 client id and secret. Register your application here to
  # obtain these values:
  #   https://console.developers.google.com/
  :oauth2_client_id: INSERT_OAUTH2_CLIENT_ID_HERE
  :oauth2_client_secret: INSERT_OAUTH2_CLIENT_SECRET_HERE
  # Optional, see: https://developers.google.com/accounts/docs/OAuth2WebServer
  #:oauth2_callback: INSERT_OAUTH2_CALLBACK_URL_HERE
  #:oauth2_state: INSERT_OAUTH2_STATE_HERE
  #:oauth2_access_type: INSERT_OAUTH2_ACCESS_TYPE_HERE
  #:oauth2_prompt: INSERT_OAUTH2_PROMPT_HERE
  # You can define extra scopes so that you can reuse your refresh token for
  # other APIs.
  #:oauth2_extra_scopes: [INSERT_EXTRA_SCOPES_HERE]

  # Auth parameters for OAUTH2_SERVICE_ACCOUNT method. See:
  #   https://developers.google.com/accounts/docs/OAuth2ServiceAccount
  # You can provide path to a file with 'oauth2_keyfile' or the key itself with
  # 'oauth2_key' option.
  #:oauth2_keyfile: INSERT_OAUTH2_KEYFILE_HERE
  # Specify the issuer only if you are using a key directly with no key file.
  #:oauth2_key: INSERT_OAUTH2_KEY_HERE
  #:oauth2_issuer: INSERT_OAUTH2_ISSUER_HERE
  # To impersonate a user set prn to an email address.
  #:oauth2_prn: INSERT_OAUTH2_PRN_HERE

  # Other parameters.
  :developer_token: INSERT_YOUR_DEVELOPER_TOKEN_HERE
  :client_customer_id: INSERT_YOUR_CLIENT_CUSTOMER_ID_HERE
  :user_agent: INSERT_YOUR_USER_AGENT_HERE
:connection:
  # Enable to request all responses to be compressed.
  :enable_gzip: false
  # If your proxy connection requires authentication, make sure to include it in
  # the URL, e.g.: http://user:password@proxy_hostname:8080
  # :proxy: INSERT_PROXY_HERE
:library:
  # Optional: set the log level.
  :log_level: INFO
  # Optional: uncomment to skip header / summary rows in reporting.
  #:skip_report_header: true
  #:skip_report_summary: true
  #:skip_column_header: true
  # Optional: uncomment to disable user agent showing used utilities.
  #:include_utilities_in_user_agent: false
EOM
  echo "adwords_api.yml is set up. Refer to the given documentation to set the following values: oauth2_client_id, oauth2_client_secret, developer_token, client_customer_id."
  exit 1
fi

ruby main.rb
