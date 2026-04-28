{
  ALPHAVANTAGE_API_KEY ? "/dev/null",
  curl,
  jq,
  writeShellApplication,
}:
writeShellApplication {
  name = "prices.sh";
  runtimeInputs = [ curl jq ];
  text = ''
    ALPHAVANTAGE_API_KEY="$(cat "${ALPHAVANTAGE_API_KEY}")"
    security_endpoint="query?function=TIME_SERIES_DAILY&symbol=%s&apikey=$ALPHAVANTAGE_API_KEY"
    # shellcheck disable=SC2016
    security_jsonpath='.["Time Series (Daily)"] as $res
                         | ($res | keys | last) as $latest
                         | $res[$latest] | .["4. close"]'

    print_entry() {
        printf "P $(date +%Y/%m/%d) %s USD " "$1"
        # shellcheck disable=SC2059
        curl -LSs "https://www.alphavantage.co/$(printf "$2" "$1")" | jq -cr "$3"
        sleep 13  # 5 requests per minute, with a little buffer
    }

    echo "; Prices collected $(date +'%Y-%m-%d %H:%M:%S')"

    for symbol in FSKAX FLCOX VTI FXNAX VOOG MSFT WMT TSLA VTSAX VVIAX VINIX VEXAX; do
        print_entry "$symbol" "$security_endpoint" "$security_jsonpath"
    done
  '';
}
