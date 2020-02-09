[phylaout]: ./docs/CableRoutingv2.png

TV
===
I did not see pre existing wired connections for the TV.
In the utility room there are two empty wall holes 1 labeled as data
other as TV, but did not saw the actual antena cables.

In the living room there are also two wall holes, I assume one will be for data other for tv. I assume inside we'll find empty tubes.

In the main bedroom there's only one empty wall hole. I assume it will be for antena.

So I expect this empty tubes to pre exist:  
* Utility -> Living room  (TV Tube)
* Utility -> Living room  (Data tube)
* Utility -> Master Bedroom (TV tube)

My personal prefference would be ignore the TV and fill all the tubes with Cat6a twisted pair.



Networking
===
The Setup here indicated provides
1. Vlan seggregation
2. Multiple ssid (Smart home, Guest, Owners)
3. Control panel with management features
4. Parental control
5. High throuput and signal quality

Choices:
1) 10Gb or 1Gb switch. Both are PoE, most people won't need 10Gbps, they provide very good capabilties, VLANs, enough power and so on.
2) I'd recommend to use 2 AP per flat for optimun coverage. AP walls have also switches, very interesting for the TV, Game consol and so on.

| Description  | Item          | Cost          |
|:------------:|:-------------:|:--------------|
| Switching 10Gb   | [US‑XG‑6POE](https://www.ui.com/unifi-switching/unifi-switch-xg-6poe/) | 550-600 |
| Switching 1Gb    | [US‑8‑150W](https://www.ui.com/unifi-switching/unifi-switch-8-150w/)| 180-200 |
| AP Wall          | [uap-iw-hd](https://inwall-hd.ui.com/) | 190 |
| AP Ceiling       | [UAP-nanoHD](https://unifi-nanohd.ui.com/) | 170 |
| Router           | [4011iGS+5HacQ2HnD-IN](https://mikrotik.com/product/rb4011igs_5hacq2hnd_in) | 0 Provided by airwire inet provider |


Physicall layout:  
![Cabling][phylaout]


Smart Home
===
The dominant protocol in the smart home domain is Zigbee, Zwave is still used, but it seems that Zigbee won the battle.
I'm sugesting two options for hub+system
1) Smarthings: Supports Zigbee + Zwave and simple and integrable with Alexa, Google home. Is simpler but less powerful.
2) DYI + OSS: [zigbee2mqtt](https://www.zigbee2mqtt.io/) + [Texas Instruments CC26X2R1](https://www.zigbee2mqtt.io/information/supported_adapters.html#texas-instruments-cc26x2r1) + [Home Assistant](https://www.home-assistant.io/) + [ZWave Controller](https://www.home-assistant.io/docs/z-wave/controllers/).  
  More powerful, configurable, but requires time, knowledge and a raspverry pi or a vm.



Hubs
---

| Description  | Item          | Cost          |
|:------------:|:-------------:|:--------------|
| opt 1: Hub Zigbee + ZWave | [SmartHubV3](https://www.samsung.com/nz/smart-things/samsung-smartthings-hub/) | 70 eur |
| opt 2: Zigbee Module | [Texas Instruments CC26X2R1](https://www.zigbee2mqtt.io/information/supported_adapters.html#texas-instruments-cc26x2r1) | 40 eur
|  opt 2:  Zwave Module | [Multiple options](https://www.home-assistant.io/docs/z-wave/controllers/) | 50 eur range| 


Bulbs
---
The Ikea bulbs in the TRÅDFRI family implement Zigbee, they are pretty cost effective and a wide range of options. Prices go from 6 - 20 eur, depending on the amount puchased and the option. The RGB ones are the most expensive, most of the non RBG ones are in the 10 eur per bulb.

[Ikea Search](https://www.ikea.com/ie/en/search/products/?q=TR%C3%85DFRI%20bulb)


Sockets
---
Sockets can be replaced and adding smart ones, providing control over them an also power consumption monitoring.The monitoring part can be solved by changing the main circuit breakers in the pannel instead of changing the switches.


Switches
---
Area of investigation. Find zigbee switches that provide:
* EU Certificaton
* UK Wall socket type
* Zigbee (1-2-3-4 gangs)
* Dimmable option

Alarm/Security/Cameras
---
Ring brand has a family of products that seems to be a good option in most cases.ZWave protocol based
  
Thermostats
---
see: [specific section](./Heating.md)

Flood detection
---
Area of investigation.

Locks
--- 
Area of investigation.

Smoke detectors
---
Area of investigation.