# zbx-templates

Collection of Zabbix templates maintained by BSKP for infrastructure, service, and availability monitoring.

## Overview

This repository organizes templates by category to make Zabbix import, maintenance, and reuse easier.

Available categories:

- `certificates`: certificate expiration monitoring for Linux and Windows
- `container`: container and Docker Engine monitoring
- `hardware`: monitoring for Linux and Windows hosts, notebooks, GPUs, NVMe devices, and printers
- `network`: monitoring for network devices and network-related metrics
- `web`: HTTP availability monitoring

## Structure

```text
zabbix-templates/
|-- certificates/
|-- container/
|-- hardware/
|-- network/
`-- web/
```

## Available Templates

### Certificates

- `BSKP - Certificates - Linux.yaml`
- `BSKP - Certificates - Windows.yaml`

Additional documentation: [certificates/README.md](./certificates/README.md)

### Container

- `BSKP - Container - Docker Engine.yaml`

Additional documentation: [container/README.md](./container/README.md)

### Hardware

- `BSKP - Hardware - Impressoras.yaml`
- `BSKP - Hardware - Linux.yaml`
- `BSKP - Hardware - Monitor Linux.yaml`
- `BSKP - Hardware - Monitor Notebooks Windows.yaml`
- `BSKP - Hardware - NVidia GPU Windows.yaml`
- `BSKP - Hardware - NVMe Windows.yaml`
- `BSKP - Hardware - Windows - LHM.yaml`
- `BSKP - Hardware - Windows.yaml`

Additional documentation: [hardware/README.md](./hardware/README.md)

### Network

- `BSKP - Network - Internet Speedtest.yaml`
- `BSKP - Network - MikroTik RB3011UiAS-RM by SNMP.yaml`
- `BSKP - Network - Unifi SNMP V3.yaml`

### Web

- `BSKP - Web - HTTP Availability.yaml`

## How To Use

1. Choose the template that matches the asset or service you want to monitor.
2. Import the `.yaml` file into Zabbix.
3. Adjust macros, dependent items, and helper scripts when applicable.
4. Check the category `README.md` for additional setup instructions when available.

## Helper Scripts

Some templates depend on local scripts for collection or discovery, especially in:

- `certificates/scripts`
- `container/scripts`
- `network/scripts`

Review paths, execution permissions, and `zabbix-agent2` settings before using them in production.

## Notes

- Template names follow the `BSKP` prefix for standardization.
- Not every template requires external scripts.
- Before using in production, validate Zabbix versions, dependencies, and access parameters.

---
</br>
</br>


## Português (PT-BR)

Coleção de templates Zabbix mantida pela BSKP para monitoramento de infraestrutura, serviços e disponibilidade.

## Visão Geral

Este repositório organiza templates por categoria para facilitar importação, manutenção e reutilização no Zabbix.

Categorias disponíveis:

- `certificates`: monitoramento de validade de certificados em Linux e Windows
- `container`: monitoramento de containers e Docker Engine
- `hardware`: monitoramento de hosts Linux, Windows, notebooks, GPUs, NVMe e impressoras
- `network`: monitoramento de equipamentos e indicadores de rede
- `web`: monitoramento de disponibilidade HTTP

## Estrutura

```text
zabbix-templates/
|-- certificates/
|-- container/
|-- hardware/
|-- network/
`-- web/
```

## Templates Disponíveis

### Certificados

- `BSKP - Certificates - Linux.yaml`
- `BSKP - Certificates - Windows.yaml`

Documentação complementar: [certificates/README.md](./certificates/README.md)

### Container

- `BSKP - Container - Docker Engine.yaml`

Documentação complementar: [container/README.md](./container/README.md)

### Hardware

- `BSKP - Hardware - Impressoras.yaml`
- `BSKP - Hardware - Linux.yaml`
- `BSKP - Hardware - Monitor Linux.yaml`
- `BSKP - Hardware - Monitor Notebooks Windows.yaml`
- `BSKP - Hardware - NVidia GPU Windows.yaml`
- `BSKP - Hardware - NVMe Windows.yaml`
- `BSKP - Hardware - Windows - LHM.yaml`
- `BSKP - Hardware - Windows.yaml`

Documentação complementar: [hardware/README.md](./hardware/README.md)

### Network

- `BSKP - Network - Internet Speedtest.yaml`
- `BSKP - Network - Zabbix Proxy.yaml`
- `BSKP - Network - MikroTik RB3011UiAS-RM by SNMP.yaml`
- `BSKP - Network - Unifi SNMP V3.yaml`

### Web

- `BSKP - Web - HTTP Availability.yaml`

## Como Usar

1. Escolha o template conforme o tipo de ativo ou serviço monitorado.
2. Importe o arquivo `.yaml` no Zabbix.
3. Ajuste macros, itens dependentes e scripts auxiliares quando aplicável.
4. Consulte o `README.md` da pasta da categoria quando houver instruções adicionais.

## Scripts Auxiliares

Alguns templates dependem de scripts locais para coleta ou descoberta, especialmente nas pastas:

- `certificates/scripts`
- `container/scripts`
- `network/scripts`

Revise os caminhos, permissões de execução e configurações do `zabbix-agent2` antes de aplicar em produção.

## Observações

- Os nomes dos templates seguem o prefixo `BSKP` para padronização.
- Nem todos os templates exigem scripts externos.
- Antes de usar em ambiente produtivo, valide versões do Zabbix, dependências e parâmetros de acesso.
