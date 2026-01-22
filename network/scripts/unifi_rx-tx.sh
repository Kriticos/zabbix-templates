#!/bin/bash

# ===============================
# CONFIGURAÇÕES
# ===============================
UNIFI_URL="https://192.168.20.42:8443"
UNIFI_USER="informaticaamplitec"
UNIFI_PASS="SFw1Qv!J5aD4"

ZABBIX_SERVER="192.168.20.42"
ZABBIX_PORT=10051

TMP_COOKIE="/tmp/unifi_cookie.txt"

# ===============================
# LOGIN
# ===============================
curl -sk -c "$TMP_COOKIE" \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"username\":\"$UNIFI_USER\",\"password\":\"$UNIFI_PASS\"}" \
  "$UNIFI_URL/api/login" > /dev/null

# ===============================
# COLETA DOS APS
# ===============================
DATA=$(curl -sk -b "$TMP_COOKIE" \
  "$UNIFI_URL/api/s/default/stat/device")

# ===============================
# PROCESSAMENTO
# ===============================
echo "$DATA" | jq -c '.data[] | select(.type=="uap")' | while read -r ap; do

  HOST=$(echo "$ap" | jq -r '.name')

  echo "$ap" | jq -c '.radio_table_stats[]' | while read -r radio; do

    BAND=$(echo "$radio" | jq -r '.radio')
    TX_RETRY=$(echo "$radio" | jq -r '.tx_retries_pct // 0')
    CLIENTS=$(echo "$radio" | jq -r '.num_sta // 0')
    CU=$(echo "$radio" | jq -r '.cu_total // 0')

    case "$BAND" in
      ng) SUF="2g" ;;
      na) SUF="5g" ;;
      6e) SUF="6g" ;;
      *) continue ;;
    esac

    zabbix_sender -z "$ZABBIX_SERVER" -p "$ZABBIX_PORT" -s "$HOST" -k "unifi.tx_retry[$SUF]" -o "$TX_RETRY" -vv

    zabbix_sender -z "$ZABBIX_SERVER" -p "$ZABBIX_PORT" -s "$HOST" -k "unifi.clients[$SUF]" -o "$CLIENTS" -vv

    zabbix_sender -z "$ZABBIX_SERVER" -p "$ZABBIX_PORT" -s "$HOST" -k "unifi.channel_util[$SUF]" -o "$CU" -vv

  done
done

rm -f "$TMP_COOKIE"
