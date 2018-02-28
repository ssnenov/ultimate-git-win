param(
    [string]$city,
    [string]$countryCode
)

$URI = "https://query.yahooapis.com/v1/public/yql?q=select  * from weather.forecast where woeid in (select woeid from geo.places(1) where  text='{0}, {1}') and u='c' &format=json&env=store://datatables.org/alltableswithkeys" -f $city, $countryCode

$Data = Invoke-RestMethod -Uri  $URI -TimeoutSec 2 -ErrorAction Stop

$Data.query.results.channel.item.forecast[0].low
$Data.query.results.channel.item.forecast[0].high
$Data.query.results.channel.item.forecast[0].text