#!/usr/bin/env bash
#
# For Xamarin, change some constants located in some class of the app.
# In this sample, suppose we have an AppConstant.cs class in shared folder with follow content:
#
# namespace AppCenterPoc
# {
#     public class AppConstant
#     {
#         public const string ApiUrl = "https://CMS_MyApp-Eur01.com/api";
#     }
# }
# 
# Suppose in our project exists two branches: master and develop. 
# We can release app for production API in master branch and app for test API in develop branch. 
# We just need configure this behaviour with environment variable in each branch :)
# 
# The same thing can be perform with any class of the app.
#
# AN IMPORTANT THING: FOR THIS SAMPLE YOU NEED DECLARE API_URL ENVIRONMENT VARIABLE IN APP CENTER BUILD CONFIGURATION.

if [ -z "$API_BASE_URL" ]
then
    echo "You need define the API_URL variable in App Center"
    exit
fi

echo "API_URL variable in App Center : $API_BASE_URL"

APP_CONSTANT_FILE=$APPCENTER_SOURCE_DIRECTORY/Aps.Com.Helpers/AppConstant.cs

if [ -e "$APP_CONSTANT_FILE" ]
then
    echo "Updating ApiBaseUrl to $API_BASE_URL in AppConstant.cs"
    sed -i '' 's#ApiBaseUrl = "[-A-Za-z0-9:_./]*"#ApiBaseUrl = "'$API_BASE_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#SitecoreBaseURL = "[-A-Za-z0-9:_./]*"#SitecoreBaseURL = "'$SITECORE_BASE_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#IdamBaseUrl = "[-A-Za-z0-9:_./]*"#IdamBaseUrl = "'$IDAM_BASE_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#SubscriptionKey = "[-A-Za-z0-9:_./]*"#SubscriptionKey = "'$SUBSCRIPTION_KEY'"#' $APP_CONSTANT_FILE
    sed -i '' 's#TenantUrl = "[-A-Za-z0-9:_./]*"#TenantUrl = "'$TENANT_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#Scope = "[-A-Za-z0-9:_./]*"#Scope = "'$SCOPE'"#' $APP_CONSTANT_FILE
    sed -i '' 's#ClientID = "[-A-Za-z0-9:_./]*"#ClientID = "'$CLIENT_ID'"#' $APP_CONSTANT_FILE
    sed -i '' 's#RedirectUrl = "[-A-Za-z0-9:_./]*"#RedirectUrl = "'$REDIRECT_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#Environment = "[-A-Za-z0-9:_./]*"#Environment = "'$ENVIRONMENT'"#' $APP_CONSTANT_FILE
    sed -i '' 's#SecretKeyAndroid = "[-A-Za-z0-9:_./]*"#SecretKeyAndroid = "'$APP_KEY_ANDROID'"#' $APP_CONSTANT_FILE
    sed -i '' 's#SecretKeyiOS = "[-A-Za-z0-9:_./]*"#SecretKeyiOS = "'$APP_KEY_iOS'"#' $APP_CONSTANT_FILE
    sed -i '' 's#ApiStatusCheckUrl = "[-A-Za-z0-9:_./]*"#ApiStatusCheckUrl = "'$API_STATUSCHECK_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#StatusCheckDRUrl = "[-A-Za-z0-9:_./]*"#StatusCheckDRUrl = "'$STATUSCHECK_DR_URL'"#' $APP_CONSTANT_FILE
    sed -i '' 's#XFunctionKey = "[-A-Za-z0-9:_.&()!/]*"#XFunctionKey = "'${XKEY_FUNCTION//&/\\&}'"#' $APP_CONSTANT_FILE
    sed -i '' 's#XDRFunctionKey = "[-A-Za-z0-9:_.&()!/]*"#XDRFunctionKey = "'${XDRKEY_FUNCTION//&/\\&}'"#' $APP_CONSTANT_FILE
    sed -i '' 's#StatusCheckApiCode = "[-A-Za-z0-9:_.&()!/]*"#StatusCheckApiCode = "'${STATUSCHECK_CODE//&/\\&}'"#' $APP_CONSTANT_FILE
    sed -i '' 's#DRStatusCheckApiCode = "[-A-Za-z0-9:_.&()!/]*"#DRStatusCheckApiCode = "'${DR_STATUSCHECK_DRAPI//&/\\&}'"#' $APP_CONSTANT_FILE
    #sed -i '' 's#PWDPublicKey = "[-A-Za-z0-9:_.&()!/]*"#PWDPublicKey = "'${PWD_PUBLIC_KEY//&/\\&}'"#' $APP_CONSTANT_FILE
    sed -i '' 's#CssUser = "[-A-Za-z0-9:_./]*"#CssUser = "'$CSS_USER'"#' $APP_CONSTANT_FILE
    

    echo "File content:"
    cat $APP_CONSTANT_FILE
    
else
    echo -e "File $APP_CONSTANT_FILE doesnt exists"
fi

