#!/usr/bin/env bash
#===============================================================================
#
#          FILE: exchange.sh
#
#         USAGE: ./exchange.sh
#
#   DESCRIPTION: Used in a custom block in i3status-rust. Used to return the exchange
#                rate of the AUD to USD. This can be changed to whatever currency rates
#                you are interested in. Change it in the URL below. The 3 letter country
#                can be found online at https://www.exchangerate-api.com/docs/supported-codes-endpoint
#
#                i3status-rust block   
#                [[block]]
#                block = "custom"
#                command = "/home/<user>/.local/bin/exchange.sh"
#                interval = 14400
#
#       OPTIONS: None
#  REQUIREMENTS: jq, curl and an emoji font for the country flags. An API key can be 
#                obtained from https://www.exchangerate-api.com/ website. Save the 
#                API key in a file called exchangerate.sh with the following line -
#                api_key=xxxxx where xxxxx is your API key. 
#
#        AUTHOR: Patrick Heffernan patrick4370@bigpond.com
#  ORGANIZATION: Your Dog Needs a Coat
#       CREATED: 24/07/22 15:10:04
#===============================================================================
#
#-------------------------------------------------------------------------------
# Declare variables 
#-------------------------------------------------------------------------------
auflag="🇦🇺"
usflag="🇺🇸"
precision="2"   # Used in rounding up 

#-------------------------------------------------------------------------------
# Read in API key
#-------------------------------------------------------------------------------
# shellcheck disable=SC2154
api_dir="$HOME/.config/exchangerate.sh"

if [ -e "${api_dir}" ]; then
    # shellcheck source=./.config/exchangerate.sh
    source "${api_dir}"
else
    exit 2
fi

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: round
#   DESCRIPTION: rounds up to N decimal places 
#    PARAMETERS: $1 = number to round $2 = precision 
#       RETURNS: Rounded number 
#-------------------------------------------------------------------------------
round() 
{
    printf "%.${2}f" "${1}"
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: cleanup
#   DESCRIPTION: cleans up when exiting 
#    PARAMETERS: None 
#       RETURNS: Nil 
#-------------------------------------------------------------------------------
cleanup()
{
    rm rates.data
    # unset "${api_key}"
    exit 0
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: get_data
#   DESCRIPTION: grabs the exchange data and saves to rates.data 
#    PARAMETERS: API Key - $api_key
#       RETURNS: Nil
#-------------------------------------------------------------------------------
get_data()
{
    curl --silent https://v6.exchangerate-api.com/v6/"${api_key}"/latest/AUD > rates.data
}

get_data

result=$(jq -r '.result' rates.data)

# If rates.data json contains success, pull out the conversion rate, else quit.
if [ "${result}" == "success" ]; then
    rate=$(jq '.conversion_rates | .USD' rates.data)
else
    exit 2
fi

rate=$(round "${rate}" "${precision}")

printf "%s \$1.00 → %s \$%.${precision}f" "${auflag}" "${usflag}" "${rate}" 
cleanup
