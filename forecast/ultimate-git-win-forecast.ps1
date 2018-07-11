param(
    [string]$city,
    [string]$countryCode,
    [boolean]$useCelsius = $true
)

$tempScale = 'c'
if (-not $useCelsius) {
    $tempScale = 'f'
}

$URI = "https://query.yahooapis.com/v1/public/yql?q=select item.condition from weather.forecast where woeid in (select woeid from geo.places(1) where text='{0}, {1}') and u='{2}' &format=json&env=store://datatables.org/alltableswithkeys" -f $city, $countryCode, $tempScale

$Data = Invoke-RestMethod -Uri  $URI -TimeoutSec 2 -ErrorAction Stop

$Data.query.results.channel.item.condition[0].temp
$Data.query.results.channel.item.condition[0].text