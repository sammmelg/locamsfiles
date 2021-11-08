#!/bin/bash
#This Source Code Form is subject to the terms of the Mozilla
#Public License, v. 2.0. If a copy of the MPL was not distributed
#with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
if [ "$1" = "-pypath" ]; then
	PYPTH=$2
else
	PYPTH=$(which "python2.7" 2>/dev/null)
fi
if [ "$PYPTH" ]; then
	if [ -f "$PYPTH" ]; then
		PYVER=$($PYPTH --version 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/')
		if [ ! "$PYVER" -eq "27" ]; then
			echo "Error: Invalid python version (required 2.7) try to use -pypath <path>"
			exit 1		
		fi		
	else
		echo "Error: Invalid python2.7 path '$PYPTH' try to use -pypath <path>"
		exit 1	
	fi
else
	echo "Error: Missing Python2.7 try to use -pypath <path>"
	exit 1
fi
echo "Extracting file ..."
SKIP=`awk '/^__TARFILE_BEGIN__/ { print NR + 1; exit 0; }' $0`
APPDT=$(date +"%Y%m%d%H%M%S")
PATH_INSTALL="/tmp/dwagent_install$APPDT"
THIS=`readlink -f $0`
rm -r -f $PATH_INSTALL
mkdir $PATH_INSTALL
cd $PATH_INSTALL
tail -n +$SKIP $THIS | tar -x
chown $(id -u):$(id -g) $PATH_INSTALL -R
echo "Running installer ..."
export PYTHONIOENCODING=utf-8
$PYPTH installer.py $@
echo "Removing temp directory ..."
rm -r -f $PATH_INSTALL
exit 0
__TARFILE_BEGIN__
cacerts.pem                                                                                         0000644 0001750 0001750 00000025453 14113401240 012472  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 -----BEGIN CERTIFICATE-----
MIIEsTCCA5mgAwIBAgIQCKWiRs1LXIyD1wK0u6tTSTANBgkqhkiG9w0BAQsFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0xNzExMDYxMjIzMzNaFw0yNzExMDYxMjIzMzNaMF4xCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
b20xHTAbBgNVBAMTFFJhcGlkU1NMIFJTQSBDQSAyMDE4MIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEA5S2oihEo9nnpezoziDtx4WWLLCll/e0t1EYemE5n
+MgP5viaHLy+VpHP+ndX5D18INIuuAV8wFq26KF5U0WNIZiQp6mLtIWjUeWDPA28
OeyhTlj9TLk2beytbtFU6ypbpWUltmvY5V8ngspC7nFRNCjpfnDED2kRyJzO8yoK
MFz4J4JE8N7NA1uJwUEFMUvHLs0scLoPZkKcewIRm1RV2AxmFQxJkdf7YN9Pckki
f2Xgm3b48BZn0zf0qXsSeGu84ua9gwzjzI7tbTBjayTpT+/XpWuBVv6fvarI6bik
KB859OSGQuw73XXgeuFwEPHTIRoUtkzu3/EQ+LtwznkkdQIDAQABo4IBZjCCAWIw
HQYDVR0OBBYEFFPKF1n8a8ADIS8aruSqqByCVtp1MB8GA1UdIwQYMBaAFAPeUDVW
0Uy7ZvCj4hsbw5eyPdFVMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEF
BQcDAQYIKwYBBQUHAwIwEgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQo
MCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBCBgNVHR8E
OzA5MDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRHbG9i
YWxSb290Q0EuY3JsMGMGA1UdIARcMFowNwYJYIZIAYb9bAECMCowKAYIKwYBBQUH
AgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwCwYJYIZIAYb9bAEBMAgG
BmeBDAECATAIBgZngQwBAgIwDQYJKoZIhvcNAQELBQADggEBAH4jx/LKNW5ZklFc
YWs8Ejbm0nyzKeZC2KOVYR7P8gevKyslWm4Xo4BSzKr235FsJ4aFt6yAiv1eY0tZ
/ZN18bOGSGStoEc/JE4ocIzr8P5Mg11kRYHbmgYnr1Rxeki5mSeb39DGxTpJD4kG
hs5lXNoo4conUiiJwKaqH7vh2baryd8pMISag83JUqyVGc2tWPpO0329/CWq2kry
qv66OSMjwulUz0dXf4OHQasR7CNfIr+4KScc6ABlQ5RDF86PGeE6kdwSQkFiB/cQ
ysNyq0jEDQTkfa2pjmuWtMCNbBnhFXBYejfubIhaUbEv2FOQB3dCav+FPg5eEveX
TVyMnGo=
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIDrzCCApegAwIBAgIQCDvgVpBCRrGhdWrJWZHHSjANBgkqhkiG9w0BAQUFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0wNjExMTAwMDAwMDBaFw0zMTExMTAwMDAwMDBaMGExCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
b20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IENBMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4jvhEXLeqKTTo1eqUKKPC3eQyaKl7hLOllsB
CSDMAZOnTjC3U/dDxGkAV53ijSLdhwZAAIEJzs4bg7/fzTtxRuLWZscFs3YnFo97
nh6Vfe63SKMI2tavegw5BmV/Sl0fvBf4q77uKNd0f3p4mVmFaG5cIzJLv07A6Fpt
43C/dxC//AH2hdmoRBBYMql1GNXRor5H4idq9Joz+EkIYIvUX7Q6hL+hqkpMfT7P
T19sdl6gSzeRntwi5m3OFBqOasv+zbMUZBfHWymeMr/y7vrTC0LUq7dBMtoM1O/4
gdW7jVg/tRvoSSiicNoxBN33shbyTApOB6jtSj1etX+jkMOvJwIDAQABo2MwYTAO
BgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUA95QNVbR
TLtm8KPiGxvDl7I90VUwHwYDVR0jBBgwFoAUA95QNVbRTLtm8KPiGxvDl7I90VUw
DQYJKoZIhvcNAQEFBQADggEBAMucN6pIExIK+t1EnE9SsPTfrgT1eXkIoyQY/Esr
hMAtudXH/vTBH1jLuG2cenTnmCmrEbXjcKChzUyImZOMkXDiqw8cvpOp/2PV5Adg
06O/nVsJ8dWO41P0jmP6P6fbtGbfYmbW0W5BjfIttep3Sp+dWOIrWcBAI+0tKIJF
PnlUkiaY4IBIqDfv8NZ5YBberOgOzW6sRBc4L0na4UU+Krk2U886UAb3LujEV0ls
YSEY1QSteDwsOoBrp+uvFRTp2InBuThs4pFsiv9kuXclVzDAGySj4dzp30d8tbQk
CAUw7C29C79Fv1C5qfPrmAESrciIxpg0X40KPMbp1ZWVbd4=
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIGEzCCA/ugAwIBAgIQfVtRJrR2uhHbdBYLvFMNpzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0pl
cnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNV
BAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgx
MTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBjzELMAkGA1UEBhMCR0IxGzAZBgNV
BAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UE
ChMPU2VjdGlnbyBMaW1pdGVkMTcwNQYDVQQDEy5TZWN0aWdvIFJTQSBEb21haW4g
VmFsaWRhdGlvbiBTZWN1cmUgU2VydmVyIENBMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA1nMz1tc8INAA0hdFuNY+B6I/x0HuMjDJsGz99J/LEpgPLT+N
TQEMgg8Xf2Iu6bhIefsWg06t1zIlk7cHv7lQP6lMw0Aq6Tn/2YHKHxYyQdqAJrkj
eocgHuP/IJo8lURvh3UGkEC0MpMWCRAIIz7S3YcPb11RFGoKacVPAXJpz9OTTG0E
oKMbgn6xmrntxZ7FN3ifmgg0+1YuWMQJDgZkW7w33PGfKGioVrCSo1yfu4iYCBsk
Haswha6vsC6eep3BwEIc4gLw6uBK0u+QDrTBQBbwb4VCSmT3pDCg/r8uoydajotY
uK3DGReEY+1vVv2Dy2A0xHS+5p3b4eTlygxfFQIDAQABo4IBbjCCAWowHwYDVR0j
BBgwFoAUU3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFI2MXsRUrYrhd+mb
+ZsF4bgBjWHhMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0G
A1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAbBgNVHSAEFDASMAYGBFUdIAAw
CAYGZ4EMAQIBMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRydXN0
LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2Bggr
BgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDov
L29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAMr9hvQ5Iw0/H
ukdN+Jx4GQHcEx2Ab/zDcLRSmjEzmldS+zGea6TvVKqJjUAXaPgREHzSyrHxVYbH
7rM2kYb2OVG/Rr8PoLq0935JxCo2F57kaDl6r5ROVm+yezu/Coa9zcV3HAO4OLGi
H19+24rcRki2aArPsrW04jTkZ6k4Zgle0rj8nSg6F0AnwnJOKf0hPHzPE/uWLMUx
RP0T7dWbqWlod3zu4f+k+TY4CFM5ooQ0nBnzvg6s1SQ36yOoeNDT5++SR2RiOSLv
xvcRviKFxmZEJCaOEDKNyJOuB56DPi/Z+fVGjmO+wea03KbNIaiGCpXZLoUmGv38
sbZXQm2V0TP2ORQGgkE49Y9Y3IBbpNV9lXj9p5v//cWoaasm56ekBYdbqbe4oyAL
l6lFhd2zi+WJN44pDfwGF/Y4QA5C5BIG+3vzxhFoYt/jmPQT2BVPi7Fp2RBgvGQq
6jG35LWjOhSbJuMLe/0CjraZwTiXWTb2qHSihrZe68Zk6s+go/lunrotEbaGmAhY
LcmsJWTyXnW0OMGuf1pGg+pRyrbxmRE1a6Vqe8YAsOf4vmSyrcjC8azjUeqkk+B5
yOGBQMkKW+ESPMFgKuOXwIlCypTPRpgSabuY0MLTDXJLR27lk8QyKGOHQ+SwMj4K
00u/I5sUKUErmgQfky3xxzlIPK1aEn8=
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIF3jCCA8agAwIBAgIQAf1tMPyjylGoG7xkDjUDLTANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0pl
cnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNV
BAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTAw
MjAxMDAwMDAwWhcNMzgwMTE4MjM1OTU5WjCBiDELMAkGA1UEBhMCVVMxEzARBgNV
BAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVU
aGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2Vy
dGlmaWNhdGlvbiBBdXRob3JpdHkwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
AoICAQCAEmUXNg7D2wiz0KxXDXbtzSfTTK1Qg2HiqiBNCS1kCdzOiZ/MPans9s/B
3PHTsdZ7NygRK0faOca8Ohm0X6a9fZ2jY0K2dvKpOyuR+OJv0OwWIJAJPuLodMkY
tJHUYmTbf6MG8YgYapAiPLz+E/CHFHv25B+O1ORRxhFnRghRy4YUVD+8M/5+bJz/
Fp0YvVGONaanZshyZ9shZrHUm3gDwFA66Mzw3LyeTP6vBZY1H1dat//O+T23LLb2
VN3I5xI6Ta5MirdcmrS3ID3KfyI0rn47aGYBROcBTkZTmzNg95S+UzeQc0PzMsNT
79uq/nROacdrjGCT3sTHDN/hMq7MkztReJVni+49Vv4M0GkPGw/zJSZrM233bkf6
c0Plfg6lZrEpfDKEY1WJxA3Bk1QwGROs0303p+tdOmw1XNtB1xLaqUkL39iAigmT
Yo61Zs8liM2EuLE/pDkP2QKe6xJMlXzzawWpXhaDzLhn4ugTncxbgtNMs+1b/97l
c6wjOy0AvzVVdAlJ2ElYGn+SNuZRkg7zJn0cTRe8yexDJtC/QV9AqURE9JnnV4ee
UB9XVKg+/XRjL7FQZQnmWEIuQxpMtPAlR1n6BB6T1CZGSlCBst6+eLf8ZxXhyVeE
Hg9j1uliutZfVS7qXMYoCAQlObgOK6nyTJccBz8NUvXt7y+CDwIDAQABo0IwQDAd
BgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYDVR0PAQH/BAQDAgEGMA8G
A1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEMBQADggIBAFzUfA3P9wF9QZllDHPF
Up/L+M+ZBn8b2kMVn54CVVeWFPFSPCeHlCjtHzoBN6J2/FNQwISbxmtOuowhT6KO
VWKR82kV2LyI48SqC/3vqOlLVSoGIG1VeCkZ7l8wXEskEVX/JJpuXior7gtNn3/3
ATiUFJVDBwn7YKnuHKsSjKCaXqeYalltiz8I+8jRRa8YFWSQEg9zKC7F4iRO/Fjs
8PRF/iKz6y+O0tlFYQXBl2+odnKPi4w2r78NBc5xjeambx9spnFixdjQg3IM8WcR
iQycE0xyNN+81XHfqnHd4blsjDwSXWXavVcStkNr/+XeTWYRUc+ZruwXtuhxkYze
Sf7dNXGiFSeUHM9h4ya7b6NnJSFd5t0dCy5oGzuCr+yDZ4XUmFF0sbmZgIn/f3gZ
XHlKYC6SQK5MNyosycdiyA5d9zZbyuAlJQG03RoHnHcAP9Dc1ew91Pq7P8yF1m9/
qS3fuQL39ZeatTXaw2ewh0qpKJ4jjv9cJ2vhsE/zB+4ALtRZh8tSQZXq9EfX7mRB
VXyNWQKV3WKdwrnuWih0hKWbt5DHDAff9Yk2dDLWKMGwsAvgnEzDHNb842m1R0aB
L6KCq9NjRHDEjf8tM7qtj3u1cIiuPhnPQCjY/MiQu12ZIvVS5ljFH4gxQ+6IHdfG
jjxDah2nGN59PRbxYvnKkKj9
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIFFjCCAv6gAwIBAgIRAJErCErPDBinU/bWLiWnX1owDQYJKoZIhvcNAQELBQAw
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMjAwOTA0MDAwMDAw
WhcNMjUwOTE1MTYwMDAwWjAyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNTGV0J3Mg
RW5jcnlwdDELMAkGA1UEAxMCUjMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQC7AhUozPaglNMPEuyNVZLD+ILxmaZ6QoinXSaqtSu5xUyxr45r+XXIo9cP
R5QUVTVXjJ6oojkZ9YI8QqlObvU7wy7bjcCwXPNZOOftz2nwWgsbvsCUJCWH+jdx
sxPnHKzhm+/b5DtFUkWWqcFTzjTIUu61ru2P3mBw4qVUq7ZtDpelQDRrK9O8Zutm
NHz6a4uPVymZ+DAXXbpyb/uBxa3Shlg9F8fnCbvxK/eG3MHacV3URuPMrSXBiLxg
Z3Vms/EY96Jc5lP/Ooi2R6X/ExjqmAl3P51T+c8B5fWmcBcUr2Ok/5mzk53cU6cG
/kiFHaFpriV1uxPMUgP17VGhi9sVAgMBAAGjggEIMIIBBDAOBgNVHQ8BAf8EBAMC
AYYwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMBMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0OBBYEFBQusxe3WFbLrlAJQOYfr52LFMLGMB8GA1UdIwQYMBaA
FHm0WeZ7tuXkAXOACIjIGlj26ZtuMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcw
AoYWaHR0cDovL3gxLmkubGVuY3Iub3JnLzAnBgNVHR8EIDAeMBygGqAYhhZodHRw
Oi8veDEuYy5sZW5jci5vcmcvMCIGA1UdIAQbMBkwCAYGZ4EMAQIBMA0GCysGAQQB
gt8TAQEBMA0GCSqGSIb3DQEBCwUAA4ICAQCFyk5HPqP3hUSFvNVneLKYY611TR6W
PTNlclQtgaDqw+34IL9fzLdwALduO/ZelN7kIJ+m74uyA+eitRY8kc607TkC53wl
ikfmZW4/RvTZ8M6UK+5UzhK8jCdLuMGYL6KvzXGRSgi3yLgjewQtCPkIVz6D2QQz
CkcheAmCJ8MqyJu5zlzyZMjAvnnAT45tRAxekrsu94sQ4egdRCnbWSDtY7kh+BIm
lJNXoB1lBMEKIq4QDUOXoRgffuDghje1WrG9ML+Hbisq/yFOGwXD9RiX8F6sw6W4
avAuvDszue5L3sz85K+EC4Y/wFVDNvZo4TYXao6Z0f+lQKc0t8DQYzk1OXVu8rp2
yJMC6alLbBfODALZvYH7n7do1AZls4I9d1P4jnkDrQoxB3UqQ9hVl3LEKQ73xF1O
yK5GhDDX8oVfGKF5u+decIsH4YaTw7mP3GFxJSqv3+0lUFJoi5Lc5da149p90Ids
hCExroL1+7mryIkXPeFM5TgO9r0rvZaBFOvV2z0gp35Z0+L4WPlbuEjN/lxPFin+
HlUjr8gRsI3qfJOQFy/9rKIJR0Y/8Omwt/8oTWgy1mdeHmmjk7j1nYsvC9JSQ6Zv
MldlTTKB3zhThV1+XWYp6rjd5JW1zbVWEkLNxE7GJThEUG3szgBVGP7pSWTUTsqX
nLRbwHOoq7hHwg==
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMTUwNjA0MTEwNDM4
WhcNMzUwNjA0MTEwNDM4WjBPMQswCQYDVQQGEwJVUzEpMCcGA1UEChMgSW50ZXJu
ZXQgU2VjdXJpdHkgUmVzZWFyY2ggR3JvdXAxFTATBgNVBAMTDElTUkcgUm9vdCBY
MTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK3oJHP0FDfzm54rVygc
h77ct984kIxuPOZXoHj3dcKi/vVqbvYATyjb3miGbESTtrFj/RQSa78f0uoxmyF+
0TM8ukj13Xnfs7j/EvEhmkvBioZxaUpmZmyPfjxwv60pIgbz5MDmgK7iS4+3mX6U
A5/TR5d8mUgjU+g4rk8Kb4Mu0UlXjIB0ttov0DiNewNwIRt18jA8+o+u3dpjq+sW
T8KOEUt+zwvo/7V3LvSye0rgTBIlDHCNAymg4VMk7BPZ7hm/ELNKjD+Jo2FR3qyH
B5T0Y3HsLuJvW5iB4YlcNHlsdu87kGJ55tukmi8mxdAQ4Q7e2RCOFvu396j3x+UC
B5iPNgiV5+I3lg02dZ77DnKxHZu8A/lJBdiB3QW0KtZB6awBdpUKD9jf1b0SHzUv
KBds0pjBqAlkd25HN7rOrFleaJ1/ctaJxQZBKT5ZPt0m9STJEadao0xAH0ahmbWn
OlFuhjuefXKnEgV4We0+UXgVCwOPjdAvBbI+e0ocS3MFEvzG6uBQE3xDk3SzynTn
jh8BCNAw1FtxNrQHusEwMFxIt4I7mKZ9YIqioymCzLq9gwQbooMDQaHWBfEbwrbw
qHyGO0aoSCqI3Haadr8faqU9GY/rOPNk3sgrDQoo//fb4hVC1CLQJ13hef4Y53CI
rU7m2Ys6xt0nUW7/vGT1M0NPAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNV
HRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5tFnme7bl5AFzgAiIyBpY9umbbjANBgkq
hkiG9w0BAQsFAAOCAgEAVR9YqbyyqFDQDLHYGmkgJykIrGF1XIpu+ILlaS/V9lZL
ubhzEFnTIZd+50xx+7LSYK05qAvqFyFWhfFQDlnrzuBZ6brJFe+GnY+EgPbk6ZGQ
3BebYhtF8GaV0nxvwuo77x/Py9auJ/GpsMiu/X1+mvoiBOv/2X/qkSsisRcOj/KK
NFtY2PwByVS5uCbMiogziUwthDyC3+6WVwW6LLv3xLfHTjuCvjHIInNzktHCgKQ5
ORAzI4JMPJ+GslWYHb4phowim57iaztXOoJwTdwJx4nLCgdNbOhdjsnvzqvHu7Ur
TkXWStAmzOVyyghqpZXjFaH3pO3JLF+l+/+sKAIuvtd7u+Nxe5AW0wdeRlN8NwdC
jNPElpzVmbUq4JUagEiuTDkHzsxHpFKVK7q4+63SM1N95R1NbdWhscdCb+ZAJzVc
oyi3B43njTOQ5yOf+1CceWxG1bQVs5ZufpsMljq4Ui0/1lvh+wjChP4kqKOJ2qxq
4RgqsahDYVvTH9w7jXbyLeiNdd8XM2w9U/t7y0Ff/9yi0GE44Za4rF2LN9d11TPA
mRGunUHBcnWEvgJBQl9nJEiU0Zsnvgc/ubhPgXRR4Xq37Z0j4r7g1SgEEzwxA57d
emyPxgcYxn/eR44/KJ4EBs+lVDR3veyJm+kXQ99b21/+jh5Xos1AnX5iItreGCc=
-----END CERTIFICATE-----                                                                                                                                                                                                                     communication.py                                                                                    0000755 0001750 0001750 00000126474 14140273566 013614  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import ssl
import struct
import time
import socket
import threading
import xml.etree.ElementTree
import os
import math
import utils

BUFFER_SIZE_MAX = 65536-10
BUFFER_SIZE_MIN = 1024


SIZE_INTEGER=math.pow(2,32)
SIZE_LONG=math.pow(2,64)


#_SOCKET_TIMEOUT_CONNECT = 10
_SOCKET_TIMEOUT_READ = 20

_cacerts_path="cacerts.pem"
_proxy_detected = {}
_proxy_detected["semaphore"]=threading.Condition()
_proxy_detected["check"] = False
_proxy_detected["info"] = None

def is_windows():
    return utils.is_windows()

def is_linux():
    return utils.is_linux()

def is_mac():
    return utils.is_mac()

def get_time():
    return utils.get_time()

def get_ssl_info():
    sslret=ssl.OPENSSL_VERSION + " ("
    #if hasattr(ssl, 'PROTOCOL_TLSv1_3'):
    #    sslret += "TLSv1.3"
    if hasattr(ssl, 'PROTOCOL_TLSv1_2'):
        sslret += "TLSv1.2" 
    elif hasattr(ssl, 'PROTOCOL_TLSv1_1'):
        sslret += "TLSv1.1"
    elif hasattr(ssl, 'PROTOCOL_TLSv1'):
        sslret += "TLSv1"
    else:
        sslret += "Unknown"
    sslret += ")"
    return sslret

def _get_ssl_ver():
    #if hasattr(ssl, 'PROTOCOL_TLSv1_3'):
    #    return ssl.PROTOCOL_TLSv1_3
    if hasattr(ssl, 'PROTOCOL_TLSv1_2'):
        return ssl.PROTOCOL_TLSv1_2 
    if hasattr(ssl, 'PROTOCOL_TLSv1_1'):
        return ssl.PROTOCOL_TLSv1_1
    if hasattr(ssl, 'PROTOCOL_TLSv1'):
        return ssl.PROTOCOL_TLSv1
    if hasattr(ssl, 'PROTOCOL_TLS'):
        return ssl.PROTOCOL_TLS
    return ssl.PROTOCOL_SSLv23 #DEFAULT

def _connect_proxy_http(sock, host, port, proxy_info):
    usr = proxy_info.get_user()
    pwd = proxy_info.get_password()
    arreq=[]
    arreq.append("CONNECT %s:%d HTTP/1.0" % (host, port))
    if usr is not None and len(usr)>0:
        auth=utils.bytes_to_str(utils.enc_base64_encode(utils.str_to_bytes(usr + ":" + pwd,"utf8")))
        arreq.append("\r\nProxy-Authorization: Basic %s" % (auth))
    arreq.append("\r\n\r\n")
    sock.sendall(utils.str_to_bytes("".join(arreq)))
    resp = Response(sock)
    if resp.get_code() != '200':
        raise Exception("Proxy http error: " + str(resp.get_code()) + ".")
    

def _connect_proxy_socks(sock, host, port, proxy_info):
    usr = proxy_info.get_user()
    pwd = proxy_info.get_password()
    if proxy_info.get_type()=='SOCKS5':
        arreq = []
        arreq.append(struct.pack(">BBBB", 0x05, 0x02, 0x00, 0x02))
        sock.sendall(utils.bytes_join(arreq))
        resp = sock.recv(2)
        ver = utils.bytes_get(resp,0)
        mth = utils.bytes_get(resp,1)
        if ver!=0x05:
            raise Exception("Proxy socks error: Incorrect version.")
        if mth!=0x00 and mth!=0x02:
            raise Exception("Proxy socks error: Method not supported.")
        if mth==0x02:
            if usr is not None and len(usr)>0 and pwd is not None and len(pwd)>0:
                arreq = []
                arreq.append(struct.pack(">B", 0x01))
                arreq.append(struct.pack(">B", len(usr)))
                for c in usr:
                    arreq.append(struct.pack(">B", ord(c)))
                arreq.append(struct.pack(">B", len(pwd)))
                for c in pwd:
                    arreq.append(struct.pack(">B", ord(c)))                
                sock.sendall(utils.bytes_join(arreq))
                resp = sock.recv(2)
                ver = utils.bytes_get(resp,0)
                status = utils.bytes_get(resp,1)
                if ver!=0x01 or status != 0x00:
                    raise Exception("Proxy socks error: Incorrect Authentication.")
            else:
                raise Exception("Proxy socks error: Authentication required.")
        arreq = []
        arreq.append(struct.pack(">BBB", 0x05, 0x01, 0x00))
        try:
            addr_bytes = socket.inet_aton(host)
            arreq.append(b"\x01")
            arreq.append(addr_bytes)
        except socket.error:
            arreq.append(b"\x03")
            arreq.append(struct.pack(">B", len(host)))
            for c in host:
                arreq.append(struct.pack(">B", ord(c)))
        arreq.append(struct.pack(">H", port))
        sock.sendall(utils.bytes_join(arreq))
        resp = sock.recv(1024)
        ver = utils.bytes_get(resp,0)
        status = utils.bytes_get(resp,1)
        if ver!=0x05 or status != 0x00:
            raise Exception("Proxy socks error.")
    else:
        remoteresolve=False
        try:
            addr_bytes = socket.inet_aton(host)
        except socket.error:
            if proxy_info.get_type()=='SOCKS4A':
                addr_bytes = b"\x00\x00\x00\x01"
                remoteresolve=True
            else:
                addr_bytes = socket.inet_aton(socket.gethostbyname(host))
            
        arreq = []
        arreq.append(struct.pack(">BBH", 0x04, 0x01, port))
        arreq.append(addr_bytes)
        if usr is not None and len(usr)>0:
            for c in usr:
                arreq.append(struct.pack(">B", ord(c)))
        arreq.append(b"\x00")
        if remoteresolve:
            for c in host:
                arreq.append(struct.pack(">B", ord(c)))
            arreq.append(b"\x00")
        sock.sendall(utils.bytes_join(arreq))
        
        resp = sock.recv(8)
        if len(resp)<2:
            raise Exception("Proxy socks error.")
        if utils.bytes_get(resp,0) != 0x00:
            raise Exception("Proxy socks error.")
        status = utils.bytes_get(resp,1)
        if status != 0x5A:
            raise Exception("Proxy socks error.")

def _detect_proxy_windows():
    prxi=None
    try:
        sproxy=None
        import _winreg
        aReg = _winreg.ConnectRegistry(None,_winreg.HKEY_CURRENT_USER)
        aKey = _winreg.OpenKey(aReg, r"Software\Microsoft\Windows\CurrentVersion\Internet Settings")
        try: 
            subCount, valueCount, lastModified = _winreg.QueryInfoKey(aKey)
            penabled=False
            pserver=None
            for i in range(valueCount):                                           
                try:
                    n,v,t = _winreg.EnumValue(aKey,i)
                    if n.lower() == 'proxyenable':
                        penabled = v and True or False
                    elif n.lower() == 'proxyserver':
                        pserver = v
                except EnvironmentError:                                               
                    break
            if penabled and pserver is not None:
                sproxy=pserver
        finally:
            _winreg.CloseKey(aKey)   
        if sproxy is not None:
            stp=None
            sho=None
            spr=None            
            lst = sproxy.split(";")
            for v in lst:
                if len(v)>0:
                    ar1 = v.split("=")
                    if len(ar1)==1:
                        stp="HTTP"
                        ar2 = ar1[0].split(":")
                        sho=ar2[0]
                        spr=ar2[1]
                        break
                    elif ar1[0].lower()=="http":
                        stp="HTTP"
                        ar2 = ar1[1].split(":")
                        sho=ar2[0]
                        spr=ar2[1]
                        break
                    elif ar1[0].lower()=="socks":
                        stp="SOCKS5"
                        ar2 = ar1[1].split(":")
                        sho=ar2[0]
                        spr=ar2[1]
                    
            if stp is not None:
                prxi = ProxyInfo()
                prxi.set_type(stp)
                prxi.set_host(sho)
                prxi.set_port(int(spr))
                #print("PROXY WINDOWS DETECTED:" + stp + "  " + spr)
                
    except:
        None
    return prxi

def _detect_proxy_linux():
    prxi=None
    try:
        sprx=None
        sprx=os.getenv("all_proxy")
        if "http_proxy" in os.environ:
            sprx = os.environ["http_proxy"]
        elif "all_proxy" in os.environ:
            sprx = os.environ["all_proxy"]
        if sprx is not None:
            stp=None
            if sprx.endswith("/"):
                sprx=sprx[0:len(sprx)-1]            
            if sprx.lower().startswith("socks:"):
                stp="SOCKS5"
                sprx=sprx[len("socks:"):]
            elif sprx.lower().startswith("http:"):
                stp="HTTP"
                sprx=sprx[len("http:"):]
            if stp is not None:
                sun=None
                spw=None
                sho=None
                spr=None
                ar = sprx.split("@")
                if len(ar)==1:
                    ar1 = sprx[0].split(":")
                    sho=ar1[0]
                    spr=ar1[1]
                else: 
                    ar1 = sprx[0].split(":")
                    sun=ar1[0]
                    spw=ar1[1]
                    ar2 = sprx[1].split(":")
                    sho=ar2[0]
                    spr=ar2[1]
                prxi = ProxyInfo()
                prxi.set_type(stp)
                prxi.set_host(sho)
                prxi.set_port(int(spr))
                prxi.set_user(sun)
                prxi.set_password(spw)
    except:
        None
    return prxi

def release_detected_proxy():
    global _proxy_detected
    _proxy_detected["semaphore"].acquire()
    try:
        _proxy_detected["check"]=False
        _proxy_detected["info"]=None
    finally:
        _proxy_detected["semaphore"].release()

def _set_detected_proxy_none():
    global _proxy_detected
    _proxy_detected["semaphore"].acquire()
    try:
        _proxy_detected["check"]=True
        _proxy_detected["info"]=None
    finally:
        _proxy_detected["semaphore"].release()
    
def set_cacerts_path(path):
    global _cacerts_path
    _cacerts_path=path

def _connect_socket(host, port, proxy_info, timeout=_SOCKET_TIMEOUT_READ):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
        sock.settimeout(timeout)
        bprxdet=False
        prxi=proxy_info
        if prxi is None or prxi.get_type() is None or proxy_info.get_type()=='SYSTEM':
            global _proxy_detected
            _proxy_detected["semaphore"].acquire()
            try:
                if not _proxy_detected["check"]:
                    try:
                        if is_windows():
                            _proxy_detected["info"] = _detect_proxy_windows()
                        elif is_linux():
                            _proxy_detected["info"] = _detect_proxy_linux()
                        elif is_mac():
                            _proxy_detected["info"]=None
                    except:
                        _proxy_detected=None
                if _proxy_detected is not None:
                    bprxdet=True
                    prxi = _proxy_detected["info"]
                _proxy_detected["check"]=True
            finally:
                _proxy_detected["semaphore"].release()
            
        conn_ex=None    
        func_prx=None
        if prxi is None or prxi.get_type() is None or prxi.get_type()=='NONE':
            sock.connect((host, port))
        elif prxi.get_type()=='HTTP':
            try:
                sock.connect((prxi.get_host(), prxi.get_port()))
                func_prx=_connect_proxy_http
            except:
                conn_ex=utils.get_exception()
        elif prxi.get_type()=='SOCKS4' or prxi.get_type()=='SOCKS4A' or prxi.get_type()=='SOCKS5':
            try:
                sock.connect((prxi.get_host(), prxi.get_port()))
                func_prx=_connect_proxy_socks
            except:
                conn_ex=utils.get_exception()
        else:
            sock.connect((host, port))
        
        if func_prx is not None:
            try:
                func_prx(sock, host, port, prxi)
            except:
                conn_ex=utils.get_exception()
        
        if conn_ex is not None:
            if bprxdet:
                try:
                    release_detected_proxy()
                    sock.close()
                    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
                    sock.settimeout(timeout)
                    sock.connect((host, port)) #PROVA A COLLEGARSI SENZA PROXY
                    _set_detected_proxy_none()
                    bprxdet=False
                except:
                    raise conn_ex
            else:
                raise conn_ex
                
        
        while True:
            try:
                #VALIDA CERITFICATI
                global _cacerts_path
                if hasattr(ssl, 'SSLContext'):
                    ctx = ssl.SSLContext(_get_ssl_ver())
                    if _cacerts_path!="":
                        ctx.verify_mode = ssl.CERT_REQUIRED
                        ctx.check_hostname = True
                        ctx.load_verify_locations(_cacerts_path)
                        sock = ctx.wrap_socket(sock,server_hostname=host)
                    else:
                        sock = ctx.wrap_socket(sock)
                else:
                    iargs = None
                    try:
                        import inspect
                        iargs = inspect.getargspec(ssl.wrap_socket).args
                    except:                   
                        None
                    if iargs is not None and "cert_reqs" in iargs and "ca_certs" in iargs and _cacerts_path!="": 
                        sock = ssl.wrap_socket(sock, ssl_version=_get_ssl_ver(), cert_reqs=ssl.CERT_REQUIRED, ca_certs=_cacerts_path)
                    else:
                        sock = ssl.wrap_socket(sock, ssl_version=_get_ssl_ver())
                break
            except:
                conn_ex=utils.get_exception()
                if bprxdet:
                    if "CERTIFICATE_VERIFY_FAILED" in str(conn_ex):
                        try: 
                            release_detected_proxy()
                            sock.close()
                            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                            sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
                            sock.settimeout(timeout)
                            sock.connect((host, port)) #PROVA A COLLEGARSI SENZA PROXY
                            _set_detected_proxy_none()
                            bprxdet=False
                        except:
                            raise conn_ex
                    else:                        
                        raise conn_ex                    
                else:
                    raise conn_ex  
            
            
    except:
        e=utils.get_exception()
        sock.close()
        raise e
    return sock

def prop_to_xml(prp):
    ardata = []
    ardata.append('<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">');
    root_element = xml.etree.ElementTree.Element("properties")
    for key in prp:
        child = xml.etree.ElementTree.SubElement(root_element, "entry")
        child.attrib['key'] = key
        child.text = prp[key]
    ardata.append(utils.bytes_to_str(xml.etree.ElementTree.tostring(root_element)));
    return ''.join(ardata)

def xml_to_prop(s):
    prp = {}
    root = xml.etree.ElementTree.fromstring(utils.buffer_new(s,0,len(s)))
    for child in root:
        prp[child.attrib['key']] = child.text
    return prp

def _split_utl(url):
    lnhttps = 8
    #legge server e porta
    p=url[lnhttps:].find('/')
    host=url[lnhttps:lnhttps+p]
    port=443
    i=host.find(':')
    if i>=0:
        port=int(host[i+1:])
        host=host[:i]
    #Legge path
    u = url[p+lnhttps:]
    return {'host':host,  'port':port,  'path':u}

def download_url_file(urlsrc, fdest, proxy_info=None, response_transfer_progress=None):
    sredurl=None
    sp = _split_utl(urlsrc)
    #Richiesta al server
    sock = _connect_socket(sp["host"], sp["port"], proxy_info)
    try:
        req = Request("GET", sp["path"],  {'Host' : sp["host"] + ':' + str(sp["port"],),  'Connection' : 'close'})
        sock.sendall(req.to_message())
    
        #Legge risposta
        if utils.path_exists(fdest):
            utils.path_remove(fdest)
        ftmp = fdest + "TMP"
        if utils.path_exists(ftmp):
            utils.path_remove(ftmp)        
        resp = Response(sock, ftmp, response_transfer_progress)
        if resp.get_code() == '301':
            sredurl=resp.get_headers()["Location"]
        elif resp.get_code() != '200':
            raise Exception("Download error " + str(resp.get_code()) + ".")
    finally:
        sock.shutdown(1)
        sock.close();
    if sredurl is not None:
        download_url_file(sredurl, fdest, proxy_info, response_transfer_progress)
    else:
        if utils.path_exists(ftmp):
            utils.path_move(ftmp, fdest)

def get_url_prop(url, proxy_info=None):
    sredurl=None
    sp = _split_utl(url)    
    sock = _connect_socket(sp["host"], sp["port"], proxy_info)
    try:
        req = Request("GET", sp["path"],  {'Host' : sp["host"] + ':' + str(sp["port"],),  'Connection' : 'close'})
        sock.sendall(req.to_message())
        
        prpresp = None;
        resp = Response(sock)
        if resp.get_code() == '200':
            prpresp = xml_to_prop(resp.get_body())
        elif resp.get_code() == '301':
            sredurl=resp.get_headers()["Location"]
        else:
            raise Exception("Get url properties error " + str(resp.get_code())  + ".")
    finally:
        sock.shutdown(1)
        sock.close();
    if sredurl is not None:
        prpresp = get_url_prop(sredurl,proxy_info)
    return prpresp

def ping_url(url, proxy_info=None):
    tmret=-1
    try:
        tm=time.time()
        sp = _split_utl(url)
        sock = _connect_socket(sp["host"], sp["port"], proxy_info,timeout=2)
        try:
            req = Request("GET", sp["path"],  {'Host': sp["host"] + ':' + str(sp["port"],),  'Connection': 'close'})
            sock.sendall(req.to_message())
            resp = Response(sock)
            if resp.get_code() == '200':
                tmret=round(time.time()-tm,3)                
        finally:
            sock.shutdown(1)
            sock.close();
    except:
        None
    return tmret

class ProxyInfo:
    def __init__(self):
        self._type="None"
        self._host=None
        self._port=None
        self._user=None
        self._password=None
        
    def set_type(self, ptype):
        self._type=ptype
    
    def set_host(self, host):
        self._host=host
        
    def set_port(self, port):
        self._port=port
    
    def set_user(self,  user):
        self._user=user
    
    def set_password(self,  password):
        self._password=password
    
    def get_type(self):
        return self._type
    
    def get_host(self):
        return self._host
        
    def get_port(self):
        return self._port
    
    def get_user(self):
        return self._user
    
    def get_password(self):
        return self._password
        

class Request:
    def __init__(self, method, url, prp=None):
        self._method = method
        self._url = url
        self._prp = prp
        self._body = None

    def set_body(self, body):
        self._body = body

    def to_message(self):
        arhead = []
        arhead.append(self._method)
        arhead.append(' ')
        arhead.append(self._url)
        arhead.append(' ')
        arhead.append('HTTP/1.1')
        if self._prp is not None:
            for k in self._prp:
                arhead.append('\r\n')
                arhead.append(k)
                arhead.append(': ')
                arhead.append(self._prp[k])
            
        if self._body is not None:
            arhead.append('\r\n')
            arhead.append('Compression: zlib')
            arhead.append('\r\n')
            arhead.append('Content-Length: ')
            arhead.append(str(len(self._body)));
        arhead.append('\r\n')
        arhead.append('\r\n')
        if self._body is not None:
            arhead.append(self._body)
        return utils.str_to_bytes(''.join(arhead))

class Response_Transfer_Progress:
    
    def __init__(self, events=None):
            self._on_data=None
            self._properties={}
            self._byte_transfer=0
            self._byte_length=0
            if events is not None:
                if 'on_data' in events:
                    self._on_data=events['on_data']
    
    def set_property(self, key, value):
        self._properties[key]=value
    
    def get_property(self, key):
        if key not in self._properties:
            return None
        return self._properties[key]
    
    def get_byte_transfer(self):
        return self._byte_transfer
    
    def get_byte_length(self):
        return self._byte_length
    
    def fire_on_data(self,  byte_transfer,  byte_length):
        self._byte_transfer=byte_transfer
        self._byte_length=byte_length
        if self._on_data is not None:
            self._on_data(self)

class Response:
    def __init__(self, sock, body_file_name=None,  response_transfer_progress=None):
        data = bytes()
        while utils.bytes_to_str(data).find('\r\n\r\n') == -1:
            app=sock.recv(1024 * 4)
            if app is None or len(app)==0:
                raise Exception('Close connection')
            data += app 
        ar = utils.bytes_to_str(data).split('\r\n\r\n')
        head = ar[0].split('\r\n')
        appbody = []
        appbody.append(data[len(ar[0])+4:])
        self._code = None
        self._headers = {}
        clenkey=None
        for item in head:
            if self._code is None:
                self._code = item.split(' ')[1]
            else:
                apppos = item.index(':')
                appk=item[0:apppos].strip()
                if appk.lower()=="content-length":
                    clenkey=appk
                self._headers[appk] = item[apppos+1:].strip()
        #Legge eventuale body
        if self._code != '301' and clenkey is not None:
            self._extra_data=None
            lenbd = int(self._headers[clenkey])
            fbody=None
            try:
                jbts=utils.bytes_join(appbody)
                if body_file_name is not None:
                    fbody=utils.file_open(body_file_name, 'wb')
                    fbody.write(jbts)
                cnt=len(jbts)
                if response_transfer_progress is not None:
                    response_transfer_progress.fire_on_data(cnt,  lenbd)
                szbuff=1024*2
                buff=None
                while lenbd > cnt:
                    buff=sock.recv(szbuff)
                    if buff is None or len(buff)==0:
                        break
                    cnt+=len(buff)
                    if response_transfer_progress is not None:
                        response_transfer_progress.fire_on_data(cnt,  lenbd)
                    if body_file_name is None:
                        appbody.append(buff)
                    else:
                        fbody.write(buff)
            finally:
                if fbody is not None:
                    fbody.close()
                else:
                    self._body=utils.bytes_join(appbody)
        else:
            self._extra_data=utils.bytes_join(appbody)
            if len(self._extra_data)==0:
                self._extra_data=None

    def get_extra_data(self):
        return self._extra_data

    def get_code(self):
        return self._code

    def get_headers(self):
        return self._headers
    
    def get_body(self):
        return self._body


class Worker(threading.Thread):
    
    def __init__(self, parent,  queue, i):
        self._parent = parent
        threading.Thread.__init__(self, name=self._parent.get_name() + "_" + str(i))
        self.daemon=True
        self._queue=queue
        
    def run(self):
        while not self._parent._destroy:
            func, args, kargs = self._queue.get()
            if func is not None:
                try: 
                    func(*args, **kargs)
                except: 
                    e=utils.get_exception()
                    self._parent.fire_except(e)
                self._queue.task_done()

class ThreadPool():
    
    def __init__(self, name, queue_size, core_size , fexcpt):
            self._destroy=False
            self._name=name
            self._fexcpt=fexcpt
            self._queue = utils.Queue(queue_size)
            for i in range(core_size):
                self._worker = Worker(self, self._queue, i)
                self._worker.start()
    
    def get_name(self):
        return self._name 

    def fire_except(self, e):
        if self._fexcpt is not None:
            self._fexcpt(e)

    def execute(self, func, *args, **kargs):
        if not self._destroy:
            self._queue.put([func, args, kargs])
    
    def destroy(self):
        self._destroy=True #DA GESTIRE


class QueueTask():
    
    def __init__(self, tpool):
        self._task_pool=tpool
        self._semaphore = threading.Condition()
        self.list = []
        self.running = False
        
    
    def _exec_func(self):
        while True:
            func = None
            self._semaphore.acquire()
            try:
                if len(self.list)==0:
                    self.running = False
                    break;
                func = self.list.pop(0)
            finally:
                self._semaphore.release()
            func();
                        
        
    def execute(self, f, only_if_empty=False):
        self._semaphore.acquire()
        try:
            if not self.running:
                self.list.append(f);
                self.running=True;
                self._task_pool.execute(self._exec_func)
            else:
                if only_if_empty:
                    if len(self.list)<2: #con < 2 sono sicuro che almeno l'ultimo viene eseguito
                        self.list.append(f)
                else:
                    self.list.append(f)
        finally:
            self._semaphore.release()
        
        
            
class BandwidthCalculator:
    
    def __init__(self, ckint=0.5, ccint=5.0):
        self._semaphore = threading.Condition()
        self._current_byte_transfered=0
        self._last_byte_transfered=0
        self._last_time=0
        self._bps=0
        self._buffer_size=BUFFER_SIZE_MIN
        self._check_intervall=ckint
        self._calc_intervall=ccint
        self._calc_ar=[]
        self._calc_elapsed=0
        self._calc_transfered=0
    
    def set_check_intervall(self,i):
        self._semaphore.acquire()
        try:
            self._check_intervall=i
        finally:
            self._semaphore.release()
    
    def get_check_intervall(self):
        self._semaphore.acquire()
        try:
            return self._check_intervall
        finally:
            self._semaphore.release()
            
    def add(self, c):
        self._semaphore.acquire()
        try:
            self._current_byte_transfered += c
            self._calculate()
        finally:
            self._semaphore.release()
    
    def _calculate(self):
        tm=get_time() 
        transfered=self._current_byte_transfered-self._last_byte_transfered
        elapsed = (tm - self._last_time)
        if elapsed<0:
            elapsed=0
            self._last_time=tm
        if elapsed>self._check_intervall:
            self._calc_ar.append({"elapsed":elapsed, "transfered":transfered})
            self._calc_elapsed+=elapsed
            self._calc_transfered+=transfered
            while len(self._calc_ar)>1 and self._calc_elapsed>self._calc_intervall:
                ar = self._calc_ar.pop(0)
                self._calc_elapsed-=ar["elapsed"]
                self._calc_transfered-=ar["transfered"]
            self._bps=int(float(self._calc_transfered)*(1.0/self._calc_elapsed))
            self._calculate_buffer_size()
            self._last_time=tm
            self._last_byte_transfered=self._current_byte_transfered        
    
    def get_bps(self):
        return self._bps
    
    def get_buffer_size(self):
        return self._buffer_size
    
    def _calculate_buffer_size(self):
        self._buffer_size=int(0.1*float(self._bps))
        if self._buffer_size<BUFFER_SIZE_MIN:
            self._buffer_size=BUFFER_SIZE_MIN
        elif self._buffer_size>BUFFER_SIZE_MAX:
            self._buffer_size=BUFFER_SIZE_MAX
        else:
            self._buffer_size=int((float(self._buffer_size)/512.0)*512.0)
        
    
    def get_transfered(self):
        self._semaphore.acquire()
        try:
            return self._current_byte_transfered
        finally:
            self._semaphore.release()

'''
class BandwidthLimiter:
    
    def __init__(self,sync=True):
        if sync:
            self._semaphore = threading.Condition()
        else:
            self._semaphore = None
        self._last_time=0
        self._bandlimit=0
        self._last_wait=0
        self._buffsz=0        
        self.set_bandlimit(0)
     
     
    def _semaphore_acquire(self):
        if self._semaphore is not None:
            self._semaphore.acquire()
    
    def _semaphore_release(self):
        if self._semaphore is not None:
            self._semaphore.release()
    
    def get_bandlimit(self):
        self._semaphore_acquire()
        try:
            return self._bandlimit
        finally:
            self._semaphore_release()
        
    def set_bandlimit(self,pbps):
        self._semaphore_acquire()
        try:
            if self._bandlimit==pbps:
                return
            if pbps>0:
                self._bandlimit=pbps
                self._buffsz=calculate_buffer_size(pbps)
            else:
                self._bandlimit=0
                self._buffsz=BUFFER_SIZE_MAX
        finally:
            self._semaphore_release()
        
    def get_buffer_size(self):
        self._semaphore_acquire()
        try:
            return self._buffsz
        finally:
            self._semaphore_release()
    
    def get_waittime(self, c):
        self._semaphore_acquire()
        try:
            tm=get_time() 
            timeout = 0
            if c > 0:
                if self._bandlimit > 0:
                    if tm>=self._last_time:
                        elapsed = (tm - self._last_time) - self._last_wait
                        maxt = float(self._bandlimit)*elapsed
                        timeout = float(c-maxt)/float(self._bandlimit) 
                        self._last_wait=timeout
                        if self._last_wait<-1.0:
                            self._last_wait=0.0
                        self._last_time=tm
                        if timeout < 0.0:
                            timeout=0.0
                    else:
                        self._last_time=tm 
                        self._last_wait=0.0
            return timeout
        finally:
            self._semaphore_release()
            
'''
            
class ConnectionCheckAlive(threading.Thread):
    _KEEPALIVE_INTERVALL = 30
    _KEEPALIVE_THRESHOLD = 5
    
    def __init__(self, conn):
        threading.Thread.__init__(self, name="ConnectionCheckAlive")
        self.daemon=True
        self._connection=conn
        self._counter=utils.Counter()
        self._connection_keepalive_send=False
        self._semaphore = threading.Condition()

    def _send_keep_alive(self):
        try:
            if not self._connection.is_close():
                self._connection._send_ws_ping()
                #print("SESSION - PING INVIATO!")                
        except:
            #traceback.print_exc()
            None

    def reset(self):
        self._semaphore.acquire()
        try:
            if self._connection_keepalive_send:
                self._counter.reset()
                self._connection_keepalive_send = False
        finally:
            self._semaphore.release()
        
            
    def run(self):
        #print("Thread alive started: " + str(self._connection))        
        bfireclose=False
        while not self._connection.is_shutdown():
            time.sleep(1)
            self._semaphore.acquire()
            try:
                #Verifica alive
                if not self._connection_keepalive_send:                    
                    #print("Thread alive send counter: " + str(self._counter.get_value()) + " " + str(self._connection))                    
                    if self._counter.is_elapsed((ConnectionCheckAlive._KEEPALIVE_INTERVALL-ConnectionCheckAlive._KEEPALIVE_THRESHOLD)):
                        self._connection_keepalive_send=True
                        self._send_keep_alive()
                        #print("Thread alive send: " + str(self._connection))
                        
                else:
                    if self._counter.is_elapsed((ConnectionCheckAlive._KEEPALIVE_INTERVALL+ConnectionCheckAlive._KEEPALIVE_THRESHOLD)):
                        bfireclose=not self._connection.is_close()
                        break                  
            finally:
                self._semaphore.release()
        self._connection.shutdown();
        if bfireclose is True:
            self._connection.fire_close(True)        
        #print("Thread alive stopped: " + str(self._connection))

class ConnectionReader(threading.Thread):
    
    def __init__(self, conn):
        threading.Thread.__init__(self, name="ConnectionReader")
        self.daemon=True
        self._connection = conn

    def _read_fully(self, sock, ln):
        data = []
        cnt=0
        while ln > cnt:
            s = sock.recv(ln-cnt)
            if s is None or len(s) == 0:
                return ''
            self._connection._tdalive.reset();
            data.append(s)
            cnt+=len(s)
        return utils.bytes_join(data)
        
    
    def run(self):
        #print("Thread read started: " + str(self._connection))        
        bfireclose=False
        bconnLost=True
        sock = self._connection.get_socket()
        try:
            while not self._connection.is_shutdown():
                data = self._read_fully(sock, 2)
                if len(data) == 0:
                    bfireclose=not self._connection.is_close()
                    break
                else:
                    lendt=0;
                    bt1=utils.bytes_get(data,1);
                    if bt1 <= 125:
                        if bt1 > 0:
                            lendt = bt1;
                        else:
                            bt0=utils.bytes_get(data,0);
                            if bt0 == 136: #CLOSE  
                                bconnLost=False                              
                                bfireclose=not self._connection.is_close()
                                break
                            elif bt0 == 138: #PONG
                                #print("SESSION - PONG RICEVUTO!")
                                continue
                            else:
                                continue    
                    elif bt1 == 126:
                        data = self._read_fully(sock, 2)
                        if len(data) == 0:
                            bfireclose=not self._connection.is_close()
                            break
                        lendt=struct.unpack('!H',data)[0]
                    elif bt1 == 127:
                        data = self._read_fully(sock, 4)
                        if len(data) == 0:
                            bfireclose=not self._connection.is_close()
                            break
                        lendt=struct.unpack('!I',data)[0]
                    #Legge data
                    if lendt>0:
                        data = self._read_fully(sock, lendt)
                        if len(data) == 0:
                            bfireclose=not self._connection.is_close()
                            break
                    elif lendt==0:
                        data=""
                    else:
                        bfireclose=not self._connection.is_close()
                        break
                    self._connection.fire_data(data)
                    
        except:
            e=utils.get_exception()
            bfireclose=not self._connection.is_close()
            #traceback.print_exc()
            self._connection.fire_except(e) 
        self._connection.shutdown()
        if bfireclose is True:
            self._connection.fire_close(bconnLost)        
        #print("Thread read stopped: " + str(self._connection))
        

class Connection:
            
    def __init__(self, events):
        self._close=True
        self._connection_lost=False
        self._shutdown=False
        self._on_data= None
        self._on_close = None
        self._on_except = None
        if events is not None:
            if "on_data" in events:
                self._on_data = events["on_data"]
            if "on_close" in events:
                self._on_close = events["on_close"]
            if "on_except" in events:
                self._on_except = events["on_except"]
        self._lock_status = threading.Lock()
        self._lock_send = threading.Lock()
        self._proxy_info = None
        self._sock = None
        self._tdalive = None
        self._tdread = None
        #WEBSOCKET DATA
        self._ws_data_b0 = 0;
        self._ws_data_b0 |= 1 << 7;
        self._ws_data_b0 |= 0x2 % 128;
        self._ws_data_struct_1=struct.Struct("!BBI")
        self._ws_data_struct_2=struct.Struct("!BBBBI")
        self._ws_data_struct_3=struct.Struct("!BBII")
        #WEBSOCKET PING
        self._ws_ping_b0 = 0
        self._ws_ping_b0 |= 1 << 7;
        self._ws_ping_b0 |= 0x9 % 128;
        self._ws_ping_struct=struct.Struct("!BBI")
        #WEBSOCKET CLOSE
        self._ws_close_b0 = 0;
        self._ws_close_b0 |= 1 << 7;
        self._ws_close_b0 |= 0x8 % 128;
        self._ws_close_struct=struct.Struct("!BBI")
                
            
    def open(self, prop, proxy_info):
        
        if self._sock is not None:
            raise Exception("Already connect!")

        #Apre socket
        self._prop = prop
        self._proxy_info = proxy_info
        self._sock = _connect_socket(self._prop['host'], int(self._prop['port']), proxy_info)
        try:
            #Invia richiesta
            appprp = {}
            for k in prop:
                if prop[k] is not None:
                    appprp["dw_" + k]=prop[k];
                    
                    
            appprp["host"] = prop['host'] + ":" + prop['port']
            appprp["Connection"] = 'keep-alive, Upgrade'
            appprp["Upgrade"] = 'websocket'
            appprp["Sec-WebSocket-Key"] = 'XV3+Fd9KMg54tXP7Tsrl8Q=='
            appprp["Sec-WebSocket-Version"] = '13'
                    
            req = Request("GET", "/openraw.dw", appprp)
            self._sock.sendall(req.to_message())
    
            #Legge risposta
            resp = Response(self._sock);
            if resp.get_code() != '101':
                if resp.get_body() is not None:
                    raise Exception(resp.get_body())
                else:
                    raise Exception("Server error.")
                        
            self._close=False
            self._sock.settimeout(None)
            
            #Avvia thread alive
            self._tdalive = ConnectionCheckAlive(self)
            self._tdalive.start()
    
            #Avvia thread lettura
            self._tdread = ConnectionReader(self)
            self._tdread.start()
            return resp            
                            
        except:
            e=utils.get_exception()
            self.shutdown()
            raise e
    
    def get_socket(self):
        return self._sock
    
   
    def send(self, data):
        self._send_ws_data(data)
        
    def fire_data(self, dt):
        if self._on_data is not None:
            self._on_data(dt)        
            
    def fire_close(self,connlost):        
        with self._lock_status:
            self._connection_lost=connlost
            onc=self._on_close
            self._on_data= None
            self._on_close = None
            self._on_except = None
        if onc is not None:
            onc()
    
    def fire_except(self,e):  
        if self._on_except is not None:
            self._on_except(e) 
    
    def _send_ws_data(self,dt):
        if self._sock is None:
            raise Exception('connection closed.')
        self._lock_send.acquire()
        try:
            length = len(dt);
            if length <= 125:
                ba=bytearray(self._ws_data_struct_1.pack(self._ws_data_b0, 0x80|length,0)) #rnd=random.randint(0,2147483647)
            elif length <= 0xFFFF:
                ba=bytearray(self._ws_data_struct_2.pack(self._ws_data_b0, 0xFE,length >> 8 & 0xFF,length & 0xFF,0)) #rnd=random.randint(0,2147483647)
            else: 
                ba=bytearray(self._ws_data_struct_3.pack(self._ws_data_b0, 0xFF,length,0)) #rnd=random.randint(0,2147483647)
            ba+=dt
            utils.socket_sendall(self._sock,ba)
        finally:
            self._lock_send.release()
            
    def _send_ws_close(self):
        if self._sock is None:
            raise Exception('connection closed.')
        self._lock_send.acquire()
        try:
            utils.socket_sendall(self._sock,self._ws_close_struct.pack(self._ws_close_b0, 0x80 | 0, 0)) #rnd=random.randint(0,2147483647)
        finally:
            self._lock_send.release() 
    
    def _send_ws_ping(self):
        if self._sock is None:
            raise Exception('connection closed.')
        self._lock_send.acquire()
        try:
            utils.socket_sendall(self._sock,self._ws_ping_struct.pack(self._ws_ping_b0, 0x80 | 0, 0)) #rnd=random.randint(0,2147483647)
        finally:
            self._lock_send.release()

    def is_close(self):
        with self._lock_status:
            bret = self._close
        return bret
    
    def is_connection_lost(self):
        with self._lock_status:
            bret = self._connection_lost
        return bret        
    
    def is_shutdown(self):
        with self._lock_status:
            bret = self._shutdown
        return bret
    
    def close(self):
        bsendclose=False
        try:
            with self._lock_status:
                if not self._close:
                    self._close=True
                    bsendclose=True
                    self._on_data= None
                    self._on_close = None
                    self._on_except = None
                    #print("session send stream close.")
            if bsendclose:
                self._send_ws_close();
                #Attende lo shutdown
                cnt = utils.Counter()
                while not self.is_shutdown():
                    time.sleep(0.2)
                    if cnt.is_elapsed(10):
                        break
        except:
            None
            
    
    def shutdown(self):
        
        with self._lock_status:
            if self._shutdown:
                return
            self._close=True
            self._shutdown=True
        
        if self._sock is not None:
            #Chiude thread alive
            #if (self._tdalive is not None) and (not self._tdalive.is_close()):
            #    self._tdalive.join(5000)
            self._tdalive = None

            #Chiude thread read
            #if (self._tdread is not None) and (not self._tdread.is_close()):
            #    self._tdread.join(5000)
            self._tdread = None
            
            try:                
                self._sock.shutdown(socket.SHUT_RDWR)
            except:
                None
            try:
                self._sock.close()
            except:
                None
            self._sock = None
            self._prop = None
            self._proxy_info = None
                                                                                                                                                                                                            detectinfo.py                                                                                       0000644 0001750 0001750 00000010233 14127306343 013044  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import platform
import subprocess
import sys
import utils

def is_windows():
    return (platform.system().lower().find("window") > -1)

def is_linux():
    return (platform.system().lower().find("linux") > -1)

def is_mac():
    return (platform.system().lower().find("darwin") > -1)

def is_os_32bit():
    return not sys.maxsize > 2**32

def is_os_64bit():
    return sys.maxsize > 2**32

def check_hw_string(s):
    if s is not None:
        if "raspberry" in s.lower():
            return "RaspberryPi"
        elif "wandboard" in s.lower():
            return "Wandboard"
        elif "pine64" in s.lower() or "rock64" in s.lower():
            return "Pine64"
    return None

def get_hw_name():
    sapp = platform.machine()
    if is_linux() and ((len(sapp)>=3 and sapp[0:3].lower()=="arm") or (len(sapp)>=7 and sapp[0:7].lower()=="aarch64")):
        #VERIFICA SE RASPBERRY
        try:
            if utils.path_exists("/sys/firmware/devicetree/base/model"):
                fin=utils.file_open("/sys/firmware/devicetree/base/model","r")
                appmdl = fin.read()
                fin.close()
                appmdl=check_hw_string(appmdl);
                if appmdl is not None:
                    return appmdl
            appmdl=check_hw_string(platform.node());
            if appmdl is not None:
                return appmdl
        except:
            None
    return None


def get_native_suffix():
    try:
        hwnm = get_hw_name()
        if hwnm == "RaspberryPi":
            if is_os_64bit():
                return "linux_arm64_v1"
            else:
                return "linux_armhf_v2"        
        elif hwnm == "Wandboard":
            if is_os_64bit():
                return "linux_arm64_v1"
            else:
                return "linux_armhf_v1"
        elif hwnm == "Pine64":
            if is_os_64bit():
                return "linux_arm64_v1"
            else:
                return "linux_armhf_v2"
        
        sapp = platform.machine()
        if sapp is not None:
            if sapp.upper()=="AMD64" or sapp.lower()=="x86_64" or sapp.lower()=="i386" or sapp.lower()=="x86" or (len(sapp)==4 and sapp[0]=="i" and sapp[2:4]=="86"):
                if is_linux():
                    if is_os_64bit():
                        return "linux_x86_64"
                    elif is_os_32bit():
                        return "linux_x86_32"
                elif is_windows():
                    if is_os_64bit():
                        return "win_x86_64"
                    elif is_os_32bit():
                        return "win_x86_32"
                elif is_mac():
                    if is_os_64bit():
                        return "mac_x86_64"
                    elif is_os_32bit():
                        return "mac_x86_32"                
            elif is_linux() and len(sapp)>=3 and sapp[0:3].lower()=="arm":
                try:
                    if is_os_64bit():
                        return "linux_arm64_v1"
                    else:
                        p = subprocess.Popen("readelf -A /proc/self/exe | grep Tag_ABI_VFP_args", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
                        (o, e) = p.communicate()
                        if len(e)==0:
                            if len(o)>0:
                                return "linux_armhf_v1"
                            else:
                                None
                                #return "linux_armel"
                except:
                    None
            elif is_linux() and len(sapp)>=7 and sapp[0:7].lower()=="aarch64":
                return "linux_arm64_v1"
            elif is_windows() and sapp.upper()=="ARM64":
                return "win_x86_32" 
    except:
        None
    if is_linux():
        return "linux_generic" 
    return None

if __name__ == "__main__":
    print(get_native_suffix())
                                                                                                                                                                                                                                                                                                                                                                         installer.py                                                                                        0000644 0001750 0001750 00000000141 14140517417 012713  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 import sys

if __name__ == "__main__":
    import ui.installer
    ui.installer.fmain(sys.argv)                                                                                                                                                                                                                                                                                                                                                                                                                                 ipc.py                                                                                              0000644 0001750 0001750 00000222516 14140273572 011506  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-
'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''
import sys
import subprocess
import os
import struct
import time
import copy
import utils
import ctypes
import json
import string
import random
import mmap
import stat
import native
import importlib
import threading

_struct_IIcc=struct.Struct("!IIcc")
_struct_I=struct.Struct("!I")
_struct_BI=struct.Struct("!BI")
_struct_c=struct.Struct("!c")
_struct_cc=struct.Struct("!cc")
_struct_utmp = struct.Struct('hi32s4s32s256shhiii4i20s')

IPC_PATH="sharedmem"
MMP_NAME="/dwammp"
SEM_NAME="/dwasem"

_ipcmap={}
_ipcmap["libbaseloaded"] = False
_ipcmap["semaphore"] = threading.Condition()
_ipcmap["picklesemaphore"] = threading.Condition()
_ipcmap["pickleprocess"] = None
_ipcmap["childsharedobjsemaphore"] = threading.Condition()
_ipcmap["childsharedobj"] = []
_ipcmap["threadsharedobj"]={}
_ipcmap["list_names_lock"]=threading.RLock()
_ipcmap["list_names"]=[]

try:
    import _multiprocessing
    import multiprocessing.synchronize
    if utils.is_windows():
        if utils.is_py2():
            import multiprocessing.forking
            import _subprocess
        else:
            import _winapi
except:
    _ipcmap["libbaseloaded"] = True



class SEMAPHORE_DEF(ctypes.Structure):
    _fields_ = [("create",ctypes.c_int),
                ("mode",ctypes.c_int),
                ("fd",ctypes.c_int),
                ("semvalue",ctypes.c_int),
                ("sem",ctypes.c_void_p),
                ("name", ctypes.c_char_p)]

class SHAREDMEMORY_DEF(ctypes.Structure):
    _fields_ = [("create",ctypes.c_int),
                ("mode",ctypes.c_int),
                ("fd",ctypes.c_int),
                ("size",ctypes.c_int),
                ("name", ctypes.c_char_p)]

def _add_child_shared_obj(obj):
    _ipcmap["childsharedobjsemaphore"].acquire()    
    try:
        _ipcmap["childsharedobj"].append(obj)
    finally:
        _ipcmap["childsharedobjsemaphore"].release()

def _destroy_child_shared_obj():
    _ipcmap["childsharedobjsemaphore"].acquire()    
    try:
        for i in reversed(range(len(_ipcmap["childsharedobj"]))):
            try:
                obj=_ipcmap["childsharedobj"][i]
                obj._destroy()
            except:
                ex = utils.get_exception()
                print("_destroy_child_shared_obj  " + str(obj) + " - err: " + utils.exception_to_string(ex))
        _ipcmap["childsharedobj"]=None
    finally:
        _ipcmap["childsharedobjsemaphore"].release()

def _rndseq(cnt):
        ar=[]
        for x in range(cnt):
            if x==0:
                ar.append(random.choice(string.ascii_lowercase))
            else:
                ar.append(random.choice(string.ascii_lowercase + string.digits))            
        return ''.join(ar)

def _add_name(suffix):
        with _ipcmap["list_names_lock"]: 
            while True:
                spid=str(os.getpid())
                nm = suffix + "_" + spid + "_" + _rndseq(10)
                if nm not in _ipcmap["list_names"]:
                    _ipcmap["list_names"].append(nm)
                    if not utils.is_windows():
                        pth = process_manager._get_release_path("dwa_" + spid)
                        if not os.path.exists(pth):
                            with utils.file_open(pth, "w", encoding="utf-8") as f:
                                f.write("[]")
                            utils.path_change_permissions(pth, stat.S_IRUSR | stat.S_IWUSR)
                        with utils.file_open(pth, "w", encoding="utf-8") as f:
                            f.write(json.dumps(_ipcmap["list_names"])) 
                    return nm

def _rem_name(nm):
    with _ipcmap["list_names_lock"]:
        if nm in _ipcmap["list_names"]:
            _ipcmap["list_names"].remove(nm)
            if not utils.is_windows():
                spid=str(os.getpid())
                pth = process_manager._get_release_path("dwa_" + spid)
                with utils.file_open(pth, "w", encoding="utf-8") as f:
                    f.write(json.dumps(_ipcmap["list_names"]))

def _fix_perm_get_mode(fixperm):
    if fixperm is not None:
        jo = fixperm()
        if "mode" in jo:
            return jo["mode"]        
    return stat.S_IRUSR | stat.S_IWUSR 

def _fix_perm_path(fpath, fixperm):
    if utils.is_windows():
        None        
    else:
        utils.path_change_permissions(fpath, _fix_perm_get_mode(fixperm))

def initialize():
        try:
            if not utils.path_exists(IPC_PATH):
                utils.path_makedir(IPC_PATH)
            else:
                clear_path(True)
        except:
            e = utils.get_exception()
            print("ipc init_path error: " + utils.exception_to_string(e))        
        process_manager.start()

def terminate():
    process_manager.destory()
    process_manager.join(5)

def clear_path(checkpid=False):
    if utils.path_exists(IPC_PATH):
        lst=utils.path_list(IPC_PATH);
        for fname in lst:
            try:
                if fname.endswith(".mmp") or fname.endswith(".cfg"):
                    if utils.path_exists(IPC_PATH + utils.path_sep + fname):
                        utils.path_remove(IPC_PATH + utils.path_sep + fname)
            except:
                None
            try:
                if not utils.is_windows():
                    if fname.endswith(".rls"):
                        bdelfile=True                        
                        if is_load_libbase():                        
                            spid = fname[0:len(fname)-4].split("_")[1]
                            if checkpid==True:
                                try:
                                    if native.get_instance().is_task_running(int(spid)):
                                        bdelfile=False
                                except:
                                    bdelfile=False
                            if bdelfile:
                                applst=[]
                                try:
                                    with utils.file_open(IPC_PATH + utils.path_sep + fname, "rb") as f:
                                        applst=json.loads(f.read())
                                except:
                                    None
                                for n in applst:
                                    try:
                                        if n.startswith(SEM_NAME):
                                            _ipcmap["libbase"].semUnlink(str(n))
                                        elif n.startswith(MMP_NAME):
                                            _ipcmap["libbase"].shmUnlink(str(n))
                                    except:
                                        None                                
                        if bdelfile:
                            if utils.path_exists(IPC_PATH + utils.path_sep + fname):
                                utils.path_remove(IPC_PATH + utils.path_sep + fname)
            except:
                None

def _dump_obj(o, prc):    
    dtret=None
    _ipcmap["picklesemaphore"].acquire()
    oldprc = _ipcmap["pickleprocess"]
    try:
        _ipcmap["pickleprocess"] = prc
        sfile = utils.BytesIO()
        utils.Pickler(sfile, -1).dump(o)
        dtret = sfile.getvalue()
    finally:
        _ipcmap["pickleprocess"] = oldprc
        _ipcmap["picklesemaphore"].release()
    return dtret

def _load_obj(dt):
    if dt is None:
        return None    
    sfile = utils.BytesIO(dt)
    return utils.Unpickler(sfile).load()

def is_load_libbase():
    _ipcmap["semaphore"].acquire()
    try:
        if _ipcmap["libbaseloaded"]:
            return "libbase" in _ipcmap
        _ipcmap["libbaseloaded"]=True
        
        if utils.is_windows():
            _libbase = native.get_instance().get_library()
            if _libbase is not None:
                _ipcmap["libbase"]=_libbase
                return True
        else:
            try:
                _libbase = native.get_instance().get_library()
                if _libbase is not None:                    
                    _ipcmap["libbase"]=_libbase
                    return True                                
            except:
                None            
    finally:
        _ipcmap["semaphore"].release()
    return False


class SemIPC(object):

    def __init__(self, kind, value, maxvalue, fixperm=None):
        self._bdestroy=False
        self._bcreate=True
        self._countdup=0
        self._sem_name=None
        self._sem_def=None
        if is_load_libbase():
            self._libbase=_ipcmap["libbase"]
            if utils.is_windows():
                if utils.is_py2():
                    self._semlock = _multiprocessing.SemLock(kind, value, maxvalue)
                else:
                    self._semlock = _multiprocessing.SemLock(kind, value, maxvalue, "", True)
            else:
                cnttry=0
                while True:
                    sid=_add_name(SEM_NAME)
                    self._sem_name=sid
                    self._sem_def = SEMAPHORE_DEF()
                    self._sem_def.name=utils.str_to_bytes(self._sem_name)
                    self._sem_def.create=1
                    self._sem_def.mode=_fix_perm_get_mode(fixperm)
                    self._sem_def.semvalue=value
                    iret = self._libbase.semaphoreInitialize(ctypes.byref(self._sem_def))
                    if iret==0:
                        break
                    if sid is not None:
                        _rem_name(sid)
                        sid=None
                    cnttry+=1
                    if cnttry>=10 or iret!=-1:
                        raise Exception("Semaphore initialize failed.")
                    else:
                        time.sleep(0.2)
                
                if utils.is_py2():
                    self._semlock = _multiprocessing.SemLock._rebuild(*(self._sem_def.sem, kind, maxvalue))
                else:
                    self._semlock = _multiprocessing.SemLock._rebuild(*(self._sem_def.sem, kind, maxvalue, None))
            
            self._type=kind
            self._max=maxvalue
        else:
            raise Exception("Semaphore libabase load failed.")
            
                
    def __getstate__(self):
        prc = _ipcmap["pickleprocess"];
        if prc is None:
            raise Exception("No child process attached")
        sid=None        
        if utils.is_windows():
            if utils.is_py2():
                chandle = _multiprocessing.win32.OpenProcess(_multiprocessing.win32.PROCESS_ALL_ACCESS, False, prc.get_pid())
                sid = _subprocess.DuplicateHandle(_subprocess.GetCurrentProcess(), self._semlock.handle, chandle, 0, False, _subprocess.DUPLICATE_SAME_ACCESS).Detach()
                multiprocessing.forking.close(chandle)
            else:
                chandle = _winapi.OpenProcess(_winapi.PROCESS_ALL_ACCESS, False, prc.get_pid())
                sid = _winapi.DuplicateHandle(_winapi.GetCurrentProcess(), self._semlock.handle, chandle, 0, False, _winapi.DUPLICATE_SAME_ACCESS)
                _winapi.CloseHandle(chandle)
        else:
            sid = self._sem_name
        prc._add_shared_obj(self)
        self._countdup+=1        
        return (sid, self._type, self._max)

    def __setstate__(self, state):
        self._bdestroy=False
        self._bcreate=False
        self._countdup=0
        self._sem_def=None
        self._sem_name=None
        if is_load_libbase():
            self._libbase=_ipcmap["libbase"]
            if utils.is_windows():
                if utils.is_py2():
                    self._semlock = _multiprocessing.SemLock._rebuild(*state)
                else:
                    self._semlock = _multiprocessing.SemLock._rebuild(*(state[0],state[1],state[2],None))
            else: 
                self._sem_name=state[0]
                self._sem_def=SEMAPHORE_DEF()
                self._sem_def.name=utils.str_to_bytes(self._sem_name)
                self._sem_def.create=0
                iret = self._libbase.semaphoreInitialize(ctypes.byref(self._sem_def))                    
                if iret==0:
                    if utils.is_py2():
                        self._semlock=_multiprocessing.SemLock._rebuild(*(self._sem_def.sem,state[1],state[2]))
                    else:
                        self._semlock=_multiprocessing.SemLock._rebuild(*(self._sem_def.sem,state[1],state[2],None))
                else:
                    raise Exception("Semaphore initialize failed.")
            _add_child_shared_obj(self)
        else:
            raise Exception("Semaphore libbase load failed.")

       
    def acquire(self, blocking=True, timeout=None):
        if blocking and timeout is None:
            while not self._semlock.acquire(blocking,1):
                if self._bdestroy:
                    raise Exception("Semaphore destroyed.")
            return True
        else:
            return self._semlock.acquire(blocking,timeout)        
    
    def release(self):
        return self._semlock.release()

    def __enter__(self):
        return self.acquire()

    def __exit__(self, *args):
        return self.release()
    
    def get_value(self):
        return self._semlock._get_value()
    
    def __del__(self):
        try:
            self._destroy()            
        except:
            None
    
    def _destroy(self):
        if self._bdestroy==False:
            self._bdestroy=True
            if self._bcreate==True:
                if self._sem_name is not None:
                    _rem_name(self._sem_name)
                    self._sem_name=None
            if self._semlock is not None:
                if utils.is_windows():
                    self._libbase.closeHandle(self._semlock.handle)
                else:
                    self._libbase.semaphoreDestroy(ctypes.byref(self._sem_def))
                self._semlock=None
            

class SemTHC(object):

    def __init__(self, objthc):
        self._threadsharedobjid = None
        self._objthc=objthc
        self._make_methods()
    
    def __del__(self):
        try:
            if self._threadsharedobjid is not None and self._threadsharedobjid in _ipcmap["threadsharedobj"]:            
                del _ipcmap["threadsharedobj"][self._threadsharedobjid]
        except:
            None
    
    def __getstate__(self):
        if self._threadsharedobjid is None: 
            self._threadsharedobjid = id(self)
            _ipcmap["threadsharedobj"][self._threadsharedobjid]=self
        return self._threadsharedobjid
    
    def __setstate__(self, state):
        self._threadsharedobjid = None
        self._objthc=_ipcmap["threadsharedobj"][state]._objthc
        self._make_methods()
    
    def _make_methods(self):
        None
    
class LockIPC(SemIPC):

    def __init__(self, fixperm=None):
        SemIPC.__init__(self, multiprocessing.synchronize.SEMAPHORE, 1, 1, fixperm)

class LockTHC(SemTHC):
    
    def __init__(self):
        SemTHC.__init__(self, threading.Lock())
        
    def _make_methods(self):
        self.acquire = self._objthc.acquire
        self.release = self._objthc.release        

def Lock(fixperm=None):
    if is_load_libbase():
        return LockIPC(fixperm)
    else:
        return LockTHC()
   
class RLockIPC(SemIPC): 
    
    def __init__(self, fixperm=None):
        SemIPC.__init__(self, multiprocessing.synchronize.RECURSIVE_MUTEX, 1, 1, fixperm)

class RLockTHC(SemTHC): 
    
    def __init__(self):
        SemTHC.__init__(self, threading.RLock())
    
    def _make_methods(self):
        self.acquire = self._objthc.acquire
        self.release = self._objthc.release

def RLock(fixperm=None):
    if is_load_libbase():
        return RLockIPC(fixperm)
    else:
        return RLockTHC()

class SemaphoreIPC(SemIPC): 
    
    def __init__(self, value=1, fixperm=None):
        SemIPC.__init__(self, multiprocessing.synchronize.SEMAPHORE, value, _multiprocessing.SemLock.SEM_VALUE_MAX, fixperm)

class SemaphoreTHC(SemTHC): 
    
    def __init__(self, value=1):
        SemTHC.__init__(self, threading.Semaphore(value))
    
    def _make_methods(self):
        self.acquire = self._objthc.acquire
        self.release = self._objthc.release

def Semaphore(fixperm=None):
    if is_load_libbase():
        return SemaphoreIPC(fixperm)
    else:
        return SemaphoreTHC()
    
class BoundedSemaphoreIPC(SemaphoreIPC):

    def __init__(self, value=1, fixperm=None):
        SemIPC.__init__(self, multiprocessing.synchronize.SEMAPHORE, value, value, fixperm)


class BoundedSemaphoreTHC(SemTHC):

    def __init__(self, value=1):
        SemTHC.__init__(self, threading.BoundedSemaphore(value))
    
    def _make_methods(self):
        self.acquire = self._objthc.acquire
        self.release = self._objthc.release

def BoundedSemaphore(fixperm=None):
    if is_load_libbase():
        return BoundedSemaphoreIPC(fixperm)
    else:
        return BoundedSemaphoreTHC()

class ConditionIPC(object):
    
    def __init__(self, lock=None, fixperm=None):
        self._bdestroy=False
        self._lock = lock or RLockIPC(fixperm)
        self._sleeping_count = SemaphoreIPC(0,fixperm)
        self._woken_count = SemaphoreIPC(0,fixperm)
        self._wait_semaphore = SemaphoreIPC(0,fixperm)
        self._make_methods()
    
    def __del__(self):
        self._destroy()
    
    def _destroy(self):
        self._bdestroy=True
        self._wait_semaphore=None
        self._woken_count=None
        self._sleeping_count=None
        self._lock=None                    
    
    def __getstate__(self):
        prc = _ipcmap["pickleprocess"];
        if prc is None:
            raise Exception("No child process attached")
        prc._add_shared_obj(self)
        return (self._lock,self._sleeping_count,self._woken_count,self._wait_semaphore)
    
    def __setstate__(self, st):
        self._lock,self._sleeping_count,self._woken_count,self._wait_semaphore = st
        self._make_methods()
        _add_child_shared_obj(self)
    
    def __enter__(self):
        return self._lock.__enter__()

    def __exit__(self, *args):
        return self._lock.__exit__(*args)
        
    def _make_methods(self):        
        self.acquire = self._lock.acquire        
        self.release = self._lock.release        
    
    def wait(self, timeout=None):
        assert self._lock._semlock._is_mine(), 'must acquire() condition before using wait()'
        self._sleeping_count.release()
        count = self._lock._semlock._count()
        for i in utils.nrange(count):
            self._lock.release()
        try:
            self._wait_semaphore.acquire(True, timeout)
        finally:
            self._woken_count.release()
            for i in utils.nrange(count):
                self._lock.acquire()
        
    def notify(self):
        assert self._lock._semlock._is_mine(), 'lock is not owned'
        assert not self._wait_semaphore.acquire(False)
        while self._woken_count.acquire(False):
            res = self._sleeping_count.acquire(False)
            assert res

        if self._sleeping_count.acquire(False): 
            self._wait_semaphore.release()      
            self._woken_count.acquire()         
            self._wait_semaphore.acquire(False)        
    
    def notify_all(self):
        assert self._lock._semlock._is_mine(), 'lock is not owned'
        assert not self._wait_semaphore.acquire(False)
        while self._woken_count.acquire(False):
            res = self._sleeping_count.acquire(False)
            assert res
        sleepers = 0
        while self._sleeping_count.acquire(False):
            self._wait_semaphore.release()
            sleepers += 1

        if sleepers:
            for i in utils.nrange(sleepers):
                self._woken_count.acquire()
            while self._wait_semaphore.acquire(False):
                pass


class ConditionTHC(SemTHC):
    
    def __init__(self, lock=None):
        SemTHC.__init__(self, threading.Condition(lock))        
    
    def _make_methods(self):
        self.acquire = self._objthc.acquire
        self.release = self._objthc.release
        self.wait=self._objthc.wait
        self.notify=self._objthc.notify
        self.notify_all=self._objthc.notify_all

def Condition(lock=None,fixperm=None):
    if is_load_libbase():
        return ConditionIPC(lock=lock,fixperm=fixperm)
    else:
        return ConditionTHC(lock)

class EventIPC(object):

    def __init__(self, fixperm=None):
        self._cond = ConditionIPC(LockIPC(fixperm),fixperm)
        self._flag = SemaphoreIPC(0)

    def __del__(self):
        self._destroy()
    
    def _destroy(self):
        self._cond=None
        self._flag=None                    
    
    def __getstate__(self):
        prc = _ipcmap["pickleprocess"];
        if prc is None:
            raise Exception("No child process attached")
        prc._add_shared_obj(self)        
        return (self._cond,self._flag)
    
    def __setstate__(self, st):        
        self._cond, self._flag = st
        _add_child_shared_obj(self)
    
    def is_set(self):
        self._cond.acquire()
        try:
            if self._flag.acquire(False):
                self._flag.release()
                return True
            return False
        finally:
            self._cond.release()

    def set(self):
        self._cond.acquire()
        try:
            self._flag.acquire(False)
            self._flag.release()
            self._cond.notify_all()
        finally:
            self._cond.release()

    def clear(self):
        self._cond.acquire()
        try:
            self._flag.acquire(False)
        finally:
            self._cond.release()

    def wait(self, timeout=None):
        self._cond.acquire()
        try:
            if self._flag.acquire(False):
                self._flag.release()
            else:
                self._cond.wait(timeout)

            if self._flag.acquire(False):
                self._flag.release()
                return True
            return False
        finally:
            self._cond.release()

class EventTHC(SemTHC):

    def __init__(self):
        SemTHC.__init__(self, threading.Event())
        
    def _make_methods(self):
        self.is_set=self._objthc.is_set
        self.set=self._objthc.set
        self.clear=self._objthc.clear
        self.wait=self._objthc.wait

def Event(fixperm=None):
    if is_load_libbase():
        return EventIPC(fixperm)
    else:
        return EventTHC()


    
'''
STREAM FILES MAP:

04 bytes: position write side 1 (DATA1)
04 bytes: position read side 2 (DATA1)
01 bytes: State side 1 (C:Connected X:Close T:Terminate)
04 bytes: position write side 2 (DATA2)
04 bytes: position read side 1 (DATA2)
01 bytes: State side 2 (I:Initializing C:Connected X:Close T:Terminate)    
DATA1 - write for Side 1 and read for Side 2)
DATA2 - write for Side 2 and read for Side 1)
'''
class StreamIPC():
    
    def __init__(self,prop=None):
        self._bdestroy=False
        self._prop=prop
        self._side=0
        self._bclose=False        
        self._binit=False        
        self._mmap_state_size = 18
        self._size1 = 0
        self._size2 = 0
        self._read_start_pos=0
        self._write_start_pos=0
        self._write_size = 0
        self._read_size = 0
        self._mmap = None
        self._cond = None
        self._read_timeout_function=None
        self._mconf = None
        self._cprocess = None
        self._keepalive_counter = utils.Counter()
        self._semaphore = threading.Condition()
        #self._otherpid = None
    
    def __del__(self):
        try:
            self._destroy()
        except:
            None        
        
    def _destroy(self):
        if self._bdestroy==False:
            self._bdestroy=True
            try:
                if self._mmap is not None:
                    self._mmap.close()
            except:
                None        
            self._mmap=None
            self._cond = None
    
    def __getstate__(self):
        if self._cprocess is not None:
            raise Exception("Stream already attached to child process.")        
        self._cprocess = _ipcmap["pickleprocess"];
        self._create()
        self._cprocess._add_shared_obj(self)
        return (os.getpid(), self._mmap,self._cond,self._size1,self._size2)
    
    def __setstate__(self, st):
        self._bdestroy=False
        self.__init__()
        self._open(st)
        _add_child_shared_obj(self)
    
    def _is_init(self):
        return self._binit
    
    def _create(self):
        self._semaphore.acquire()
        try:                
            if self._binit==True:
                raise Exception("Stream already initialized.")
            fixperm=None
            if self._prop is not None and "fixperm" in self._prop:
                fixperm=self._prop["fixperm"]
            appsz = 1*1024*1024
            if self._prop is not None and "size" in self._prop:
                appsz=self._prop["size"] 
            self._size1 = int(appsz/2)
            if self._prop is not None and "size1" in self._prop:
                self._size1 = self._prop["size1"] 
            self._size2 = int(appsz/2)
            if self._prop is not None and "size2" in self._prop:
                self._size2 = self._prop["size2"]       
            
            self._mmap = MemMap(self._mmap_state_size + self._size1 + self._size2, fixperm)
            self._cond = Condition(fixperm=fixperm)
            #self._otherpid=self._cprocess.get_pid()
            self._initialize(1)
            self._binit=True            
        except:
            e = utils.get_exception()
            self._destroy()
            raise e
        finally:
            self._semaphore.release() 
        
    def _open(self, ostate):
        self._semaphore.acquire()
        try:
            if self._binit==True:
                raise Exception("Stream already initialized.")
            self._otherpid, self._mmap, self._cond, self._size1, self._size2 = ostate            
            self._initialize(2)
            self._binit=True
        except:
            e = utils.get_exception()
            self._destroy()
            raise e
        finally:
            self._semaphore.release() 
    
    def _initialize(self, side):
        self._side=side
        if self._side==1:
            self._write_size = self._size1
            self._read_size = self._size2
            self._write_pos=0
            self._read_pos=9
            self._state_pos=8
            self._state_pos_other=17
            self._write_start_pos=self._mmap_state_size
            self._read_start_pos=self._mmap_state_size + self._size1
            self._mmap.seek(0)
            self._mmap.write(_struct_IIcc.pack(self._write_start_pos,self._write_start_pos,b"C",b"K"))
            self._mmap.write(_struct_IIcc.pack(0,0,b"I",b"K"))
        elif self._side==2:
            self._write_size = self._size2
            self._read_size = self._size1
            self._write_pos=9
            self._read_pos=0
            self._state_pos=17
            self._state_pos_other=8
            self._write_start_pos=self._mmap_state_size + self._size1
            self._read_start_pos=self._mmap_state_size
            self._mmap.seek(self._write_pos)
            self._mmap.write(_struct_IIcc.pack(self._write_start_pos,self._write_start_pos,b"C",b"K"))                
     
    def _close_nosync(self):
        if not self._bclose:
            self._bclose=True
            self._mmap.seek(self._state_pos)
            self._mmap.write(_struct_c.pack(b"X"))
    
    def close(self):
        if self._binit==False or self._cond is None or self._mmap is None:
            return
        try:
            self._cond.acquire()
            try:
                self._close_nosync()
            finally:
                self._cond.release()
        except:
            self._close_nosync()
    
    def is_closed(self):
        return self._bclose
    
    def write(self, data):
        if self._bclose:
            raise Exception("Stream closed")
        self._cond.acquire()
        try:
            p=0
            sz=len(data)
            while not self._bclose and sz>0:
                self._mmap.seek(self._write_pos)
                pw, pr, st, ka = _struct_IIcc.unpack(self._mmap.read(10))
                self._mmap.seek(self._state_pos_other)
                st_other, ka_other = _struct_cc.unpack(self._mmap.read(2))
                #if st_other==b"X" or st_other==b"T":
                if st_other==b"X":
                    self._close_nosync()
                    break
                if pw>=pr:
                    szspace=self._write_size-(pw-pr)-1
                    szlimit=self._write_size-(pw-self._write_start_pos)
                    szremain=(pr-self._write_start_pos)-1
                    if szremain<=0:
                        szlimit-=1
                else: 
                    szspace=pr-pw-1
                    szlimit=szspace
                    szremain=0
                if szspace==0:
                    self._cond.wait(1)
                else:   
                    self._mmap.seek(pw)
                    if sz<=szlimit:
                        self._mmap.write(utils.buffer_new(data,p,len(data)-p))
                        pw+=sz
                        if pw-self._write_start_pos==self._write_size:
                            pw=self._write_start_pos
                        p+=sz
                        sz=0                                                    
                    else:
                        self._mmap.write(utils.buffer_new(data,p,szlimit))
                        pw+=szlimit
                        if pw-self._write_start_pos==self._write_size:
                            pw=self._write_start_pos
                        p+=szlimit
                        sz-=szlimit
                        if szremain>0:
                            ln = sz
                            if sz>szremain:
                                ln = szremain
                            self._mmap.seek(pw)
                            self._mmap.write(utils.buffer_new(data,p,ln))
                            pw+=ln
                            if pw-self._write_start_pos==self._write_size:
                                pw=self._write_start_pos
                            p+=ln
                            sz-=ln                            
                        
                    self._mmap.seek(self._write_pos)
                    self._mmap.write(_struct_I.pack(pw))
                    self._cond.notify_all()
        finally:
            self._cond.release()
        if self._bclose:
            raise Exception("Stream closed")
    
    def set_read_timeout_function(self,f):
        self._read_timeout_function=f    
    
    def read(self,numbytes=0):
        dt=None
        ardt=[]
        self._cond.acquire()
        try:
            while not self._bclose:
                self._mmap.seek(self._read_pos)
                pw, pr, st, ka = _struct_IIcc.unpack(self._mmap.read(10))
                if pw>pr:
                    sz=pw-pr
                elif pw<pr:
                    sz=self._read_size-(pr-self._read_start_pos)
                if pw==pr: # or (numbytes>0 and numbytes>sz):
                    #if st==b"X" or st==b"T":
                    if st==b"X":
                        self._close_nosync()
                        break
                    self._cond.wait(1)
                    if self._read_timeout_function is not None and self._read_timeout_function(self):
                        raise Exception("Read timeout")                    
                    if self._bdestroy:
                        raise Exception("Stream closed.")
                else: 
                    self._mmap.seek(pr)
                    if numbytes>0:
                        if sz>numbytes:
                            sz=numbytes                    
                        ardt.append(self._mmap.read(sz))
                        numbytes-=sz
                    else:
                        dt = self._mmap.read(sz)
                    pr+=sz
                    if pr-self._read_start_pos==self._read_size:
                        pr=self._read_start_pos
                    self._mmap.seek(self._read_pos+4)
                    self._mmap.write(_struct_I.pack(pr))
                    self._cond.notify_all()
                    if numbytes==0:
                        if dt is None:
                            dt=utils.bytes_join(ardt)
                        break
        finally:
            self._cond.release()
        return dt
    
    def write_int(self, i):
        self.write(_struct_I.pack(i))
    
    def read_int(self):
        bt = self.read(numbytes=4)
        if bt is None:
            return None
        return _struct_I.unpack(bt)[0]        
    
    def write_bytes(self, bts):
        self.write(_struct_I.pack(len(bts))+bts)
    
    def read_bytes(self):
        bt = self.read(numbytes=4)
        if bt is None:
            return None
        sz = _struct_I.unpack(bt)[0]
        if sz==0:
            return ""
        return self.read(numbytes=sz)
    
    def write_str(self, s, enc="utf8"):
        ba = bytearray(s,enc)
        self.write(_struct_BI.pack(len(enc),len(ba))+enc+ba)        
    
    def read_str(self):
        bt = self.read(numbytes=5)
        if bt is None:
            return None
        encsz, sz=_struct_BI.unpack(bt)
        enc = self.read(numbytes=encsz)
        if enc is None:
            return None
        if sz==0:
            return ""
        return self.read(numbytes=sz).decode(enc)
    
    def write_obj(self, o):
        bts = _dump_obj(o,self._cprocess)
        self.write(_struct_I.pack(len(bts))+bts)
    
    def read_obj(self):
        bt = self.read(numbytes=4)
        if bt is None:
            return None
        sz = _struct_I.unpack(bt)[0]
        return _load_obj(self.read(numbytes=sz))

class StreamTHC(StreamIPC):
    
    def __init__(self,prop=None):
        StreamIPC.__init__(self, prop)
        self._threadsharedobjid=None
    
    def __del__(self):
        try:
            if self._threadsharedobjid is not None and self._threadsharedobjid in _ipcmap["threadsharedobj"]:            
                del _ipcmap["threadsharedobj"][self._threadsharedobjid]
        except:
            None
    
    def __getstate__(self):
        if self._threadsharedobjid is None:
            self._create() 
            self._threadsharedobjid = id(self)
            _ipcmap["threadsharedobj"][self._threadsharedobjid]=self
        return self._threadsharedobjid
    
    def __setstate__(self, state):
        self.__init__()
        pobj=_ipcmap["threadsharedobj"][state]
        self._open((None, pobj._mmap,pobj._cond,pobj._size1,pobj._size2))
    

def Stream(prop=None):
    if is_load_libbase():
        return StreamIPC(prop)
    else:
        return StreamTHC(prop)

class MemMapIPC():
    
    def __init__(self,size,fixperm=None):
        self.shm_def = None
        self.file=None
        self.fixperm=fixperm
        self.mmap=None
        self.size=size
        self.bcreate=True
        self.bclose=False
        self.bdestroy=False
        self._create()
    
    def __del__(self):
        try: 
            self._destroy()        
        except:
            None
        
    def _destroy(self):
        if not self.bdestroy:
            self.bdestroy=True
            if self.bcreate:
                self.close()
                if self.ftype=="F":
                    if utils.path_exists(self.fpath):
                        try:
                            utils.path_remove(self.fpath)
                        except:
                            ex = utils.get_exception()
                            print("MemMap remove file error: " + utils.exception_to_string(ex))
                elif self.ftype=="M":
                    _rem_name(self.fname)
                    if not utils.is_windows():                        
                        iret = self._libbase.sharedMemoryDestroy(ctypes.byref(self.shm_def))
                        if iret!=0:
                            print("Shared memory destroy failed.")
            
    
    def __getstate__(self):
        if not self.bcreate:
            raise Exception("MemMap not initialized")
        prc = _ipcmap["pickleprocess"];
        if prc is None:
            raise Exception("No child process attached")
        prc._add_shared_obj(self)
        return {"type":self.ftype, "name":self.fname, "size":self.size}
    
    def __setstate__(self, st):
        self.file=None
        self.fixperm=None
        self.mmap=None
        self.size=None
        self.bcreate=False
        self.bclose=False
        self.bdestroy=False
        self._open(st)
        _add_child_shared_obj(self)
    
    def _create_mem(self, fixperm):
        if not utils.is_windows():
            if is_load_libbase():
                self._libbase=_ipcmap["libbase"]
                cnt=0
                while True:
                    self.fname = _add_name(MMP_NAME)
                    self.shm_def = SHAREDMEMORY_DEF()
                    self.shm_def.name=utils.str_to_bytes(self.fname)
                    self.shm_def.create=1
                    self.shm_def.size=self.size
                    self.shm_def.mode=_fix_perm_get_mode(fixperm)
                    iret = self._libbase.sharedMemoryInitialize(ctypes.byref(self.shm_def))
                    if iret==0:
                        self.ftype="M"
                        try:
                            self._prepare_map()
                            return
                        except:
                            ex = utils.get_exception()
                            self._libbase.sharedMemoryDestroy(ctypes.byref(self.shm_def))
                            _rem_name(self.fname)
                            raise ex
                    else:     
                        _rem_name(self.fname)               
                        cnt+=1
                        if cnt>=5 or iret!=-1:
                            raise Exception("SharedMemory initialize failed")
                        else:
                            time.sleep(0.2)            
            else:
                raise Exception("SharedMemory libbase load failed")
        else:
            self.fname = _add_name(MMP_NAME)
            self.ftype="M"
            try:
                self._prepare_map()
            except:
                _rem_name(self.fname)
                raise Exception(utils.get_exception())
            
    def _create_disk(self, fixperm):
        while True:
            spid=str(os.getpid())
            self.fname = MMP_NAME + "_" + spid + "_" + _rndseq(10)
            self.fpath=IPC_PATH + utils.path_sep + self.fname + ".mmp"
            if not utils.path_exists(self.fpath):
                with utils.file_open(self.fpath, "wb") as f:
                    f.write(" "*self.size)
                _fix_perm_path(self.fpath,fixperm)
                self.file=utils.file_open(self.fpath, "r+b")
                self.ftype="F"
                self._prepare_map()
                break
    
    def _create(self):
        try:
            self._create_mem(self.fixperm)
        except:
            self._create_disk(self.fixperm)

    def _open(self, mconf):
        self.ftype=mconf["type"]
        self.fname=mconf["name"]
        self.size=mconf["size"]
        if self.ftype=="F":
            self.fpath=process_manager._get_memmap_path(self.fname)
            if not utils.path_exists(self.fpath):
                raise Exception("Shared file not found.")
            self.file=utils.file_open(self.fpath, "r+b")
        elif self.ftype=="M":            
            if not utils.is_windows():
                if is_load_libbase():
                    self._libbase=_ipcmap["libbase"]
                    self.shm_def = SHAREDMEMORY_DEF()
                    self.shm_def.name=utils.str_to_bytes(self.fname)
                    self.shm_def.create=0
                    self.shm_def.size=self.size
                    iret = self._libbase.sharedMemoryInitialize(ctypes.byref(self.shm_def))
                    if iret!=0:
                        raise Exception("SharedMemory initialize failed")
                else:
                    raise Exception("SharedMemory libbase load failed")
        self._prepare_map()                
    
    def _prepare_map(self):
        try:
            if self.ftype=="F":
                self.mmap=mmap.mmap(self.file.fileno(), 0)                                
            elif self.ftype=="M":
                if not utils.is_windows():
                    self.mmap=mmap.mmap(self.shm_def.fd, self.size)
                else:
                    try:
                        self.mmap=mmap.mmap(0, self.size, "Global\\" + self.fname)
                    except:
                        e = utils.get_exception()
                        if self.mmap is None:
                            self.mmap=mmap.mmap(0, self.size, "Local\\" + self.fname)
                        else:
                            raise e
        except:
            ex = utils.get_exception()
            try:
                self.close()
            except:
                None
            raise ex
    
    def seek(self, p):
        self.mmap.seek(p)        
    
    def tell(self):
        return self.mmap.tell()     
    
    def write(self, dt):
        self.mmap.write(dt)
        
    def read(self, sz):
        return self.mmap.read(sz)        

    def close(self):
        if not self.bclose:            
            self.bclose=True
            self._mconf=None
            serr=""
            try:
                if self.mmap is not None:
                    self.mmap.close()
                    self.mmap=None                    
            except:
                e = utils.get_exception()
                serr+="Error map close: " + utils.exception_to_string(e) + "; ";
            
            if self.ftype=="F":
                if self.file is not None:  
                    self.file.close()
                    self.file=None
            elif self.ftype=="M":
                if not utils.is_windows():
                    if self.bcreate==False:
                        self._libbase.sharedMemoryDestroy(ctypes.byref(self.shm_def))            
            if serr!="":
                raise Exception(serr)
                        
    def get_size(self):
        return self.size


class MemMapTHC():
    
    def __init__(self,size,fixperm=None):
        self.fixperm=fixperm
        self.size=size
        self.pos=0
        self.data=bytearray(self.size)
        self.lck=threading.Lock()
        self._threadsharedobjid=None

    def __del__(self):
        try:
            if self._threadsharedobjid is not None and self._threadsharedobjid in _ipcmap["threadsharedobj"]:            
                del _ipcmap["threadsharedobj"][self._threadsharedobjid]
        except:
            None
    
    def __getstate__(self):
        if self._threadsharedobjid is None: 
            self._threadsharedobjid = id(self)
            _ipcmap["threadsharedobj"][self._threadsharedobjid]=self
        return self._threadsharedobjid
    
    def __setstate__(self, state):
        pobj=_ipcmap["threadsharedobj"][state]
        self.data=pobj.data
        self.size=pobj.size
        self.fixperm=pobj.fixperm
        self.lck=pobj.lck
        self.pos=0
        

    def seek(self, p):
        self.pos=p        
    
    def tell(self):
        return self.pos     
    
    def write(self, dt):
        if isinstance(dt,ctypes.Structure):
            dt=utils.convert_struct_to_bytes(dt)        
        with self.lck:
            sz=len(dt)
            self.data[self.pos:self.pos+sz]=dt
            self.pos+=sz
        
    def read(self, sz):
        with self.lck:
            sret = utils.bytes_new(self.data[self.pos:self.pos+sz])
            self.pos+=sz
            return sret

    def close(self):
        self.data=None
        self.lck=None
                        
    def get_size(self):
        return self.size


def MemMap(size,fixperm=None):
    if is_load_libbase():
        return MemMapIPC(size,fixperm)
    else:
        return MemMapTHC(size,fixperm)


class Property():
    
    def __init__(self):
        self._semaphore = threading.Condition()
        self._binit=False
        if utils.is_py2():
            self._mmap_write = lambda s: self._mmap.write(s.encode("utf8", errors="replace"))
            self._mmap_read = lambda n: self._mmap.read(n).decode("utf8", errors="replace")
        else:
            self._mmap_write = lambda s: self._mmap.write(bytes(s, "utf8"))
            self._mmap_read = lambda n: str(self._mmap.read(n), "utf8")
            
    
    def create(self, fname, fieldsdef, fixperm=None):
        self._semaphore.acquire()
        try:
            if self._binit:
                raise Exception("Already initialized.")
            self._path = process_manager._get_property_path(fname)
            if utils.path_exists(self._path):
                if fixperm is not None:
                    fixperm(self._path)
                self.open(fname)
                bok=True
                for f in fieldsdef:
                    if f["name"] in self._fields:
                        if f["size"]!=self._fields[f["name"]]["size"]:
                            bok=False
                            break
                    else:
                        bok=False
                        break
                if not bok:
                    self.close()
                    try:
                        utils.path_remove(self._path)
                    except:
                        raise Exception("Shared file is locked.")
                else:
                    self._binit=True
                    return
            self._fields={}
            szdata=0
            for f in fieldsdef:
                self._fields[f["name"]]={"pos":szdata,"size":f["size"]}
                szdata+=f["size"]
            shead=json.dumps(self._fields)
            self._len_def=len(shead)
            self._size=4+self._len_def+szdata
            with utils.file_open(self._path, "wb") as f:
                f.write(b" "*self._size)
            if fixperm is not None:
                fixperm(self._path)
            self._file=utils.file_open(self._path, "r+b")
            self._mmap = mmap.mmap(self._file.fileno(), 0)
            self._mmap.seek(0)
            self._mmap.write(struct.pack('!i', self._len_def))
            self._mmap.write(utils.str_to_bytes(shead))
            self._binit=True
        finally:
            self._semaphore.release()
    
    def exists(self, fname, bpath=None):
        return utils.path_exists(process_manager._get_property_path(fname, path=bpath))
    
    def open(self, fname, bpath=None):
        self._semaphore.acquire()
        try:
            if self._binit:
                raise Exception("Already initialized.")
            self._path = process_manager._get_property_path(fname, path=bpath)
            if not utils.path_exists(self._path):
                raise Exception("Shared file not found")
            self._file=utils.file_open(self._path, "r+b")
            self._mmap = mmap.mmap(self._file.fileno(), 0)
            self._mmap.seek(0)
            #Legge struttura
            self._len_def=struct.unpack('!i',self._mmap.read(4))[0]
            shead=self._mmap.read(self._len_def)
            self._fields = json.loads(shead)
            self._binit=True
        finally:
            self._semaphore.release()
    
    def close(self):
        self._semaphore.acquire()
        try:
            if self._binit:
                self._binit=False
                self._fields=None
                err=""
                try:
                    self._mmap.close()
                except:
                    e = utils.get_exception()
                    err+="Error map close:" + utils.exception_to_string(e) + "; "
                try:
                    self._file.close()
                except:
                    e = utils.get_exception()
                    err+="Error shared file close:" + utils.exception_to_string(e) + ";"
                if (err!=""):
                    raise Exception(err)
        finally:
            self._semaphore.release()
    
    def is_close(self):
        self._semaphore.acquire()
        try:
            return not self._binit;
        finally:
            self._semaphore.release()
    
    def set_property(self, name, val):
        self._semaphore.acquire()
        try:
            if self._binit:
                if name in self._fields:
                    f=self._fields[name];
                    if len(val)<=f["size"]:
                        self._mmap.seek(4+self._len_def+f["pos"])
                        appv=val + " "*(f["size"]-len(val)) 
                        self._mmap_write(appv)
                    else:
                        raise Exception("Invalid size for property " + name + ".")
                else:
                    raise Exception("Property " + name + " not found.")
            else:
                raise Exception("Not initialized.")
        finally:
            self._semaphore.release()
    
    def get_property(self, name):
        self._semaphore.acquire()
        try:
            if self._binit:
                if name in self._fields:
                    f=self._fields[name];
                    self._mmap.seek(4+self._len_def+f["pos"])
                    sret = self._mmap_read(f["size"])
                    return sret.strip() 
                else:
                    raise Exception("Property " + name + " not found.")
            else:
                raise Exception("Not initialized.")
        finally:
            self._semaphore.release()


class ProcessManager(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self,name="IPCProcessManager")
        self.daemon=True                
        self._lock=threading.RLock()
        #self._list_release_obj=[]
        self._list_process=[]
        self._bdestroy=False
            
    def _get_release_path(self,name,path=None):
        if path is None:
            return IPC_PATH + utils.path_sep + name + ".rls"
        else:
            return path + utils.path_sep + IPC_PATH + utils.path_sep + name + ".rls"
    
    def _get_config_path(self,name,path=None):
        if path is None:
            return IPC_PATH + utils.path_sep + name + ".cfg"
        else:
            return path + utils.path_sep + IPC_PATH + utils.path_sep + name + ".cfg"
    
    def _get_memmap_path(self,name,path=None):
        if path is None:
            return IPC_PATH + utils.path_sep + name + ".mmp"
        else:
            return path + utils.path_sep + IPC_PATH + utils.path_sep + name + ".mmp"
    
    def _get_property_path(self,name,path=None):
        if path is None:
            return IPC_PATH + utils.path_sep + name + ".shm"
        else:
            return path + utils.path_sep + IPC_PATH + utils.path_sep + name + ".shm"
    
    
    def _destroy_process_by_shared_obj(self, obj):
        tocloselist=[]
        with self._lock:
            for prc in self._list_process:
                if prc._contains_shared_object(obj):
                    tocloselist.append(prc)
        
        for prc in tocloselist:
            try:
                prc.close()                
            except:
                e = utils.get_exception()
                print("IPC manager _destroy_process_by_shared_obj error: " + utils.exception_to_string(e))
        
    def _add_process(self, prc):
        with self._lock:
            self._list_process.append(prc)
    
    def destory(self):
        self._bdestroy=True
            
    def run(self):
        try:
            while not self._bdestroy:
                time.sleep(1)
                if is_load_libbase():
                    #CHECK PROCESS
                    remlist=[]
                    lstprcs={}
                    with self._lock:
                        lstprcs=copy.copy(self._list_process)
                        
                    for prc in lstprcs:
                        try:
                            if prc._check_close():
                                remlist.append(prc)                        
                        except:
                            e = utils.get_exception()
                            print("IPC manager process check close error: " + utils.exception_to_string(e))
                            remlist.append(prc)
                    
                    #REMOVE PROCESS
                    with self._lock:
                        for prc in remlist:
                            self._list_process.remove(prc)
                            #print("PROCES REMOVED " + str(prc))                
                
        except:
            #ex = utils.get_exception()
            #print(utils.exception_to_string(ex))
            None #Sometime shutdown error (most likely raised during interpreter shutdown) errore: <type 'exceptions.TypeError'>: 'NoneType' object is not callable
        
process_manager=ProcessManager()
    
class ProcessConfig():
    
    def __init__(self):
        #STATUS: I=Init  O=OPEN  C=CLOSE
        self.POS_STATUS_PARENT=0
        self.POS_PID_PARENT=self.POS_STATUS_PARENT+1
        self.POS_STATUS_CHILD=self.POS_PID_PARENT+4
        self.POS_PID_CHILD=self.POS_STATUS_CHILD+1
        self.POS_ALIVE_TIME=self.POS_PID_CHILD+4
        self.POS_RUN_INFO=self.POS_ALIVE_TIME+8
        self._key=None   
        self._bclose=True             
    
    def create(self, prc, fixperm=None):        
        self._bcreate=True
        self._process=prc
        self._fixperm=fixperm
        _ipcmap["semaphore"].acquire()
        try:
            while True:
                spid=str(os.getpid())
                self._key = "dwa_" + spid + "_" + _rndseq(10)
                pth = process_manager._get_config_path(self._key)
                if not os.path.exists(pth):
                    break
            with utils.file_open(pth, "wb") as f:
                f.write(utils.bytes_new())
            _fix_perm_path(pth,fixperm)
        finally:
            _ipcmap["semaphore"].release()
        with utils.file_open(pth, "r+b") as f:
            f.write(struct.pack("!cIcIQI",b"I",os.getpid(),b"I",0,int(time.time()*1000),0))
        
        self._bclose=False
    
    def open(self, key):
        self._bcreate=False
        self._process=None
        self._key=key        
        pth = process_manager._get_config_path(self._key)
        if not os.path.exists(pth):
            self._key=None
            raise Exception("File config missing.")
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_PID_CHILD)
            f.write(struct.pack("!I",os.getpid()))
        self._bclose=False
        
    def set_status_parent(self, s):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_STATUS_PARENT)
            f.write(s)
        
    def get_status_child(self):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_STATUS_CHILD)
            return f.read(1)
    
    def set_status_child(self, s):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_STATUS_CHILD)
            f.write(s)            
        
    def get_pid_child(self):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_PID_CHILD)
            return struct.unpack("!I",f.read(4))[0]    
    
    def get_status_parent_and_alive_time(self):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_STATUS_PARENT)
            s = f.read(1)
            f.seek(self.POS_ALIVE_TIME)
            t= struct.unpack("!Q",f.read(8))[0]
            return(s,t)
    
    def set_alive_time(self):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_ALIVE_TIME)
            f.write(struct.pack("!Q",int(time.time()*1000)))
    
    def set_run_info(self, oconf):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_RUN_INFO+4)
            apps = _dump_obj(oconf,self._process)
            f.write(apps)
            f.seek(self.POS_RUN_INFO)
            f.write(struct.pack("!I",len(apps)))
        self._process=None            
    
    def get_run_info(self):
        pth = process_manager._get_config_path(self._key)
        with utils.file_open(pth, "r+b") as f:
            f.seek(self.POS_RUN_INFO)
            ln = struct.unpack("!I",f.read(4))[0]
            if ln>0:
                oconf=_load_obj(f.read(ln))
                f.seek(self.POS_RUN_INFO)
                f.write(struct.pack("!I",0))
                f.write(b" "*ln)
                f.flush()
                return oconf
            else:
                return {}
    
    def is_close(self):
        return self._bclose
    
    def close(self):
        if not self._bclose:
            self._bclose=True
            if self._bcreate:
                pth = process_manager._get_config_path(self._key)
                if os.path.exists(pth):
                    if utils.path_exists(pth):
                        utils.path_remove(pth)
            self._key=None
            self._process=None
    
    def get_key(self):
        return self._key

class Process():
    
    def __init__(self, pkg, cls, args=None, fixperm=None,forcesubprocess=False):
        self._process=None
        self._ppid=None
        self._pkg=pkg
        self._cls=cls
        self._args=args
        if self._args is None:
            self._args=[]
        self._fixperm=fixperm
        self._forcesubprocess=forcesubprocess
        self._stream=None
        self._binit=False
        self._bclose=False
        self._tdclose=None
        self._config=None
        self._lock=threading.RLock()
        self._list_shared_obj=[]
        self._tdchild=None
        self._py_exe_path=None
        self._py_home_path=None        
    
    def __del__(self):
        self._stream=None
        self._process=None
        self._ppid=None
    
    def _add_shared_obj(self, obj):
        with self._lock:
            self._list_shared_obj.append(obj)
            
    def _contains_shared_object(self, obj):
        with self._lock:
            if self._list_shared_obj is not None:
                return obj in self._list_shared_obj
        return False
    
    def get_fixperm(self):
        return self._fixperm
    
    def get_pid(self):
        return self._ppid
    
    def _create_process(self, args):
        if utils.is_windows() and not self._forcesubprocess:
            appcmd=u"\"" + self._py_exe_path + u"\" -S -m agent " + utils.str_new(args[2]) + u" " + utils.str_new(args[3])            
            self._process=None
            self._ppid = native.get_instance().start_process(appcmd,self._py_home_path)
            if self._ppid==-1:
                self._ppid=None
                raise Exception("Start process error")
        elif utils.is_linux():
            libenv = os.environ
            if utils.path_exists("runtime"):
                libenv["LD_LIBRARY_PATH"]=utils.path_absname("runtime/lib")
            elif "LD_LIBRARY_PATH" in os.environ:
                libenv["LD_LIBRARY_PATH"]=os.environ["LD_LIBRARY_PATH"]
            self._process=subprocess.Popen(args, env=libenv)
            self._ppid=self._process.pid
        elif utils.is_mac():
            libenv = os.environ
            if utils.path_exists("runtime"):
                libenv["DYLD_LIBRARY_PATH"]=utils.path_absname("runtime/lib")
            elif "DYLD_LIBRARY_PATH" in os.environ:
                libenv["DYLD_LIBRARY_PATH"]=os.environ["DYLD_LIBRARY_PATH"]
            self._process=subprocess.Popen(args, env=libenv)
            self._ppid=self._process.pid
        else:
            self._process=subprocess.Popen(args)
            self._ppid=self._process.pid
    
    def _start_ipc(self):
        try:
            self._config=ProcessConfig()
            self._config.create(self, self._fixperm)
            #START CHILD PROCESS
            self._py_exe_path=utils.str_new(sys.executable) 
            if utils.is_windows():
                #sys.executable don't work well with unicode path
                self._py_home_path=u""
                appth="native\\service.properties"
                if (utils.path_exists(appth)):
                    f = utils.file_open(appth, 'r', encoding='utf-8')
                    sprop = f.read()
                    f.close()
                    lns = sprop.splitlines()
                    for line in lns:
                        if line.startswith("pythonPath="):
                            self._py_exe_path=utils.str_new(line[11:])
                        elif line.startswith("pythonHome="):
                            self._py_home_path=utils.str_new(line[11:])   
                                     
            self._create_process([self._py_exe_path, u"agent.py", u"app=ipc", self._config.get_key()])
            #WAIT CHILD PROCESS
            cnt=utils.Counter()
            cnt_timeout=15
            while True:
                if not self.is_running():
                    raise Exception("Process closed (child pid).")
                try:
                    apppid=self._config.get_pid_child()
                    if apppid!=0:
                        self._ppid=apppid
                        break
                except:
                    None
                if cnt.is_elapsed(cnt_timeout):
                    raise Exception("Start process timeout")
                time.sleep(0.5)                
            
            self._stream = Stream({"fixperm":self._fixperm})
            oconf={}
            oconf["package"]=self._pkg
            oconf["class"]=self._cls
            oconf["arguments"]=self._args
            oconf["stream"]=self._stream
            oconf["aliveTime"]=time.time()
            self._config.set_run_info(oconf)
            self._config.set_status_parent(b"O")
            while True:
                if not self.is_running():
                    raise Exception("Process closed (child status).")
                try:
                    stcl=self._config.get_status_child()
                    if stcl==b"O":
                        break
                    elif stcl==b"C":
                        raise Exception("Process closed (child status).")
                except:
                    None
                if cnt.is_elapsed(cnt_timeout):
                    raise Exception("Start process timeout")
                time.sleep(0.5)
            process_manager._add_process(self)
            #print("STARTED " + str(self._ppid) + " self._cls:" + self._cls)
        except:
            ex = utils.get_exception()
            try:
                self._config.set_status_parent(b"C")
                self._config.close()
            except:
                ex1 = utils.get_exception()
                print("_start_ipc close config file - err: " + str(ex1))
            self._kill()
            if self._stream is not None:
                self._stream.close()
                self._stream=None
            raise ex    
    
    def _start_thp(self):
        try:
            self._stream = Stream()
            pkn=self._pkg.rsplit('.',1)[0]
            if pkn==self._pkg:
                pkn=None                    
            cls = self._cls
            objlib = importlib.import_module(self._pkg,pkn)
            cls = getattr(objlib, cls, None)                    
            cstrm = _load_obj(_dump_obj(self._stream, None))
            self._tdchild = cls(cstrm,self._args)
            self._tdchild.start()
        except:
            ex = utils.get_exception()
            self._tdchild=None
            if self._stream is not None:
                self._stream.close()
                self._stream=None                
            raise ex
        
    
    def start(self):
        if self._binit:
            raise Exception("Process already initialized.")
        self._binit=True
        if is_load_libbase():
            self._start_ipc()
        else:
            self._start_thp()
        return self._stream

    def is_running(self):
        if is_load_libbase():
            try:
                if self._process!=None:
                    if self._process.poll() == None:
                        return True
                    else:
                        return False
            except:
                None
            if self._ppid!=None:
                if native.get_instance().is_task_running(self._ppid):
                    return True
        elif self._tdchild is not None:
            try:
                return self._tdchild.is_alive()
            except:
                None            
        return False

    def join(self, timeout=None):
        if is_load_libbase():
            cnt=utils.Counter() 
            while self.is_running():
                if timeout is not None and cnt.is_elapsed(timeout):
                    return
                time.sleep(0.5)
            self._stream=None
            self._process=None
            self._ppid=None
        elif self._tdchild is not None:
            self._tdchild.join(timeout)
            self._stream=None
            self._tdchild=None            
    
    def close(self):
        if not self._bclose:
            self._bclose=True
            if self.is_running():
                if is_load_libbase():
                    if self._tdclose is None:
                        try:
                            if self._config is not None:
                                self._config.set_status_parent(b"C")
                        except:
                            None
                        if self._stream is not None: 
                            self._stream.close()
                            self._stream=None
                        self._tdclose=threading.Thread(target=self._close_wait, name="IPCProcessClose")
                        self._tdclose.start()
                else:
                    if self._stream is not None: 
                        self._stream.close()
                        self._stream=None
                    self._tdchild.join(2)
                    self._tdchild=None
            else:
                if self._stream is not None: 
                    self._stream.close()
                    self._stream=None
                self._process=None
                self._ppid=None   
                self._tdchild=None
        
    def _close_wait(self):
        cnt=utils.Counter() 
        while self.is_running():
            if cnt.is_elapsed(5):
                break
            time.sleep(1)
        self._kill()
    
    def _check_close(self):
        if self._config is None:
            return True
        if self.is_running():
            self._config.set_alive_time()
        else:
            self._bclose=True
            stcl=self._config.get_status_child()
            try:
                self._config.close()
            except:
                ex = utils.get_exception()
                print("_check_close config file - err: " + utils.exception_to_string(ex))
            self._config=None
            if stcl==b"C":
                with self._lock:
                    self._list_shared_obj=None                                        
            else:
                #PROCESS TERMINATED ABNORMALLY
                lstshobj=None
                with self._lock:
                    lstshobj=self._list_shared_obj
                    self._list_shared_obj=None
                #CLOSE ALL PROCESS THAT USE SHARE OBJECT
                if lstshobj is not None:
                    for i in reversed(range(len(lstshobj))):
                        try:
                            obj=lstshobj[i]
                            process_manager._destroy_process_by_shared_obj(obj)
                        except:
                            ex = utils.get_exception()
                            print("_check_close close other process shared obj:  " + str(obj) + " - err: " + utils.exception_to_string(ex))
                    #DESTROY OBJECT (RELEASE LOCKS)
                    for i in reversed(range(len(lstshobj))):
                        try:
                            obj=lstshobj[i]
                            obj._destroy()
                        except:
                            ex = utils.get_exception()
                            print("_check_close destroy shared obj:  " + str(obj) + " - err: " + utils.exception_to_string(ex))                    
            self._stream=None
            self._process=None
            self._ppid=None            
            return True
        return False

    def _kill(self):
        if self.is_running():
            if self._stream is not None:
                self._stream.close()
                self._stream=None
            if self._process!=None:
                self._process.kill()
                self._process.poll()
                time.sleep(1)
            if self._ppid!=None:
                native.get_instance().task_kill(self._ppid)
        self._process=None
        self._ppid=None
        

class ChildProcessThread(threading.Thread):
    
    def _get_thread_name(self):
        return type(self).__name__
    
    def _on_init(self):
        None
    
    def __init__(self, strm, args):
        threading.Thread.__init__(self,  name=self._get_thread_name())
        self._stream=strm
        self._args=args
        self._destroy=False
        self._on_init()
    
    def get_stream(self):
        return self._stream
    
    def get_arguments(self):
        return self._args
    
    def is_destroy(self):
        return self._destroy or self._stream.is_closed()
    
    def destroy(self):
        self._destroy=True
        self._stream.close()

def ctrlHandler(ctrlType):    
    return 1


def fmain(args): #SERVE PER MACOS APP
    if utils.is_windows():
        try:
            #Evita che si chiude durante il logoff
            HandlerRoutine = ctypes.WINFUNCTYPE(ctypes.c_int, ctypes.c_uint)(ctrlHandler)
            ctypes.windll.kernel32.SetConsoleCtrlHandler(HandlerRoutine, 1)
        except:
            None
    
    #fk = args[1]
    waittm=0.5
    parentAliveTime=None
    parentAliveCounter=utils.Counter()
    parentAliveTimeout=15    
    tdchild=None 
    #oconf={}
    conf=ProcessConfig()
    try:
        conf.open(args[1])
        while ((not parentAliveCounter.is_elapsed(parentAliveTimeout)) and (tdchild is None or tdchild.is_alive())):
            appst, apptm = conf.get_status_parent_and_alive_time()
            apptm = apptm*1000.0
            if parentAliveTime is None or parentAliveTime!=apptm:
                    parentAliveTime=apptm
                    parentAliveCounter.reset()
            if tdchild is None and appst==b"O":
                oconf=conf.get_run_info()            
                pkn = oconf["package"].rsplit('.',1)[0]
                if pkn == oconf["package"]:
                    pkn=None                    
                cls = oconf["class"]
                objlib = importlib.import_module(oconf["package"],pkn)
                cls = getattr(objlib, cls, None)                    
                cstrm = oconf["stream"]
                cargs = oconf["arguments"]
                if cls is not None:
                    tdchild = cls(cstrm,cargs)
                    tdchild.start()
                    conf.set_status_child(b"O")
                    waittm=1.0
                else:
                    break                    
            if appst==b"C":
                break            
            time.sleep(waittm)           
    except:
        ex = utils.get_exception()
        print(utils.exception_to_string(ex))
    if tdchild is not None:
        try:
            tdchild.destroy()
            tdchild.join(5)
        except:
            None
    _destroy_child_shared_obj()
    if not conf.is_close():
        conf.set_status_child(b"C")
    conf.close()
    
    
     
    
                                                                                                                                                                                  LICENSES/                                                                                           0000755 0001750 0001750 00000000000 14140517417 011555  5                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 LICENSES/ui                                                                                         0000644 0001750 0001750 00000041313 13422307023 012107  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 Mozilla Public License Version 2.0
==================================

1. Definitions
--------------

1.1. "Contributor"
    means each individual or legal entity that creates, contributes to
    the creation of, or owns Covered Software.

1.2. "Contributor Version"
    means the combination of the Contributions of others (if any) used
    by a Contributor and that particular Contributor's Contribution.

1.3. "Contribution"
    means Covered Software of a particular Contributor.

1.4. "Covered Software"
    means Source Code Form to which the initial Contributor has attached
    the notice in Exhibit A, the Executable Form of such Source Code
    Form, and Modifications of such Source Code Form, in each case
    including portions thereof.

1.5. "Incompatible With Secondary Licenses"
    means

    (a) that the initial Contributor has attached the notice described
        in Exhibit B to the Covered Software; or

    (b) that the Covered Software was made available under the terms of
        version 1.1 or earlier of the License, but not also under the
        terms of a Secondary License.

1.6. "Executable Form"
    means any form of the work other than Source Code Form.

1.7. "Larger Work"
    means a work that combines Covered Software with other material, in 
    a separate file or files, that is not Covered Software.

1.8. "License"
    means this document.

1.9. "Licensable"
    means having the right to grant, to the maximum extent possible,
    whether at the time of the initial grant or subsequently, any and
    all of the rights conveyed by this License.

1.10. "Modifications"
    means any of the following:

    (a) any file in Source Code Form that results from an addition to,
        deletion from, or modification of the contents of Covered
        Software; or

    (b) any new file in Source Code Form that contains any Covered
        Software.

1.11. "Patent Claims" of a Contributor
    means any patent claim(s), including without limitation, method,
    process, and apparatus claims, in any patent Licensable by such
    Contributor that would be infringed, but for the grant of the
    License, by the making, using, selling, offering for sale, having
    made, import, or transfer of either its Contributions or its
    Contributor Version.

1.12. "Secondary License"
    means either the GNU General Public License, Version 2.0, the GNU
    Lesser General Public License, Version 2.1, the GNU Affero General
    Public License, Version 3.0, or any later versions of those
    licenses.

1.13. "Source Code Form"
    means the form of the work preferred for making modifications.

1.14. "You" (or "Your")
    means an individual or a legal entity exercising rights under this
    License. For legal entities, "You" includes any entity that
    controls, is controlled by, or is under common control with You. For
    purposes of this definition, "control" means (a) the power, direct
    or indirect, to cause the direction or management of such entity,
    whether by contract or otherwise, or (b) ownership of more than
    fifty percent (50%) of the outstanding shares or beneficial
    ownership of such entity.

2. License Grants and Conditions
--------------------------------

2.1. Grants

Each Contributor hereby grants You a world-wide, royalty-free,
non-exclusive license:

(a) under intellectual property rights (other than patent or trademark)
    Licensable by such Contributor to use, reproduce, make available,
    modify, display, perform, distribute, and otherwise exploit its
    Contributions, either on an unmodified basis, with Modifications, or
    as part of a Larger Work; and

(b) under Patent Claims of such Contributor to make, use, sell, offer
    for sale, have made, import, and otherwise transfer either its
    Contributions or its Contributor Version.

2.2. Effective Date

The licenses granted in Section 2.1 with respect to any Contribution
become effective for each Contribution on the date the Contributor first
distributes such Contribution.

2.3. Limitations on Grant Scope

The licenses granted in this Section 2 are the only rights granted under
this License. No additional rights or licenses will be implied from the
distribution or licensing of Covered Software under this License.
Notwithstanding Section 2.1(b) above, no patent license is granted by a
Contributor:

(a) for any code that a Contributor has removed from Covered Software;
    or

(b) for infringements caused by: (i) Your and any other third party's
    modifications of Covered Software, or (ii) the combination of its
    Contributions with other software (except as part of its Contributor
    Version); or

(c) under Patent Claims infringed by Covered Software in the absence of
    its Contributions.

This License does not grant any rights in the trademarks, service marks,
or logos of any Contributor (except as may be necessary to comply with
the notice requirements in Section 3.4).

2.4. Subsequent Licenses

No Contributor makes additional grants as a result of Your choice to
distribute the Covered Software under a subsequent version of this
License (see Section 10.2) or under the terms of a Secondary License (if
permitted under the terms of Section 3.3).

2.5. Representation

Each Contributor represents that the Contributor believes its
Contributions are its original creation(s) or it has sufficient rights
to grant the rights to its Contributions conveyed by this License.

2.6. Fair Use

This License is not intended to limit any rights You have under
applicable copyright doctrines of fair use, fair dealing, or other
equivalents.

2.7. Conditions

Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
in Section 2.1.

3. Responsibilities
-------------------

3.1. Distribution of Source Form

All distribution of Covered Software in Source Code Form, including any
Modifications that You create or to which You contribute, must be under
the terms of this License. You must inform recipients that the Source
Code Form of the Covered Software is governed by the terms of this
License, and how they can obtain a copy of this License. You may not
attempt to alter or restrict the recipients' rights in the Source Code
Form.

3.2. Distribution of Executable Form

If You distribute Covered Software in Executable Form then:

(a) such Covered Software must also be made available in Source Code
    Form, as described in Section 3.1, and You must inform recipients of
    the Executable Form how they can obtain a copy of such Source Code
    Form by reasonable means in a timely manner, at a charge no more
    than the cost of distribution to the recipient; and

(b) You may distribute such Executable Form under the terms of this
    License, or sublicense it under different terms, provided that the
    license for the Executable Form does not attempt to limit or alter
    the recipients' rights in the Source Code Form under this License.

3.3. Distribution of a Larger Work

You may create and distribute a Larger Work under terms of Your choice,
provided that You also comply with the requirements of this License for
the Covered Software. If the Larger Work is a combination of Covered
Software with a work governed by one or more Secondary Licenses, and the
Covered Software is not Incompatible With Secondary Licenses, this
License permits You to additionally distribute such Covered Software
under the terms of such Secondary License(s), so that the recipient of
the Larger Work may, at their option, further distribute the Covered
Software under the terms of either this License or such Secondary
License(s).

3.4. Notices

You may not remove or alter the substance of any license notices
(including copyright notices, patent notices, disclaimers of warranty,
or limitations of liability) contained within the Source Code Form of
the Covered Software, except that You may alter any license notices to
the extent required to remedy known factual inaccuracies.

3.5. Application of Additional Terms

You may choose to offer, and to charge a fee for, warranty, support,
indemnity or liability obligations to one or more recipients of Covered
Software. However, You may do so only on Your own behalf, and not on
behalf of any Contributor. You must make it absolutely clear that any
such warranty, support, indemnity, or liability obligation is offered by
You alone, and You hereby agree to indemnify every Contributor for any
liability incurred by such Contributor as a result of warranty, support,
indemnity or liability terms You offer. You may include additional
disclaimers of warranty and limitations of liability specific to any
jurisdiction.

4. Inability to Comply Due to Statute or Regulation
---------------------------------------------------

If it is impossible for You to comply with any of the terms of this
License with respect to some or all of the Covered Software due to
statute, judicial order, or regulation then You must: (a) comply with
the terms of this License to the maximum extent possible; and (b)
describe the limitations and the code they affect. Such description must
be placed in a text file included with all distributions of the Covered
Software under this License. Except to the extent prohibited by statute
or regulation, such description must be sufficiently detailed for a
recipient of ordinary skill to be able to understand it.

5. Termination
--------------

5.1. The rights granted under this License will terminate automatically
if You fail to comply with any of its terms. However, if You become
compliant, then the rights granted under this License from a particular
Contributor are reinstated (a) provisionally, unless and until such
Contributor explicitly and finally terminates Your grants, and (b) on an
ongoing basis, if such Contributor fails to notify You of the
non-compliance by some reasonable means prior to 60 days after You have
come back into compliance. Moreover, Your grants from a particular
Contributor are reinstated on an ongoing basis if such Contributor
notifies You of the non-compliance by some reasonable means, this is the
first time You have received notice of non-compliance with this License
from such Contributor, and You become compliant prior to 30 days after
Your receipt of the notice.

5.2. If You initiate litigation against any entity by asserting a patent
infringement claim (excluding declaratory judgment actions,
counter-claims, and cross-claims) alleging that a Contributor Version
directly or indirectly infringes any patent, then the rights granted to
You by any and all Contributors for the Covered Software under Section
2.1 of this License shall terminate.

5.3. In the event of termination under Sections 5.1 or 5.2 above, all
end user license agreements (excluding distributors and resellers) which
have been validly granted by You or Your distributors under this License
prior to termination shall survive termination.

************************************************************************
*                                                                      *
*  6. Disclaimer of Warranty                                           *
*  -------------------------                                           *
*                                                                      *
*  Covered Software is provided under this License on an "as is"       *
*  basis, without warranty of any kind, either expressed, implied, or  *
*  statutory, including, without limitation, warranties that the       *
*  Covered Software is free of defects, merchantable, fit for a        *
*  particular purpose or non-infringing. The entire risk as to the     *
*  quality and performance of the Covered Software is with You.        *
*  Should any Covered Software prove defective in any respect, You     *
*  (not any Contributor) assume the cost of any necessary servicing,   *
*  repair, or correction. This disclaimer of warranty constitutes an   *
*  essential part of this License. No use of any Covered Software is   *
*  authorized under this License except under this disclaimer.         *
*                                                                      *
************************************************************************

************************************************************************
*                                                                      *
*  7. Limitation of Liability                                          *
*  --------------------------                                          *
*                                                                      *
*  Under no circumstances and under no legal theory, whether tort      *
*  (including negligence), contract, or otherwise, shall any           *
*  Contributor, or anyone who distributes Covered Software as          *
*  permitted above, be liable to You for any direct, indirect,         *
*  special, incidental, or consequential damages of any character      *
*  including, without limitation, damages for lost profits, loss of    *
*  goodwill, work stoppage, computer failure or malfunction, or any    *
*  and all other commercial damages or losses, even if such party      *
*  shall have been informed of the possibility of such damages. This   *
*  limitation of liability shall not apply to liability for death or   *
*  personal injury resulting from such party's negligence to the       *
*  extent applicable law prohibits such limitation. Some               *
*  jurisdictions do not allow the exclusion or limitation of           *
*  incidental or consequential damages, so this exclusion and          *
*  limitation may not apply to You.                                    *
*                                                                      *
************************************************************************

8. Litigation
-------------

Any litigation relating to this License may be brought only in the
courts of a jurisdiction where the defendant maintains its principal
place of business and such litigation shall be governed by laws of that
jurisdiction, without reference to its conflict-of-law provisions.
Nothing in this Section shall prevent a party's ability to bring
cross-claims or counter-claims.

9. Miscellaneous
----------------

This License represents the complete agreement concerning the subject
matter hereof. If any provision of this License is held to be
unenforceable, such provision shall be reformed only to the extent
necessary to make it enforceable. Any law or regulation which provides
that the language of a contract shall be construed against the drafter
shall not be used to construe this License against a Contributor.

10. Versions of the License
---------------------------

10.1. New Versions

Mozilla Foundation is the license steward. Except as provided in Section
10.3, no one other than the license steward has the right to modify or
publish new versions of this License. Each version will be given a
distinguishing version number.

10.2. Effect of New Versions

You may distribute the Covered Software under the terms of the version
of the License under which You originally received the Covered Software,
or under the terms of any subsequent version published by the license
steward.

10.3. Modified Versions

If you create software not governed by this License, and you want to
create a new license for such software, you may create and use a
modified version of this License if you rename the license and remove
any references to the name of the license steward (except to note that
such modified license differs from this License).

10.4. Distributing Source Code Form that is Incompatible With Secondary
Licenses

If You choose to distribute Source Code Form that is Incompatible With
Secondary Licenses under the terms of this version of the License, the
notice described in Exhibit B of this License must be attached.

Exhibit A - Source Code Form License Notice
-------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

If it is not possible or desirable to put the notice in a particular
file, then You may include the notice in a location (such as a LICENSE
file in a relevant directory) where a recipient would be likely to look
for such a notice.

You may add additional accurate notices of copyright ownership.

Exhibit B - "Incompatible With Secondary Licenses" Notice
---------------------------------------------------------

  This Source Code Form is "Incompatible With Secondary Licenses", as
  defined by the Mozilla Public License, v. 2.0.
                                                                                                                                                                                                                                                                                                                     LICENSES/core                                                                                       0000644 0001750 0001750 00000041313 13422307023 012422  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 Mozilla Public License Version 2.0
==================================

1. Definitions
--------------

1.1. "Contributor"
    means each individual or legal entity that creates, contributes to
    the creation of, or owns Covered Software.

1.2. "Contributor Version"
    means the combination of the Contributions of others (if any) used
    by a Contributor and that particular Contributor's Contribution.

1.3. "Contribution"
    means Covered Software of a particular Contributor.

1.4. "Covered Software"
    means Source Code Form to which the initial Contributor has attached
    the notice in Exhibit A, the Executable Form of such Source Code
    Form, and Modifications of such Source Code Form, in each case
    including portions thereof.

1.5. "Incompatible With Secondary Licenses"
    means

    (a) that the initial Contributor has attached the notice described
        in Exhibit B to the Covered Software; or

    (b) that the Covered Software was made available under the terms of
        version 1.1 or earlier of the License, but not also under the
        terms of a Secondary License.

1.6. "Executable Form"
    means any form of the work other than Source Code Form.

1.7. "Larger Work"
    means a work that combines Covered Software with other material, in 
    a separate file or files, that is not Covered Software.

1.8. "License"
    means this document.

1.9. "Licensable"
    means having the right to grant, to the maximum extent possible,
    whether at the time of the initial grant or subsequently, any and
    all of the rights conveyed by this License.

1.10. "Modifications"
    means any of the following:

    (a) any file in Source Code Form that results from an addition to,
        deletion from, or modification of the contents of Covered
        Software; or

    (b) any new file in Source Code Form that contains any Covered
        Software.

1.11. "Patent Claims" of a Contributor
    means any patent claim(s), including without limitation, method,
    process, and apparatus claims, in any patent Licensable by such
    Contributor that would be infringed, but for the grant of the
    License, by the making, using, selling, offering for sale, having
    made, import, or transfer of either its Contributions or its
    Contributor Version.

1.12. "Secondary License"
    means either the GNU General Public License, Version 2.0, the GNU
    Lesser General Public License, Version 2.1, the GNU Affero General
    Public License, Version 3.0, or any later versions of those
    licenses.

1.13. "Source Code Form"
    means the form of the work preferred for making modifications.

1.14. "You" (or "Your")
    means an individual or a legal entity exercising rights under this
    License. For legal entities, "You" includes any entity that
    controls, is controlled by, or is under common control with You. For
    purposes of this definition, "control" means (a) the power, direct
    or indirect, to cause the direction or management of such entity,
    whether by contract or otherwise, or (b) ownership of more than
    fifty percent (50%) of the outstanding shares or beneficial
    ownership of such entity.

2. License Grants and Conditions
--------------------------------

2.1. Grants

Each Contributor hereby grants You a world-wide, royalty-free,
non-exclusive license:

(a) under intellectual property rights (other than patent or trademark)
    Licensable by such Contributor to use, reproduce, make available,
    modify, display, perform, distribute, and otherwise exploit its
    Contributions, either on an unmodified basis, with Modifications, or
    as part of a Larger Work; and

(b) under Patent Claims of such Contributor to make, use, sell, offer
    for sale, have made, import, and otherwise transfer either its
    Contributions or its Contributor Version.

2.2. Effective Date

The licenses granted in Section 2.1 with respect to any Contribution
become effective for each Contribution on the date the Contributor first
distributes such Contribution.

2.3. Limitations on Grant Scope

The licenses granted in this Section 2 are the only rights granted under
this License. No additional rights or licenses will be implied from the
distribution or licensing of Covered Software under this License.
Notwithstanding Section 2.1(b) above, no patent license is granted by a
Contributor:

(a) for any code that a Contributor has removed from Covered Software;
    or

(b) for infringements caused by: (i) Your and any other third party's
    modifications of Covered Software, or (ii) the combination of its
    Contributions with other software (except as part of its Contributor
    Version); or

(c) under Patent Claims infringed by Covered Software in the absence of
    its Contributions.

This License does not grant any rights in the trademarks, service marks,
or logos of any Contributor (except as may be necessary to comply with
the notice requirements in Section 3.4).

2.4. Subsequent Licenses

No Contributor makes additional grants as a result of Your choice to
distribute the Covered Software under a subsequent version of this
License (see Section 10.2) or under the terms of a Secondary License (if
permitted under the terms of Section 3.3).

2.5. Representation

Each Contributor represents that the Contributor believes its
Contributions are its original creation(s) or it has sufficient rights
to grant the rights to its Contributions conveyed by this License.

2.6. Fair Use

This License is not intended to limit any rights You have under
applicable copyright doctrines of fair use, fair dealing, or other
equivalents.

2.7. Conditions

Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
in Section 2.1.

3. Responsibilities
-------------------

3.1. Distribution of Source Form

All distribution of Covered Software in Source Code Form, including any
Modifications that You create or to which You contribute, must be under
the terms of this License. You must inform recipients that the Source
Code Form of the Covered Software is governed by the terms of this
License, and how they can obtain a copy of this License. You may not
attempt to alter or restrict the recipients' rights in the Source Code
Form.

3.2. Distribution of Executable Form

If You distribute Covered Software in Executable Form then:

(a) such Covered Software must also be made available in Source Code
    Form, as described in Section 3.1, and You must inform recipients of
    the Executable Form how they can obtain a copy of such Source Code
    Form by reasonable means in a timely manner, at a charge no more
    than the cost of distribution to the recipient; and

(b) You may distribute such Executable Form under the terms of this
    License, or sublicense it under different terms, provided that the
    license for the Executable Form does not attempt to limit or alter
    the recipients' rights in the Source Code Form under this License.

3.3. Distribution of a Larger Work

You may create and distribute a Larger Work under terms of Your choice,
provided that You also comply with the requirements of this License for
the Covered Software. If the Larger Work is a combination of Covered
Software with a work governed by one or more Secondary Licenses, and the
Covered Software is not Incompatible With Secondary Licenses, this
License permits You to additionally distribute such Covered Software
under the terms of such Secondary License(s), so that the recipient of
the Larger Work may, at their option, further distribute the Covered
Software under the terms of either this License or such Secondary
License(s).

3.4. Notices

You may not remove or alter the substance of any license notices
(including copyright notices, patent notices, disclaimers of warranty,
or limitations of liability) contained within the Source Code Form of
the Covered Software, except that You may alter any license notices to
the extent required to remedy known factual inaccuracies.

3.5. Application of Additional Terms

You may choose to offer, and to charge a fee for, warranty, support,
indemnity or liability obligations to one or more recipients of Covered
Software. However, You may do so only on Your own behalf, and not on
behalf of any Contributor. You must make it absolutely clear that any
such warranty, support, indemnity, or liability obligation is offered by
You alone, and You hereby agree to indemnify every Contributor for any
liability incurred by such Contributor as a result of warranty, support,
indemnity or liability terms You offer. You may include additional
disclaimers of warranty and limitations of liability specific to any
jurisdiction.

4. Inability to Comply Due to Statute or Regulation
---------------------------------------------------

If it is impossible for You to comply with any of the terms of this
License with respect to some or all of the Covered Software due to
statute, judicial order, or regulation then You must: (a) comply with
the terms of this License to the maximum extent possible; and (b)
describe the limitations and the code they affect. Such description must
be placed in a text file included with all distributions of the Covered
Software under this License. Except to the extent prohibited by statute
or regulation, such description must be sufficiently detailed for a
recipient of ordinary skill to be able to understand it.

5. Termination
--------------

5.1. The rights granted under this License will terminate automatically
if You fail to comply with any of its terms. However, if You become
compliant, then the rights granted under this License from a particular
Contributor are reinstated (a) provisionally, unless and until such
Contributor explicitly and finally terminates Your grants, and (b) on an
ongoing basis, if such Contributor fails to notify You of the
non-compliance by some reasonable means prior to 60 days after You have
come back into compliance. Moreover, Your grants from a particular
Contributor are reinstated on an ongoing basis if such Contributor
notifies You of the non-compliance by some reasonable means, this is the
first time You have received notice of non-compliance with this License
from such Contributor, and You become compliant prior to 30 days after
Your receipt of the notice.

5.2. If You initiate litigation against any entity by asserting a patent
infringement claim (excluding declaratory judgment actions,
counter-claims, and cross-claims) alleging that a Contributor Version
directly or indirectly infringes any patent, then the rights granted to
You by any and all Contributors for the Covered Software under Section
2.1 of this License shall terminate.

5.3. In the event of termination under Sections 5.1 or 5.2 above, all
end user license agreements (excluding distributors and resellers) which
have been validly granted by You or Your distributors under this License
prior to termination shall survive termination.

************************************************************************
*                                                                      *
*  6. Disclaimer of Warranty                                           *
*  -------------------------                                           *
*                                                                      *
*  Covered Software is provided under this License on an "as is"       *
*  basis, without warranty of any kind, either expressed, implied, or  *
*  statutory, including, without limitation, warranties that the       *
*  Covered Software is free of defects, merchantable, fit for a        *
*  particular purpose or non-infringing. The entire risk as to the     *
*  quality and performance of the Covered Software is with You.        *
*  Should any Covered Software prove defective in any respect, You     *
*  (not any Contributor) assume the cost of any necessary servicing,   *
*  repair, or correction. This disclaimer of warranty constitutes an   *
*  essential part of this License. No use of any Covered Software is   *
*  authorized under this License except under this disclaimer.         *
*                                                                      *
************************************************************************

************************************************************************
*                                                                      *
*  7. Limitation of Liability                                          *
*  --------------------------                                          *
*                                                                      *
*  Under no circumstances and under no legal theory, whether tort      *
*  (including negligence), contract, or otherwise, shall any           *
*  Contributor, or anyone who distributes Covered Software as          *
*  permitted above, be liable to You for any direct, indirect,         *
*  special, incidental, or consequential damages of any character      *
*  including, without limitation, damages for lost profits, loss of    *
*  goodwill, work stoppage, computer failure or malfunction, or any    *
*  and all other commercial damages or losses, even if such party      *
*  shall have been informed of the possibility of such damages. This   *
*  limitation of liability shall not apply to liability for death or   *
*  personal injury resulting from such party's negligence to the       *
*  extent applicable law prohibits such limitation. Some               *
*  jurisdictions do not allow the exclusion or limitation of           *
*  incidental or consequential damages, so this exclusion and          *
*  limitation may not apply to You.                                    *
*                                                                      *
************************************************************************

8. Litigation
-------------

Any litigation relating to this License may be brought only in the
courts of a jurisdiction where the defendant maintains its principal
place of business and such litigation shall be governed by laws of that
jurisdiction, without reference to its conflict-of-law provisions.
Nothing in this Section shall prevent a party's ability to bring
cross-claims or counter-claims.

9. Miscellaneous
----------------

This License represents the complete agreement concerning the subject
matter hereof. If any provision of this License is held to be
unenforceable, such provision shall be reformed only to the extent
necessary to make it enforceable. Any law or regulation which provides
that the language of a contract shall be construed against the drafter
shall not be used to construe this License against a Contributor.

10. Versions of the License
---------------------------

10.1. New Versions

Mozilla Foundation is the license steward. Except as provided in Section
10.3, no one other than the license steward has the right to modify or
publish new versions of this License. Each version will be given a
distinguishing version number.

10.2. Effect of New Versions

You may distribute the Covered Software under the terms of the version
of the License under which You originally received the Covered Software,
or under the terms of any subsequent version published by the license
steward.

10.3. Modified Versions

If you create software not governed by this License, and you want to
create a new license for such software, you may create and use a
modified version of this License if you rename the license and remove
any references to the name of the license steward (except to note that
such modified license differs from this License).

10.4. Distributing Source Code Form that is Incompatible With Secondary
Licenses

If You choose to distribute Source Code Form that is Incompatible With
Secondary Licenses under the terms of this version of the License, the
notice described in Exhibit B of this License must be attached.

Exhibit A - Source Code Form License Notice
-------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

If it is not possible or desirable to put the notice in a particular
file, then You may include the notice in a location (such as a LICENSE
file in a relevant directory) where a recipient would be likely to look
for such a notice.

You may add additional accurate notices of copyright ownership.

Exhibit B - "Incompatible With Secondary Licenses" Notice
---------------------------------------------------------

  This Source Code Form is "Incompatible With Secondary Licenses", as
  defined by the Mozilla Public License, v. 2.0.
                                                                                                                                                                                                                                                                                                                     LICENSES/runtime                                                                                    0000644 0001750 0001750 00000113706 13410204240 013155  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 Most part of this software has been written in Python. 
To execute it you need the Python framework you can find in the runtime folder.
For information about Python visit https://www.python.org/.

This Python software is governed by the following license:
A. HISTORY OF THE SOFTWARE
==========================

Python was created in the early 1990s by Guido van Rossum at Stichting
Mathematisch Centrum (CWI, see http://www.cwi.nl) in the Netherlands
as a successor of a language called ABC.  Guido remains Python's
principal author, although it includes many contributions from others.

In 1995, Guido continued his work on Python at the Corporation for
National Research Initiatives (CNRI, see http://www.cnri.reston.va.us)
in Reston, Virginia where he released several versions of the
software.

In May 2000, Guido and the Python core development team moved to
BeOpen.com to form the BeOpen PythonLabs team.  In October of the same
year, the PythonLabs team moved to Digital Creations (now Zope
Corporation, see http://www.zope.com).  In 2001, the Python Software
Foundation (PSF, see http://www.python.org/psf/) was formed, a
non-profit organization created specifically to own Python-related
Intellectual Property.  Zope Corporation is a sponsoring member of
the PSF.

All Python releases are Open Source (see http://www.opensource.org for
the Open Source Definition).  Historically, most, but not all, Python
releases have also been GPL-compatible; the table below summarizes
the various releases.

    Release         Derived     Year        Owner       GPL-
                    from                                compatible? (1)

    0.9.0 thru 1.2              1991-1995   CWI         yes
    1.3 thru 1.5.2  1.2         1995-1999   CNRI        yes
    1.6             1.5.2       2000        CNRI        no
    2.0             1.6         2000        BeOpen.com  no
    1.6.1           1.6         2001        CNRI        yes (2)
    2.1             2.0+1.6.1   2001        PSF         no
    2.0.1           2.0+1.6.1   2001        PSF         yes
    2.1.1           2.1+2.0.1   2001        PSF         yes
    2.1.2           2.1.1       2002        PSF         yes
    2.1.3           2.1.2       2002        PSF         yes
    2.2 and above   2.1.1       2001-now    PSF         yes

Footnotes:

(1) GPL-compatible doesn't mean that we're distributing Python under
    the GPL.  All Python licenses, unlike the GPL, let you distribute
    a modified version without making your changes open source.  The
    GPL-compatible licenses make it possible to combine Python with
    other software that is released under the GPL; the others don't.

(2) According to Richard Stallman, 1.6.1 is not GPL-compatible,
    because its license has a choice of law clause.  According to
    CNRI, however, Stallman's lawyer has told CNRI's lawyer that 1.6.1
    is "not incompatible" with the GPL.

Thanks to the many outside volunteers who have worked under Guido's
direction to make these releases possible.


B. TERMS AND CONDITIONS FOR ACCESSING OR OTHERWISE USING PYTHON
===============================================================

PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
--------------------------------------------

1. This LICENSE AGREEMENT is between the Python Software Foundation
("PSF"), and the Individual or Organization ("Licensee") accessing and
otherwise using this software ("Python") in source or binary form and
its associated documentation.

2. Subject to the terms and conditions of this License Agreement, PSF hereby
grants Licensee a nonexclusive, royalty-free, world-wide license to reproduce,
analyze, test, perform and/or display publicly, prepare derivative works,
distribute, and otherwise use Python alone or in any derivative version,
provided, however, that PSF's License Agreement and PSF's notice of copyright,
i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
2011, 2012, 2013, 2014, 2015, 2016 Python Software Foundation; All Rights
Reserved" are retained in Python alone or in any derivative version prepared by
Licensee.

3. In the event Licensee prepares a derivative work that is based on
or incorporates Python or any part thereof, and wants to make
the derivative work available to others as provided herein, then
Licensee hereby agrees to include in any such work a brief summary of
the changes made to Python.

4. PSF is making Python available to Licensee on an "AS IS"
basis.  PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
INFRINGE ANY THIRD PARTY RIGHTS.

5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.

6. This License Agreement will automatically terminate upon a material
breach of its terms and conditions.

7. Nothing in this License Agreement shall be deemed to create any
relationship of agency, partnership, or joint venture between PSF and
Licensee.  This License Agreement does not grant permission to use PSF
trademarks or trade name in a trademark sense to endorse or promote
products or services of Licensee, or any third party.

8. By copying, installing or otherwise using Python, Licensee
agrees to be bound by the terms and conditions of this License
Agreement.


BEOPEN.COM LICENSE AGREEMENT FOR PYTHON 2.0
-------------------------------------------

BEOPEN PYTHON OPEN SOURCE LICENSE AGREEMENT VERSION 1

1. This LICENSE AGREEMENT is between BeOpen.com ("BeOpen"), having an
office at 160 Saratoga Avenue, Santa Clara, CA 95051, and the
Individual or Organization ("Licensee") accessing and otherwise using
this software in source or binary form and its associated
documentation ("the Software").

2. Subject to the terms and conditions of this BeOpen Python License
Agreement, BeOpen hereby grants Licensee a non-exclusive,
royalty-free, world-wide license to reproduce, analyze, test, perform
and/or display publicly, prepare derivative works, distribute, and
otherwise use the Software alone or in any derivative version,
provided, however, that the BeOpen Python License is retained in the
Software, alone or in any derivative version prepared by Licensee.

3. BeOpen is making the Software available to Licensee on an "AS IS"
basis.  BEOPEN MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, BEOPEN MAKES NO AND
DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE SOFTWARE WILL NOT
INFRINGE ANY THIRD PARTY RIGHTS.

4. BEOPEN SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF THE
SOFTWARE FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS
AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THE SOFTWARE, OR ANY
DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.

5. This License Agreement will automatically terminate upon a material
breach of its terms and conditions.

6. This License Agreement shall be governed by and interpreted in all
respects by the law of the State of California, excluding conflict of
law provisions.  Nothing in this License Agreement shall be deemed to
create any relationship of agency, partnership, or joint venture
between BeOpen and Licensee.  This License Agreement does not grant
permission to use BeOpen trademarks or trade names in a trademark
sense to endorse or promote products or services of Licensee, or any
third party.  As an exception, the "BeOpen Python" logos available at
http://www.pythonlabs.com/logos.html may be used according to the
permissions granted on that web page.

7. By copying, installing or otherwise using the software, Licensee
agrees to be bound by the terms and conditions of this License
Agreement.


CNRI LICENSE AGREEMENT FOR PYTHON 1.6.1
---------------------------------------

1. This LICENSE AGREEMENT is between the Corporation for National
Research Initiatives, having an office at 1895 Preston White Drive,
Reston, VA 20191 ("CNRI"), and the Individual or Organization
("Licensee") accessing and otherwise using Python 1.6.1 software in
source or binary form and its associated documentation.

2. Subject to the terms and conditions of this License Agreement, CNRI
hereby grants Licensee a nonexclusive, royalty-free, world-wide
license to reproduce, analyze, test, perform and/or display publicly,
prepare derivative works, distribute, and otherwise use Python 1.6.1
alone or in any derivative version, provided, however, that CNRI's
License Agreement and CNRI's notice of copyright, i.e., "Copyright (c)
1995-2001 Corporation for National Research Initiatives; All Rights
Reserved" are retained in Python 1.6.1 alone or in any derivative
version prepared by Licensee.  Alternately, in lieu of CNRI's License
Agreement, Licensee may substitute the following text (omitting the
quotes): "Python 1.6.1 is made available subject to the terms and
conditions in CNRI's License Agreement.  This Agreement together with
Python 1.6.1 may be located on the Internet using the following
unique, persistent identifier (known as a handle): 1895.22/1013.  This
Agreement may also be obtained from a proxy server on the Internet
using the following URL: http://hdl.handle.net/1895.22/1013".

3. In the event Licensee prepares a derivative work that is based on
or incorporates Python 1.6.1 or any part thereof, and wants to make
the derivative work available to others as provided herein, then
Licensee hereby agrees to include in any such work a brief summary of
the changes made to Python 1.6.1.

4. CNRI is making Python 1.6.1 available to Licensee on an "AS IS"
basis.  CNRI MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, CNRI MAKES NO AND
DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON 1.6.1 WILL NOT
INFRINGE ANY THIRD PARTY RIGHTS.

5. CNRI SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
1.6.1 FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON 1.6.1,
OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.

6. This License Agreement will automatically terminate upon a material
breach of its terms and conditions.

7. This License Agreement shall be governed by the federal
intellectual property law of the United States, including without
limitation the federal copyright law, and, to the extent such
U.S. federal law does not apply, by the law of the Commonwealth of
Virginia, excluding Virginia's conflict of law provisions.
Notwithstanding the foregoing, with regard to derivative works based
on Python 1.6.1 that incorporate non-separable material that was
previously distributed under the GNU General Public License (GPL), the
law of the Commonwealth of Virginia shall govern this License
Agreement only as to issues arising under or with respect to
Paragraphs 4, 5, and 7 of this License Agreement.  Nothing in this
License Agreement shall be deemed to create any relationship of
agency, partnership, or joint venture between CNRI and Licensee.  This
License Agreement does not grant permission to use CNRI trademarks or
trade name in a trademark sense to endorse or promote products or
services of Licensee, or any third party.

8. By clicking on the "ACCEPT" button where indicated, or by copying,
installing or otherwise using Python 1.6.1, Licensee agrees to be
bound by the terms and conditions of this License Agreement.

        ACCEPT


CWI LICENSE AGREEMENT FOR PYTHON 0.9.0 THROUGH 1.2
--------------------------------------------------

Copyright (c) 1991 - 1995, Stichting Mathematisch Centrum Amsterdam,
The Netherlands.  All rights reserved.

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of Stichting Mathematisch
Centrum or CWI not be used in advertising or publicity pertaining to
distribution of the software without specific, written prior
permission.

STICHTING MATHEMATISCH CENTRUM DISCLAIMS ALL WARRANTIES WITH REGARD TO
THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS, IN NO EVENT SHALL STICHTING MATHEMATISCH CENTRUM BE LIABLE
FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


Additional Conditions for this Windows binary build
---------------------------------------------------

This program is linked with and uses Microsoft Distributable Code,
copyrighted by Microsoft Corporation. The Microsoft Distributable Code
includes the following files:

msvcr90.dll
msvcp90.dll
msvcm90.dll

If you further distribute programs that include the Microsoft
Distributable Code, you must comply with the restrictions on
distribution specified by Microsoft. In particular, you must require
distributors and external end users to agree to terms that protect the
Microsoft Distributable Code at least as much as Microsoft's own
requirements for the Distributable Code. See Microsoft's documentation
(included in its developer tools and on its website at microsoft.com)
for specific details.

Redistribution of the Windows binary build of the Python interpreter
complies with this agreement, provided that you do not:

- alter any copyright, trademark or patent notice in Microsoft's
Distributable Code;

- use Microsoft's trademarks in your programs' names or in a way that
suggests your programs come from or are endorsed by Microsoft;

- distribute Microsoft's Distributable Code to run on a platform other
than Microsoft operating systems, run-time technologies or application
platforms; or

- include Microsoft Distributable Code in malicious, deceptive or
unlawful programs.

These restrictions apply only to the Microsoft Distributable Code as
defined above, not to Python itself or any programs running on the
Python interpreter. The redistribution of the Python interpreter and
libraries is governed by the Python Software License included with this
file, or by other licenses as marked.


This copy of Python includes a copy of bzip2, which is licensed under the following terms:


--------------------------------------------------------------------------

This program, "bzip2", the associated library "libbzip2", and all
documentation, are copyright (C) 1996-2010 Julian R Seward.  All
rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. The origin of this software must not be misrepresented; you must 
   not claim that you wrote the original software.  If you use this 
   software in a product, an acknowledgment in the product 
   documentation would be appreciated but is not required.

3. Altered source versions must be plainly marked as such, and must
   not be misrepresented as being the original software.

4. The name of the author may not be used to endorse or promote 
   products derived from this software without specific prior written 
   permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Julian Seward, jseward@bzip.org
bzip2/libbzip2 version 1.0.6 of 6 September 2010

--------------------------------------------------------------------------

This copy of Python includes a copy of Berkeley DB, which is licensed under the following terms:

/*-
 * $Id: LICENSE,v 12.9 2008/02/07 17:12:17 mark Exp $
 */

The following is the license that applies to this copy of the Berkeley DB
software.  For a license to use the Berkeley DB software under conditions
other than those described here, or to purchase support for this software,
please contact Oracle at berkeleydb-info_us@oracle.com.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/*
 * Copyright (c) 1990,2008 Oracle.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Redistributions in any form must be accompanied by information on
 *    how to obtain complete source code for the DB software and any
 *    accompanying software that uses the DB software.  The source code
 *    must either be included in the distribution or be available for no
 *    more than the cost of distribution plus a nominal fee, and must be
 *    freely redistributable under reasonable conditions.  For an
 *    executable file, complete source code means the source code for all
 *    modules it contains.  It does not include source code for modules or
 *    files that typically accompany the major components of the operating
 *    system on which the executable file runs.
 *
 * THIS SOFTWARE IS PROVIDED BY ORACLE ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR
 * NON-INFRINGEMENT, ARE DISCLAIMED.  IN NO EVENT SHALL ORACLE BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 * Copyright (c) 1990, 1993, 1994, 1995
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
/*
 * Copyright (c) 1995, 1996
 *	The President and Fellows of Harvard University.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY HARVARD AND ITS CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL HARVARD OR ITS CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
/***
 * ASM: a very small and fast Java bytecode manipulation framework
 * Copyright (c) 2000-2005 INRIA, France Telecom
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the copyright holders nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

This copy of Python includes a copy of openssl, which is licensed under the following terms:


  LICENSE ISSUES
  ==============

  The OpenSSL toolkit stays under a dual license, i.e. both the conditions of
  the OpenSSL License and the original SSLeay license apply to the toolkit.
  See below for the actual license texts. Actually both licenses are BSD-style
  Open Source licenses. In case of any license issues related to OpenSSL
  please contact openssl-core@openssl.org.

  OpenSSL License
  ---------------

/* ====================================================================
 * Copyright (c) 1998-2016 The OpenSSL Project.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
 *
 * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please contact
 *    openssl-core@openssl.org.
 *
 * 5. Products derived from this software may not be called "OpenSSL"
 *    nor may "OpenSSL" appear in their names without prior written
 *    permission of the OpenSSL Project.
 *
 * 6. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
 *
 * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
 * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 * ====================================================================
 *
 * This product includes cryptographic software written by Eric Young
 * (eay@cryptsoft.com).  This product includes software written by Tim
 * Hudson (tjh@cryptsoft.com).
 *
 */

 Original SSLeay License
 -----------------------

/* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
 * All rights reserved.
 *
 * This package is an SSL implementation written
 * by Eric Young (eay@cryptsoft.com).
 * The implementation was written so as to conform with Netscapes SSL.
 * 
 * This library is free for commercial and non-commercial use as long as
 * the following conditions are aheared to.  The following conditions
 * apply to all code found in this distribution, be it the RC4, RSA,
 * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
 * included with this distribution is covered by the same copyright terms
 * except that the holder is Tim Hudson (tjh@cryptsoft.com).
 * 
 * Copyright remains Eric Young's, and as such any Copyright notices in
 * the code are not to be removed.
 * If this package is used in a product, Eric Young should be given attribution
 * as the author of the parts of the library used.
 * This can be in the form of a textual message at program startup or
 * in documentation (online or textual) provided with the package.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *    "This product includes cryptographic software written by
 *     Eric Young (eay@cryptsoft.com)"
 *    The word 'cryptographic' can be left out if the rouines from the library
 *    being used are not cryptographic related :-).
 * 4. If you include any Windows specific code (or a derivative thereof) from 
 *    the apps directory (application code) you must include an acknowledgement:
 *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
 * 
 * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * 
 * The licence and distribution terms for any publically available version or
 * derivative of this code cannot be changed.  i.e. this code cannot simply be
 * copied and put under another distribution licence
 * [including the GNU Public Licence.]
 */


This copy of Python includes a copy of Tcl, which is licensed under the following terms:

This software is copyrighted by the Regents of the University of
California, Sun Microsystems, Inc., Scriptics Corporation, ActiveState
Corporation and other parties.  The following terms apply to all files
associated with the software unless explicitly disclaimed in
individual files.

The authors hereby grant permission to use, copy, modify, distribute,
and license this software and its documentation for any purpose, provided
that existing copyright notices are retained in all copies and that this
notice is included verbatim in any distributions. No written agreement,
license, or royalty fee is required for any of the authorized uses.
Modifications to this software may be copyrighted by their authors
and need not follow the licensing terms described here, provided that
the new terms are clearly indicated on the first page of each file where
they apply.

IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
MODIFICATIONS.

GOVERNMENT USE: If you are acquiring this software on behalf of the
U.S. government, the Government shall have only "Restricted Rights"
in the software and related documentation as defined in the Federal 
Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
are acquiring the software on behalf of the Department of Defense, the
software shall be classified as "Commercial Computer Software" and the
Government shall have only "Restricted Rights" as defined in Clause
252.227-7013 (b) (3) of DFARs.  Notwithstanding the foregoing, the
authors grant the U.S. Government and others acting in its behalf
permission to use and distribute the software in accordance with the
terms specified in this license. 

This copy of Python includes a copy of Tk, which is licensed under the following terms:

This software is copyrighted by the Regents of the University of
California, Sun Microsystems, Inc., and other parties.  The following
terms apply to all files associated with the software unless explicitly
disclaimed in individual files.

The authors hereby grant permission to use, copy, modify, distribute,
and license this software and its documentation for any purpose, provided
that existing copyright notices are retained in all copies and that this
notice is included verbatim in any distributions. No written agreement,
license, or royalty fee is required for any of the authorized uses.
Modifications to this software may be copyrighted by their authors
and need not follow the licensing terms described here, provided that
the new terms are clearly indicated on the first page of each file where
they apply.

IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
MODIFICATIONS.

GOVERNMENT USE: If you are acquiring this software on behalf of the
U.S. government, the Government shall have only "Restricted Rights"
in the software and related documentation as defined in the Federal
Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
are acquiring the software on behalf of the Department of Defense, the
software shall be classified as "Commercial Computer Software" and the
Government shall have only "Restricted Rights" as defined in Clause
252.227-7013 (b) (3) of DFARs.  Notwithstanding the foregoing, the
authors grant the U.S. Government and others acting in its behalf
permission to use and distribute the software in accordance with the
terms specified in this license.

This copy of Python includes a copy of Tix, which is licensed under the following terms:

Copyright (c) 1993-1999 Ioi Kim Lam.
Copyright (c) 2000-2001 Tix Project Group.
Copyright (c) 2004 ActiveState

This software is copyrighted by the above entities
and other parties.  The following terms apply to all files associated
with the software unless explicitly disclaimed in individual files.

The authors hereby grant permission to use, copy, modify, distribute,
and license this software and its documentation for any purpose, provided
that existing copyright notices are retained in all copies and that this
notice is included verbatim in any distributions. No written agreement,
license, or royalty fee is required for any of the authorized uses.
Modifications to this software may be copyrighted by their authors
and need not follow the licensing terms described here, provided that
the new terms are clearly indicated on the first page of each file where
they apply.

IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
MODIFICATIONS.

GOVERNMENT USE: If you are acquiring this software on behalf of the
U.S. government, the Government shall have only "Restricted Rights"
in the software and related documentation as defined in the Federal 
Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
are acquiring the software on behalf of the Department of Defense, the
software shall be classified as "Commercial Computer Software" and the
Government shall have only "Restricted Rights" as defined in Clause
252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
authors grant the U.S. Government and others acting in its behalf
permission to use and distribute the software in accordance with the
terms specified in this license. 

----------------------------------------------------------------------

Parts of this software are based on the Tcl/Tk software copyrighted by
the Regents of the University of California, Sun Microsystems, Inc.,
and other parties. The original license terms of the Tcl/Tk software
distribution is included in the file docs/license.tcltk.

Parts of this software are based on the HTML Library software
copyrighted by Sun Microsystems, Inc. The original license terms of
the HTML Library software distribution is included in the file
docs/license.html_lib.

                                                          LICENSES/README                                                                                     0000644 0001750 0001750 00000001271 13410204240 012420  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 License
-------
This software is free and open source.
It consists of one core component and several libraries and components defined "app" that could be governed by different licenses. The "LICENSES" folder contains all the licenses:

runtime: license of Python runtime.
core: license of core component.
ui: license of ui component.
app_<appname>: license of each app.
<libname>: license of each library.


Security
--------
To protect your privacy we guarantee that no information will be stored on our servers and communications are encrypted so third parties can't read them anyway.


Software updates
----------------
The updates of this software are automatic.





                                                                                                                                                                                                                                                                                                                                       listener.py                                                                                         0000644 0001750 0001750 00000033537 14140273603 012556  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''
import threading
import time
import ipc
import json
import os
import hashlib
import base64
import utils


##############################
######### IPCSERVER ##########
##############################
class IPCServer(threading.Thread):
    def __init__(self,agent):
        threading.Thread.__init__(self, name="ListenerIPCServer")
        self._agent=agent
        self._prop = None
        self._status = None
        self._config = None
    
    def start(self):
        self._prop = ipc.Property()
        fieldsdef=[]
        fieldsdef.append({"name":"counter","size":30})
        fieldsdef.append({"name":"state","size":5})
        fieldsdef.append({"name":"connections","size":20}) #TO REMOVE 2021-02-11
        fieldsdef.append({"name":"group","size":100*5})
        fieldsdef.append({"name":"name","size":100*5})        
        fieldsdef.append({"name":"request_pid","size":20})
        fieldsdef.append({"name":"request_data","size":1024*16})
        fieldsdef.append({"name":"response_data","size":1024*16})        
        fieldsdef.append({"name":"sessions_status","size":1024*512})
        def fix_perm(fn):
            self._agent.get_osmodule().set_file_permission_everyone(fn)            
        self._prop.create("status_config", fieldsdef, fix_perm)
        self._prop.set_property("response_data","")
        self._prop.set_property("request_data","")
        self._prop.set_property("request_pid","")
        
        self._status=IPCStatus(self._agent,self._prop)
        self._status.start();
        self._config=IPCConfig(self._agent,self._prop)
        self._config.start();
    
    def close(self):
        if self._config!=None:
            self._config.close();
            self._config.join(5000)
        if self._status!=None:
            self._status.close();
            self._status.join(5000)
        self._prop.close()

class IPCStatus(threading.Thread):
    def __init__(self,agent,prop):
        threading.Thread.__init__(self, name="ListenerIPCStatus")
        self.daemon=True
        self._agent=agent
        self._prop=prop
        self._bclose=False
        self._cnt=0

    def run(self):
        logwait=60*10
        while not self._bclose:
            if self._cnt==utils.sys_maxsize:
                self._cnt=0
            else:
                self._cnt+=1
            try:
                self._prop.set_property("counter", str(self._cnt))
                self._prop.set_property("state", str(self._agent.get_status()))
                sapp = self._agent.get_group()
                if sapp is None:
                    sapp=""
                if utils.is_py2():
                    sapp=sapp.encode("unicode-escape");
                self._prop.set_property("group", sapp)
                
                sapp = self._agent.get_name()
                if sapp is None:
                    sapp=""
                if utils.is_py2():
                    sapp=sapp.encode("unicode-escape");
                self._prop.set_property("name", sapp)
                
                jo = self._agent.get_active_sessions_status()                
                self._prop.set_property("connections", str(len(jo))) #TO REMOVE 2021-02-11                
                self._prop.set_property("sessions_status", json.dumps(jo))
            except:
                e=utils.get_exception()
                if logwait>=60*10:
                    logwait=0
                    self._agent.write_except(e)                    
                logwait+=1
            time.sleep(1)
                
        self._bclose=True        
    
    def close(self):
        self._bclose=True
        

class IPCConfig(threading.Thread):
    
    def __init__(self,agent,prop):
        threading.Thread.__init__(self, name="ListenerIPCConfig")
        self.daemon=True
        self._agent=agent
        self._prop=prop
        self._bclose=False
        self._cnt=0
        
    
    def run(self):

        while not self._bclose:
            #VARIFICA NUOVE RICHIESTE DI CONFIGURAZIONE
            request_pid = self._prop.get_property("request_pid");
            if request_pid!="":
                try:
                    request_data = None
                    #Wait 2 seconds for request
                    for i in range(20):
                        request_data = self._prop.get_property("request_data");
                        if request_data!="":
                            break
                        time.sleep(0.1)
                    if request_data is not None:
                        self._prop.set_property("response_data",self._invoke_request(request_data))
                        #Wait 2 seconds for read response
                        for i in range(20):
                            if self._prop.get_property("request_data")=="":
                                break
                            time.sleep(0.1)
                except:
                    e=utils.get_exception()
                    self._agent.write_except(e);
                self._prop.set_property("response_data","")
                self._prop.set_property("request_data","")
                self._prop.set_property("request_pid","")
            time.sleep(0.1)
        self._bclose=True
    
    def _invoke_request(self, request_data):
        if request_data!=None:
            try:
                prms=json.loads(request_data)
                req = prms["_request"]
                func = getattr(self,  '_req_' + req)
                try:
                    return func(prms)
                except:
                    e=utils.get_exception()
                    return "ERROR:" + utils.exception_to_string(e)
            except:
                return "ERROR:INVALID_REQUEST"
        else:
            return "ERROR:INVALID_REQUEST"
    
    def _req_check_auth(self, prms):
        if "_user" in prms and "_password" in prms :
            usr=prms["_user"]
            pwd=prms["_password"]
            if self._agent.check_config_auth(usr, pwd):
                return "OK"
        return "ERROR:FORBIDDEN"

    def _req_change_pwd(self, prms):
        if 'nopassword' in prms:
            nopwd = prms['nopassword']
            if nopwd=='true':
                self._agent.set_config_password("")
                return "OK"
            else:
                return "ERROR:INVALID_AUTHENTICATION"
        elif 'password' in prms:
            pwd = prms['password']
            self._agent.set_config_password(pwd)
            return "OK"
        else:
            return "ERROR:INVALID_AUTHENTICATION"
    
    def _req_set_config(self, prms):
        if "key" in prms and "value" in prms :
            key=prms["key"]
            value=prms["value"]
            self._agent.set_config_str(key, value)
            return "OK"
        return "ERROR:INVALID_PARAMETERS."
    
    def _req_get_config(self, prms):
        if "key" in prms:
            key=prms["key"]
            return "OK:" + self._agent.get_config_str(key)
        return "ERROR:INVALID_PARAMETERS."
        
    def _req_remove_key(self, prms):
        self._agent.remove_key()
        return "OK"
    
    def _req_install_key(self, prms):
        if "code" in prms:
            code=prms["code"]
            self._agent.install_key(code)
            return "OK"
        return "ERROR:INVALID_PARAMETERS."
    
    def _req_install_new_agent(self, prms):
        #user, password, name, id
        if "user" in prms and "password" in prms and "name" in prms:
            user=prms["user"]
            password=prms["password"]
            name=prms["name"]
            self._agent.install_new_agent(user,password,name)
            return "OK"
        return "ERROR:INVALID_PARAMETERS."
    
    def _req_set_proxy(self, prms):
        ptype = None
        host = None
        port = None
        user = None
        password = None
        if 'type' in prms:
            ptype = prms['type']
        if 'host' in prms:
            host = prms['host']
        if 'port' in prms and prms['port'] is not None and prms['port'].strip()!="":
            port = int(prms['port'])
        if 'user' in prms:
            user = prms['user']
        if 'password' in prms:
            password = prms['password']
        self._agent.set_proxy(ptype,  host,  port,  user,  password)
        return "OK"

    
    def close(self):
        self._bclose=True

class IPCClient():
    
    def __init__(self,path=None):
        self._prop=ipc.Property()
        self._prop.open("status_config",bpath=path)
    
    def close(self):
        self._prop.close()
        self._prop=None
    
    def is_close(self):
        return self._prop is None or self._prop.is_close()

    def get_property(self,name):
        return self._prop.get_property(name)

    def send_request(self, usr, pwd, req, prms=None):
        sret=""
        try:
            spid=str(os.getpid())
            bok=False
            #Attende 40 secondi
            cnt=self._prop.get_property("counter")
            testcnt=0
            for i in range(400):
                bok=True
                if self._prop.get_property("request_pid")=="": #PRONTO AD ACCETTARE RICHIESTE
                    self._prop.set_property("request_pid",spid)
                    if prms is None:
                        prms={}
                    prms["_request"]=req
                    prms["_user"]=usr
                    #Hash password
                    encpwd=hashlib.sha256(utils.str_to_bytes(pwd,"utf8")).digest()
                    encpwd=base64.b64encode(encpwd)
                    prms["_password"]=utils.bytes_to_str(encpwd)
                    
                    self._prop.set_property("request_data",json.dumps(prms))
                    self._prop.set_property("response_data","")
                    break
                time.sleep(0.1)
                testcnt+=1
                if testcnt==20:
                    testcnt=0
                    appcnt=self._prop.get_property("counter")
                    if cnt==appcnt:
                        break
            if bok:
                #Attende 40 secondi
                cnt=self._prop.get_property("counter")
                testcnt=0
                for i in range(400):
                    sret=self._prop.get_property("response_data")
                    #Gestione concorrenza
                    if self._prop.get_property("request_pid")!=spid:
                        sret=""
                        break
                    if sret!="":
                        break
                    time.sleep(0.1)
                    testcnt+=1
                    if testcnt==20:
                        testcnt=0
                        appcnt=self._prop.get_property("counter")
                        if cnt==appcnt:
                            break
                if self._prop.get_property("request_pid")==spid:
                    self._prop.set_property("response_data","")
                    self._prop.set_property("request_data","")
                if sret=="":
                    sret = 'ERROR:REQUEST_TIMEOUT'
            else:
                sret = 'ERROR:REQUEST_TIMEOUT'
        except: 
            sret = 'ERROR:REQUEST_TIMEOUT'
        return sret



###############################
######### HTTPSERVER ##########
###############################
#CREATO PER USI FUTURI
class HttpServer(threading.Thread):
    
    def __init__(self, port,  agent):
        threading.Thread.__init__(self, name="HttpServer")
        self.daemon=True
        self._agent = agent
        self._port = port
        self._close=False
        self._httpd = None
    
    def run(self):        
        self._httpd = HttpConfigServer(self._port,  self._agent)
        self._close=False
        while not self._close:
            self._httpd.handle_request()

    def close(self):
        if  not self._close:
            self._close=True
            try:
                self._httpd.server_close()
            except:
                None
            self._httpd = None

'''
La versione attiva lascia la porta aperta in linux e mac
quella commentata da testare non vorrei che self._httpd.shutdown() blocca il thread principale
class HttpServer(threading.Thread):
    
    def __init__(self, port,  agent):
        threading.Thread.__init__(self, name="AgentListener")
        self.daemon=True
        self._agent = agent
        self._port = port
        self._close=False
        self._httpd = None
    
    def run(self):        
        self._httpd = HttpConfigServer(self._port,  self._agent)
        self._close=False
        self._httpd.serve_forever()
        self._httpd = None

    def close(self):
        if  not self._close:
            self._close=True
            self._httpd.shutdown() 
'''
class HttpConfigServer(utils.HTTPServer):
    
    def __init__(self, port, agent):
        server_address = ('127.0.0.1', port)
        utils.HTTPServer.__init__(self, server_address, HttpConfigHandler)
        self._agent = agent
    
    def get_agent(self):
        return self._agent


class HttpConfigHandler(utils.BaseHTTPRequestHandler):

    def do_GET(self):
        #Legge richiesta
        o = utils.url_parse(self.path)
        nm = o.path
        qs = utils.url_parse_qs(o.query)
        #Invia risposta
        resp={}
        resp['code']=404
        if 'code' in resp:
            self.send_response(resp['code'])
        else:
            self.send_response(200)
        if 'headers' in resp:
            hds = resp['headers']
            for k in hds.keys():
                self.send_header(k, hds[k])
            self.end_headers()
        if 'data' in resp:
            self.wfile.write(resp['data'])
        
    def do_HEAD(self):
        self.send_response(404)

    def do_POST(self):
        self.send_response(404)
    
    def log_message(self, format, *args):
        return



if __name__ == "__main__":
    ac = HttpServer(9000, None)
    ac.start()
    ac.join()
    
    
    
    
                                                                                                                                                                 native/                                                                                             0000755 0001750 0001750 00000000000 14140517417 011636  5                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 native/dwagent.service                                                                              0000644 0001750 0001750 00000000402 13777623120 014651  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 [Unit]
Description=@NAME@
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/bin/sh -c '"@PATH_DWA@/native/dwagsvc" start_internal'
ExecStop=/bin/sh -c '"@PATH_DWA@/native/dwagsvc" stop_internal'

[Install]
WantedBy=multi-user.target





                                                                                                                                                                                                                                                              native/systray.desktop                                                                              0000644 0001750 0001750 00000000211 14000355257 014736  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 [Desktop Entry]
Encoding=UTF-8
Type=Application
Terminal=false
Icon=@PATH_LOGOOS@
Exec="@PATH_DWA@/native/systray"
Name=@NAME@ - Systray
                                                                                                                                                                                                                                                                                                                                                                                       native/dwagent.desktop                                                                              0000644 0001750 0001750 00000000300 14000354570 014645  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 [Desktop Entry]
Encoding=UTF-8
Version=1.0
Terminal=false
Icon=@PATH_LOGOOS@
Exec="@PATH_DWA@/native/@EXE_NAME@"
Categories=System;Application;
Type=Application
Name=@NAME@
GenericName=@NAME@
                                                                                                                                                                                                                                                                                                                                native/dwagsvc                                                                                      0000644 0001750 0001750 00000030444 14140245565 013226  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 #!/bin/sh
#
# chkconfig: 2345 80 30
# description: @NAME@ Service
#
### BEGIN INIT INFO
# Provides: @NAME@
# Required-Start:
# Required-Stop:
# Should-Start:
# Should-Stop:
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start and Stop @NAME@ Service
# Description: @NAME@ Service
### END INIT INFO
#This Source Code Form is subject to the terms of the Mozilla
#Public License, v. 2.0. If a copy of the MPL was not distributed
#with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

RETVAL=0
PATH_DWA="@PATH_DWA@"
PATH_DWA_NATIVE="$PATH_DWA/native"
PATH_DWA_RUNTIME="$PATH_DWA/runtime/bin"
PATH_DWA_RUNTIME_LIBRARY="$PATH_DWA/runtime/lib"
TIMEOUT_START_STOP=30
INST_VER=0
if [ -f "${PATH_DWA_NATIVE}/installer.ver" ]; then
	INST_VER=$(cat "${PATH_DWA_NATIVE}/installer.ver")
fi

install_systemctl(){
	if [ ! -f /etc/systemd/system/@EXE_NAME@.service ]; then
		cp "${PATH_DWA_NATIVE}/@EXE_NAME@.service" /etc/systemd/system/@EXE_NAME@.service
		if [ $? -eq 0 ]; then
			systemctl --system daemon-reload
			systemctl enable @EXE_NAME@.service
			if [ $? -eq 0 ]; then
				echo "systemctl" > "${PATH_DWA_NATIVE}/service.mng"
				echo "Installed"
			else
				echo "Error: Enable systemctl."
				RETVAL=11
			fi
		else
			echo "Error: Copy file service in systemd."
			RETVAL=12
		fi
	else
		echo "Error: Service already installed."
		RETVAL=1
	fi
}

install_chkconfig(){
	if [ ! -f /etc/init.d/@EXE_NAME@ ]; then
		ln -s "${PATH_DWA_NATIVE}/dwagsvc" /etc/init.d/@EXE_NAME@
		if [ $? -eq 0 ]; then
			chkconfig --add @EXE_NAME@
			if [ $? -eq 0 ]; then
				echo "chkconfig" > "${PATH_DWA_NATIVE}/service.mng"
				echo "Installed"
			else
				echo "Error: Add chkconfig."
				RETVAL=11
			fi
		else
			echo "Error: Create symbolic link."
			RETVAL=12
		fi
	else
		echo "Error: Service already installed."
		RETVAL=1
	fi
}

install_updatercd(){
	if [ ! -f /etc/init.d/@EXE_NAME@ ]; then
		ln -s "${PATH_DWA_NATIVE}/dwagsvc" /etc/init.d/@EXE_NAME@
		if [ $? -eq 0 ]; then
			#update-rc.d -f @EXE_NAME@ start 80 2 3 4 5 . stop 30 0 1 6 .
			update-rc.d -f @EXE_NAME@ defaults
			if [ $? -eq 0 ]; then
				echo "updatercd" > "${PATH_DWA_NATIVE}/service.mng"
				echo "Installed"
			else
				echo "Error: Add update-rc.d."
				RETVAL=11
			fi
		else
			echo "Error: Create symbolic link."
			RETVAL=12
		fi
	else
		echo "Error: Service already installed."
		RETVAL=1
	fi
}

install_rclocal(){
	if [ ! -f /etc/rc.d/rc.@EXE_NAME@ ]; then
		ln -s "${PATH_DWA_NATIVE}/dwagsvc" /etc/rc.d/rc.@EXE_NAME@
        if [ -f /etc/rc.d/rc.local ]; then
			sed -i '/\/etc\/rc.d\/rc.@EXE_NAME@ start/d' /etc/rc.d/rc.local
        fi
        echo "/etc/rc.d/rc.@EXE_NAME@ start" >> /etc/rc.d/rc.local
        if [ -f /etc/rc.d/rc.local_shutdown ]; then
        	sed -i '/\/etc\/rc.d\/rc.@EXE_NAME@ stop/d' /etc/rc.d/rc.local_shutdown
        fi
        echo "/etc/rc.d/rc.@EXE_NAME@ stop" >> /etc/rc.d/rc.local_shutdown
        chmod +x /etc/rc.d/rc.local_shutdown
        echo "rclocal" > "${PATH_DWA_NATIVE}/service.mng"
        echo "Installed"
	else
		echo "Error: Service already installed."
		RETVAL=1
	fi   
}

install(){
	if [ "$(which "systemctl" 2>/dev/null)" ] && [ "$(systemctl list-units -t service 2>/dev/null)" ]; then
    	install_systemctl
    elif [ "$(which "chkconfig" 2>/dev/null)" ]; then
    	install_chkconfig
	elif [ "$(which "update-rc.d" 2>/dev/null)" ]; then
        install_updatercd
    elif [ -f /etc/rc.d/rc.local ]; then
    	install_rclocal
	else
		echo "Error: Missing systemctl or chkconfig or update-rc.d command."
		RETVAL=2
	fi
}

delete_systemctl(){
	if [ -f /etc/systemd/system/@EXE_NAME@.service ]; then
		systemctl disable @EXE_NAME@.service
		if [ $? -eq 0 ]; then
			rm /etc/systemd/system/@EXE_NAME@.service
			if [ $? -eq 0 ]; then
				systemctl --system daemon-reload
				if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
					rm "${PATH_DWA_NATIVE}/service.mng"
				fi
				echo "Deleted"
			else
				echo "Error: Remove service file."
				RETVAL=11
			fi
		else
			echo "Error: Disable service in systemd."
			RETVAL=12
		fi
	else
		echo "Error: Service not installed."
		RETVAL=1
	fi
}

delete_chkconfig(){
	if [ -f /etc/init.d/@EXE_NAME@ ]; then
		chkconfig --del @EXE_NAME@
		if [ $? -eq 0 ]; then
			rm /etc/init.d/@EXE_NAME@
			if [ $? -eq 0 ]; then
				if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
					rm "${PATH_DWA_NATIVE}/service.mng"
				fi
				echo "Deleted"
			else
				echo "Error: Remove symbolic link."
				RETVAL=12
			fi
		else
			echo "Error: Del chkconfig."
			RETVAL=11
		fi
	else
		chkconfig --del @EXE_NAME@ &>/dev/null
		echo "Error: Service not installed."
		RETVAL=1
	fi
}

delete_updatercd(){
	if [ -f /etc/init.d/@EXE_NAME@ ]; then
		update-rc.d -f @EXE_NAME@ remove
		if [ $? -eq 0 ]; then
			rm /etc/init.d/@EXE_NAME@
			if [ $? -eq 0 ]; then
				if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
					rm "${PATH_DWA_NATIVE}/service.mng"
				fi
				echo "Deleted"
			else
				echo "Error: Remove symbolic link."
				RETVAL=12
			fi
		else
			echo "Error: Del update-rc.d."
			RETVAL=11
		fi
	else
		update-rc.d -f @EXE_NAME@ remove > /dev/null 2>&1
		echo "Error: Service not installed."
		RETVAL=1
	fi
}

delete_rclocal(){
	if [ -f /etc/rc.d/rc.@EXE_NAME@ ]; then
    	if [ -f /etc/rc.d/rc.local ]; then
			sed -i '/\/etc\/rc.d\/rc.@EXE_NAME@ start/d' /etc/rc.d/rc.local
        fi
        if [ -f /etc/rc.d/rc.local_shutdown ]; then
        	sed -i '/\/etc\/rc.d\/rc.@EXE_NAME@ stop/d' /etc/rc.d/rc.local_shutdown
        fi
        rm /etc/rc.d/rc.@EXE_NAME@
        if [ $? -eq 0 ]; then
			if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
				rm "${PATH_DWA_NATIVE}/service.mng"
            fi
        	echo "Deleted"
        else
        	echo "Error: Remove symbolic link."
        	RETVAL=12
        fi
    else			
		echo "Error: Service not installed."
		RETVAL=1
	fi
}

delete(){
	if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
		if [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "systemctl" ]; then
			delete_systemctl
		elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "chkconfig" ]; then
			delete_chkconfig
		elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "updatercd" ]; then
			delete_updatercd
        elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "rclocal" ]; then
			delete_rclocal
		fi				
	else
		if [ "$(which "systemctl" 2>/dev/null)" ] && [ "$(systemctl list-units -t service 2>/dev/null)" ]; then
			delete_systemctl
		elif [ "$(which "chkconfig" 2>/dev/null)" ]; then
			delete_chkconfig
		elif [ "$(which "update-rc.d" 2>/dev/null)" ]; then
			delete_updatercd
        elif [ -f /etc/rc.d/rc.local ]; then
        	delete_rclocal
		else
			echo "Error: Missing chkconfig or update-rc.d command."
			RETVAL=2
		fi
	fi
}

rem_file() {
	if [ -f $1 ]; then
		rm -f $1
	fi
}

test_pid() {
	if [ -f dwagent.pid ]; then
		PIDDW=`cat dwagent.pid`
		kill -0 $PIDDW > /dev/null 2>&1
		if test $? -eq 0; then
			return 1
		else
			echo "Warning: @NAME@ is not running, but pid file exists "
			rem_file dwagent.pid
		fi
	fi
	return 0
}

run() {
	cd "${PATH_DWA}"
	test_pid
	if [ $? -eq 0 ]; then
		echo $$ > dwagent.pid
		while [ ! -f dwagent.stop ]
		do
			. "${PATH_DWA_NATIVE}/dwagupd"
			if check_update "${PATH_DWA}"; then
				cd "${PATH_DWA}"
				export LD_LIBRARY_PATH=${PATH_DWA_RUNTIME_LIBRARY}
				export PYTHONIOENCODING=utf-8
				"${PATH_DWA_RUNTIME}/@EXE_NAME@" agent.py -filelog
			fi
			for X in $(seq 5)
			do
				if [ ! -f dwagent.stop ]; then
					sleep 1
				fi
			done
		done
		rem_file dwagent.stop
		rem_file dwagent.pid
	else
		echo "Error: @NAME@ already run."
	fi
}

start_internal() {
	cd "${PATH_DWA}"
	test_pid
	if [ $? -eq 0 ]; then
		echo "Starting @NAME@ daemon"
		rem_file dwagent.stop
		rem_file dwagent.start
		export LD_LIBRARY_PATH=${PATH_DWA_RUNTIME_LIBRARY}
		export PYTHONIOENCODING=utf-8
		"${PATH_DWA_RUNTIME}/@EXE_NAME@" "${PATH_DWA}/daemon.py" "${PATH_DWA_NATIVE}/dwagsvc" run  > "${PATH_DWA_NATIVE}/service.log" 2>&1
		c=0
		while [ ! -f dwagent.start ]
		do
			sleep 1
			c=`expr $c + 1`
			if [ $c -ge $TIMEOUT_START_STOP ]; then
				echo "Warning: Starting timeout."
				RETVAL=11
				break
			fi
		done
		rem_file dwagent.start
	else
		echo "@NAME@ already stared."
		RETVAL=1
	fi
}

start() {
	if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
		if [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "systemctl" ]; then
			if ! systemctl start @EXE_NAME@.service; then
				RETVAL=1
			fi
		elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "chkconfig" ]; then
			if [ "$(which "start-stop-daemon" 2>/dev/null)" ]; then
				if ! start-stop-daemon --start --quiet --oknodo --exec "${PATH_DWA_NATIVE}/dwagsvc" -- start_internal; then
					RETVAL=1
				fi
			else
				start_internal
			fi
		elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "updatercd" ]; then
			if [ "$(which "start-stop-daemon" 2>/dev/null)" ]; then
				if ! start-stop-daemon --start --quiet --oknodo --exec "${PATH_DWA_NATIVE}/dwagsvc" -- start_internal; then
					RETVAL=1
				fi
			else
				start_internal
			fi
		else
			start_internal
		fi				
	else
		if [ "$(which "systemctl" 2>/dev/null)" ] && [ "$(systemctl list-units -t service 2>/dev/null)" ]; then
			if ! systemctl start @EXE_NAME@.service; then
				RETVAL=1
			fi
		elif [ "$(which "chkconfig" 2>/dev/null)" ]; then
			if [ "$(which "start-stop-daemon" 2>/dev/null)" ]; then
				if ! start-stop-daemon --start --quiet --oknodo --exec "${PATH_DWA_NATIVE}/dwagsvc" -- start_internal; then
					RETVAL=1
				fi
			else
				start_internal
			fi
		elif [ "$(which "update-rc.d" 2>/dev/null)" ]; then
			if [ "$(which "start-stop-daemon" 2>/dev/null)" ]; then
				if ! start-stop-daemon --start --quiet --oknodo --exec "${PATH_DWA_NATIVE}/dwagsvc" -- start_internal; then
					RETVAL=1
				fi
			else
				start_internal
			fi
		else
			start_internal
		fi
	fi
}

stop_internal() {
	cd "${PATH_DWA}"
	test_pid
	if [ $? -eq 1 ]; then
		echo "Stopping @NAME@ daemon"
		echo "" > dwagent.stop
		c=0
		while [ -f dwagent.stop ]
		do
			sleep 1
			c=`expr $c + 1`
			if [ $c -ge $TIMEOUT_START_STOP ]; then
				echo "Warning: Stopping timeout."
				PIDDW=`cat dwagent.pid`
				echo "Warning: Kill process $PIDDW."
				kill -9 $PIDDW
				break
			fi
		done
	else
		echo "@NAME@ already stopped."
		RETVAL=1
	fi
}

stop() {
	if [ -f "${PATH_DWA_NATIVE}/service.mng" ]; then
		if [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "systemctl" ]; then
			if ! systemctl stop @EXE_NAME@.service; then
				RETVAL=1
			fi
		elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "chkconfig" ]; then
			stop_internal
		elif [ "$(cat "${PATH_DWA_NATIVE}/service.mng")" = "updatercd" ]; then
			stop_internal
		else
			stop_internal
		fi				
	else
		if [ "$(which "systemctl" 2>/dev/null)" ] && [ "$(systemctl list-units -t service 2>/dev/null)" ]; then
			if ! systemctl stop @EXE_NAME@.service; then
				RETVAL=1
			fi
		elif [ "$(which "chkconfig" 2>/dev/null)" ]; then
			stop_internal
		elif [ "$(which "update-rc.d" 2>/dev/null)" ]; then
			stop_internal
		else
			stop_internal
		fi
	fi
}

restart() {
	stop
	start
}

status() {
	cd "${PATH_DWA}"
	test_pid
	if [ ! $? -eq 1 ]; then
		echo "Not running."
		RETVAL=3
	else
		echo "Running."
	fi
}

install_bin(){
	ln -s '@PATH_DWA@/native/@EXE_NAME@' $1/@EXE_NAME@_monitor
	ln -s '@PATH_DWA@/native/configure' $1/@EXE_NAME@_configure
	ln -s '@PATH_DWA@/native/uninstall' $1/@EXE_NAME@_uninstall
}

uninstall_bin(){
	if [ -f $1/@EXE_NAME@_monitor ]; then
		rm $1/@EXE_NAME@_monitor
	fi
	if [ -f $1/@EXE_NAME@_configure ]; then
		rm $1/@EXE_NAME@_configure
	fi
	if [ -f $1/@EXE_NAME@_uninstall ]; then
		rm $1/@EXE_NAME@_uninstall
	fi
}

install_shortcuts(){
	if [ -d /usr/bin ]; then
		install_bin /usr/bin
	elif [ -d /bin ]; then
		install_bin /bin
	fi
	if [ "$(which "xdg-desktop-menu")" ]; then
		cd "${PATH_DWA_NATIVE}"
		xdg-desktop-menu install --noupdate --mode system --novendor @EXE_NAME@.desktop
		xdg-desktop-menu forceupdate
	else
		RETVAL=1
	fi
}

uninstall_shortcuts(){
	uninstall_bin /usr/bin
	uninstall_bin /bin
	if [ "$(which "xdg-desktop-menu")" ]; then
		cd "${PATH_DWA_NATIVE}"
		xdg-desktop-menu uninstall --mode system --novendor @EXE_NAME@.desktop
	else
		RETVAL=1
	fi
}

case "$1" in
start)
  start
;;
start_internal)
  start_internal
;;
stop_internal)
  stop_internal
;;
stop)
  stop
;;
restart)
  restart
;;
status)
  status
;;
run)
  run
;;
install)
  install
;;
delete)
  delete
;;
install_shortcuts)
  install_shortcuts
;;
uninstall_shortcuts)
  uninstall_shortcuts
;;
*)
echo $"Usage: $0 {start|stop|restart}"
exit 1
esac

exit $RETVAL
                                                                                                                                                                                                                            native/uninstall                                                                                    0000644 0001750 0001750 00000002221 14137773665 013606  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 #!/bin/sh
#This Source Code Form is subject to the terms of the Mozilla
#Public License, v. 2.0. If a copy of the MPL was not distributed
#with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

PATH_DWA="@PATH_DWA@"
PATH_DWA_RUNTIME="$PATH_DWA/runtime/bin"
PATH_DWA_RUNTIME_LIBRARY="$PATH_DWA/runtime/lib"
PATH_DWA_NATIVE="$PATH_DWA/native"

if [ "$(id -u)" != "0" ]; then
	echo "You must have root privileges to run this installer. Please try again, this time running the script using the root user." 
	exit 1
else

	#FIX LIBZ 
	unlink "${PATH_DWA_RUNTIME_LIBRARY}/libz.so.1.2.8"
	
	cd "${PATH_DWA}"
	export LD_LIBRARY_PATH=${PATH_DWA_RUNTIME_LIBRARY}
	export PYTHONIOENCODING=utf-8
	"${PATH_DWA_RUNTIME}/@EXE_NAME@" installer.py uninstall $@
	if [ ! $? -eq 0 ]; then
		echo "Error starting gui, attempt to start console mode..."
		"${PATH_DWA_RUNTIME}/@EXE_NAME@" installer.py uninstall -console
	fi
	if [ -f "${PATH_DWA}/agent.uninstall" ]; then
		cd /tmp
		echo '#!/bin/sh' > @EXE_NAME@_remove
		echo 'sleep 2' >> @EXE_NAME@_remove
		echo 'rm -r -f "@PATH_DWA@"' >> @EXE_NAME@_remove
		chmod u+x @EXE_NAME@_remove
		./@EXE_NAME@_remove &
	fi
fi
exit 0
                                                                                                                                                                                                                                                                                                                                                                               native/configure                                                                                    0000644 0001750 0001750 00000001314 14137773754 013557  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 #!/bin/sh
#This Source Code Form is subject to the terms of the Mozilla
#Public License, v. 2.0. If a copy of the MPL was not distributed
#with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

PATH_DWA="@PATH_DWA@"
PATH_DWA_RUNTIME="$PATH_DWA/runtime/bin"
PATH_DWA_RUNTIME_LIBRARY="$PATH_DWA/runtime/lib"
PATH_DWA_NATIVE="$PATH_DWA/native"

#FIX LIBZ 
unlink "${PATH_DWA_RUNTIME_LIBRARY}/libz.so.1.2.8"

cd "${PATH_DWA}"
export LD_LIBRARY_PATH=${PATH_DWA_RUNTIME_LIBRARY}
export PYTHONIOENCODING=utf-8
"${PATH_DWA_RUNTIME}/@EXE_NAME@" configure.py $@
if [ ! $? -eq 0 ]; then
	echo "Error starting gui, attempt to start console mode..."
	"${PATH_DWA_RUNTIME}/@EXE_NAME@" configure.py -console
fi
exit 0
                                                                                                                                                                                                                                                                                                                    native/systray                                                                                      0000644 0001750 0001750 00000001002 14137773703 013300  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 #!/bin/sh
#This Source Code Form is subject to the terms of the Mozilla
#Public License, v. 2.0. If a copy of the MPL was not distributed
#with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

PATH_DWA="@PATH_DWA@"
PATH_DWA_RUNTIME="$PATH_DWA/runtime/bin"
PATH_DWA_RUNTIME_LIBRARY="$PATH_DWA/runtime/lib"
PATH_DWA_NATIVE="$PATH_DWA/native"

cd "${PATH_DWA}"
export LD_LIBRARY_PATH=${PATH_DWA_RUNTIME_LIBRARY}
export PYTHONIOENCODING=utf-8
"${PATH_DWA_RUNTIME}/@EXE_NAME@" monitor.py systray &
exit 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              native/dwagent                                                                                      0000644 0001750 0001750 00000001304 14137773547 013226  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 #!/bin/sh
#This Source Code Form is subject to the terms of the Mozilla
#Public License, v. 2.0. If a copy of the MPL was not distributed
#with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

PATH_DWA="@PATH_DWA@"
PATH_DWA_RUNTIME="$PATH_DWA/runtime/bin"
PATH_DWA_RUNTIME_LIBRARY="$PATH_DWA/runtime/lib"
PATH_DWA_NATIVE="$PATH_DWA/native"

#FIX LIBZ 
unlink "${PATH_DWA_RUNTIME_LIBRARY}/libz.so.1.2.8"

cd "${PATH_DWA}"
export LD_LIBRARY_PATH=${PATH_DWA_RUNTIME_LIBRARY}
export PYTHONIOENCODING=utf-8
"${PATH_DWA_RUNTIME}/@EXE_NAME@" monitor.py $@
if [ ! $? -eq 0 ]; then
	echo "Error starting gui, attempt to start console mode..."
	"${PATH_DWA_RUNTIME}/@EXE_NAME@" monitor.py info
fi
exit 0
                                                                                                                                                                                                                                                                                                                            native.py                                                                                           0000755 0001750 0001750 00000055652 14140273606 012227  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import ctypes
import utils
import os
import stat
import subprocess
import sys
import time
import ipc
import threading
import signal
import json

GUILNC_ARG_MAX=10
GUILNC_ARG_SIZE=1024

_nativemap={}
_nativemap["semaphore"] = threading.Condition()

def get_instance():
    oret=None
    _nativemap["semaphore"].acquire()
    try:
        if "instance" in _nativemap:
            oret=_nativemap["instance"]
        else:
            if utils.is_windows():
                oret = Windows()
            elif utils.is_linux():
                oret = Linux()
            elif utils.is_mac():
                oret = Mac()
            oret.load_library();
            _nativemap["instance"]=oret
    finally:
        _nativemap["semaphore"].release()
    return oret

def fmain(args):
    if utils.is_mac():
        if len(args)>1:
            a1=args[1]
            if a1 is not None and a1.lower()=="guilnc":
                main = Mac()
                main.start_guilnc()
                sys.exit(0)

def get_suffix():
    if utils.is_windows():
        return "win"
    elif utils.is_linux():
        return "linux"
    elif utils.is_mac():
        return "mac"
    return None

def get_library_config(name):
    fn=None
    if utils.path_exists(".srcmode"):
        fn=".." + utils.path_sep + "lib_" + name + utils.path_sep + "config.json"        
    else:
        fn="native" + utils.path_sep + "lib_" + name + ".json"
    if utils.path_exists(fn):
        f = utils.file_open(fn)
        jsapp = json.loads(f.read())
        f.close()
        return jsapp
    else:
        return None

def _load_libraries_with_deps(ar,name):
    cnflib=get_library_config(name)
    if cnflib is not None:
        if "lib_dependencies" in cnflib:
            for ln in cnflib["lib_dependencies"]:
                _load_libraries_with_deps(ar,ln)
        if "filename_" + get_suffix() in cnflib:
            fn = cnflib["filename_" + get_suffix()]
            ar.insert(0,_load_lib_obj(fn))

def load_libraries_with_deps(name):
    lstlibs=[]
    _load_libraries_with_deps(lstlibs,name)
    return lstlibs

def unload_libraries(lstlibs):
    for i in range(len(lstlibs)):
        _unload_lib_obj(lstlibs[i])

def _load_lib_obj(name):
    retlib = None
    if utils.is_windows():
        if not utils.path_exists(".srcmode"):
            retlib = ctypes.CDLL("native\\" + name)
        else:
            retlib = ctypes.CDLL("..\\make\\native\\" + name)
        if retlib is None:
            raise Exception("Missing library " + name + ".")
    elif utils.is_linux():
        if not utils.path_exists(".srcmode"):
            retlib  = ctypes.CDLL("native/" + name, ctypes.RTLD_GLOBAL)
        else: 
            retlib = ctypes.CDLL("../make/native/" + name, ctypes.RTLD_GLOBAL)
        if retlib is None:
            raise Exception("Missing library " + name + ".")
    elif utils.is_mac():
        if not utils.path_exists(".srcmode"):
            retlib  = ctypes.CDLL("native/" + name, ctypes.RTLD_GLOBAL)
        else: 
            retlib = ctypes.CDLL("../make/native/" + name, ctypes.RTLD_GLOBAL)
        if retlib is None:
            raise Exception("Missing library " + name + ".")
    return retlib;
    

def _unload_lib_obj(olib):
    if olib is not None:
        try:
            if utils.is_windows():
                import _ctypes
                _ctypes.FreeLibrary(olib._handle)
                del olib
            elif utils.is_linux():
                import _ctypes
                _ctypes.dlclose(olib._handle)
                del olib
            elif utils.is_mac():
                import _ctypes
                _ctypes.dlclose(olib._handle)
                del olib
        except:
            None
'''
del olib
    olib.dlclose(olib._handle)
while isLoaded('./mylib.so'):
    dlclose(handle)

It's so unclean that I only checked it works using:

def isLoaded(lib):
   libp = utils.path_absname(lib)
   ret = os.system("lsof -p %d | grep %s > /dev/null" % (os.getpid(), libp))
   return (ret == 0)

def dlclose(handle)
   libdl = ctypes.CDLL("libdl.so")
   libdl.dlclose(handle)
'''

class Windows():
        
    def __init__(self):
        self._dwaglib=None

    def load_library(self):
        if self._dwaglib is None:
            self._dwaglib = _load_lib_obj("dwaglib.dll");
    
    def unload_library(self):
        _unload_lib_obj(self._dwaglib)
        self._dwaglib=None
    
    def get_library(self):
        return self._dwaglib

    def task_kill(self, pid) :
        bret = self._dwaglib.taskKill(pid)
        return bret==1
    
    def is_task_running(self, pid):
        bret=self._dwaglib.isTaskRunning(pid);
        return bret==1
    
    def set_file_permission_everyone(self,fl):
        self._dwaglib.setFilePermissionEveryone(fl)    
    
    def fix_file_permissions(self,operation,path,path_src=None):
        None
        
    def is_win_xp(self):
        return self._dwaglib.isWinXP()
        
    def is_win_2003_server(self):
        return self._dwaglib.isWin2003Server()
    
    def is_user_in_admin_group(self):
        return self._dwaglib.isUserInAdminGroup()
    
    def is_run_as_admin(self):
        return self._dwaglib.isRunAsAdmin()
        
    def is_process_elevated(self):
        return self._dwaglib.isProcessElevated()
    
    def get_active_console_id(self):
        return self._dwaglib.getActiveConsoleId();
    
    def start_process(self, scmd, spythonHome):
        return self._dwaglib.startProcess(scmd, spythonHome);
    
    def start_process_in_active_console(self, scmd, spythonHome):
        return self._dwaglib.startProcessInActiveConsole(scmd, spythonHome);
    
    def win_station_connect(self):
        self._dwaglib.winStationConnect()
    
    def is_gui(self):
        return True 
    
    def reboot(self):
        os.system("shutdown -r -f -t 0")

class Linux():
    
    def __init__(self):
        self._dwaglib=None
    
    def load_library(self):
        try:
            if self._dwaglib is None:
                self._dwaglib = _load_lib_obj("dwaglib.so")
        except:
            None
    
    def unload_library(self):
        _unload_lib_obj(self._dwaglib)
        self._dwaglib=None
    
    def get_library(self):
        return self._dwaglib 
    
    def task_kill(self, pid) :
        try:
            os.kill(pid, -9)
        except OSError:
            return False
        return True
    
    def is_task_running(self, pid):
        try:
            os.kill(pid, 0)
        except OSError:
            return False
        return True
    
    def set_file_permission_everyone(self,f):
        utils.path_change_permissions(f, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP | stat.S_IWGRP | stat.S_IROTH | stat.S_IWOTH)
    
        
    def fix_file_permissions(self,operation,path,path_template=None):
        apppath=path
        if apppath.endswith(utils.path_sep):
            apppath=apppath[0:len(apppath)-1]
        apppath_template=path_template
        if apppath_template is not None:
            if apppath_template.endswith(utils.path_sep):
                apppath_template=apppath_template[0:len(apppath_template)-1]
        
        if operation=="CREATE_DIRECTORY":
            apppath_template=utils.path_dirname(path)    
            stat_info = utils.path_stat(apppath_template)
            mode = stat.S_IMODE(stat_info.st_mode)
            utils.path_change_permissions(path,mode)
            utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        elif operation=="CREATE_FILE":
            apppath_template=utils.path_dirname(path)    
            stat_info = utils.path_stat(apppath_template)
            mode = stat.S_IMODE(stat_info.st_mode)
            utils.path_change_permissions(path, ((mode & ~stat.S_IXUSR) & ~stat.S_IXGRP) & ~stat.S_IXOTH)
            utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        elif operation=="COPY_DIRECTORY" or operation=="COPY_FILE":
            if apppath_template is not None:
                stat_info = utils.path_stat(apppath_template)
                mode = stat.S_IMODE(stat_info.st_mode)
                utils.path_change_permissions(path,mode)
                stat_info = utils.path_stat(utils.path_dirname(path)) #PRENDE IL GRUPPO E L'UTENTE DELLA CARTELLA PADRE 
                utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        elif operation=="MOVE_DIRECTORY" or operation=="MOVE_FILE":
            if apppath_template is not None:
                stat_info = utils.path_stat(apppath_template)
                mode = stat.S_IMODE(stat_info.st_mode)
                utils.path_change_permissions(path,mode)
                utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        
    def is_gui(self):
        try:
            import detectinfo
            appnsfx = detectinfo.get_native_suffix()
            if not appnsfx=="linux_generic":
                appout = subprocess.Popen("ps ax -ww | grep 'X.*-auth .*'", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate() 
                lines = appout[0].splitlines()
                for l in lines:
                    if 'X.*-auth .*' not in l:
                        return True
        except:
            None
        return False
    
    def reboot(self):
        os.system("reboot")
        
    def get_tty_active(self):
        scons=None
        try:
            sactive=None
            fn = "/sys/class/tty/console/active"
            if os.path.exists(fn):
                f = open(fn, "r")
                try:
                    s = utils.bytes_to_str(f.read(),"utf8")    
                    if s is not None and len(s)>0:
                        s=s.strip("\n").strip("\r")
                        appar = s.split(" ")
                        for apps in appar:
                            if apps[3:].isdigit():
                                sactive = apps
                                break
                        
                finally:
                    f.close()
            if sactive is not None:
                fn = "/sys/class/tty/" + sactive+ "/active"
                if os.path.exists(fn):
                    f = open(fn , "r")
                    try:
                        s = utils.bytes_to_str(f.read(),"utf8")
                        if s is not None and len(s)>0:
                            s=s.strip("\n").strip("\r")
                            scons = s.split(" ")[0]                        
                    finally:
                        f.close()
                else:
                    scons = None
            if scons is None:
                #Try fgconsole
                data = subprocess.Popen(["fgconsole"], stdout = subprocess.PIPE, stderr = subprocess.PIPE)
                so, se = data.communicate()
                if so is not None and len(so)>0:
                    so=utils.bytes_to_str(so, "utf8")
                    scons="tty"+so.replace("\n","").replace("\r","")
                    if not os.path.exists("/sys/class/tty/" + scons):
                        scons=None                    
            if scons is None:
                scons = sactive
        except:
            None
        return scons
    
    def get_process_ids(self):
        lret=[]
        lst = os.listdir("/proc")
        for name in lst:
            if name.isdigit():
                lret.append(int(name))
        return lret
    
    def get_process_environ(self,pid):
        eret = {} 
        try:
            fn = "/proc/" + str(pid) + "/" + "environ"
            if os.path.exists(fn):
                f = open(fn , "r")
                try:
                    s = utils.bytes_to_str(f.read(),"utf8")    
                    if s is not None and len(s)>0:
                        arenv = s.split("\0")
                        for apps in arenv:
                            p = apps.index("=")
                            if p>0:
                                eret[apps[:p]]=apps[p+1:]                            
                finally:
                    f.close()
        except:
            None
        return eret
    
    def get_process_stat(self,pid):
        sret = {} 
        try:
            fn = "/proc/" + str(pid) + "/" + "stat"
            if os.path.exists(fn):
                f = open(fn , "r")
                try:
                    s = utils.bytes_to_str(f.read(),"utf8")
                    if s is not None and len(s)>0:
                        rpar = s.rfind(b')')
                        name = s[s.find(b'(') + 1:rpar]
                        fields = s[rpar + 2:].split()            
                        sret['name'] = name
                        sret['status'] = fields[0]
                        sret['ppid'] = int(fields[1])
                        sret['pgrp'] = int(fields[2])
                        sret['session'] = fields[3]
                        sret['tty'] = int(fields[4])
                        sret['tpgid'] = int(fields[5])             
                finally:
                    f.close()
        except:
            None
        return sret

    def get_process_uid(self,pid):
        sret = -1
        try:
            fn = "/proc/" + str(pid) + "/" + "status"
            if os.path.exists(fn):
                f = open(fn , "r")
                try:
                    s = utils.bytes_to_str(f.read(),"utf8")
                    if s is not None and len(s)>0:
                        import re
                        reuids=re.compile(br'Uid:\t(\d+)\t(\d+)\t(\d+)')
                        ur, ue, us = reuids.findall(s)[0]
                        sret = int(ur)
                finally:
                    f.close()
        except:
            None
        return sret
    
    def get_process_gid(self, pid):
        sret = -1
        try:
            fn = "/proc/" + str(pid) + "/" + "status"
            if os.path.exists(fn):
                f = open(fn , "r")
                try:
                    s = utils.bytes_to_str(f.read(),"utf8")
                    if s is not None and len(s)>0:
                        import re
                        reuids=re.compile(br'Gid:\t(\d+)\t(\d+)\t(\d+)')
                        gr, ge, gs = reuids.findall(s)[0]
                        sret = gr
                finally:
                    f.close()
        except:
            None
        return sret
    
    
    def get_process_cmdline(self, pid):
        lret = [] 
        try:
            fn = "/proc/" + str(pid) + "/" + "cmdline"
            if os.path.exists(fn):
                f = open(fn , "r")
                try:
                    s = utils.bytes_to_str(f.read(),"utf8")
                    if s is not None and len(s)>0:
                        lret = s.split("\0")             
                finally:
                    f.close()
        except:
            None
        return lret

class Mac():
        
    def __init__(self):
        self._dwaglib = None
        self._propguilnc = None
        self._propguilnc_semaphore = threading.Condition()        
    
    def load_library(self):
        try:
            if self._dwaglib is None:
                lbn="dwaglib.dylib"
                #COMPATIBILITY BEFORE 14/11/2019
                if not utils.path_exists(".srcmode"):
                    if not utils.path_exists("native/"+lbn):
                        lbn="dwaglib.so"
                #COMPATIBILITY BEFORE 14/11/2019
                self._dwaglib = _load_lib_obj(lbn)
        except:
            None
    
    def unload_library(self):
        _unload_lib_obj(self._dwaglib)
        self._dwaglib=None
    
    def get_library(self):        
        return self._dwaglib
    
    def task_kill(self, pid) :
        try:
            os.kill(pid, -9)
        except OSError:
            return False
        return True
    
    def is_task_running(self, pid):
        try:
            os.kill(pid, 0)
        except OSError:
            return False
        return True
    
    def set_file_permission_everyone(self,f):
        utils.path_change_permissions(f, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP | stat.S_IWGRP | stat.S_IROTH | stat.S_IWOTH)
    
    def fix_file_permissions(self,operation,path,path_src=None):
        apppath=path
        if apppath.endswith(utils.path_sep):
            apppath=apppath[0:len(apppath)-1]
        apppath_src=path_src
        if apppath_src is not None:
            if apppath_src.endswith(utils.path_sep):
                apppath_src=apppath_src[0:len(apppath_src)-1]
        else:
            apppath_src=utils.path_dirname(path)    
        stat_info = utils.path_stat(apppath_src)
        mode = stat.S_IMODE(stat_info.st_mode)
        if operation=="CREATE_DIRECTORY":
            utils.path_change_permissions(path,mode)
            utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        elif operation=="CREATE_FILE":
            utils.path_change_permissions(path, ((mode & ~stat.S_IXUSR) & ~stat.S_IXGRP) & ~stat.S_IXOTH)
            utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        elif operation=="COPY_DIRECTORY" or operation=="COPY_FILE":
            utils.path_change_permissions(path,mode)
            stat_info = utils.path_stat(utils.path_dirname(path)) #PRENDE IL GRUPPO E L'UTENTE DELLA CARTELLA PADRE 
            utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
        elif operation=="MOVE_DIRECTORY" or operation=="MOVE_FILE":
            utils.path_change_permissions(path,mode)
            utils.path_change_owner(path, stat_info.st_uid, stat_info.st_gid)
    
    def is_gui(self):
        return True
    
    def get_console_user_id(self):
        return self._dwaglib.getConsoleUserId();
    
    #GESTIONE GUI LAUNCHER
    def _signal_handler(self, signal, frame):
        self._propguilnc_stop=True
    
    def start_guilnc(self):
        self._propguilnc_stop=False
        signal.signal(signal.SIGTERM, self._signal_handler)
        bload=False
        suid=str(os.getuid())
        spid=str(os.getpid())
        lnc = ipc.Property()
        prcs = []
        try:
            while not self._propguilnc_stop and utils.path_exists("guilnc.run"):
                if not bload:
                    if lnc.exists("gui_launcher_" + suid):
                        try:
                            lnc.open("gui_launcher_" + suid)
                            lnc.set_property("pid", spid)
                            bload=True
                        except:
                            time.sleep(1)
                    else:
                        time.sleep(1)
                if bload:
                    if lnc.get_property("state")=="LNC":
                        popenar=[]
                        popenar.append(sys.executable)
                        popenar.append("agent.py")
                        popenar.append(u"app=" + lnc.get_property("app"))
                        for i in range(GUILNC_ARG_MAX):
                            a = lnc.get_property("arg" + str(i))
                            if a=="":
                                break;
                            popenar.append(a)
                        libenv = os.environ
                        libenv["LD_LIBRARY_PATH"]=utils.path_absname("runtime/lib")
                        #print("Popen: " + " , ".join(popenar))
                        try:
                            p = subprocess.Popen(popenar, env=libenv)
                            prcs.append(p)
                            #print("PID: " + str(p.pid))
                            if p.poll() is None:
                                lnc.set_property("state", str(p.pid))
                            else:
                                lnc.set_property("state", "ERR")
                        except:
                            lnc.set_property("state", "ERR")
                    time.sleep(0.2)
                #Pulisce processi
                prcs = [p for p in prcs if p.poll() is None]
        finally:
            if bload:
                lnc.close()

    def init_guilnc(self,ag):
        self._propguilnc_semaphore.acquire()
        try:
            #COMPATIBILITA VERSIONI PRECEDENTI
            if utils.path_exists("native/dwagguilnc"):
                self._propguilnc = {}
                if not utils.path_exists("guilnc.run"):
                    f = utils.file_open("guilnc.run","wb")
                    f.close()
        finally:
            self._propguilnc_semaphore.release()        
    
    def term_guilnc(self):
        self._propguilnc_semaphore.acquire()
        try:
            if utils.path_exists("guilnc.run"):
                utils.path_remove("guilnc.run")
            if self._propguilnc is not None:
                for l in self._propguilnc:
                    self._propguilnc[l].close()
                self._propguilnc=None
        finally:
            self._propguilnc_semaphore.release()            
    
    def exec_guilnc(self, uid, app, args):
        self._propguilnc_semaphore.acquire()
        try:
            if self._propguilnc is not None:
                suid=str(uid)
                lnc = None
                if suid not in self._propguilnc:
                    lnc = ipc.Property()
                    fieldsdef=[]
                    fieldsdef.append({"name":"pid","size":20})
                    fieldsdef.append({"name":"state","size":20}) # ""=NESSUNA OPERAZIONE; "LNC"="ESEGUI"; "NUM"=PID ESEGUITO 
                    fieldsdef.append({"name":"app","size":100})
                    for i in range(GUILNC_ARG_MAX):
                        fieldsdef.append({"name":"arg" + str(i),"size":GUILNC_ARG_SIZE})
                    def fix_perm(fn):
                        utils.path_change_owner(fn, uid, -1)
                        utils.path_change_permissions(fn, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP | stat.S_IWGRP)
                    lnc.create("gui_launcher_" + suid, fieldsdef, fix_perm)
                    self._propguilnc[suid]=lnc
                else:
                    lnc=self._propguilnc[suid]
                
                cnt=20.0                
                #PULISCE
                lnc.set_property("state","")
                lnc.set_property("app","")
                for i in range(GUILNC_ARG_MAX):
                    lnc.set_property("arg" + str(i),"")
                #RICHIESTA                        
                lnc.set_property("app", app)
                for i in range(len(args)):
                    lnc.set_property("arg" + str(i), args[i])
                st="LNC" 
                lnc.set_property("state", st)
                while st=="LNC" and cnt>0.0:
                    st = lnc.get_property("state")
                    time.sleep(0.2)
                    cnt-=0.2                        
                if st=="LNC":
                    lnc.set_property("state", "")
                    raise Exception("GUI launcher timeout.")
                if st=="ERR":
                    raise Exception("GUI launcher error.")
                return int(st)          
        finally:
            self._propguilnc_semaphore.release() 
        return None
    
    def reboot(self):
        os.system("shutdown -r now")                                                                                      resources.py                                                                                        0000755 0001750 0001750 00000010214 14127306343 012734  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import locale
import subprocess
import utils
import threading
import importlib

class ResText:
    
    def __init__(self, pkgnm):
        if utils.path_exists(".srcmode"):
            self._pkgnm = pkgnm.split(".")[1]
        else:
            self._pkgnm=pkgnm
        self._data_default = self._get_data("default")
        self._lang_current = None
        self._data_current = None
        self._semaphore=threading.Condition()

    def _get_data(self,lng):
        try:
            if lng is None or lng=="":
                return None
            arlng = lng.split("_")
            testlng=""
            for i in range(len(arlng)):
                if i==0:
                    arlng[i]=arlng[i].lower()
                    testlng=arlng[i]
                else:
                    arlng[i]=arlng[i].upper()
                    testlng+="_" + arlng[i]            
            objlib = importlib.import_module(self._pkgnm + "." + lng)
            if objlib is None:
                raise Exception("Not found.")
            return getattr(objlib, 'data', None)
        except:
            arlng = lng.split("_")
            if len(arlng)>1:
                testlng=""
                for i in range(len(arlng)-1):
                    if i>0:
                        testlng+="_"
                    testlng+=arlng[i]
                return self._get_data(testlng)
            else:
                return None

    def set_locale(self, lng):
        self._semaphore.acquire()
        try:
            self._set_locale(lng)
        finally:
            self._semaphore.release()
    
    def _set_locale(self, lng):
        appdt = self._get_data(lng)
        if appdt is not None:
            self._lang_current=lng
            self._data_current=appdt
        else:
            self._lang_current="default"
            self._data_current=self._data_default
            
    def get(self, key):
        try:
            self._semaphore.acquire()
            try:
                if self._lang_current is None:
                    applng=None
                    try:
                        if utils.is_windows():
                            import ctypes
                            windll = ctypes.windll.kernel32
                            windll.GetUserDefaultUILanguage()
                            wl = locale.windows_locale[windll.GetUserDefaultUILanguage()]
                            applng=wl.split("_")[0]
                        elif utils.is_mac():
                            p = subprocess.Popen(['defaults', 'read', '-g', 'AppleLocale'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                            sout, serr = p.communicate()
                            if sout is not None:
                                applng = sout.replace("\n","").replace(" ","_")[:10]
                    except:
                        None                    
                    try:
                        if applng is None:
                            l = locale.getdefaultlocale()
                            if l is not None:
                                applng=l[0]
                    except:
                        None
                    
                    self._set_locale(applng)
                    
            finally:
                self._semaphore.release()
            
            if key in self._data_current:
                return self._data_current[key]
            elif key in self._data_default:
                return self._data_default[key]
            else:
                return "RES_MISSING#" + key
        except:
            return "RES_ERROR#" + key
    
class ResImage:
    
    def __init__(self, pkgnm):
        if utils.path_exists(".srcmode"):
            self._pkgnm = pkgnm.split(".")[1]
        else:
            self._pkgnm=pkgnm        
        self._basepth=utils.str_new(self._pkgnm.replace(".",utils.path_sep))
        
    def get(self, nm):        
        return self._basepth + utils.path_sep + utils.str_new(nm)
        
                                                                                                                                                                                                                                                                                                                                                                                            ui/                                                                                                 0000755 0001750 0001750 00000000000 14140517417 010765  5                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 ui/images/                                                                                          0000755 0001750 0001750 00000000000 14140517417 012232  5                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 ui/images/logo.png                                                                                  0000644 0001750 0001750 00000014304 13422307023 013672  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 �PNG

   IHDR   @   @   �iq�   bKGD � � �����   	pHYs     ��   tIME�
6CC�H   tEXtComment Created with GIMPW�  ,IDATx��y|]�u�{�s�ђ-Y�my`�c�3;q	mh��@�˃4y���i�M(M!�/�'!a
�T�`&6x��Ɩ%ٖ�I���{uu�3���8G���M���y���=��3��[k���Z������8�/�ן�S���W�J%Ak����׭��[[������|����ϙsG�4h��Jc;��lom9X}��#���ɽ?=���B��D� (PJ#���NDy�H����������<�رc?��#��'L�t�y�qyY���:.���<Oy(�P�G<'������o���>���?��%Ӑ�% x����[�O��`ъ�N{sr��ү}���Y�r�H����Ǻ����߽�SyX�EIii�H ��ǯ3����U����?N~��[��O`���Ƣ7�z`��X�9+�ɐ/�u��n���#���w]�羧P��u=<Wa�&c*�� ���q�>�x,�����A6�#�r�)g���w�8���u� ������o|�˗\vE�2�[��,E�A)�R
���k/;��Y��t�ׇ��Q^ ���S
H�i�Ԏ�-�q=��cuH\���P,`��x}C��z��ly��k����w�Ϟ��)M�V(���@k�V�wۭߜ�z��1JqM6��������������X{�B1g���ת�*�t
��&M�v㖦�Gz{{�J���c�M�6��_}�f�)@7?��������Z��A�'��F�0�P8D>W�P(��=��z��>��eQZ'���ߟ�9����d*Œ�o|�u���W�wϞ;�b!�| ��wE�&��X,��־	D�5����
��D7Y�OB d�2��NHA2��[�l~�pܕ�����#ݽ}��¤�� Z�-4 PBQ��k@  8B����A�H��H)I�3l����d�d h�G�(/�[b������	�;<��0�1�e��W�- ��" C
�>��4R
V��b1��X�~D �������w�h;���*+/�9H0yBdiq�@q����>1�ܖB"�DJÎ����� h��� ��Hs�O����=�� ׭Ckmd�϶��X��Һ'�J��G�=S�)�L!�A.jq�^!�pUˀx�sW��R`H_�}�}�[�I�蔼�`ѽ���u�������?��/�)+y���
d2�֬]��h��_�3����XtisKkKK����<0��@�j�@�i�˂��uq]��  *��S�����Ӡ��3]��?H�z��̌�w�z��o��t�\!�UU|�n�����#�qLӜ��ܲ���s���'aH���rt%ԇ�@�� \ף���v���!��G.�[�4()�SWWK8d���D#C�E��) 0�ɐ���fs�����Ķ�\������<��v}�{�=������ܴy˅� *P]�c�����u]]����F��v\�b�*qt	ђ*L+�v��NK��N����&�SZ^J<��l6��@�\.?D䑸:�E����T!���<���(&��e�y��E�tz�6�@��
_s�@۫� �� �D7[�������8s����v��"�1��Yn?g�ZKS�^�B��}ۘTk0m�x̐E>�Gk=�T��i�)��߻�o� ��(��_�֚R�|S5踠	�}���G�L����X����wqҙs�>�b���|��@+q��	MY�X�U���Ha� �&b��L�ڴ���R���'��5���jk'�N=�أ�x�c�H7���i�D�׍_#��0R��5�41����0|�l���0�55�ē/Г)���?�f�L�O����{�D)�(�q���+�<1N�>��q8����������X�p�i�PC4%U���e[S��{j#��?, �DW���_Y�1g4�O����D&��"���0�c��4-������c'�EN��'c���Sy��V��Q�O	���ʪ�����]6��p��!f|��߷��<�y>�v�K}}��'��D�<E��m���3�W�xw�����.cd+`+`Ϧ��_jnn6��Ο2y���61L��i����Io_/�����uE���_cS� ��<���d_Wm��"�6�(BO<ץ�&̞�<X1�c*���z�~��xXq�?�泗}���k>'ML�4�p8t Bd39^��R��|�������@��E�6o�pǭ߼e����;�-�z�=~ᅗ���O�ī	��QVg�9�G�uE	���RC{P�iak��&�T��~�.B�8W\~"w=�LX���j~v�>�d�+���x�юy/���\��P��(��Z��/��t������5�M�y��w��0�Py-��8W�9�7��C�"�ByS@J����HXpݬJj¬����]�?�s�Y<��V���g�%R>�|Z���˸��7��7* ���V��O����BeE%��0�i4�=�uS������)�������/�܊E��B�R�n��1���iq�>���r�������PQ��SJxqi/Ѳrˠ�-�)'��}W#�~����I2n\�Ȗ_�9�|&�4}j jk��6L��V��=h?��D��%��S1�K|n�Y|e�T����Zs��լ�m#mI<nR]n�P&1�]Ň;�<�z�E:�"!ɜYU<�� ��0��bFL�:S\9��]��t
KWn斛N�,ΚucǍ�՝H<3��y^ȚU�����|��s�����J
1%
U��UgYf͸q5"d�YE"�S֬~�
�����bjC5��U��`R}Y�-�d�d�����R��2��U|vF�&Dy|a�h�D{��2P.�@�h<��a:9�X��?�^I.� CJ^|q޷���-�i�W��(
�����<���,���������-_�?'N<�����LRJ֮����K�|:e���/�әt��~�e���AnY���Ѱ�o��b�q�[�G8*}%�����$�0-±ؚ΄I��!��:�sϝ��LBNB`����.����a�����t~��<m!ؾs7��S���t(R�yR�FM\C
hS�\}p�{F$"S�O%����
�H�G�.��d)*�SB��í<�}{�9��3��3L��b@š:@�hul�v_��X�XVl���ky�['�zG�wZr4�EH�]�����������]`m{�w�f�!8(1�eQ"�%���Uq:�E�p=�=�4_�SzD%����:�]RJ<�	�J�DC��-�z� �}.W�]��5!�5wŐ�>4i�Aj+M6w��-˥�����E�P�P���#<<�ez{-���N�s��x�01���x؎�q=�D�&%�%�E(d���N�����=)�k���J\)hٛ����c
� l&W�8oJ���%���d\Emu�T��m�Ę�04e%!������Q��� n9�C]`�q88���b4G
��Lj�e�P�B&�X� ������j�-v�\&�\;�K

�ڸ䪓�8�fӁ�]6;SM���5�@�<�Њʸ�-�T�o�D��}���S,ڣ�h}0�>Li��/-�/��:�ݽTWWSZZJ�$NYY)Bh���C����&��4@��0$�M�"����Uဓ��V�u�#3&�2!Cp�Y�%l�w���QA��aa	51�9SJ0�`��>�/k�W^�팾L�"�͑�f�d������F__�� ف��{�����i�E�ъX4VVQY�я~4m�gg�C��
|ڶ�y�ǋ�_ǲ.SbH�
	�����"3'F����i0��5=6*Lv��,�W U�-Bij���Gg_�L��*�ؙ*�KL�Eͥgא+�q�ͳ���7�m��ԓ�f��|>��vFk�� ��<��W��B�l&��f�==�����/���ٞ�K�4�����8�q�R8�VS
"&D,�%�����xC�v�4R@��M���=̨IeH�
�Qtf]KM�iAQ�����SE��3�2#N&��6��uK�]��u���]`>�E�	>?��C�ܾk׫����7��k�E����\y�Y,ݿ��)g`�h� jI"aA8b�s���k�n �`RL�(*b1ӏz��K+����t�
�gW$X֜�uo�I�����R(:�p_�~�\�Y@�O�ڰaݳ���q�f���y��MѶ)��<�"[0M�!ѨE4b��ѐdWNqN�E4$��$�a�A<,��~�B�XȠ�:Dgڡk�%5)�[��s�G�����n;6;w�v���u�p�MM���o~��o��y��q���S�A�Z3�:�ֽI&4N@iD���A$l�%)��!IA�ؐ`@��$B0����HL����N��q��J�L����cs�-S��{�I$��9=޺m[L�֢Bѹ�P��Z����KZv��]9��O�g_�%��D�+$0���$�%l,$A𗀫	y
�*��9d
9�0�gFHu��?�;]�6=]��կ~�gG�����P_OGG�u��K}ɴ�<o(.��'E`{{3�;m&;�&��I$j	 �2aV�7�K2�B ���s�ڒ.��K>�ϻT��n�w&���Ac�&B;��h�=���=�19��޳��d��d�(}�/p��6HR/-e�l$R^J$j
,Kb������aGAI@���NQ�˺�scLŌ�v��7�?�����K�~�+>���>1 �Һ��$���r���GUN��8g��ngy�!%��O	����x�ư���8B�.��hlGc�0c� ڻ������E����,Y��Z!��Z���J�)���x׿��h,Z�J�G�Q��,�r�i�1����¾�K�OAmHpE���^��>���`|������ry�bP.�cŲe�O�}�n���ԏ.ۚ��w���uM]�w��"��{���RJ�:}ط��̳����ڱL�0��I��y?���}�=���<�����4mneW������H)��Q���]��³�����IV �ȣs��|.2X���K�+cZ��P�:$F83�B�T�Q=��h,�eY��Cz C���l.?��r�<�ޞdyEee(�.���T?�Z�s����<�#�:����4͇� �Jam���M���p�����s@3-	�T�rY����X$�X�ֺ=�����|�n�'�Z5k��7��Oh4-˲���U�<x�������ߑ�d&������o/�
�Ѻ�����_-�O����x6!��`��6m��;�q�0����5\wɥ�o���'o޴~݆�k���^vL ̘~���֯��6$����vۭg�q��mm�� �������vG� �zH��&�;����n<<��9�BI�����-[�{��GoVJs|E ��+�/���V>y��[��'�u�v|�3��Y��#"���Cx!����C���X�?�/FV�_�/�V�G�.���R
9��L����@c4[( �2�ll�2�����c��8��.�7�{�F��+�-jmݎ����B��d_g&�5=OY~�Q�z��y8�C6�%�+����]�K۶-�Ԉ��9jkk��5=�Q�'��忛�j&ݻu�Qא�8����V���w��H$:sRc����_xm�Ŧ)r}?ذ�;ѵ�:��>}�y<3�2����/����(��}� ���rL�/�N=aviY��P(���.K����]��B��@[����y��q��l�X}L���q]��ݳ�;���AZ;�ٱ���޳#���y��
r���o����do}�Qr ��F��u�����W'M�����q�p�wo�Yv�hY�<�I�m0��o����]li];�C.�K{���-_���.��z�
� ��q��<݉m�����DO%���L&��ֿ͛6�f��c���X��t��;�<��cK�v��i�ǵ�l&�
���H��-��8q�&_��={��/�<�5`>�8V">��]?��ܝ8p{�����u?:й�xf$�!�Nw8��H��X,R,�#��T2�-������չ\��E`�!�#0L/���n ʀ�#uu�1�9bR3��P�Q�wv�{X�>�s������-�սMk��G*��zhe���{�H��QZ{�;�՗�������v|���w�	��#�    IEND�B`�                                                                                                                                                                                                                                                                                                                            ui/images/logo48x48.bmp                                                                             0000644 0001750 0001750 00000022212 14010256654 014410  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 BM�$      �   |   0   0          $  �  �            �  �  �      �BGRs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ���S���Ν��❝���������❝�Ν��S                                                                                                                                        ������;                ��������������������������������                ���;���                                                                                                        ������o���❝�����?            ��������������������������������            ���:�������蝝�����                                                                                            ���J���䝝�������������ޝ��        ��������������������������������        ������ڝ��������������雛�R                                                                                �����������������������������������        ��������������������������������        �����������������������������������                                                                        ������򝝝����������������������������I    ���ĝ���������������������������    ���E�����������������������������������                                                                            �����������������������������������杝�Ý����������������������������������Ý��杝������������������������������                                                                                ������񝝝������������������������������������������������������������������������������������������������󞞞                                                            ������H                ��������������������������������������������������������������������������������������������������������                ���H���                                        �����������Н��^���    �����������������������������������������������������������������������������������������������񜜜    ������M���ɝ�������                                    ���d�������������������Ԝ��Z���0���띝�����������������������������������������������������������������������������������������쟟�0���Z���ԝ������������������e                            ������򝝝������������������������������������������������������������������Ż��ɾ��������������������������������������������������������������������������������󢢢                        �����������������������������������������������������������������ش�������������������������ѹ�þ������������������������������������������������������������������                    ���������������������������������������������������������Ц��ݡ������������������������������۝��қ����������������������������������������������������������������󙙙                ���$���ԝ������������������������������������������������ɘ��ؙ������������������������������������ӗ��ǋ��ϴ��������������������������������������������������������՜��$                    ������w���������������������������������������������͓��ؚ����������������������������������Ә��Ê�캄��������������������������������������������������������                                ���-���ʝ�����������������������������l��ț��ċ��є��ݞ����������������������������ޥ��ק�꺀�黌������±������������������������������������ћ��3                                            �����������������������������t��s������~��ȉ��Ւ�������������������������ݙ��ю��̓���������齗�ٞr��Ļ��������������������������������                                        ���������.���Ý��������������������{U�ݞo�繌��q��{��ѐ�����ُ��ݔ��������ے��ؐ��҉�����Å��Ψ�嵋��ǫ�்�ˬ�����������������������������ě��.������                    �������띝���������������������������������������~S�ؗg�崃��d��m��ϕ��̈�����ˁ��ґ������٢���}���z��Ǆ��ǎ��m�ۚ_��Ȯ��ѽ�ɠ�������������������������������������������������띝��        ���֝����������������������������������������th��{N�ԑ_��|��X��h��ň��i��q��x�������������Ԧ��ϝ��ѡ��Ŏ��Œ��ɠ���������n�����������������������������������������������������        ���띝��������������������������������������{XF��vI�ӋW��q��]��Ш������z��{��w�븀������ʠ��S��g��b��L�ߗL�ܕP�㴏�ങ�ȉb��¼�������������������������������������������������        ��������������������������������������������jB-��oA�шT��š��Я������W���N�ߑI�ߑJ���K��S��r�ߑJ��y�ގF�ݎH���H���I�ؕb�ˇ]��f9�����������������������������������������������������        ���읝��������������������������������������gF7��i>�ٞw�������ߐO�݉A�܅A�܄A�܄A�܄A�ۄ@��v��ҷ��h�ڂ=�ۃ@��A��?�ؕd��wM��X/�����������������������������������������������������        ���ם���������������������������������������r`Y��uR��uF�ޞr������u3��|7��w6��x7��y9��x9��y9�豌�����뼜��v5��y9�ۂ<��{8�זm��`7��E$��¾�������������������������������������������������        �������띝�����������������������������������yw��E%��_5����������{��d���]�ځJ��o3��k.��l0�݇T�竇�譅��l.��m2��y5��i/�Ғn��N)��B*������������������������������������������������띝��                    ���������-���Ý�������������������n8"�ȋk���������ۈ\��p6��wB�ވX��q��r�܂O�ߌ]��q;��r>�݊Z��l-��`*��`-�Ăb��@��dR����������������������������ě��.������                                        ���������������������������cWT��;�Ąi�乢��c2��\%��_+��c.��d0��g5��R�����夂��o>��zJ�كT��K��g>��Z9��9������������������������������������                                            ���-���˝���������������������������F��]@��S/�ٗt��X)��d6��h:��j=��l>��l>�݉a��zP�ޓn��~T��jA�הs�Е|��?#�q?1������������������������������������ѝ��4                                ������w������������������������������������wrq�sB0��C%��z]��yW��e?��gA��i@��i@��i@�׀\��qK��sE��r��qP��r[������L=����������������������������������������������������                    ���$���՝�������������������������������������������wpo�o<,��aH�ܛ���lN��hH��hG��hE��iE��_��uR��nN��iN�ǒ~�Ĕ���ZM��������������������������������������������������������՜��$                ����������������������������������������������������~yx�Y6*��|h�Н���hP��jQ��jO��iO��sY�Ņn��oX��t^��xf����������������������������������������������������������������󙙙                    ������������������������������������������������������������f\Y��la���q��jW��mY��o[��oY���|��l[��_R��ws�����������������������������������������������������������������                        ������򝝝����������������������������������������������������������~�vjg�pZR�rVM�r]V�so������������������������������������������������������������������������󢢢                            ���d�������������������Ӝ��Z���/���띝�����������������������������������������������������������������������������������������쟟�0���Z���ӝ������������������d                                    �����������Н��^���    �����������������������������������������������������������������������������������������������󙙙    ������M���ȝ�������                                        ������G                ��������������������������������������������������������������������������������������������������������                ���G���                                                            ������򝝝������������������������������������������������������������������������������������������������󞞞                                                                                �����������������������������������朜�������������������������������������杝������������������������������                                                                            ������򝝝����������������������������I    ���ŝ���������������������������    ���E�����������������������������������                                                                        �����������������������������������        ��������������������������������        �����������������������������������                                                                                ���J���坝�������������ޝ��        ��������������������������������        ������ڝ��������������雛�R                                                                                            ������o���❝�����?            ��������������������������������            ���:�������蝝�����                                                                                                        ������;                ��������������������������������                ���;���                                                                                                                                        ���S���͝��❝���������❝�͝��S                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ui/images/logo32x32.bmp                                                                             0000644 0001750 0001750 00000010212 14010256004 014354  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 BM�      �   |                    h  h            �  �  �      �BGRs                                                                                                                                                                                                                                                   ���7���❝���������➞�7                                                                                    ������w�������    ���Q�������������������Q    ����������w���                                                            ���H���坝���������|    ���a�������������������a    ���}�����������霜�P                                                    ���(�����������������������.���r�������������������r���.�����������������������)                                                    �����������������������杝�񝝝����������������񝝝杝������������������                                            ���)        ���>�������������������������������������������������������������������?        ���)                            ���M�����������?    ���˝�����������������������������������������������������������    ���?�����������N                    ������蝝�������������͝����������������������������ж��Ѳ��Ƕ����������������������������͝��������������褤�                ���x�������������������������������������ѱ���������������������ۯ����������������������������������������w                �������������������������������������ͤ��ܝ���������������������י��ċ�ļ����������������������������������                ������w������������������������Ǥ���ɔ��֘�����������������������ک��}������������������������������������                        ���.���睝������������{�鷍��w��ʉ�����������������ؔ��ƅ�����䰄�ѡ}����������������盛�.                    ���8���Q���b���s���񝝝����������eD�ᭃ��c��s��؟��υ��Ӎ�����͂���{��Ȍ��e�罛�䶖����������������񝝝s���b���Q���8        ���������������������������������mC�ަy�ߚQ��|��g��ň��Ӧ������ɖ��Ɛ��w��y��׾�����°������������������������������        ���������������������������������h>�ݢv�鴃��ֺ��g���J���K��t��P��j�ߒI��L�ؐW��{Q���}�����������������������������        ���������������������������������c?�ߩ��굊�܅@�܄@�ہ?�ہ?��<������a�ځ>��A�׋U��h?���{�����������������������������        ���᝝��������������������������{>#��mA�����ߏX�݆O��x<��m/��n0��Ȱ��g��p4��}8�΁V��N)���������������������������������        ���7���P���a���q���񝝝���������P1%�ăf������o8��j4��}K�މZ�ފZ��o��{I��t;��](��qN��6����������������񝝝r���a���P���7                    ���.���睝�����������}�m"
��uR��uI��`1��h9��k=��i9�榇�ۈ`��uI��pL��eI��YM����������������盛�.                        ������w������������������������N:4��Q9�ȇk��b?��gB��hA��h?�׃_��sH�͍q�ȕ���k`��������������������������������                ������������������������������������]OK��R?�ם���iN��jM��gK�Ȃh��oW��u`�����������������������������������������                ���x������������������������������������yv�fSL��dW��aO��gT��n^��`T�~pk����������������������������������������w                ������蝝�������������̝����������������������������~|��zx��������������������������������̝��������������褤�                    ���M�����������>    ���̝�����������������������������������������������������������    ���>�����������M                            ���(        ���>�������������������������������������������������������������������?        ���(                                            �����������������������杝�񝝝����������������񝝝杝������������������                                                    ���(�����������������������.���r�������������������r���.�����������������������)                                                    ���H���坝���������|    ���b�������������������b    ���}�����������霜�P                                                            ������v�������    ���Q�������������������Q    ����������v���                                                                                    ���6���᝝���������᜜�6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ui/images/logo16x16.bmp                                                                             0000644 0001750 0001750 00000002212 13763160606 014401  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 BM�      �   |                  �  �            �  �  �      �BGRs                                                                               ���,������4�����������4������,                            ���������������H�����������H������������                        ����������������������������������������                �����������]�����������������������������������]��������    ���)���������������������å��ޱ�����ũ������������������������,�����������������������������������ʢ�����������������������2���H�������������{��ѓ��ܘ������ˇ�龗�Ϲ�������������H���2������������������n��r������o��Ɯ��n��w�̥������������������������������������m�綖�܄D��y9�窂�ۅK�ۊJ��u[��������������������2���H��������������s��g3��vG�ߎe��yI��hA����������������H���2��������������������}i��y^��hG��vU��wZ���������������������������)�������������������������yo��yn����������������������������,    �����������]�����������������������������������]��������                ����������������������������������������                        ���������������H�����������H������������                            ���+������4�����������4������+                                                                                                                                                                                                                                                                                                                                                                                                      ui/images/__init__.py                                                                               0000644 0001750 0001750 00000000514 13422307023 014333  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''
import resources

resimage=resources.ResImage("ui.images")

def get_image(nm):
    return resimage.get(nm)                                                                                                                                                                                    ui/messages/                                                                                        0000755 0001750 0001750 00000000000 14140517417 012574  5                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 ui/messages/ca.py                                                                                   0000644 0001750 0001750 00000027540 14137471777 013557  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Accepto',
    'agentName':u'Nom de l\'agent',
    'alreadyInstalled':u'DWAgent ja instal·lat.\n\nL\'agent s\'actualitza automàticament a la darrera versió. Això vol dir que no cal instal·lar manualment les actualitzacions més recents.',
    'back':u'Enrere',
    'cancel':u'Cancel·lar',
    'cancelInstall':u'La instal·lació s\'ha cancel·lat.',
    'cancelUninstall':u'La desinstal·lació s\'ha cancel·lat.',
    'checkInstallCode':u'Comprovant el codi d\'activació...',
    'chooseProxyType':u'Quin tipus de proxy vols utilitzar?',
    'close':u'Tancar',
    'code':u'Codi',
    'commands':u'Ordres',
    'configureAgent':u'Configurar l\'agent',
    'configureAgentDisabled':u'Agent desactivat',
    'configureAgentEnabled':u'Agent habilitat',
    'configureChangeInstallKey':u'Canviar el codi d\'activació',
    'configureChooseMonitorTrayIconVisibility':u'Vols que es mostri el monitor d\'estat a la barra d\'estat?',
    'configureChooseOperation':u'Escull una opció, si us plau:',
    'configureDesktopNotification':u'Notificació d\'escriptori',
    'configureDesktopNotificationOK':u'Notificació d\'escriptori configurada correctament.',
    'configureDisableAgent':u'Desactivar l\'agent',
    'configureDisableAgentQuestion':u'Vols desactivar l\'agent?',
    'configureEnableAgent':u'Activar l\'agent',
    'configureEnableAgentQuestion':u'Vols activar l\'agent?',
    'configureEnd':u'S\'ha acabat la configuració.',
    'configureErrorConnection':u'Error de connexió. Si et plau, verifica que el servei DWAgent és engegat.',
    'configureExit':u'Tancar',
    'configureInsertPassword':u'Si et plau, escriu la paraula de pas de configuració:',
    'configureInstallAgent':u'Com vols configurar l\'agent?',
    'configureInstallCode':u'Introduïnt el codi d\'instal·lació',
    'configureInstallNewAgent':u'Creant un nou agent',
    'configureInvalidPassword':u'Paraula de pas incorrecta',
    'configureKeyInstalled':u'Clau instal·lada correctament',
    'configureLater':u'Configurar més tard',
    'configureMonitor':u'Configurar el monitor',
    'configurePassword':u'Establir la paraula de pas',
    'configurePasswordErrNoMatch':u'Els passwords no són iguals.',
    'configurePasswordUpdated':u'Paraula de pas canviada.',
    'configureProxy':u'Configurar el servidor intermediari',
    'configureProxyEnd':u'Servidor intermediari configurat correctament',
    'configureRemovePassword':u'Esborrar la paraula de pas',
    'configureRemovePasswordQuestion':u'Vols esborrar la paraula de pas?',
    'configureSetPassword':u'Establir paraula de pas',
    'configureTitle':u'DWAgent - Configuració',
    'configureTrayIconOK':u'Configurada correctament la visibilitat de la icona a la barra de tasques.',
    'configureTrayIconVisibility':u'Visibilitat de la icona a la barra de tasques',
    'configureUninstallKeyQuestion':u'Desinstal·lar l\'actual codi d\'instal·lació?',
    'configureUninstallationKey':u'Desinstal·lació...',
    'confirmExit':u'Segur que vols sortir?',
    'confirmInstall':u'Vols instal·lar el DWAgent a \'{0}\'?',
    'confirmUninstall':u'Vols esborrar el DWAgent?',
    'copyFiles':u'Copiant arxius...',
    'createNewAgent':u'Creació de l\'agent en progrés...',
    'decline':u'No ho accepto',
    'desktopNotificationAutoHide':u'Amagar automàticament',
    'desktopNotificationNone':u'Cap',
    'desktopNotificationVisible':u'Visible',
    'downloadFile':u'Descarregant l\'arxiu \'{0}\'...',
    'dwsPassword':u'Paraula de pas del DWS',
    'dwsUser':u'Usuari del DWS',
    'endInstall':u'La instal·lació ha acabat.',
    'endInstallConfigLater':u'La instal·lació ha acabat.\nL\'agent no ha estat pas configurat. Pots continuar més tard amb la configuració.',
    'endUninstall':u'La desinstal·lació ha acabat.',
    'enter':u'Introdueix',
    'enterInstallCode':u'Escriu el codi d\'instal·lació',
    'enterInstallNewAgent':u'Escriu la informació per a crear el nou agent:',
    'enterRunCode':u'Escriu el codi de connexió',
    'error':u'Error',
    'errorAgentAlreadyExsists':u'L\'agent {0} ja existia',
    'errorAgentMax':u'Has excedit el nombre màxim d\'agents.',
    'errorAgentNameNotValid':u'El nom de l\'agent no és vàlid. No pots pas fer servir els caracters / \ | # @ : .',
    'errorConnectionConfig':u'Error de connexió. Si et plau, verifica que el servei DWAgent sigui engegat.',
    'errorConnectionQuestion':u'Error de connexió. Si et plau, verifica que la connexió a internet o el tallafocs.\nVols configurar un servidor intermediari (proxy)?',
    'errorInvalidCode':u'El codi que has introduït no és vàlid.',
    'errorInvalidUserPassword':u'Usuari o paraula de pas no correctes.',
    'fieldRequired':u'Es requereix el camp \'{0}\'.',
    'install':u'Instal·lar',
    'installMonitor':u'Instal·lant el monitor...',
    'installMonitorErr':u'Instal·lació del monitor fallida.',
    'installService':u'Instal·lant el servei...',
    'installServiceErr':u'Instal·lació del servei fallida.',
    'installShortcuts':u'Instal·lant dreceres...',
    'installShortcutsErr':u'Instal·lació de les dreceres fallida.',
    'linuxRootPrivileges':u'Hauries de tindre privilegis de root per instal·lar el DWAgent.\nSi et plau, reinicia l\'script amb l\'usuari root.',
    'menuConfigure':u'Configurar',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Desinstal·lar',
    'missingInfoFile':u'Arxiu info.json no trobat.',
    'missingNative':u'Native no trobat.',
    'missingRuntime':u'Runtime no trobat.',
    'monitorActive':u'actiu',
    'monitorAgentDisabled':u'Agent desactivat.',
    'monitorAgentEnabled':u'Agent actiu.',
    'monitorConfigure':u'Configurar',
    'monitorConnections':u'Connexions',
    'monitorCurrentActivities':u'Activitats actuals',
    'monitorDisable':u'Desactivar',
    'monitorDisableAgentQuestion':u'Vols desactivar l\'agent?',
    'monitorDownload':u'Descàrrega',
    'monitorEnable':u'Activar',
    'monitorEnableAgentQuestion':u'Vols activar l\'agent?',
    'monitorEnterPassword':u'Escriu la paruala de pas:',
    'monitorErrorConnectionConfig':u'Error de connexió. Si et plau, verifica que el servei DWAgent és engegat.',
    'monitorHide':u'Amagar',
    'monitorInvalidPassword':u'Paraula de pas no vàlida.',
    'monitorNoActivities':u'Sense activitats',
    'monitorScreenCapture':u'Captura de pantalla',
    'monitorSession':u'Sessió',
    'monitorShellSession':u'Consola',
    'monitorShow':u'Veure',
    'monitorStatus':u'Estat',
    'monitorStatusDisabled':u'Desactivat',
    'monitorStatusNoService':u'Sense servei',
    'monitorStatusOffline':u'Fora de línia',
    'monitorStatusOnline':u'En línia',
    'monitorStatusUpdating':u'Actualitzant',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Desinstal·lar',
    'monitorUninstallNotRun':u'No pots desinstal·lar sense permisos de root.\nExecuta la comanda "dwaguninstall" des de la línia de comandes.',
    'monitorUpload':u'Pujar',
    'mustAccept':u'Per poder continuar, has d\'escollir la opció {0}',
    'mustSelectOptions':u'Has d\'escollir una opció.',
    'next':u'Següent',
    'no':u'No',
    'noTryAgain':u'No; prova-ho de nou',
    'notInstalled':u'El DWAgent no és instal·lat.',
    'ok':u'D\'acord',
    'option':u'Opció',
    'optionNotValid':u'L\'opció escollida no és vàlida.',
    'or':u'o',
    'password':u'Paraula de pas',
    'path':u'Ruta',
    'pathCreating':u'Creació del directori...',
    'pathNotCreate':u'No es pot crear el directori. Ruta incorrecta o permís denegat.',
    'pressEnter':u'Prem "enter" per continuar.',
    'privacyPolicy':u'Política de privacitat',
    'proxyAuthPassword':u'Paraula de pas',
    'proxyAuthUser':u'Usuari',
    'proxyHost':u'Host',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'Escriu la informació del servidor intermediari.',
    'proxyNone':u'Cap',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Sistema',
    'reEnterCode':u'Torna a entrar el codi',
    'reEnterData':u'Torna a entrar la informació',
    'rePassword':u'Torna a escriure la paraula de pas',
    'removeFile':u'Esborrant arxiu...',
    'runWithoutInstallation':u'Executar',
    'runWithoutInstallationClosing':u'Tancant la sessió...',
    'runWithoutInstallationConnecting':u'Obrint la sessió...',
    'runWithoutInstallationEnd':u'Sessió acabada.',
    'runWithoutInstallationOnlineBottom':u'COMPTE!!!\nNo donis pas aquesta informació a desconeguts, doncs tindrien accés a aquest agent. Si no tens clar el que ets fent, millor que tanquis aquesta aplicació.',
    'runWithoutInstallationOnlineBottomPutCode':u'COMPTE!\nAra l\'agent és a punt per acceptar connexions.',
    'runWithoutInstallationOnlinePassword':u'Paraula de pas: {0}',
    'runWithoutInstallationOnlineTop':u'La sessió és activa.\nPer connectar amb aquest agent, vés a https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'La sessió és activa.',
    'runWithoutInstallationOnlineUser':u'Usuari: {0}',
    'runWithoutInstallationStarting':u'Iniciant l\'agent...',
    'runWithoutInstallationUnexpectedError':u'Error inesperat.\nNo ha estat possible iniciar el DWAgent. Si el problema segueix, prova de descarregar-te la darrera versió del DWAgent, esborra el directori \'{0}\' i torna a iniciar el DWAgent.',
    'runWithoutInstallationUpdating':u'Actualització de l\'agent...',
    'runWithoutInstallationWait':u'Esperant per la nova connexió (intent {0})...',
    'selectPathInstall':u'Escull la ruta per la instal·lació:',
    'startService':u'Iniciant el servei...',
    'startServiceErr':u'No s\'ha pogut iniciar el servei.',
    'termsAndConditions':u'Termes i condicions',
    'titleInstall':u'DWAgent - Instal·lació',
    'titleUninstall':u'DWAgent - Desinstal·lació',
    'toBack':u'anar enrere.',
    'toExit':u'sortir.',
    'unexpectedError':u'Error inesperat.\n{0}',
    'uninstallMonitor':u'Desinstal·lant el monitor...',
    'uninstallService':u'Desinstal·lant el servei...',
    'uninstallShortcuts':u'Desinstal·lant les dreceres...',
    'user':u'Usuari',
    'validInteger':u'El camp \'{0}\' ha d\'ésser un nombre enter.',
    'versionInstallNotValid':u'La versió de l\'instal·lador no és la correcta per al teu sistema operatiu.\nSi et plau, descarrega\'t la versió correcta. {0}',
    'waiting':u'Esperant...',
    'warningLoginLogout':u'Per tal que els canvis siguin efectius, l\'usuari ha de tancar i tornar a obrir sessió.',
    'warningRemovePath':u'Compte: el directori destí ja existeix; l\'esborrarem.',
    'warningSpyingTool':u'Tingues en compte que no has d\'accedir a un ordinador remot sense el consentiment de l\'usuari. Fent ús del DWService com a eina d\'espionatge pot estar infringint les lleis al teu país de residència.',
    'welcomeLicense':u'Llicència.\nAquest programari és lliure i de codi obert.\nTé un principal component i uns quants accessoris que poden contindre diferents llicències. En tot cas, consulteu més informació al respecte aquí: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Si instal·leu o feu anar aquest programari vol dir que sou acceptant els #TERMSANDCONDITIONS i la #PRIVACYPOLICY',
    'welcomeSecurity':u'Seguretat\nPer tal de protegir la teva privacitat, et garantim que no emmagatzemarem pas informació teva dins dels nostres servidors; a més que les comunicacions són xifrades i, per tant, les aplicacions de tercers no poden pas llegir-ne res.',
    'welcomeSoftwareUpdates':u'Actualitzacions del programari\nAquest programari s\'actualitza automàticament.',
    'windowsAdminPrivileges':u'Has de tindre privilegis d\'administrador per tal d\'instal·lar el DWAgent.\nSi et plau, inicia l\'executable amb la opció "executar com a administrador".',
    'yes':u'Si'
}
                                                                                                                                                                ui/messages/fr.py                                                                                   0000644 0001750 0001750 00000030514 14137471754 013571  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'J\'accepte',
    'agentName':u'Nom de l\'agent',
    'alreadyInstalled':u'DWAgent est déjà installé.\n\nL\'agent est automatiquement mis à jour vers la dernière version. Cela signifie que vous n\'avez pas besoin d\'installer manuellement les nouvelles mises à jour.',
    'back':u'Retour',
    'cancel':u'Annuler',
    'cancelInstall':u'L\'installation a été annulée.',
    'cancelUninstall':u'La désinstallation a été annulée.',
    'checkInstallCode':u'Vérification du code d\'installation...',
    'chooseProxyType':u'Quel type de proxy utilisez-vous ?',
    'close':u'Fermer',
    'code':u'Code',
    'commands':u'Commandes',
    'configureAgent':u'Configurer l\'agent',
    'configureAgentDisabled':u'Agent désactivé.',
    'configureAgentEnabled':u'Agent activé.',
    'configureChangeInstallKey':u'Changer le code d\'installation',
    'configureChooseMonitorTrayIconVisibility':u'Voulez-vous afficher l\'icône du moniteur dans la barre des tâches ?',
    'configureChooseOperation':u'Veuillez choisir une opération :',
    'configureDesktopNotification':u'Notification sur le bureau',
    'configureDesktopNotificationOK':u'Notification configurée avec succès.',
    'configureDisableAgent':u'Désactiver l\'agent',
    'configureDisableAgentQuestion':u'Voulez-vous désactiver l\'agent ?',
    'configureEnableAgent':u'Activer l\'agent',
    'configureEnableAgentQuestion':u'Voulez-vous activer l\'agent ?',
    'configureEnd':u'La configuration est terminée.',
    'configureErrorConnection':u'Erreur de connexion. Vérifiez que le service DWAgent est démarré.',
    'configureExit':u'Sortir',
    'configureInsertPassword':u'Veuillez taper le mot de passe de configuration :',
    'configureInstallAgent':u'Comment préférez vous paramétrer l\'agent ?',
    'configureInstallCode':u'Entrez le code d\'installation',
    'configureInstallNewAgent':u'Créer un nouvel agent',
    'configureInvalidPassword':u'Mot de passe invalide.',
    'configureKeyInstalled':u'La clé a été installée correctement.',
    'configureLater':u'Configurer plus tard',
    'configureMonitor':u'Configurer le moniteur',
    'configurePassword':u'Configurer le mot de passe',
    'configurePasswordErrNoMatch':u'Les mots de passe ne correspondent pas.',
    'configurePasswordUpdated':u'Mot de passe mis à jour.',
    'configureProxy':u'Configurer le mandataire (proxy)',
    'configureProxyEnd':u'Configuration du mandataire (proxy) réussie.',
    'configureRemovePassword':u'Supprimer le mot de passe',
    'configureRemovePasswordQuestion':u'Voulez-vous supprimer le mot de passe ?',
    'configureSetPassword':u'Définir le mot de passe',
    'configureTitle':u'DWAgent - Configuration',
    'configureTrayIconOK':u'La visibilité de l\'icône dans la barre des tâches a été configurée avec succès.',
    'configureTrayIconVisibility':u'Visibilité de l\'icône dans la barre des tâches',
    'configureUninstallKeyQuestion':u'Désinstaller le code actuel ?',
    'configureUninstallationKey':u'Désinstallation...',
    'confirmExit':u'Êtes-vous sûr de vouloir quitter ?',
    'confirmInstall':u'Voulez-vous installer DWAgent dans \'{0}\' ?',
    'confirmUninstall':u'Voulez-vous supprimer DWAgent ?',
    'copyFiles':u'Copie des fichiers ...',
    'createNewAgent':u'Création de l\'agent en cours...',
    'decline':u'Je refuse',
    'desktopNotificationAutoHide':u'Masquer automatiquement',
    'desktopNotificationNone':u'Aucune',
    'desktopNotificationVisible':u'Visible',
    'downloadFile':u'Téléchargement du fichier {0}...',
    'dwsPassword':u'Mot de passe DWS',
    'dwsUser':u'Utilisateur DWS',
    'endInstall':u'L\'installation est terminée.',
    'endInstallConfigLater':u'L\'installation est terminée.\nL\'agent n\'a pas été configuré. Vous pouvez toujours effectuer la configuration plus tard.',
    'endUninstall':u'La désinstallation est terminée.',
    'enter':u'entrer',
    'enterInstallCode':u'Saisissez le code d\'installation',
    'enterInstallNewAgent':u'Saisissez les données pour créer un nouvel agent :',
    'enterRunCode':u'Entrez le code de connexion',
    'error':u'Erreur',
    'errorAgentAlreadyExsists':u'L\'agent {0} existe déjà.',
    'errorAgentMax':u'Le nombre maximum d\'agents est atteint.',
    'errorAgentNameNotValid':u'Le nom de l\'agent n\'est pas valide. Vous ne pouvez pas utiliser les caractères / \ | # @ : .',
    'errorConnectionConfig':u'Erreur de connexion. Veuillez vérifier que le service DWAgent est démarré.',
    'errorConnectionQuestion':u'Erreur de connexion. Veuillez vérifier votre connexion internet ou la configuration de votre pare-feu.\nVoulez-vous configurer un serveur mandataire (proxy) ?',
    'errorInvalidCode':u'Le code saisi est incorrect.',
    'errorInvalidUserPassword':u'Nom d\'utilisateur ou mot de passe incorrect.',
    'fieldRequired':u'Le champ \'{0}\' est obligatoire.',
    'install':u'Installer',
    'installMonitor':u'Installation du moniteur...',
    'installMonitorErr':u'L\'installation du moniteur a échoué.',
    'installService':u'Installation du service...',
    'installServiceErr':u'L\'installation du service a échoué.',
    'installShortcuts':u'Installation des raccourcis...',
    'installShortcutsErr':u'L\'installation des raccourcis a échoué.',
    'linuxRootPrivileges':u'Vous devez avoir les droits administrateur pour installer DWAgent.\nVeuillez démarrer le script en tant qu\'administrateur.',
    'menuConfigure':u'Configurer',
    'menuMonitor':u'Moniteur',
    'menuUninstall':u'Désinstaller',
    'missingInfoFile':u'Le fichier info.json est introuvable.',
    'missingNative':u'Natif introuvable.',
    'missingRuntime':u'Runtime introuvable.',
    'monitorActive':u'actif',
    'monitorAgentDisabled':u'Agent désactivé',
    'monitorAgentEnabled':u'Agent activé',
    'monitorConfigure':u'Configurer',
    'monitorConnections':u'Connexions',
    'monitorCurrentActivities':u'Activités actuelles',
    'monitorDisable':u'Désactiver',
    'monitorDisableAgentQuestion':u'Voulez vous désactiver l\'agent ?',
    'monitorDownload':u'Téléchargement',
    'monitorEnable':u'Activer',
    'monitorEnableAgentQuestion':u'Voulez vous activer l\'agent ?',
    'monitorEnterPassword':u'Entrez le mot de passe :',
    'monitorErrorConnectionConfig':u'Erreur de connexion. Veuillez vérifier que le service DWAgent est démarré.',
    'monitorHide':u'Cacher',
    'monitorInvalidPassword':u'Mot de passe invalide',
    'monitorNoActivities':u'Aucune activité',
    'monitorScreenCapture':u'Capture d\'écran',
    'monitorSession':u'Session',
    'monitorShellSession':u'Interface système',
    'monitorShow':u'Afficher',
    'monitorStatus':u'État',
    'monitorStatusDisabled':u'Désactivé',
    'monitorStatusNoService':u'Aucun service',
    'monitorStatusOffline':u'Non connecté',
    'monitorStatusOnline':u'En ligne',
    'monitorStatusUpdating':u'Mise à jour',
    'monitorTitle':u'DWAgent - Moniteur',
    'monitorUninstall':u'Désinstaller',
    'monitorUninstallNotRun':u'Vous ne pouvez pas désinstaller sans les droits administrateur.\nexecuter la commande dwaguninstall dans l\'invite de commande.',
    'monitorUpload':u'Envoi',
    'mustAccept':u'Pour continuer, vous devez sélectionner l\'option {0}',
    'mustSelectOptions':u'Vous devez choisir une option',
    'next':u'Suivant',
    'no':u'Non',
    'noTryAgain':u'Non, essayez encore',
    'notInstalled':u'DWAgent n\'est pas installé.',
    'ok':u'Ok',
    'option':u'Option',
    'optionNotValid':u'L\'option sélectionnée est invalide.',
    'or':u'ou',
    'password':u'Mot de passe',
    'path':u'Chemin',
    'pathCreating':u'Création du dossier...',
    'pathNotCreate':u'Impossible de créer le dossier. Chemin invalide ou permission refusée.',
    'pressEnter':u'Appuyez sur Entrée pour continuer',
    'privacyPolicy':u'Politique de confidentialité',
    'proxyAuthPassword':u'Mot de passe',
    'proxyAuthUser':u'Utilisateur',
    'proxyHost':u'Hôte',
    'proxyHttp':u'http',
    'proxyInfo':u'Insérez les informations du serveur mandataire (proxy)',
    'proxyNone':u'Aucun',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Système',
    'reEnterCode':u'Veuillez ré-entrer le code',
    'reEnterData':u'Veuillez ré-entrer les données',
    'rePassword':u'Veuillez retaper le mot de passe',
    'removeFile':u'Suppression du fichier...',
    'runWithoutInstallation':u'Exécuter',
    'runWithoutInstallationClosing':u'Fermeture de session...',
    'runWithoutInstallationConnecting':u'Ouverture de session...',
    'runWithoutInstallationEnd':u'Session terminée.',
    'runWithoutInstallationOnlineBottom':u'ATTENTION :\nNe divulguez pas ces informations à des personnes qui ne sont pas dignes de confiance. Si vous n\'êtes pas sûr de ce que vous faites, fermez cette application.',
    'runWithoutInstallationOnlineBottomPutCode':u'ATTENTION  :\nL\'agent est maintenant prêt pour accepter les connexions. Si vous n\'êtes pas sûr de ce que vous faites, merci de fermer cette application.',
    'runWithoutInstallationOnlinePassword':u'Mot de passe : {0}',
    'runWithoutInstallationOnlineTop':u'La session est active.\nPour connecter cet agent, rendez-vous sur le site https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'La session est active.',
    'runWithoutInstallationOnlineUser':u'Utilisateur : {0}',
    'runWithoutInstallationStarting':u'Démarrage de l\'agent...',
    'runWithoutInstallationUnexpectedError':u'Erreur inattendue.\nImpossible de démarrer DWAgent. Si le problème persiste, essayez de télécharger la dernière version de DWAgent, effacez le dossier \'{0}\' et relancez à nouveau l\'installation.',
    'runWithoutInstallationUpdating':u'Mise à jour de l\'agent...',
    'runWithoutInstallationWait':u'Attente d\'une nouvelle connexion en cours (attempt {0})...',
    'selectPathInstall':u'Choisissez le chemin d\'installation :',
    'startService':u'Démarrage du service...',
    'startServiceErr':u'Échec de démarrage du service.',
    'termsAndConditions':u'Termes et conditions',
    'titleInstall':u'DWAgent - Installation',
    'titleUninstall':u'DWAgent - Désinstallation',
    'toBack':u'Retour',
    'toExit':u'Sortir',
    'unexpectedError':u'Erreur innatendue.\n{0}',
    'uninstallMonitor':u'Désinstallation du moniteur...',
    'uninstallService':u'Désinstallation du service...',
    'uninstallShortcuts':u'Désinstallation des raccourcis...',
    'user':u'Utilisateur',
    'validInteger':u'Le champ \'{0}\' doit être un entier.',
    'versionInstallNotValid':u'La version de l\'installeur n\'est pas compatible avec votre système d\'exploitation.\nVeuillez télécharger la bonne version. {0}',
    'waiting':u'Patientez...',
    'warningLoginLogout':u'Pour que cette modification prenne effet, l\'utilisateur doit se déconnecter et se reconnecter.',
    'warningRemovePath':u'Attention, le dossier de destination existe déjà, il sera supprimé.',
    'warningSpyingTool':u'Veuillez noter que vous ne pouvez pas accéder à un ordinateur distant sans le consentement de son utilisateur. En utilisant DWService comme outil d\'espionnage, vous enfreignez peut-être les lois de votre pays de résidence',
    'welcomeLicense':u'Licence\nCe logiciel est libre (gratuit) et open source.\nIl est constitué d\'un composant principal et de plusieurs composants accessoires "app" définis qui pourraient être sous licences différentes. Pour plus d\'informations visitez: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'En poursuivant l\'installation ou en exécutant ce logiciel, vous acceptez les #TERMSANDCONDITIONS et la #PRIVACYPOLICY',
    'welcomeSecurity':u'Sécurité\nPour protéger votre vie privée, nous garantissons qu\'aucune informations ne sera stockée sur nos serveurs et que les communications sont chiffrées afin que de tierces parties ne puissent y accéder.',
    'welcomeSoftwareUpdates':u'Mises à jour logiciel\nLes mises à jour de ce logiciel sont automatiques.',
    'windowsAdminPrivileges':u'Vous devez avoir les droits administrateur pour installer DWAgent.\nVeuillez démarrer l\'exécutable avec \'exécuter en tant qu\'administrateur\'.',
    'yes':u'Oui'
}
                                                                                                                                                                                    ui/messages/cs.py                                                                                   0000644 0001750 0001750 00000027166 14137471765 013602  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Souhlasím',
    'agentName':u'Název agenta',
    'alreadyInstalled':u'DWAgent je už nainstalovaný.\n\nAgent se aktualizuje automaticky. To znamená, že ho není třeba aktualizovat ručně.',
    'back':u'Zpět',
    'cancel':u'Storno',
    'cancelInstall':u'Instalace byla zrušena.',
    'cancelUninstall':u'Odinstalace byla zrušena.',
    'checkInstallCode':u'Prověřování kódu instalace…',
    'chooseProxyType':u'Jaký typ proxy chcete použít?',
    'close':u'Zavřít',
    'code':u'Kód',
    'commands':u'Příkazy',
    'configureAgent':u'Nastavit agenta',
    'configureAgentDisabled':u'Agent vypnut.',
    'configureAgentEnabled':u'Agent zapnut.',
    'configureChangeInstallKey':u'Změnit kód instalace',
    'configureChooseMonitorTrayIconVisibility':u'Chcete zobrazovat ikonu monitoru v oznamovací oblasti systémového panelu?',
    'configureChooseOperation':u'Zvolte akci:',
    'configureDesktopNotification':u'Oznámení na ploše',
    'configureDesktopNotificationOK':u'Oznámení na ploše byla nastavena.',
    'configureDisableAgent':u'Vypnout agenta',
    'configureDisableAgentQuestion':u'Chcete agenta vypnout?',
    'configureEnableAgent':u'Zapnout agenta',
    'configureEnableAgentQuestion':u'Chcete agenta zapnout?',
    'configureEnd':u'Nastavení je dokončeno.',
    'configureErrorConnection':u'Chyba spojení. Ověřte zda je spuštěná služba DWAgent.',
    'configureExit':u'Ukončit',
    'configureInsertPassword':u'Zadejte heslo pro odemčení nastavení:',
    'configureInstallAgent':u'Jak chcete agenta nastavovat?',
    'configureInstallCode':u'Zadáním kódu instalace',
    'configureInstallNewAgent':u'Vytvořením nového agenta',
    'configureInvalidPassword':u'Neplatné heslo.',
    'configureKeyInstalled':u'Klíč byl úspěšně nainstalován.',
    'configureLater':u'Nastavit později',
    'configureMonitor':u'Nastavit monitor',
    'configurePassword':u'Nastavit heslo',
    'configurePasswordErrNoMatch':u'Zadaná hesla se neshodují.',
    'configurePasswordUpdated':u'Heslo bylo změněno.',
    'configureProxy':u'Nastavit proxy',
    'configureProxyEnd':u'Proxy úspěšně nastavena.',
    'configureRemovePassword':u'Odstranit heslo',
    'configureRemovePasswordQuestion':u'Opravdu odstranit heslo?',
    'configureSetPassword':u'Nastavit heslo',
    'configureTitle':u'Nastavení DWAgent',
    'configureTrayIconOK':u'Zobrazování ikony v oznamovací oblasti systémového panelu úspěšně nastaveno.',
    'configureTrayIconVisibility':u'Zobrazování ikony v oznamovací oblasti systémového panelu',
    'configureUninstallKeyQuestion':u'Odinstalovat stávající kód instalace?',
    'configureUninstallationKey':u'Odinstalace…',
    'confirmExit':u'Opravdu ukončit?',
    'confirmInstall':u'Opravdu chcete nainstalovat DWAgenta do „{0}“?',
    'confirmUninstall':u'Opravdu odstranit DWAgenta?',
    'copyFiles':u'Kopírování souborů…',
    'createNewAgent':u'Vytváření agenta…',
    'decline':u'Nesouhlasím',
    'desktopNotificationAutoHide':u'Automaticky skrýt',
    'desktopNotificationNone':u'Žádné',
    'desktopNotificationVisible':u'Viditelné',
    'downloadFile':u'Stahování souboru {0}…',
    'dwsPassword':u'DWS heslo',
    'dwsUser':u'DWS uživatelské jméno',
    'endInstall':u'Instalace je dokončena.',
    'endInstallConfigLater':u'Instalace dokončena.\nAgent není nastaven. Můžete ho ovšem nastavit později.',
    'endUninstall':u'Odinstalace je dokončena.',
    'enter':u'vstup',
    'enterInstallCode':u'Zadejte kód instalace',
    'enterInstallNewAgent':u'Zadejte údaje pro vytvoření nového agenta:',
    'enterRunCode':u'Zadejte kód spojení',
    'error':u'Chyba',
    'errorAgentAlreadyExsists':u'Agent {0} už existuje.',
    'errorAgentMax':u'Překročen nejvyšší možný počet agentů.',
    'errorAgentNameNotValid':u'Název agenta není platný. Nelze použít znaky / \ | # @ :',
    'errorConnectionConfig':u'Chyba spojení. Zkontrolujte zda je spuštěná služba DWAgent.',
    'errorConnectionQuestion':u'Chyba spojení. Zkontroluje připojení k Internetu nebo nastavení brány firewall.\nChcete nastavit proxy?',
    'errorInvalidCode':u'Zadaný kód není platný.',
    'errorInvalidUserPassword':u'Neplatné uživatelské jméno nebo heslo.',
    'fieldRequired':u'Je třeba, aby kolonka „{0}“ byla vyplněná.',
    'install':u'Instalace',
    'installMonitor':u'Instalace monitoru…',
    'installMonitorErr':u'Instalace monitoru se nezdařila.',
    'installService':u'Instalace služby…',
    'installServiceErr':u'Instalace služby se nezdařila.',
    'installShortcuts':u'Instalace zástupců…',
    'installShortcutsErr':u'Instalace zástupců se nezdařila.',
    'linuxRootPrivileges':u'Pro instalaci DWAgenta jsou zapotřebí práva pro správu systému.\nSpusťte instalační skript jako superuživatel (např. pomocí sudo).',
    'menuConfigure':u'Nastavit',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Odinstalovat',
    'missingInfoFile':u'Soubor info.json nenalezen.',
    'missingNative':u'Nativní chyba.',
    'missingRuntime':u'Běhové prostředí nenalezeno.',
    'monitorActive':u'aktivní',
    'monitorAgentDisabled':u'Agent je vypnutý.',
    'monitorAgentEnabled':u'Agent je zapnutý.',
    'monitorConfigure':u'Nastavit',
    'monitorConnections':u'Spojení',
    'monitorCurrentActivities':u'Současné aktivity',
    'monitorDisable':u'Vypnout',
    'monitorDisableAgentQuestion':u'Vypnout spouštění agenta?',
    'monitorDownload':u'Stahování',
    'monitorEnable':u'Zapnout',
    'monitorEnableAgentQuestion':u'Chcete zapnout spouštění agenta?',
    'monitorEnterPassword':u'Zadejte heslo:',
    'monitorErrorConnectionConfig':u'Chyba spojení. Zkontrolujte zda je spuštěná služba DWAgent.',
    'monitorHide':u'Skrýt',
    'monitorInvalidPassword':u'Neplatné heslo.',
    'monitorNoActivities':u'Žádná aktivita',
    'monitorScreenCapture':u'Přístup k obrazovce',
    'monitorSession':u'Sezení',
    'monitorShellSession':u'Přístup k shellu',
    'monitorShow':u'Zobrazit',
    'monitorStatus':u'Stav',
    'monitorStatusDisabled':u'Vypnuto',
    'monitorStatusNoService':u'Žádná služba',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Aktualizace',
    'monitorTitle':u'DWAgent – Monitor',
    'monitorUninstall':u'Odinstalovat',
    'monitorUninstallNotRun':u'Pro odinstalaci jsou zapotřebí práva pro správu systému.\nSpusťte příkaz dwaguninstall v příkazovém řádku.',
    'monitorUpload':u'Nahrávání',
    'mustAccept':u'Aby bylo možné pokračovat, je třeba vybrat možnost {0}',
    'mustSelectOptions':u'Vyberte jednu z možností.',
    'next':u'Další',
    'no':u'Ne',
    'noTryAgain':u'Ne, zkusit znovu',
    'notInstalled':u'DWAgent není nainstalovaný.',
    'ok':u'Ok',
    'option':u'Volba',
    'optionNotValid':u'Vybraná volba není platná.',
    'or':u'nebo',
    'password':u'Heslo',
    'path':u'Cesta',
    'pathCreating':u'Vytváření složky…',
    'pathNotCreate':u'Složku se nepodařilo vytvořit. Neplatná cesta nebo nedostatečná oprávnění.',
    'pressEnter':u'Pokračujte stiskem klávesy Enter.',
    'privacyPolicy':u'Zásadami ochrany osobních údajů',
    'proxyAuthPassword':u'Heslo',
    'proxyAuthUser':u'Uživatel',
    'proxyHost':u'Stroj',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'Zadejte informace o proxy.',
    'proxyNone':u'Nepoužívat',
    'proxyPort':u'Port',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'Převzít ze systému',
    'reEnterCode':u'Znovu zadejte kód.',
    'reEnterData':u'Znovu zadejte údaje',
    'rePassword':u'Zadejte heslo znovu',
    'removeFile':u'Odstraňování souboru…',
    'runWithoutInstallation':u'Spustit',
    'runWithoutInstallationClosing':u'Ukončování relace…',
    'runWithoutInstallationConnecting':u'Otevírání relace…',
    'runWithoutInstallationEnd':u'Relace ukončena.',
    'runWithoutInstallationOnlineBottom':u'VAROVÁNÍ:\nTyto údaje poskytněte jen důvěryhodným osobám, protože jim tím dáváte přístup do tohoto počítače. Pokud si nejste jisti tím, co děláte, raději tuto aplikaci ukončete.',
    'runWithoutInstallationOnlineBottomPutCode':u'VAROVÁNÍ:\nAgent je nyní připraven přijímat připojení. Pokud si nejste jistí, co děláte, tuto aplikaci prosím zavřete.',
    'runWithoutInstallationOnlinePassword':u'Heslo: {0}',
    'runWithoutInstallationOnlineTop':u'Relace je aktivní.\nPro připojení k tomuto agentovi navštivte https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Relace je aktivní.',
    'runWithoutInstallationOnlineUser':u'Uživatel: {0}',
    'runWithoutInstallationStarting':u'Spouštění agenta…',
    'runWithoutInstallationUnexpectedError':u'Neočekávaná chyba.\nNepodařilo se spustit DWAgenta. Pokud problém přetrvává, zkuste si stáhnout nejnovější verzi DWAgenta, smažte složku „{0}“ a spusťte DWAgenta znovu.',
    'runWithoutInstallationUpdating':u'Aktualizace agenta…',
    'runWithoutInstallationWait':u'Čekejte, navazuje se nové spojení (pokus {0})…',
    'selectPathInstall':u'Vyberte cestu k instalaci:',
    'startService':u'Spouštění služby…',
    'startServiceErr':u'Spuštění služby se nezdařilo.',
    'termsAndConditions':u'Smluvními podmínkami',
    'titleInstall':u'DWAgent - instalace',
    'titleUninstall':u'DWAgent - odinstalace',
    'toBack':u'pro návrat zpět.',
    'toExit':u'pro ukončení.',
    'unexpectedError':u'Neočekávaná chyba.\n{0}',
    'uninstallMonitor':u'Odstraňování monitoru…',
    'uninstallService':u'Odstraňování služby…',
    'uninstallShortcuts':u'Odstraňování zástupců…',
    'user':u'Uživatel',
    'validInteger':u'Je třeba, aby kolonka „{0}“ bylo celé kladné číslo.',
    'versionInstallNotValid':u'Tato varianta instalátoru není určená pro váš operační sytém.\nStáhněte si správnou verzi. {0}',
    'waiting':u'Čekejte…',
    'warningLoginLogout':u'Aby se tato změna projevila, uživatel se musí odhlásit a znovu přihlásit.',
    'warningRemovePath':u'Varování: cílová složka už existuje – stávající obsah bude smazán.',
    'warningSpyingTool':u'Upozorňujeme, že ke vzdálenému počítači nelze přistupovat bez souhlasu jeho uživatele. Používáním služby DWService jako špionážního nástroje můžete porušovat zákony země, ve které žijete.',
    'welcomeLicense':u'Licence\nTento software je svobodný a opensource.\nSkládá se z jedné hlavní komponenty, vydané pod licencí MPLv2, a několika pomocných komponent, vydaných pod různými licencemi. Více informací naleznete na: https://www.dwservice.net/cs/licenses-sources.html',
    'welcomePrivacyTerms':u'Pokračováním v instalaci nebo spuštění tohoto software vyjadřujete souhlas s #TERMSANDCONDITIONS a #PRIVACYPOLICY',
    'welcomeSecurity':u'Zabezpečení\nAby bylo ochráněno Vaše soukromí, garantujeme že na našich serverech nejsou ukládány žádné údaje a komunikace je zašifrována tak, že je pro všechny ostatní nečitelná.',
    'welcomeSoftwareUpdates':u'Aktualizace software\nAktualizace tohoto software se děje automaticky.',
    'windowsAdminPrivileges':u'Pro instalaci DWAgenta jsou zapotřebí práva pro správu systému.\nKlikněte na instalační soubor pravým tlačítkem a z kontextové nabídky zvolte „Spustit jako správce“.',
    'yes':u'Ano'
}
                                                                                                                                                                                                                                                                                                                                                                                                          ui/messages/nl.py                                                                                   0000644 0001750 0001750 00000027225 14137471775 013603  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Accepteren',
    'agentName':u'Naam agent',
    'alreadyInstalled':u'DWAgent is al geïnstalleerd.\n\nDe agent wordt automatisch bijgewerkt naar de laatste versie. Dit betekent dat u nieuwe updates niet handmatig hoeft te installeren.',
    'back':u'Terug',
    'cancel':u'Annuleren',
    'cancelInstall':u'De installatie is geannuleerd.',
    'cancelUninstall':u'De verwijdering is geannuleerd.',
    'checkInstallCode':u'Installatiecode controleren...',
    'chooseProxyType':u'Welk type proxy wilt u gebruiken?',
    'close':u'Sluiten',
    'code':u'Code',
    'commands':u'Opdrachten',
    'configureAgent':u'Agent configureren',
    'configureAgentDisabled':u'Agent uitgeschakeld.',
    'configureAgentEnabled':u'Agent ingeschakeld.',
    'configureChangeInstallKey':u'Installatiecode wijzigen.',
    'configureChooseMonitorTrayIconVisibility':u'Wilt u het monitorpictogram in het systeemvak weergeven?',
    'configureChooseOperation':u'Kies een bewerking:',
    'configureDesktopNotification':u'Bureaubladmelding',
    'configureDesktopNotificationOK':u'Bureaubladmelding met succes geconfigureerd.',
    'configureDisableAgent':u'Agent uitschakelen',
    'configureDisableAgentQuestion':u'Wilt u de agent uitschakelen?',
    'configureEnableAgent':u'Agent inschakelen',
    'configureEnableAgentQuestion':u'Wilt u de agent inschakelen?',
    'configureEnd':u'De configuratie is voltooid.',
    'configureErrorConnection':u'Verbindingsfout. Controleer of de DWAgent-service draait.',
    'configureExit':u'Afsluiten',
    'configureInsertPassword':u'Voer het configuratiewachtwoord in:',
    'configureInstallAgent':u'Hoe wilt u de agent configureren?',
    'configureInstallCode':u'Voer de installatiecode in',
    'configureInstallNewAgent':u'Een nieuwe agent aanmaken',
    'configureInvalidPassword':u'Ongeldig wachtwoord.',
    'configureKeyInstalled':u'Sleutel met succes geïnstalleerd.',
    'configureLater':u'Later configureren',
    'configureMonitor':u'Monitor configureren',
    'configurePassword':u'Configuratiewachtwoord bewerken',
    'configurePasswordErrNoMatch':u'De wachtwoorden komen niet overeen.',
    'configurePasswordUpdated':u'Wachtwoord bijgewerkt.',
    'configureProxy':u'Proxy configureren',
    'configureProxyEnd':u'Proxy met succes geconfigureerd.',
    'configureRemovePassword':u'Wachtwoord verwijderen',
    'configureRemovePasswordQuestion':u'Wilt u het wachtwoord verwijderen?',
    'configureSetPassword':u'Wachtwoord instellen',
    'configureTitle':u'DWAgent - Configuratie',
    'configureTrayIconOK':u'Systeemvakpictogram met succes geconfigureerd.',
    'configureTrayIconVisibility':u'Zichtbaarheid systeemvakpictogram',
    'configureUninstallKeyQuestion':u'De huidige installatiecode verwijderen?',
    'configureUninstallationKey':u'Verwijderen...',
    'confirmExit':u'Weet u zeker dat u wilt afsluiten?',
    'confirmInstall':u'Wilt u DWAgent installeren in \'{0}\'?',
    'confirmUninstall':u'Wilt u DWAgent verwijderen?',
    'copyFiles':u'Bestanden kopiëren...',
    'createNewAgent':u'Aanmaken van nieuwe agent in uitvoering...',
    'decline':u'Niet accepteren',
    'desktopNotificationAutoHide':u'Automatisch verbergen',
    'desktopNotificationNone':u'Geen',
    'desktopNotificationVisible':u'Zichtbaar',
    'downloadFile':u'Bestand {0} downloaden...',
    'dwsPassword':u'DWS-wachtwoord',
    'dwsUser':u'DWS-gebruiker',
    'endInstall':u'Installatie is voltooid.',
    'endInstallConfigLater':u'De installatie is voltooid.\nDe agent is niet geconfigureerd. U kunt de configuratie later nog aanmaken.',
    'endUninstall':u'Verwijdering is voltooid.',
    'enter':u'invoeren',
    'enterInstallCode':u'Voor de installatiecode in',
    'enterInstallNewAgent':u'Voer gegevens in om een nieuwe agent aan te maken:',
    'enterRunCode':u'Voer de verbindingscode in',
    'error':u'Fout',
    'errorAgentAlreadyExsists':u'Agent {0} bestaat al.',
    'errorAgentMax':u'Maximum aantal agents overschreden.',
    'errorAgentNameNotValid':u'De naam van de agent is ongeldig. U kunt geen gebruik maken van de tekens / \ | # @ : .',
    'errorConnectionConfig':u'Verbindingsfout. Controleer of de DWAgent-service draait.',
    'errorConnectionQuestion':u'Verbindingsfout. Controleer uw internetverbinding of firewall.\nWilt u een proxy configureren?',
    'errorInvalidCode':u'De ingevoerde code is ongeldig.',
    'errorInvalidUserPassword':u'Ongeldige gebruiker of wachtwoord.',
    'fieldRequired':u'Het veld \'{0}\' is vereist.',
    'install':u'Installeren',
    'installMonitor':u'Monitor installeren...',
    'installMonitorErr':u'Installatie van monitor mislukt.',
    'installService':u'Service installeren...',
    'installServiceErr':u'Installatie van service mislukt.',
    'installShortcuts':u'Snelkoppelingen installeren...',
    'installShortcutsErr':u'Installatie van snelkoppelingen mislukt.',
    'linuxRootPrivileges':u'U moet root-rechten hebben om DWAgent te installeren.\nVoer het script uit met sudo of als root.',
    'menuConfigure':u'Configureren',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Verwijderen',
    'missingInfoFile':u'Bestand info.json niet gevonden.',
    'missingNative':u'Bron niet gevonden.',
    'missingRuntime':u'Uitvoerbestand niet gevonden.',
    'monitorActive':u'actief',
    'monitorAgentDisabled':u'Agent uitgeschakeld.',
    'monitorAgentEnabled':u'Agent ingeschakeld.',
    'monitorConfigure':u'Configureren',
    'monitorConnections':u'Verbindingen',
    'monitorCurrentActivities':u'Huidige activiteiten',
    'monitorDisable':u'Uitschakelen',
    'monitorDisableAgentQuestion':u'Wilt u de agent uitschakelen?',
    'monitorDownload':u'Downloaden',
    'monitorEnable':u'Inschakelen',
    'monitorEnableAgentQuestion':u'Wilt u de agent inschakelen?',
    'monitorEnterPassword':u'Wachtwoord invoeren:',
    'monitorErrorConnectionConfig':u'Verbindingsfout. Controleer of de DWAgent-service draait.',
    'monitorHide':u'Verbergen',
    'monitorInvalidPassword':u'Ongeldig wachtwoord.',
    'monitorNoActivities':u'Geen activiteiten',
    'monitorScreenCapture':u'Schermtoegang',
    'monitorSession':u'Sessie',
    'monitorShellSession':u'Shell-toegang',
    'monitorShow':u'Weergeven',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Uitgeschakeld',
    'monitorStatusNoService':u'Geen service',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Bijwerken',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Verwijderen',
    'monitorUninstallNotRun':u'U kunt de installatie niet ongedaan maken zonder root-rechten.\nVoer de opdracht dwaguninstall uit met sudo of als root.',
    'monitorUpload':u'Uploaden',
    'mustAccept':u'Om verder te gaan, moet u de optie {0} selecteren',
    'mustSelectOptions':u'U moet een optie kiezen.',
    'next':u'Volgende',
    'no':u'Nee',
    'noTryAgain':u'Nee, opnieuw proberen',
    'notInstalled':u'DWAgent is niet geïnstalleerd.',
    'ok':u'Ok',
    'option':u'Optie',
    'optionNotValid':u'Geselecteerde optie is ongeldig.',
    'or':u'of',
    'password':u'Wachtwoord',
    'path':u'Pad',
    'pathCreating':u'Map maken...',
    'pathNotCreate':u'Kon de map niet aanmaken. Ongeldig pad of geen toestemming.',
    'pressEnter':u'Druk op enter om verder te gaan.',
    'privacyPolicy':u'Privacybeleid',
    'proxyAuthPassword':u'Wachtwoord',
    'proxyAuthUser':u'Gebruiker',
    'proxyHost':u'Host',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'Proxy-informatie invoeren.',
    'proxyNone':u'Geen',
    'proxyPort':u'Poort',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'Systeem',
    'reEnterCode':u'Code opnieuw invoeren',
    'reEnterData':u'Gegevens opnieuw invoeren',
    'rePassword':u'Wachtwoord opnieuw invoeren',
    'removeFile':u'Bestand verwijderen...',
    'runWithoutInstallation':u'Uitvoeren',
    'runWithoutInstallationClosing':u'Sessie sluiten...',
    'runWithoutInstallationConnecting':u'Sessie openen...',
    'runWithoutInstallationEnd':u'Sessie afgelopen.',
    'runWithoutInstallationOnlineBottom':u'WAARSCHUWING:\nGeef deze informatie niet aan mensen die u niet vertrouwt. Het zal hen in staat stellen toegang te krijgen tot dit apparaat. Als u niet zeker weet wat u doet, sluit deze toepassing dan af.',
    'runWithoutInstallationOnlineBottomPutCode':u'WAARSCHUWING:\nDe agent is nu klaar om een verbinding te accepteren. Als u niet zeker weet wat u doet, sluit deze toepassing dan af.',
    'runWithoutInstallationOnlinePassword':u'Wachtwoord: {0}',
    'runWithoutInstallationOnlineTop':u'De sessie is actief.\nGa naar https://www.dwservice.net om met de agent te verbinden',
    'runWithoutInstallationOnlineTopPutCode':u'De sessie is actief.',
    'runWithoutInstallationOnlineUser':u'Gebruiker: {0}',
    'runWithoutInstallationStarting':u'Agent opstarten...',
    'runWithoutInstallationUnexpectedError':u'Onverwachte fout.\nDWAgent kon niet starten. Als het probleem zich blijft voordoen, download dan de laatste versie van DWAgent, verwijder de map \'{0}\' en start DWAgent opnieuw.',
    'runWithoutInstallationUpdating':u'Agent bijwerken...',
    'runWithoutInstallationWait':u'Wachten tot de nieuwe verbinding gemaakt is (poging {0})...',
    'selectPathInstall':u'Selecteer het installatiepad:',
    'startService':u'Service starten...',
    'startServiceErr':u'Service starten mislukt.',
    'termsAndConditions':u'Algemene voorwaarden',
    'titleInstall':u'DWAgent - Installatie',
    'titleUninstall':u'DWAgent - Verwijderen',
    'toBack':u'om terug te keren.',
    'toExit':u'om af te sluiten.',
    'unexpectedError':u'Onverwachte fout.\n{0}',
    'uninstallMonitor':u'Monitor verwijderen...',
    'uninstallService':u'Service verwijderen...',
    'uninstallShortcuts':u'Snelkoppelingen verwijderen...',
    'user':u'Gebruiker',
    'validInteger':u'Het veld \'{0}\' moet een getal zijn.',
    'versionInstallNotValid':u'Deze versie van het installatieprogramma is niet correct voor uw besturingssysteem.\nDownload de juiste versie. {0}',
    'waiting':u'Wachten...',
    'warningLoginLogout':u'Om deze wijziging van kracht te laten worden, moet de gebruiker afmelden en opnieuw aanmelden.',
    'warningRemovePath':u'Waarschuwing: de doelmap bestaat al en zal worden verwijderd.',
    'warningSpyingTool':u'Hou er rekening mee dat u geen toegang mag krijgen tot een computer op afstand zonder de toestemming van de gebruiker. Door DWService als spionagemiddel te gebruiken overtreedt u mogelijk de wetten in het land waar u woont.',
    'welcomeLicense':u'Licentie\nDeze software is gratis en open source.\nHet bestaat uit één hoofdonderdeel dat is vrijgegeven onder de MPLv2-licentie en verscheidene bijkomende onderdelen die onder verschillende licenties vallen. Bezoek https://www.dwservice.net/en/licenses-sources.html voor meer informatie.',
    'welcomePrivacyTerms':u'Door verder te gaan met de installatie of het uitvoeren van deze software gaat u akkoord met de #TERMSANDCONDITIONS en het #PRIVACYPOLICY',
    'welcomeSecurity':u'Beveiliging\nOm uw privacy te beschermen slaan wij geen informatie van de agent op onze servers op. De communicatie tussen gebruikers, onze servers en agenten wordt versleuteld, zodat derden er geen toegang toe kunnen krijgen.',
    'welcomeSoftwareUpdates':u'Software-updates\nDeze software wordt automatisch bijgewerkt',
    'windowsAdminPrivileges':u'U moet beheerdersrechten hebben om DWAgent te installeren.\nKlik met de rechtermuisknop op het uitvoerbare bestand en klik op \'als administrator uitvoeren\' om het installatieprogramma te starten.',
    'yes':u'Ja'
}
                                                                                                                                                                                                                                                                                                                                                                           ui/messages/de.py                                                                                   0000644 0001750 0001750 00000027763 14137471762 013565  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Akzeptieren',
    'agentName':u'Agentenname',
    'alreadyInstalled':u'DWAgent ist bereits installiert. \n\nDer Agent wird automatisch auf die neueste Version aktualisiert. Das heisst, es können keine manuellen Updates durchgeführt werden.',
    'back':u'Zurück',
    'cancel':u'Abbrechen',
    'cancelInstall':u'Die Installation wurde abgebrochen.',
    'cancelUninstall':u'Die Deinstallation wurde abgebrochen.',
    'checkInstallCode':u'Prüfe Installationscode...',
    'chooseProxyType':u'Welcher Proxy-Typ soll verwendet werden?',
    'close':u'Schliessen',
    'code':u'Code',
    'commands':u'Befehle',
    'configureAgent':u'Agent konfigurieren',
    'configureAgentDisabled':u'Agent deaktiviert',
    'configureAgentEnabled':u'Agent aktiviert',
    'configureChangeInstallKey':u'Installations-Code ändern',
    'configureChooseMonitorTrayIconVisibility':u'Monitor-Symbol in der Taskleiste anzeigen?',
    'configureChooseOperation':u'Bitte einen Vorgang auswählen:',
    'configureDesktopNotification':u'Desktopbenachrichtigung',
    'configureDesktopNotificationOK':u'Desktopbenachrichtigung erfolgreich konfiguriert.',
    'configureDisableAgent':u'Agent deaktivieren',
    'configureDisableAgentQuestion':u'Wollen Sie den Agenten deaktivieren?',
    'configureEnableAgent':u'Agent aktivieren',
    'configureEnableAgentQuestion':u'Wollen Sie den Agenten aktivieren?',
    'configureEnd':u'Die Konfiguration wurde fertiggestellt.',
    'configureErrorConnection':u'Verbindungsfehler. Bitte prüfen, ob der DWAgent-Dienst läuft.',
    'configureExit':u'Beenden',
    'configureInsertPassword':u'Bitte Konfigurations-Passwort eingeben:',
    'configureInstallAgent':u'Wie soll der Agent bevorzugt konfiguriert werden?',
    'configureInstallCode':u'Bitte Installations-Code eingeben',
    'configureInstallNewAgent':u'Erzeuge neuen Agenten',
    'configureInvalidPassword':u'Ungültiges Passwort.',
    'configureKeyInstalled':u'Schlüssel erfolgreich installiert.',
    'configureLater':u'Später konfigurieren',
    'configureMonitor':u'Monitor konfigurieren',
    'configurePassword':u'Konfigurationspasswort ändern',
    'configurePasswordErrNoMatch':u'Die Passwörter stimmen nicht überein.',
    'configurePasswordUpdated':u'Passwort aktualisiert.',
    'configureProxy':u'Proxy konfigurieren',
    'configureProxyEnd':u'Proxy erfolgreich konfiguriert.',
    'configureRemovePassword':u'Passwort entfernen',
    'configureRemovePasswordQuestion':u'Möchten Sie das Passwort entfernen?',
    'configureSetPassword':u'Passwort festlegen',
    'configureTitle':u'DWAgent - Konfiguration',
    'configureTrayIconOK':u'Taskleistensymbol erfolgreich konfiguriert.',
    'configureTrayIconVisibility':u'Sichtbarkeit des Taskleistensymbols',
    'configureUninstallKeyQuestion':u'Aktuellen Installations-Code entfernen?',
    'configureUninstallationKey':u'Deinstallation...',
    'confirmExit':u'Sind Sie sicher, dass das Programm beendet werden soll?',
    'confirmInstall':u'Den DWAgent in \'{0}\' installieren?',
    'confirmUninstall':u'Wollen Sie den DWAgent entfernen?',
    'copyFiles':u'Kopiere Dateien...',
    'createNewAgent':u'Agent wird erzeugt...',
    'decline':u'Ich lehne ab',
    'desktopNotificationAutoHide':u'Automatisch ausblenden',
    'desktopNotificationNone':u'Keine',
    'desktopNotificationVisible':u'Sichtbar',
    'downloadFile':u'Lade Datei {0} herunter...',
    'dwsPassword':u'DWS Passwort',
    'dwsUser':u'DWS Benutzer',
    'endInstall':u'Installation abgeschlossen.',
    'endInstallConfigLater':u'Installation abgeschlossen.\nDer Agent wurde nicht konfiguriert. Die Konfiguration kann aber später erstellt werden.',
    'endUninstall':u'Deinstallation abgeschlossen.',
    'enter':u'Eingabe',
    'enterInstallCode':u'Installationscode eingeben',
    'enterInstallNewAgent':u'Daten für neuen Agenten eingeben:',
    'enterRunCode':u'Geben Sie den Verbindungscode ein',
    'error':u'Fehler',
    'errorAgentAlreadyExsists':u'Der Agent {0} existiert bereits.',
    'errorAgentMax':u'Maximale Anzahl an Agenten überschritten.',
    'errorAgentNameNotValid':u'Der Agentenname ist ungültig. Die Zeichen / \ | # @ : . können nicht verwendet werden.',
    'errorConnectionConfig':u'Verbindungsfehler. Bitte prüfen, ob der DWAgent-Dienst läuft.',
    'errorConnectionQuestion':u'Verbindungsfehler. Bitte Internetverbindung oder Firewalleinstellungen prüfen.\nWollen Sie den Proxy konfigurieren?',
    'errorInvalidCode':u'Der eingegebene Code ist ungültig.',
    'errorInvalidUserPassword':u'Benutzername oder Passwort ungültig.',
    'fieldRequired':u'Das Feld \'{0}\' ist erforderlich.',
    'install':u'Installieren',
    'installMonitor':u'Installiere Monitor...',
    'installMonitorErr':u'Installation des Monitors fehlgeschlagen.',
    'installService':u'Installiere Dienst...',
    'installServiceErr':u'Installation des Dienstes fehlgeschlagen.',
    'installShortcuts':u'Installiere Verknüpfungen...',
    'installShortcutsErr':u'Installation der Verknüpfungen fehlgeschlagen.',
    'linuxRootPrivileges':u'Für die Installation des DWAgent sind root-Rechte erforderlich.\nSkript bitte als root-Benutzer starten.',
    'menuConfigure':u'Konfigurieren',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Deinstallieren',
    'missingInfoFile':u'Datei info.json nicht gefunden.',
    'missingNative':u'Native nicht gefunden.',
    'missingRuntime':u'Laufzeitumgebung nicht gefunden.',
    'monitorActive':u'aktiv',
    'monitorAgentDisabled':u'Agent deaktiviert.',
    'monitorAgentEnabled':u'Agent aktiviert.',
    'monitorConfigure':u'Konfigurieren',
    'monitorConnections':u'Verbindungen',
    'monitorCurrentActivities':u'Momentane Aktivitäten',
    'monitorDisable':u'Deaktivieren',
    'monitorDisableAgentQuestion':u'Den Agenten deaktivieren?',
    'monitorDownload':u'Download',
    'monitorEnable':u'Aktivieren',
    'monitorEnableAgentQuestion':u'Den Agenten aktivieren?',
    'monitorEnterPassword':u'Passwort eingeben:',
    'monitorErrorConnectionConfig':u'Verbindungsfehler. Bitte prüfen, ob der DWAgent-Dienst läuft.',
    'monitorHide':u'Ausblenden',
    'monitorInvalidPassword':u'Ungültiges Passwort.',
    'monitorNoActivities':u'Keine Aktivitäten',
    'monitorScreenCapture':u'Bildschirmzugriff',
    'monitorSession':u'Sitzung',
    'monitorShellSession':u'Shell-Zugriff',
    'monitorShow':u'Einblenden',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Deaktiviert',
    'monitorStatusNoService':u'Kein Dienst',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Aktualisiere',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Deinstallieren',
    'monitorUninstallNotRun':u'Für die Deinstallation sind root-Rechte erforderlich.\nBefehl dwaguninstall in der Shell mit root-Rechte ausführen.',
    'monitorUpload':u'Upload',
    'mustAccept':u'Zum Fortsetzen {0} auswählen',
    'mustSelectOptions':u'Auswahl einer Option erforderlcih.',
    'next':u'Weiter',
    'no':u'Nein',
    'noTryAgain':u'Nein, erneut versuchen',
    'notInstalled':u'DWAgent nicht installiert.',
    'ok':u'Ok',
    'option':u'Option',
    'optionNotValid':u'Gewählte Option ungültig.',
    'or':u'oder',
    'password':u'Passwort',
    'path':u'Pfad',
    'pathCreating':u'Ordner wird erstellt...',
    'pathNotCreate':u'Ordner konnte nicht erstellt werden. Ungültiger Pfad oder fehlende Berechtigungen.',
    'pressEnter':u'Zum Fortsetzen die Enter-Taste drücken.',
    'privacyPolicy':u'Datenschutzbestimmungen',
    'proxyAuthPassword':u'Proxy-Passwort',
    'proxyAuthUser':u'Proxy-Benutzer',
    'proxyHost':u'Proxy-Host',
    'proxyHttp':u'Proxy-URL',
    'proxyInfo':u'Proxy-Informationen eingeben.',
    'proxyNone':u'Keiner',
    'proxyPort':u'Port',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'System',
    'reEnterCode':u'Code erneut eingeben',
    'reEnterData':u'Daten erneut eingeben',
    'rePassword':u'Passwort erneut eingeben',
    'removeFile':u'Datei wird gelöscht...',
    'runWithoutInstallation':u'Ausführen',
    'runWithoutInstallationClosing':u'Schliesse Sitzung...',
    'runWithoutInstallationConnecting':u'Öffne Sitzung...',
    'runWithoutInstallationEnd':u'Sitzung beendet.',
    'runWithoutInstallationOnlineBottom':u'WARNUNG:\nGeben Sie diese Informationen nicht Dritten, denen Sie nicht vertrauen. Sonst können sich diese mit diesem Agenten vebinden. Im Zweifelsfall schliessen Sie dieses Programm.',
    'runWithoutInstallationOnlineBottomPutCode':u'WARNUNG:\nDer Agent kann nun Verbindungen annehmen. Wenn Sie sich nicht sicher sind, was Sie tun, schliessen Sie bitte diese Anwendung.',
    'runWithoutInstallationOnlinePassword':u'Passwort: {0}',
    'runWithoutInstallationOnlineTop':u'Die Sitzung ist aktiv.\nUm sich nun mit diesem Computer zu verbinden, müssen in einem Browser die Webadresse https://www.dwservice.net aufgerufen und bei "Login" die folgenden Angaben eingegeben werden:',
    'runWithoutInstallationOnlineTopPutCode':u'Die Sitzung ist aktiv.',
    'runWithoutInstallationOnlineUser':u'Benutzer: {0}',
    'runWithoutInstallationStarting':u'Agent startet...',
    'runWithoutInstallationUnexpectedError':u'Unerwarteter Fehler.\nDWAgent konnte nicht gestartet werden. Wenn das Problem bestehen bleibt, bitte die neueste Version von DWAgent herunterladen, den Ordner \'{0}\' löschen und DWAgent erneut ausführen.',
    'runWithoutInstallationUpdating':u'Aktualisiere Agenten...',
    'runWithoutInstallationWait':u'Warte auf neue Verbindung ({0}. Versuch)...',
    'selectPathInstall':u'Installationsverzeichnis auswählen:',
    'startService':u'Dienst wird gestartet...',
    'startServiceErr':u'Dienst konnte nicht gestartet werden.',
    'termsAndConditions':u'Konditionen und Bedingungen',
    'titleInstall':u'DWAgent - Installation',
    'titleUninstall':u'DWAgent - Deinstallation',
    'toBack':u'um zurückzukehren.',
    'toExit':u'um zu beenden.',
    'unexpectedError':u'Unerwarteter Fehler.\n{0}',
    'uninstallMonitor':u'Deinstalliere Monitor...',
    'uninstallService':u'Deinstalliere Dienst...',
    'uninstallShortcuts':u'Deinstalliere Verknüpfungen...',
    'user':u'Benutzer',
    'validInteger':u'Das Feld \'{0}\' muss ganzzahlig sein.',
    'versionInstallNotValid':u'Diese Version des Installationsprogrammes passt nicht zu ihrem Betriebssystem.\nBitte die richtige Version herunterladen. {0}',
    'waiting':u'Warte...',
    'warningLoginLogout':u'Um die Änderungen anzuwenden, muss der Benutzer sich erneut anmelden.',
    'warningRemovePath':u'Warnung: Der Zielordner ist bereits vorhanden und wird gelöscht.',
    'warningSpyingTool':u'Seien Sie sich bewusst, dass Sie auf einen Remotecomputer nicht ohne die Zustimmung des Benutzers zugreifen dürfen. Wenn Sie DWService als Spionagewerkzeug verwenden, machen Sie sich möglicherweise in der Rechtsprechung Ihres Landes strafbar.',
    'welcomeLicense':u'Lizenz:\nDiese Software ist frei und Open Source. \nDer Hauptbestandteil der Software ist der MPLv2-Lizenz unterstellt, einige zusätzliche Softwarekomponenten sind anderen Lizenzen unterstellt. Für mehr Informationen siehe: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Indem Sie mit der Installation fortfahren oder diese Software ausführen, erklären Sie sich mit den #TERMSANDCONDITIONS und der #PRIVACYPOLICY einverstanden',
    'welcomeSecurity':u'Sicherheit:\nUm den Datenschutz zu gewährleisten, garantieren wir, dass keine Informationen auf unseren Servern gespeichert werden und die Kommunikation verschlüsselt ist, sodass Dritte keinen Zugriff darauf haben.',
    'welcomeSoftwareUpdates':u'Software-Aktualisierungen:\nDiese Software wird automatisch aktualisiert',
    'windowsAdminPrivileges':u'Zur Installation von DWAgent sind Administratorenrechte erforderlich.\nBitte die Installation "Als Administrator ausführen".',
    'yes':u'Ja'
}
             ui/messages/it.py                                                                                   0000644 0001750 0001750 00000027776 14024661244 013604  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'titleInstall': u'DWAgent - Installazione', 
    'titleUninstall': u'DWAgent - Disinstallazione', 
    'welcomeLicense': u'Licenza\nQuesto software è libero e open source.\nConsiste di una componente principale e diverse componenti accessorie definite "app" che potrebbero essere regolate da licenze differenti. Per maggiorni informazioni visita: https://www.dwservice.net/it/licenses-sources.html',
    'welcomeSecurity': u'Sicurezza\nA tutela della vostra privacy garantiamo che nessuna informazione verrà memorizzata sui nostri server e le comunicazioni sono criptate in modo che terze parti non possono leggerle.',
    'welcomeSoftwareUpdates': u'Aggiornamenti software\nGli aggiornamenti di questo software avvengono in modo automatico.',
    'welcomePrivacyTerms':u'Procedendo con l\'installazione o l\'esecuzione di questo software accetti i #TERMSANDCONDITIONS e la #PRIVACYPOLICY',
    'termsAndConditions': u'Termini e Condizioni',
    'privacyPolicy': u'Informativa sulla Privacy',
    'confirmUninstall': u'Vuoi eliminare DWAgent?',
    'mustAccept': u'Per poter continuare devi selezionare l\'opzione {0}',
    'or' : u'o',
    'accept': u'Accetto',
    'decline': u'Non accetto', 
    'next': u'Successivo', 
    'back': u'Indietro', 
    'yes': u'Sì', 
    'no': u'No', 
    'ok': u'Ok',
    'cancel': u'Annulla', 
    'close': u'Chiudi', 
    'waiting': u'Attendere...', 
    'alreadyInstalled': u'DWAgent già installato.\n\nL\'agente si aggiorna automaticamente all\'ultima versione. Ciò significa che non è necessario installare manualmente gli aggiornamenti più recenti.', 
    'notInstalled': u'DWAgent non installato.', 
    'fieldRequired': u'Il campo \'{0}\' è obbligatorio.', 
    'selectPathInstall': u'Selezionare il percorso di installazione:', 
    'path': u'Percorso', 
    'mustSelectOptions': u'Devi selezionare un opzione.', 
    'confirmInstall': u'Vuoi installare DWAgent in \'{0}\'?', 
    'warningRemovePath': u'Attenzione la cartella di destinazione già esiste quindi verrà eliminata.', 
    'pathNotCreate': u'Impossibile creare la cartella. Percorso invalido o accesso negato.', 
    'pathCreating': u'Creazione cartella...', 
    'unexpectedError': u'Errore inaspettato.\n{0}', 
    'downloadFile': u'Scaricamento file {0}...',
    'copyFiles': u'Copia file...', 
    'installService': u'Installazione servizio...', 
    'installServiceErr': u'Installazione servizio fallita.', 
    'uninstallService': u'Disinstallazione servizio...', 
    'startService': u'Avvio servizio...', 
    'startServiceErr': u'Avvio servizio fallito.', 
    'installMonitor': u'Installazione monitor...', 
    'uninstallMonitor': u'Disinstallazione monitor...', 
    'installMonitorErr': u'Installazione monitor fallita.',
    'monitorStatus': u'Stato',
    'monitorConnections': u'Connessioni', 
    'monitorStatusOffline': u'Offline', 
    'monitorStatusOnline': u'Online', 
    'monitorStatusDisabled': u'Disabilitato', 
    'monitorStatusUpdating': u'Aggiornamento', 
    'monitorStatusNoService': u'Nessun servizio', 
    'monitorShow': u'Mostra', 
    'monitorHide': u'Nascondi',
    'monitorUninstall': u'Disinstalla', 
    'monitorConfigure': u'Configura', 
    'monitorEnable': u'Abilita', 
    'monitorDisable': u'Disabilita', 
    'monitorErrorConnectionConfig': u'Errore di connessione. Verificare se il servizio DWAgent è attivo.', 
    'monitorDisableAgentQuestion': u'Vuoi disabilitare l\'agente', 
    'monitorEnableAgentQuestion': u'Vuoi abilitare l\'agente?', 
    'monitorEnterPassword': u'Inserire password:', 
    'monitorInvalidPassword': u'Password invalida.', 
    'monitorAgentDisabled': u'Agente disabilitato.', 
    'monitorAgentEnabled': u'Agente abilitato.',
    'monitorUninstallNotRun': u'Non è possibile eseguire la disinstallazione senza i permessi di root.\nEseguire il comand dwaguninstall da console.',
    'monitorTitle': u'DWAgent - Monitor', 
    'configureTitle':u'DWAgent - Configurazione', 
    'configureChooseOperation':u'Scegliere un operazione:', 
    'configureAgent':u'Configurare agente',
    'configureProxy':u'Configurare proxy', 
    'configureMonitor':u'Configurare monitor',
    'configurePassword':u'Configurare password',
    'configureSetPassword':u'Imposta password', 
    'configureRemovePassword':u'Rimuovi password',  
    'configureRemovePasswordQuestion':u'Vuoi rimuovere la password?', 
    'configureExit':u'Esci', 
    'configureEnd':u'Configurazione completata.', 
    'configureChangeInstallKey':u'Modifica codice di installazione', 
    'configureEnableAgent': u'Abilita agente', 
    'configureAgentEnabled': u'Agente abilitato.', 
    'configureEnableAgentQuestion': u'Vuoi abilitare l\'agente?', 
    'configureDisableAgent': u'Disabilita agente',     
    'configureAgentDisabled': u'Agente disabilitato.', 
    'configureDisableAgentQuestion': u'Vuoi disabilitare l\'agente?', 
    'configureErrorConnection': u'Errore di connessione. Verificare se il servizio DWAgent è avviato.', 
    'configureUninstallKeyQuestion':u'Disinstallare il codice di installazione corrente?', 
    'configureUninstallationKey':u'Disinstallazione...', 
    'configureKeyInstalled':u'Chiave installata correttamente.', 
    'configureProxyEnd':u'Proxy configurato correttamente.', 
    'configureTrayIconVisibility':u'Visibilità icona nella barra di sistema', 
    'configureChooseMonitorTrayIconVisibility':u'Vuoi visualizzare l\'icona nel monitor nella barra di sistema?', 
    'configureTrayIconOK':u'Visibilità icona nella barra di sistema, configurata correttamente.', 
    'configurePasswordErrNoMatch':u'Le password non coincidono.', 
    'configurePasswordUpdated':u'Password aggioranta.', 
    'configureInsertPassword':u'Inserire la password di configurazione:', 
    'configureInvalidPassword':u'Password invalida.', 
    'installShortcuts':u'Installazione collegamenti...', 
    'installShortcutsErr': u'Installazione collegamenti fallita.', 
    'uninstallShortcuts':u'Disinstallazione collegamenti...', 
    'enterInstallCode': u'Inserire il codice di installazione:', 
    'code': u'Codice', 
    'checkInstallCode': u'Verifica codice di installazione...', 
    'errorConnectionConfig': u'Errore di connessione. Verificare se il servizio DWAgent è avviato.', 
    'errorInvalidCode': u'Il codice inserito non è valido.', 
    'reEnterCode': u'Reinserisci il codice', 
    'endInstall': u'Installazione completata correttamente.', 
    'cancelInstall': u'L\'installazione è stata annullata.', 
    'cancelUninstall': u'La disinstallazione è stata annullata.', 
    'endInstallConfigLater': u'Installazione completata correttamente.\nL\'agente non è stato configurato. Si può comunque procedere con la configurazione successivamente.', 
    'errorConnectionQuestion': u'Errore di connessione. Verificare la connessione ad internet o verificare la configurazione del firewall.\nVuoi configurare un proxy?', 
    'noTryAgain': u'No, Riprova', 
    'configureLater': u'Configura più tardi', 
    'chooseProxyType': u'Che tipo di proxy vuoi usare?', 
    'proxySystem': u'Sistema', 
    'proxyHttp': u'Http', 
    'proxySocks4': u'Socks4', 
    'proxySocks4a': u'Socks4a',
    'proxySocks5': u'Socks5', 
    'proxyNone': u'Nessuno', 
    'proxyInfo': u'Inserire informazioni proxy.', 
    'proxyHost': u'Host', 
    'proxyPort': u'Porta', 
    'proxyAuthUser': u'Utente', 
    'proxyAuthPassword': u'Password', 
    'validInteger':u'Il campo \'{0}\' deve essere un numero intero.', 
    'endUninstall': u'Disinstallazione completata.', 
    'removeFile': u'Rimozione file...', 
    'menuUninstall': u'Disinstalla', 
    'menuConfigure': u'Configura', 
    'menuMonitor': u'Monitor', 
    'missingRuntime':u'Runtime non trovati.',
    'missingNative':u'Native non trovati.',  
    'missingInfoFile':u'File info.json non trovato.',  
    'versionInstallNotValid':u'La versione dell\'installatore non è corretta per il tuo sistema operativo.\nSi prega di scaricare la versione corretta. {0}',
    'user':u'Utente',     
    'password':u'Password', 
    'rePassword':u'Ripeti Password', 
    'confirmExit':u'Sicuro di voler Uscire?', 
    'linuxRootPrivileges':u'È necessario disporre dei privilegi di root per installare DWAgent.\nSi prega di avviare lo script usando l\'utente root.',
    'windowsAdminPrivileges':u'È necessario disporre dei privilegi di amministratore per installare DWAgent.\nSi prega di avviare l\'eseguibile con \'Esegui come amministratore\'.', 
    'pressEnter':u'Premi invio per continuare.', 
    'error':u'Errore', 
    'option':u'Opzione', 
    'optionNotValid':u'Opzione selezionata non valida.', 
    'enter':u'invio', 
    'commands':u'Comandi', 
    'toBack':u'per andare indietro.', 
    'toExit':u'per uscire.',
    'install':u'Installa',
    'runWithoutInstallation':u'Esegui',
    'runWithoutInstallationStarting':u'Avvio agente...',
    'runWithoutInstallationUpdating':u'Aggiornamento agente...',
    'runWithoutInstallationConnecting':u'Apertura sessione...',
    'runWithoutInstallationOnlineTop':u'La sessione è attiva.\nPer collegarsi a questo agente vai su https://www.dwservice.net',
    'runWithoutInstallationOnlineUser':u'Utente: {0}',
    'runWithoutInstallationOnlinePassword':u'Password: {0}',
    'runWithoutInstallationOnlineBottom':u'ATTENZIONE:\nNon comunicare queste informazioni a persone non fidate altrimenti consenti loro l\'accesso a questo agente. Quindi se non sei sicuro di quello che stai facendo, chiudi questa applicazione.',
    'runWithoutInstallationWait':u'Attendere nuova connessione in corso (tentativo {0})...',
    'runWithoutInstallationClosing':u'Chiusura sessione...',
    'runWithoutInstallationEnd':u'Sessione terminata.',
    'runWithoutInstallationUnexpectedError':u'Errore inaspettato.\nNon è stato possibile avviare DWAgent. Se il problema persiste, provare a scaricare l\'ultima versione di DWAgent, ad eliminare la cartella \'{0}\' ed eseguire nuovamente DWAgent.',
    'configureInstallAgent':u'Come preferisci configurare l\'agente?',
    'configureInstallNewAgent':u'Creando un nuovo agente',
    'configureInstallCode':u'Digitando il codice di installazione',
    'createNewAgent':u'Creazione dell\'agente in corso...',
    'agentName':u'Nome agente',
    'enterInstallNewAgent':u'Inserire i dati per creare un nuovo agente:',
    'dwsUser':u'Utente DWS',     
    'dwsPassword':u'Password DWS',
    'reEnterData':u'Reinserire i dati',
    'errorInvalidUserPassword':u'l\'utente o la password non sono validi.',
    'errorAgentNameNotValid':u'Il nome dell\'agente non è valido. Non puoi usare i caratteri / \\ | # @ : .',
    'errorAgentAlreadyExsists':u'L\'agente {0} già esiste.',
    'errorAgentMax':u'Superato numero massimo agenti.',
    'enterRunCode': u'Inserire il codice di connessione',
    'runWithoutInstallationOnlineTopPutCode':u'La sessione è attiva.' ,
    'runWithoutInstallationOnlineBottomPutCode':u'ATTENZIONE:\nL\'agente è pronto ad accettare connessioni. Quindi se non sei sicuro di quello che stai facendo, chiudi questa applicazione.',
    'monitorCurrentActivities': u'Attività correnti',
    'monitorNoActivities': u'Nessuna attività',
    'monitorSession': u'Sessione',
    'monitorScreenCapture': u'Accesso allo schermo',
    'monitorShellSession': u'Accesso al terminale',
    'monitorDownload': u'Download',
    'monitorUpload': u'Upload',
    'monitorActive': u'attivo',
    'configureDesktopNotification': u'Notifica desktop',
    'configureDesktopNotificationOK': u'Notifica desktop configurata correttamente.',
    'desktopNotificationVisible': u'Visibile',
    'desktopNotificationAutoHide': u'Nascondi automaticamente',
    'desktopNotificationNone': u'Nessuna',
    'warningSpyingTool': u'Sii consapevole che non puoi accedere a un computer remoto senza il consenso dell\'utente. Utilizzando DWService come strumento di spionaggio potresti violare le leggi del tuo paese di residenza.',
    'warningLoginLogout': u'Affinché questa modifica abbia effetto, l\'utente deve disconnettersi e accedere nuovamente.'
}
  ui/messages/pt_BR.py                                                                                0000644 0001750 0001750 00000027141 14137472013 014157  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Eu aceito',
    'agentName':u'Nome do agente',
    'alreadyInstalled':u'DWAgent já instalado.\n\nO agente atualiza automaticamente para a última versão. Isso significa que você não precisa instalar manualmente as novas atualizações.',
    'back':u'Voltar',
    'cancel':u'Cancelar',
    'cancelInstall':u'A instalação foi cancelada.',
    'cancelUninstall':u'Eu aceito',
    'checkInstallCode':u'Verificando código de instalação...',
    'chooseProxyType':u'Qual tipo de proxy deseja usar?',
    'close':u'Fechar',
    'code':u'Código',
    'commands':u'Comandos',
    'configureAgent':u'Configurar agente',
    'configureAgentDisabled':u'Agente desativado.',
    'configureAgentEnabled':u'Agente ativado.',
    'configureChangeInstallKey':u'Alterar código de instalação',
    'configureChooseMonitorTrayIconVisibility':u'Deseja exibir o monitor na barra de notificações?',
    'configureChooseOperation':u'Escolha uma operação:',
    'configureDesktopNotification':u'Notificação na área de trabalho',
    'configureDesktopNotificationOK':u'Notificação na área de trabalho configurada com sucesso.',
    'configureDisableAgent':u'Desativar agente',
    'configureDisableAgentQuestion':u'Deseja desativar o agente?',
    'configureEnableAgent':u'Ativar agente',
    'configureEnableAgentQuestion':u'Deseja ativar o agente?',
    'configureEnd':u'Configuração completada',
    'configureErrorConnection':u'Erro de conexão. Verifique se o serviço DWAgent está iniciado.',
    'configureExit':u'Sair',
    'configureInsertPassword':u'Insira senha de configuração:',
    'configureInstallAgent':u'Configurar o agente?',
    'configureInstallCode':u'Insira o código de instalação',
    'configureInstallNewAgent':u'Criar um novo agente',
    'configureInvalidPassword':u'Senha inválida.',
    'configureKeyInstalled':u'Chave instalada com sucesso.',
    'configureLater':u'Configurar depois',
    'configureMonitor':u'Configurar monitor',
    'configurePassword':u'Configurar senha',
    'configurePasswordErrNoMatch':u'Senha não confere.',
    'configurePasswordUpdated':u'Senha atualizada.',
    'configureProxy':u'Configurar proxy',
    'configureProxyEnd':u'Proxy configurado com sucesso.',
    'configureRemovePassword':u'Remover senha',
    'configureRemovePasswordQuestion':u'Deseja remover a senha?',
    'configureSetPassword':u'Definir senha',
    'configureTitle':u'DWAgent - Configuração',
    'configureTrayIconOK':u'Visibilidade do ícone da área de notificação configurado com sucesso.',
    'configureTrayIconVisibility':u'Visibilidade do ícone da área de notificação.',
    'configureUninstallKeyQuestion':u'Desinstalar o código de instalação atual?',
    'configureUninstallationKey':u'Desinstalação...',
    'confirmExit':u'Você tem certeza que deseja sair?',
    'confirmInstall':u'Você deseja instalar o DWAgent em \'{0}\'?',
    'confirmUninstall':u'Você deseja remover o DWAgent?',
    'copyFiles':u'Copiando arquivos...',
    'createNewAgent':u'Criação do agente em progresso...',
    'decline':u'Eu não aceito',
    'desktopNotificationAutoHide':u'Ocultar automaticamente',
    'desktopNotificationNone':u'Nenhum',
    'desktopNotificationVisible':u'Visível',
    'downloadFile':u'Baixando arquivo {0}...',
    'dwsPassword':u'Senha DWS',
    'dwsUser':u'Usuário DWS',
    'endInstall':u'Instalação concluída com sucesso.',
    'endInstallConfigLater':u'Instalação concluída com sucesso.\nO agente não foi configurado. Você poderá configurá-lo depois.',
    'endUninstall':u'Desinstalação concluída com sucesso.',
    'enter':u'entrar',
    'enterInstallCode':u'Inserir o código de instalação',
    'enterInstallNewAgent':u'Insira os dados para criar um novo agente:',
    'enterRunCode':u'Insira o código de conexão',
    'error':u'Erro',
    'errorAgentAlreadyExsists':u'O agente {0} já existe.',
    'errorAgentMax':u'Número máximo de agentes atingido.',
    'errorAgentNameNotValid':u'O nome do agente não é válido. Você não pode usar os caracteres / \ | # @ : .',
    'errorConnectionConfig':u'Erro de conexão. Por favor verifique se o serviço DWAgent está iniciado.',
    'errorConnectionQuestion':u'Erro de conexão. Por favor verifique sua conexão a internet ou configuração de firewall.\nVocê deseja configurar proxy?',
    'errorInvalidCode':u'O código inserido é inválido.',
    'errorInvalidUserPassword':u'Usuário ou senha inválidos.',
    'fieldRequired':u'O campo \'{0}\' é obrigatório.',
    'install':u'Instalar',
    'installMonitor':u'Instalando monitor...',
    'installMonitorErr':u'Instalação do monitor falhou.',
    'installService':u'Instalando serviço',
    'installServiceErr':u'Instalação do serviço falhou.',
    'installShortcuts':u'Instalando atalhos',
    'installShortcutsErr':u'Instalação dos atalhos falharam.',
    'linuxRootPrivileges':u'Você necessita ter privilégios de root para instalar o DWAgent.\nPor favor inicie o script usando um usuário root.',
    'menuConfigure':u'Configurar',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Desinstalar',
    'missingInfoFile':u'Arquivo info.json não encontrado.',
    'missingNative':u'Native não encontrado.',
    'missingRuntime':u'Runtime não encontrado.',
    'monitorActive':u'ativo',
    'monitorAgentDisabled':u'Agente desativado.',
    'monitorAgentEnabled':u'Agente ativado.',
    'monitorConfigure':u'Configurar',
    'monitorConnections':u'Conexões',
    'monitorCurrentActivities':u'Atividades atuais',
    'monitorDisable':u'Desativar',
    'monitorDisableAgentQuestion':u'Você deseja desativar o agente?',
    'monitorDownload':u'Download',
    'monitorEnable':u'Ativar',
    'monitorEnableAgentQuestion':u'Você deseja ativar o agente?',
    'monitorEnterPassword':u'Insira a senha:',
    'monitorErrorConnectionConfig':u'Erro de conexão. Por favor verifique se o serviço DWAgent está iniciado.',
    'monitorHide':u'Esconder',
    'monitorInvalidPassword':u'Senha inválida.',
    'monitorNoActivities':u'Sem atividades',
    'monitorScreenCapture':u'Capturar tela',
    'monitorSession':u'Sessão',
    'monitorShellSession':u'Shell',
    'monitorShow':u'Mostrar',
    'monitorStatus':u'Estado',
    'monitorStatusDisabled':u'Desabilitado',
    'monitorStatusNoService':u'Sem serviço',
    'monitorStatusOffline':u'Offiline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Atualizando',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Desinstalar',
    'monitorUninstallNotRun':u'Você não pode desinstalar sem permissões de root.\nExecute o comando dwaguninstall no shell.',
    'monitorUpload':u'Upload',
    'mustAccept':u'Para continuar, você deve selecionar a opção {0}',
    'mustSelectOptions':u'Você deve selecionar uma opção.',
    'next':u'Próximo',
    'no':u'Não',
    'noTryAgain':u'Não, tente novamente',
    'notInstalled':u'DWAgent não instalado.',
    'ok':u'Ok',
    'option':u'Opção',
    'optionNotValid':u'Opção selecionada é inválida.',
    'or':u'ou',
    'password':u'Senha',
    'path':u'Caminho',
    'pathCreating':u'Criação de pasta...',
    'pathNotCreate':u'Não pode criar a pasta. Caminho inválido ou permissão negada.',
    'pressEnter':u'Pressione enter para continuar.',
    'privacyPolicy':u'Política de privacidade',
    'proxyAuthPassword':u'Senha',
    'proxyAuthUser':u'Usuário',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Insira as informações de proxy.',
    'proxyNone':u'Nenhum',
    'proxyPort':u'Porta',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Sistema',
    'reEnterCode':u'Reinsira o código',
    'reEnterData':u'Reinsira os dados',
    'rePassword':u'Redigite a senha',
    'removeFile':u'Removendo arquivo...',
    'runWithoutInstallation':u'Executar',
    'runWithoutInstallationClosing':u'Fechando sessão',
    'runWithoutInstallationConnecting':u'Abrindo sessão:',
    'runWithoutInstallationEnd':u'Sessão finalizada.',
    'runWithoutInstallationOnlineBottom':u'ATENÇÃO:\nNão divulgue essas informações a pessoas que não são confiáveis, pois de outra forma você permitirá que elas acessem a este agente. Então, se você não tem certeza do que está fazendo, feche esta aplicação.',
    'runWithoutInstallationOnlineBottomPutCode':u'AVISO:\nAgora o agente está pronto para aceitar a conexão. Então, se você não tem certeza do que está fazendo, por favor, feche esta aplicação.',
    'runWithoutInstallationOnlinePassword':u'Senha: {0}',
    'runWithoutInstallationOnlineTop':u'A sessão está ativa.\nPara se conectar a este agente vá para https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'A sessão está ativa.',
    'runWithoutInstallationOnlineUser':u'Usuário: {0}',
    'runWithoutInstallationStarting':u'Iniciando agente...',
    'runWithoutInstallationUnexpectedError':u'Erro inesperado.\nNão foi possível iniciar o DWAgent. Se o problema persistir, tente baixar a última versão do DWAgent, apague a pasta \'{0}\' e execute o DWAgent novamente.',
    'runWithoutInstallationUpdating':u'Atualizando agente...',
    'runWithoutInstallationWait':u'Aguarde pela nova conexão em progresso (tentativa {0})...',
    'selectPathInstall':u'Selecione o caminho de instalação:',
    'startService':u'Iniciando serviço...',
    'startServiceErr':u'Inicialização do serviço falhou.',
    'termsAndConditions':u'Termos e Condições',
    'titleInstall':u'DWAgent - Instalação',
    'titleUninstall':u'DWAgent - Desinstalação',
    'toBack':u'para voltar.',
    'toExit':u'para sair.',
    'unexpectedError':u'Erro inesperado.\n{0}',
    'uninstallMonitor':u'Desinstalando monitor...',
    'uninstallService':u'Desinstalando serviço...',
    'uninstallShortcuts':u'Desinstalando atalhos...',
    'user':u'Usuário',
    'validInteger':u'O campo \'{0}\' precisa ser um inteiro.',
    'versionInstallNotValid':u'A versão do instalador não é a correta para o seu sistema operacional.\nPor favor baixe a versão correta. {0}',
    'waiting':u'Aguardando...',
    'warningLoginLogout':u'Para que essa alteração tenha efeito, o usuário deve fazer logout e login novamente.',
    'warningRemovePath':u'Aviso: a pasta de destino já existe então ela será apagada.',
    'warningSpyingTool':u'Esteja ciente de que você não pode acessar um computador remoto sem o consentimento de seu usuário. Ao usar o DWService como uma ferramenta de espionagem, você pode estar infringindo as leis de seu país de residência.',
    'welcomeLicense':u'Licença\nEste software é gratuito e open source.\nEle consiste de um componente principal e vários componentes acessórios definidos "app" que podem ser regidos por diferentes licenças. Para mais informações visite: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Ao prosseguir com a instalação ou executar este software, você concorda com os #TERMSANDCONDITIONS e com a #PRIVACYPOLICY',
    'welcomeSecurity':u'Segurança\nPara proteger sua privacidade nós garantimos que nenhuma informação será armazenada nos nossos servidores e as comunicações são criptografadas para que terceiros não possam acessá-las.',
    'welcomeSoftwareUpdates':u'Atualizações de software\nAs atualizações deste software são automáticas.',
    'windowsAdminPrivileges':u'Você deve ter privilégios de administrador para instalar o DWAgent.\nPor favor inicie o executável com \'Executar como administrador\'.',
    'yes':u'Sim'
}
                                                                                                                                                                                                                                                                                                                                                                                                                               ui/messages/zh.py                                                                                   0000644 0001750 0001750 00000024355 14137471770 013607  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'我接受',
    'agentName':u'代理名稱',
    'alreadyInstalled':u'已经安装了DWAgent.\n\nDWAgent會自動更新到最新版本. 代表您不需要手動安装新的更新.',
    'back':u'返回',
    'cancel':u'取消',
    'cancelInstall':u'安裝程序已被取消.',
    'cancelUninstall':u'移除程序已被取消.',
    'checkInstallCode':u'正在檢查安裝代碼...',
    'chooseProxyType':u'你需要哪種類型的伺服服務器?',
    'close':u'關閉',
    'code':u'代碼',
    'commands':u'指令',
    'configureAgent':u'設置代理',
    'configureAgentDisabled':u'代理已被停用.',
    'configureAgentEnabled':u'代理已啟用.',
    'configureChangeInstallKey':u'改變安裝程式碼',
    'configureChooseMonitorTrayIconVisibility':u'是否要在托盘图标中显示监视器?',
    'configureChooseOperation':u'請選擇作業項目:',
    'configureDesktopNotification':u'桌面通知',
    'configureDesktopNotificationOK':u'桌面通知已成功配置.',
    'configureDisableAgent':u'停用代理',
    'configureDisableAgentQuestion':u'要禁用代理吗?',
    'configureEnableAgent':u'啟用代理',
    'configureEnableAgentQuestion':u'請確認啟用代理?',
    'configureEnd':u'設置已完成.',
    'configureErrorConnection':u'連線錯誤. 請檢察 DWAgent 服務使否啟用',
    'configureExit':u'退出',
    'configureInsertPassword':u'請輸入設置時需要的密碼:',
    'configureInstallAgent':u'要如何設置此代理的服務?',
    'configureInstallCode':u'輸入安裝代碼',
    'configureInstallNewAgent':u'创建一个新代理',
    'configureInvalidPassword':u'密碼錯誤.',
    'configureKeyInstalled':u'密钥已成功安装.',
    'configureLater':u'稍后設置',
    'configureMonitor':u'設置监视器',
    'configurePassword':u'設置密碼',
    'configurePasswordErrNoMatch':u'密碼不合.',
    'configurePasswordUpdated':u'密碼已更新.',
    'configureProxy':u'配置伺服服務器',
    'configureProxyEnd':u'伺服服務器設置成功.',
    'configureRemovePassword':u'移除密碼',
    'configureRemovePasswordQuestion':u'確認要移除密碼?',
    'configureSetPassword':u'設定密碼',
    'configureTitle':u'DWAgent - 設置',
    'configureTrayIconOK':u'成功設置在系統區顯示圖示.',
    'configureTrayIconVisibility':u'系統區顯示圖示',
    'configureUninstallKeyQuestion':u'卸載目前安裝的程式碼?',
    'configureUninstallationKey':u'卸載程式中...',
    'confirmExit':u'確定退出?',
    'confirmInstall':u'確認安装 DWAgent 到\'{0}\'吗?',
    'confirmUninstall':u'確認删除 DWAgent?',
    'copyFiles':u'複製文件中...',
    'createNewAgent':u'正在新建代理中...',
    'decline':u'我不接受',
    'desktopNotificationAutoHide':u'自动隐藏',
    'desktopNotificationNone':u'没有',
    'desktopNotificationVisible':u'可见的',
    'downloadFile':u'正在下載檔案 {0}...',
    'dwsPassword':u'DWS 密碼',
    'dwsUser':u'DWS 用戶',
    'endInstall':u'完成安裝.',
    'endInstallConfigLater':u'完成安装.\n尚未設置代理, 你仍可以繼續, 稍后再設置.',
    'endUninstall':u'完成卸載.',
    'enter':u'輸入',
    'enterInstallCode':u'輸入安裝程式碼',
    'enterInstallNewAgent':u'輸入建立新代理的資料:',
    'enterRunCode':u'輸入連接代碼',
    'error':u'錯誤',
    'errorAgentAlreadyExsists':u'此代理{0}已經存在.',
    'errorAgentMax':u'超過最大的代理數量.',
    'errorAgentNameNotValid':u'代理名稱無效. 你不能使用字符 / \ | # @ : .',
    'errorConnectionConfig':u'連線錯誤. 請檢察代理是否已啟動.',
    'errorConnectionQuestion':u'連線錯誤. 請檢察對外連線或防火牆的設置.\n是否有使用代理服務器?',
    'errorInvalidCode':u'輸入的程式碼錯誤.',
    'errorInvalidUserPassword':u'密碼或是帳號錯誤.',
    'fieldRequired':u'\'{0}\' 欄位必填.',
    'install':u'安裝',
    'installMonitor':u'安裝监视器...',
    'installMonitorErr':u'錯誤, 無法安裝監視器.',
    'installService':u'安裝服務...',
    'installServiceErr':u'安裝服務錯誤.',
    'installShortcuts':u'安裝捷徑...',
    'installShortcutsErr':u'安裝捷徑錯誤.',
    'linuxRootPrivileges':u'您必须具有root权限才能安装DWAgent.\n请使用root用户启动脚本.',
    'menuConfigure':u'設置',
    'menuMonitor':u'監視器',
    'menuUninstall':u'卸載',
    'missingInfoFile':u'找不到 info.json 檔案.',
    'missingNative':u'找不到 Native 程序.',
    'missingRuntime':u'找不到  Runtime 程序.',
    'monitorActive':u'活跃',
    'monitorAgentDisabled':u'代理已停用.',
    'monitorAgentEnabled':u'代理已啟動.',
    'monitorConfigure':u'設置',
    'monitorConnections':u'連線',
    'monitorCurrentActivities':u'当前活动',
    'monitorDisable':u'停用',
    'monitorDisableAgentQuestion':u'確認停用此代理?',
    'monitorDownload':u'下载',
    'monitorEnable':u'啟用',
    'monitorEnableAgentQuestion':u'確認啟用此代理?',
    'monitorEnterPassword':u'輸入密碼:',
    'monitorErrorConnectionConfig':u'連線錯誤. 請檢察 DWAgent 服務使否啟用.',
    'monitorHide':u'隱藏',
    'monitorInvalidPassword':u'密碼錯誤.',
    'monitorNoActivities':u'没有活动',
    'monitorScreenCapture':u'屏幕截图',
    'monitorSession':u'会话',
    'monitorShellSession':u'Shell',
    'monitorShow':u'顯示',
    'monitorStatus':u'狀態',
    'monitorStatusDisabled':u'禁用',
    'monitorStatusNoService':u'無服務',
    'monitorStatusOffline':u'離線',
    'monitorStatusOnline':u'上線',
    'monitorStatusUpdating':u'更新中',
    'monitorTitle':u'DWAgent - 監視器',
    'monitorUninstall':u'卸載',
    'monitorUninstallNotRun':u'没有root权限就无法卸载.\n请在指令介面中执行dwaguninstall命令.',
    'monitorUpload':u'上传',
    'mustAccept':u'要繼續, 必須選擇 {0}',
    'mustSelectOptions':u'必須選擇作業選項.',
    'next':u'下一步',
    'no':u'否',
    'noTryAgain':u'不, 請再試一次',
    'notInstalled':u'DWAgent 未安裝.',
    'ok':u'好',
    'option':u'選項',
    'optionNotValid':u'選擇的選項無效.',
    'or':u'或是',
    'password':u'密碼',
    'path':u'路徑',
    'pathCreating':u'建立資料夾...',
    'pathNotCreate':u'無法建立資料夾. 路徑無效或無權限.',
    'pressEnter':u'請按 Enter 來繼續.',
    'privacyPolicy':u'隐私政策',
    'proxyAuthPassword':u'密碼',
    'proxyAuthUser':u'用户',
    'proxyHost':u'服務主機',
    'proxyHttp':u'Http',
    'proxyInfo':u'插入伺服器訊息.',
    'proxyNone':u'無',
    'proxyPort':u'連接埠',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'系統',
    'reEnterCode':u'請重新輸入代碼',
    'reEnterData':u'請重新輸入資料',
    'rePassword':u'請重新輸入密碼',
    'removeFile':u'移除檔案...',
    'runWithoutInstallation':u'執行',
    'runWithoutInstallationClosing':u'關閉連線會期...',
    'runWithoutInstallationConnecting':u'啟動連線會期...',
    'runWithoutInstallationEnd':u'連線會期結束.',
    'runWithoutInstallationOnlineBottom':u'警告:\n不要將此信息透露給不信任的人, 否則將會允許他們存取此設備的代理. 所以如果你不確定, 請關閉這個應用程式.',
    'runWithoutInstallationOnlineBottomPutCode':u'警告:\n現在代理已準備好接受連接.  因此, 如果您不確定自己在做什麼, 請關閉此應用程序.',
    'runWithoutInstallationOnlinePassword':u'密碼: {0}',
    'runWithoutInstallationOnlineTop':u'此連線會期已啟用.\n要連線此代理, 請連接到 https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'會話處於活動狀態.',
    'runWithoutInstallationOnlineUser':u'用戶: {0}',
    'runWithoutInstallationStarting':u'啟動代理 ...',
    'runWithoutInstallationUnexpectedError':u'意外錯誤.\n無法啟動 DWAgent. 如果問題仍然存在, 請嘗試下載最新版本的 DWAgent, 刪除資料夾 \'{0}\' 並再次執行 DWAgent.',
    'runWithoutInstallationUpdating':u'更新代理 ...',
    'runWithoutInstallationWait':u'正等待新的連線中(嘗試次數 {0})...',
    'selectPathInstall':u'選擇此安裝的路徑:',
    'startService':u'啟動服務...',
    'startServiceErr':u'啟動服務錯誤.',
    'termsAndConditions':u'条款和条件',
    'titleInstall':u'DWAgent - 安裝',
    'titleUninstall':u'DWAgent - 卸載',
    'toBack':u'返回.',
    'toExit':u'離開.',
    'unexpectedError':u'意外錯誤.\n{0}',
    'uninstallMonitor':u'卸載監控...',
    'uninstallService':u'卸載服務...',
    'uninstallShortcuts':u'卸載快捷方式...',
    'user':u'用戶',
    'validInteger':u'字段 \'{0}\' 必須是整數.',
    'versionInstallNotValid':u'安裝程序的版本不適用於您的操作系統.\n請下載正確的版本. {0}',
    'waiting':u'請等候...',
    'warningLoginLogout':u'为了使此更改生效，用户必须注销并再次登录.',
    'warningRemovePath':u'警告目標文件夾已經存在, 它將被刪除.',
    'warningSpyingTool':u'请注意, 未经用户的同意, 您不得访问远程计算机. 通过将DWService用作间谍工具, 您可能违反了居住国家/地区的法律.',
    'welcomeLicense':u'許可證\n該軟件是免費和開源的.\n它由一個主要組件和幾個定義為 "app" 的附件組件組成, 可以由不同的許可證管理. 有關更多信息, 請訪問: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'通过继续安装或运行此软件, 您同意#TERMSANDCONDITIONS和#PRIVACYPOLICY',
    'welcomeSecurity':u'安全性\n為了保護您的隱私, 我們保證不會在我們的服務器上存儲任何信息, 並且通信也會被加密, 因此無論如何第三方都無法讀取它們.',
    'welcomeSoftwareUpdates':u'軟件更新\n此軟件的更新是自動的.',
    'windowsAdminPrivileges':u'您必須具有管理員權限才能安裝DWAgent.\n請以 \'以管理員身份運行\' 啟動可執行文件.',
    'yes':u'是'
}
                                                                                                                                                                                                                                                                                   ui/messages/bg.py                                                                                   0000644 0001750 0001750 00000040772 14137471772 013561  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Приемам',
    'agentName':u'Име на агента',
    'alreadyInstalled':u'DWAgent е вече инсталиран.\n\nАгентът автоматично се актуализира до последната версия. Това означава, че не е нужно да инсталирате ръчно новите актуализации.',
    'back':u'Назад',
    'cancel':u'Отказ',
    'cancelInstall':u'Инсталирането е отменено.',
    'cancelUninstall':u'Деинсталирането е отменено.',
    'checkInstallCode':u'Проверка на инсталационния ключ...',
    'chooseProxyType':u'Какъв тип прокси искате да използвате?',
    'close':u'Затвори',
    'code':u'Код',
    'commands':u'Команди',
    'configureAgent':u'Конфигурация на агента',
    'configureAgentDisabled':u'Агентът е забранен.',
    'configureAgentEnabled':u'Агентът е разрешен.',
    'configureChangeInstallKey':u'Смени инсталационния ключ',
    'configureChooseMonitorTrayIconVisibility':u'Желаете ли икона в панела за известия?',
    'configureChooseOperation':u'Моля, изберете действие:',
    'configureDesktopNotification':u'Известие на работния плот',
    'configureDesktopNotificationOK':u'Известието на работния плот е конфигурирано успешно.',
    'configureDisableAgent':u'Забрани агента',
    'configureDisableAgentQuestion':u'Желаете ли да забраните агента?',
    'configureEnableAgent':u'Разреши агента',
    'configureEnableAgentQuestion':u'Желаете ли за разрешите агента?',
    'configureEnd':u'Настройката приключи.',
    'configureErrorConnection':u'Грешка при свързване. Моля, проверете дали услугата DWAgent е стартирана.',
    'configureExit':u'Изход',
    'configureInsertPassword':u'Моля, въведете парола за настройки:',
    'configureInstallAgent':u'Как желаете да настроите агента?',
    'configureInstallCode':u'Въвеждане на инсталационния ключ',
    'configureInstallNewAgent':u'Създаване на нов агент',
    'configureInvalidPassword':u'Грешна парола.',
    'configureKeyInstalled':u'Ключа е инсталиран успешно.',
    'configureLater':u'Настрой по-късно',
    'configureMonitor':u'Настройки на монитора',
    'configurePassword':u'Настрой парола',
    'configurePasswordErrNoMatch':u'Паролата не съвпада.',
    'configurePasswordUpdated':u'Паролата бе актуализирана.',
    'configureProxy':u'Конфигуриране на прокси сървър',
    'configureProxyEnd':u'Прокси сървър конфигуриран успешно.',
    'configureRemovePassword':u'Премахване на паролата',
    'configureRemovePasswordQuestion':u'Искате ли да премахнете паролата?',
    'configureSetPassword':u'Задайте парола',
    'configureTitle':u'DWAgent - Конфигурация',
    'configureTrayIconOK':u'Видимостта на иконата в областта за уведомление е конфигурирана успешно.',
    'configureTrayIconVisibility':u'Видимост на иконата в областта за уведомление',
    'configureUninstallKeyQuestion':u'Деинсталиране на текущия код за инсталиране?',
    'configureUninstallationKey':u'Деинсталиране ...',
    'confirmExit':u'Сигурни ли сте, че искате да излезете?',
    'confirmInstall':u'Искате ли да инсталирате DWAgent на \'{0}\'?',
    'confirmUninstall':u'Искате ли да премахнете DWAgent?',
    'copyFiles':u'Копиране на файлове...',
    'createNewAgent':u'Създаване на агент...',
    'decline':u'Не приемам',
    'desktopNotificationAutoHide':u'Автоматично скриване',
    'desktopNotificationNone':u'Нищо',
    'desktopNotificationVisible':u'Видим',
    'downloadFile':u'Изтегляне на файла {0}...',
    'dwsPassword':u'DWS парола',
    'dwsUser':u'DWS потребител',
    'endInstall':u'Инсталацията е завършена.',
    'endInstallConfigLater':u'Инсталацията е завършена.\nАгентът не е конфигуриран. Все пак можете да продължите с конфигурацията по-късно.',
    'endUninstall':u'Деинсталацията е завършена.',
    'enter':u'въведете',
    'enterInstallCode':u'Въведете инсталационния код',
    'enterInstallNewAgent':u'Въведете данни, за да създадете нов агент:',
    'enterRunCode':u'Въведете кода на връзката',
    'error':u'Грешка',
    'errorAgentAlreadyExsists':u'Агентът {0} вече съществува.',
    'errorAgentMax':u'Превишен е максималният брой агенти.',
    'errorAgentNameNotValid':u'Името на агента не е валидно. Не можете да използвате символите / \ | # @:',
    'errorConnectionConfig':u'Грешка при свързването. Моля, проверете дали услугата DWAgent е стартирана.',
    'errorConnectionQuestion':u'Грешка при свързването. Моля, проверете връзката си с интернет или конфигурацията на защитната стена.\nИскате ли да конфигурирате прокси сървър?',
    'errorInvalidCode':u'Въведеният код е невалиден.',
    'errorInvalidUserPassword':u'Невалиден потребител или парола.',
    'fieldRequired':u'Полето "{0}" е задължително.',
    'install':u'Инсталирай',
    'installMonitor':u'Инсталиране на монитора ...',
    'installMonitorErr':u'Инсталирането на монитор е неуспешно.',
    'installService':u'инсталиране на услуга...',
    'installServiceErr':u'Инсталирането на услугата е неуспешно...',
    'installShortcuts':u'Инсталиране на преки пътища (икони)...',
    'installShortcutsErr':u'Инсталирането на преки пътища (икони) е неуспешно.',
    'linuxRootPrivileges':u'Трябва да имате администраторски права, за да инсталирате DWAgent.\nМоля, стартирайте скрипта, като администратор.',
    'menuConfigure':u'Конфигурация',
    'menuMonitor':u'Монитор',
    'menuUninstall':u'Деинсталиране',
    'missingInfoFile':u'Файлът info.json не е намерен.',
    'missingNative':u'Настоящ не е намерен.',
    'missingRuntime':u'Времето за изпълнение не е намерено.',
    'monitorActive':u'активен',
    'monitorAgentDisabled':u'Агентът е изключен.',
    'monitorAgentEnabled':u'Агентът е включен.',
    'monitorConfigure':u'Конфигуриране',
    'monitorConnections':u'Връзки',
    'monitorCurrentActivities':u'Текущи дейности',
    'monitorDisable':u'Изключен',
    'monitorDisableAgentQuestion':u'Искате ли да деактивирате агента?',
    'monitorDownload':u'Сваляне',
    'monitorEnable':u'Включи',
    'monitorEnableAgentQuestion':u'Искате ли да активирате агента?',
    'monitorEnterPassword':u'Въведете парола:',
    'monitorErrorConnectionConfig':u'Грешка при свързването. Моля, проверете дали услугата DWAgent е стартирана.',
    'monitorHide':u'Скрий',
    'monitorInvalidPassword':u'Невалидна парола.',
    'monitorNoActivities':u'Няма дейности',
    'monitorScreenCapture':u'Заснемане на екрана',
    'monitorSession':u'Сесия',
    'monitorShellSession':u'Обвивка',
    'monitorShow':u'Покажи',
    'monitorStatus':u'Статус',
    'monitorStatusDisabled':u'Изключен',
    'monitorStatusNoService':u'Няма услуга',
    'monitorStatusOffline':u'Офлайн',
    'monitorStatusOnline':u'Онлайн',
    'monitorStatusUpdating':u'Обновяване',
    'monitorTitle':u'DWAgent - Монитор',
    'monitorUninstall':u'Деинсталирай',
    'monitorUninstallNotRun':u'Не можете да деинсталирате без разрешение на администратора.\nСтартирайте командата dwaguninstall в системната обвивка.',
    'monitorUpload':u'Качване',
    'mustAccept':u'За да продължите, трябва да изберете опцията {0}',
    'mustSelectOptions':u'Трябва да изберете опция.',
    'next':u'Следващ',
    'no':u'Не',
    'noTryAgain':u'Не, опитай пак.',
    'notInstalled':u'DWAgent не е инсталиран.',
    'ok':u'Ок',
    'option':u'Опция',
    'optionNotValid':u'Избраната опция е невалидна.',
    'or':u'или',
    'password':u'Парола',
    'path':u'Път',
    'pathCreating':u'Създаване на директория...',
    'pathNotCreate':u'Директорията не можа да бъде създадена. Невалиден път или отказан достъп.',
    'pressEnter':u'Натиснете "Enter", за да продължите.',
    'privacyPolicy':u'Политика за поверителност',
    'proxyAuthPassword':u'Парола',
    'proxyAuthUser':u'Потребител',
    'proxyHost':u'Хост',
    'proxyHttp':u'Http',
    'proxyInfo':u'Въведете информация за прокси сървъра.',
    'proxyNone':u'Нищо',
    'proxyPort':u'Порт',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Система',
    'reEnterCode':u'Въведете отново кода.',
    'reEnterData':u'Въведете отново данните.',
    'rePassword':u'Повторете паролата',
    'removeFile':u'Премахване на файла...',
    'runWithoutInstallation':u'Стартирай',
    'runWithoutInstallationClosing':u'Затваряне на сесията...',
    'runWithoutInstallationConnecting':u'Отваряне на сесията...',
    'runWithoutInstallationEnd':u'Сесията завърши.',
    'runWithoutInstallationOnlineBottom':u'ВНИМАНИЕ:\nНе разкривайте тази информация на хора, на които нямате доверие, иначе ще им позволите достъп до този агент. Така че, ако не сте сигурни какво правите, моля, затворете приложението.',
    'runWithoutInstallationOnlineBottomPutCode':u'ВНИМАНИЕ:\nСега агентът е готов да приеме връзка. Така че, ако не сте сигурни какво правите, моля, затворете това приложение.',
    'runWithoutInstallationOnlinePassword':u'Парола: {0}',
    'runWithoutInstallationOnlineTop':u'Сесията е активна.\nЗа да се свържете с този агент, посетете https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Сесията е активна.',
    'runWithoutInstallationOnlineUser':u'Потребител: {0}',
    'runWithoutInstallationStarting':u'Стартиране на агента...',
    'runWithoutInstallationUnexpectedError':u'Неочаквана грешка.\nDWAgent не можа да се стартира. Ако проблемът продължава, опитайте да изтеглите последната версия на DWAgent, да изтриете папката \'{0}\' и отново да стартирате DWAgent.',
    'runWithoutInstallationUpdating':u'Агентът се обновява...',
    'runWithoutInstallationWait':u'Изчакайте, в ход е нова връзка (опит {0}) ...',
    'selectPathInstall':u'Изберете къде да се инсталира:',
    'startService':u'Стартиране на услуга...',
    'startServiceErr':u'Стартирането на услугата пропадна.',
    'termsAndConditions':u'Правила и условия',
    'titleInstall':u'DWAgent - Инсталация',
    'titleUninstall':u'DWAgent - Деинсталация',
    'toBack':u'се завръща',
    'toExit':u'излиза.',
    'unexpectedError':u'Неочаквана грешка.\n{0}',
    'uninstallMonitor':u'Деинсталиране на монитор...',
    'uninstallService':u'Деинсталиране на услуга...',
    'uninstallShortcuts':u'Деинсталиране на преки пътища...',
    'user':u'Потребител',
    'validInteger':u'Полето "{0}" трябва да е цяло число.',
    'versionInstallNotValid':u'Версията на инсталатора не е подходяща за вашата операционна система.\nМоля, изтеглете правилната версия. {0}',
    'waiting':u'Моля изчакайте...',
    'warningLoginLogout':u'За да влезе в сила тази промяна, потребителят трябва да излезе и да влезе отново.',
    'warningRemovePath':u'Предупреждение, че ако папката за местоназначение вече съществува, то тя ще бъде изтрита.',
    'warningSpyingTool':u'Моля, имайте предвид, че нямате достъп до отдалечен компютър без съгласието на неговия потребител. Използвайки DWService като шпионски инструмент, може да нарушите законите във вашата държава.',
    'welcomeLicense':u'Лиценз\nТози софтуер е безплатен и с отворен код.\nСъстои се от един основен компонент и няколко допълнителни компонента, дефинирани като "приложение", които могат да бъдат управлявани от различни лицензи. За повече информация посетете https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Продължавайки инсталацията или стартирането на този софтуер, вие се съгласявате с #TERMSANDCONDITIONS и #PRIVACYPOLICY',
    'welcomeSecurity':u'Сигурност\nВ защита на вашата поверителност ние гарантираме, че на нашите сървъри няма да се съхранява информация и комуникациите са кодирани, така че трети страни да не могат да ги прочетат.',
    'welcomeSoftwareUpdates':u'Актуализации на софтуера.\nАктуализациите на този софтуер са автоматични.',
    'windowsAdminPrivileges':u'Трябва да имате администраторски права, за да инсталирате DWAgent.\nМоля стартирайте изпълнимия файл, като администратор. (\'run as administrator\' или \'изпълни като администратор\').',
    'yes':u'Да'
}
      ui/messages/zh_TW.py                                                                                0000644 0001750 0001750 00000025364 14137472020 014207  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'接受',
    'agentName':u'代理器名稱',
    'alreadyInstalled':u'DWAgent 已經安裝。\n\n代理器會自動更新到最新版本，亦即您不需要手動安裝更新。',
    'back':u'上一步',
    'cancel':u'取消',
    'cancelInstall':u'已取消安裝。',
    'cancelUninstall':u'已取消解除安裝。',
    'checkInstallCode':u'檢查安裝碼…',
    'chooseProxyType':u'您要使用何種代理伺服器類型？',
    'close':u'關閉',
    'code':u'安裝碼',
    'commands':u'命令',
    'configureAgent':u'組配代理器',
    'configureAgentDisabled':u'已停用代理器。',
    'configureAgentEnabled':u'已啟用代理器。',
    'configureChangeInstallKey':u'變更安裝碼',
    'configureChooseMonitorTrayIconVisibility':u'您想要在系統匣中顯示監控圖示嗎？',
    'configureChooseOperation':u'請選擇一項操作：',
    'configureDesktopNotification':u'桌面通知',
    'configureDesktopNotificationOK':u'已成功組配桌面通知。',
    'configureDisableAgent':u'停用代理器',
    'configureDisableAgentQuestion':u'您想要停用代理器嗎？',
    'configureEnableAgent':u'啟用代理器',
    'configureEnableAgentQuestion':u'您想要啟用代理器嗎？',
    'configureEnd':u'組態已經完成。',
    'configureErrorConnection':u'連線錯誤。請檢查是否偵測得到 DWAgent 服務。',
    'configureExit':u'退出',
    'configureInsertPassword':u'請輸入組配密碼：',
    'configureInstallAgent':u'您想要如何組配代理器？',
    'configureInstallCode':u'輸入安裝碼',
    'configureInstallNewAgent':u'建立新的代理器',
    'configureInvalidPassword':u'無效的密碼。',
    'configureKeyInstalled':u'已成功安裝金鑰。',
    'configureLater':u'稍後進行組配',
    'configureMonitor':u'組配監控器',
    'configurePassword':u'編輯組態密碼',
    'configurePasswordErrNoMatch':u'密碼不符合。',
    'configurePasswordUpdated':u'已更新密碼。',
    'configureProxy':u'組配代理伺服器',
    'configureProxyEnd':u'已成功組配代理伺服器。',
    'configureRemovePassword':u'移除密碼',
    'configureRemovePasswordQuestion':u'您想要移除密碼嗎？',
    'configureSetPassword':u'設定密碼',
    'configureTitle':u'DWAgent - 組態',
    'configureTrayIconOK':u'已成功組配系統匣圖示。',
    'configureTrayIconVisibility':u'系統匣圖示可視性',
    'configureUninstallKeyQuestion':u'解除安裝目前的安裝碼？',
    'configureUninstallationKey':u'解除安裝…',
    'confirmExit':u'確定要退出？',
    'confirmInstall':u'您想要安裝 DWAgent 到「{0}」？',
    'confirmUninstall':u'您想要移除 DWAgent 嗎？',
    'copyFiles':u'拷貝檔案…',
    'createNewAgent':u'正在建立代理器…',
    'decline':u'不接受',
    'desktopNotificationAutoHide':u'自動隱藏',
    'desktopNotificationNone':u'沒有',
    'desktopNotificationVisible':u'可見',
    'downloadFile':u'下載檔案 {0}…',
    'dwsPassword':u'DWS 密碼',
    'dwsUser':u'DWS 使用者',
    'endInstall':u'已完成安裝。',
    'endInstallConfigLater':u'已完成安裝。\n尚未組配代理器。您仍然能夠稍後建立組態。',
    'endUninstall':u'已完成解除安裝。',
    'enter':u'輸入',
    'enterInstallCode':u'輸入安裝碼',
    'enterInstallNewAgent':u'輸入資料以建立新的代理器：',
    'enterRunCode':u'輸入連接碼',
    'error':u'錯誤',
    'errorAgentAlreadyExsists':u'已經存在代理器 {0}。',
    'errorAgentMax':u'超出代理器的最大數量。',
    'errorAgentNameNotValid':u'代理器名稱無效。您不可以使用字元 / \ | # @ : 。',
    'errorConnectionConfig':u'連線錯誤。請檢查是否偵測得到 DWAgent 服務。',
    'errorConnectionQuestion':u'連線錯誤。請檢查您的網際網路連接或防火牆。\n您要組配代理伺服器嗎？',
    'errorInvalidCode':u'輸入的碼無效。',
    'errorInvalidUserPassword':u'無效的使用者或密碼。',
    'fieldRequired':u'欄位「{0}」是必要項目。',
    'install':u'安裝',
    'installMonitor':u'安裝監控器…',
    'installMonitorErr':u'安裝監控器失敗。',
    'installService':u'安裝服務…',
    'installServiceErr':u'安裝服務失敗。',
    'installShortcuts':u'安裝快捷鍵…',
    'installShortcutsErr':u'安裝快捷鍵失敗。',
    'linuxRootPrivileges':u'您必須有管理員權力才能安裝 DWAgent。\n請配合 sudo 或以 root 身分運行命令稿。',
    'menuConfigure':u'組配',
    'menuMonitor':u'監控器',
    'menuUninstall':u'解除安裝',
    'missingInfoFile':u'找不到檔案 info.json。',
    'missingNative':u'找不到原生架構程式。',
    'missingRuntime':u'找不到執行階段函式庫。',
    'monitorActive':u'作用中',
    'monitorAgentDisabled':u'已停用代理器。',
    'monitorAgentEnabled':u'已啟用代理器。',
    'monitorConfigure':u'組配',
    'monitorConnections':u'連接',
    'monitorCurrentActivities':u'目前活動',
    'monitorDisable':u'停用',
    'monitorDisableAgentQuestion':u'您想要停用代理器嗎？',
    'monitorDownload':u'下載',
    'monitorEnable':u'啟用',
    'monitorEnableAgentQuestion':u'您想要啟用代理器嗎？',
    'monitorEnterPassword':u'輸入密碼：',
    'monitorErrorConnectionConfig':u'連線錯誤。請檢查是否偵測得到 DWAgent 服務。',
    'monitorHide':u'隱藏',
    'monitorInvalidPassword':u'無效的密碼。',
    'monitorNoActivities':u'沒有活動',
    'monitorScreenCapture':u'畫面存取',
    'monitorSession':u'作業階段',
    'monitorShellSession':u'命令殼存取',
    'monitorShow':u'顯示',
    'monitorStatus':u'狀態',
    'monitorStatusDisabled':u'已停用',
    'monitorStatusNoService':u'沒有服務',
    'monitorStatusOffline':u'離線',
    'monitorStatusOnline':u'上線',
    'monitorStatusUpdating':u'更新中',
    'monitorTitle':u'DWAgent - 監控器',
    'monitorUninstall':u'解除安裝',
    'monitorUninstallNotRun':u'您無法不具管理員許可就進行解除安裝。\n配合 sudo 或以 root 身分運行命令 dwaguninstall。',
    'monitorUpload':u'上傳',
    'mustAccept':u'為了要繼續進行，您必須選取選項 {0}',
    'mustSelectOptions':u'您必須選取選項。',
    'next':u'下一步',
    'no':u'否',
    'noTryAgain':u'否，再試一次',
    'notInstalled':u'DWAgent 未安裝。',
    'ok':u'確定',
    'option':u'選項',
    'optionNotValid':u'所選項目無效。',
    'or':u'或',
    'password':u'密碼',
    'path':u'路徑',
    'pathCreating':u'建立資料夾…',
    'pathNotCreate':u'無法建立資料夾。無效的路徑或未獲許可。',
    'pressEnter':u'按下輸入以繼續。',
    'privacyPolicy':u'隱私政策',
    'proxyAuthPassword':u'密碼',
    'proxyAuthUser':u'使用者',
    'proxyHost':u'主機',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'加入代理伺服器資訊。',
    'proxyNone':u'無',
    'proxyPort':u'通訊埠',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'系統',
    'reEnterCode':u'重新輸入安裝碼',
    'reEnterData':u'重新輸入資料',
    'rePassword':u'重打密碼',
    'removeFile':u'移除檔案…',
    'runWithoutInstallation':u'運行',
    'runWithoutInstallationClosing':u'關閉作業階段…',
    'runWithoutInstallationConnecting':u'開啟作業階段…',
    'runWithoutInstallationEnd':u'作業階段結束。',
    'runWithoutInstallationOnlineBottom':u'警告：\n不要透露這個資訊給您不信賴的人，它將允許他們存取這個裝置。如果您不確定在做什麼，請關閉這個應用程式。',
    'runWithoutInstallationOnlineBottomPutCode':u'警告：\n代理器現在已準備好接受連接。如果您不確定在做什麼，請關閉這個應用程式。',
    'runWithoutInstallationOnlinePassword':u'密碼：{0}',
    'runWithoutInstallationOnlineTop':u'作業階段正在運作。\n要連線這個代理器請前往 https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'作業階段正在運作。',
    'runWithoutInstallationOnlineUser':u'使用者：{0}',
    'runWithoutInstallationStarting':u'啟動代理器…',
    'runWithoutInstallationUnexpectedError':u'非預期錯誤。\nDWAgent 無法啟動。如果問題持續，請下載最近的 DWAgent 釋出版本，刪除資料夾「{0}」並再次運行 DWAgent。',
    'runWithoutInstallationUpdating':u'更新代理器…',
    'runWithoutInstallationWait':u'等待新的連接 (嘗試 {0})…',
    'selectPathInstall':u'選取安裝路徑：',
    'startService':u'啟動服務…',
    'startServiceErr':u'啟動服務時失敗。',
    'termsAndConditions':u'條款與細則',
    'titleInstall':u'DWAgent - 安裝',
    'titleUninstall':u'DWAgent - 解除安裝',
    'toBack':u'將要返回。',
    'toExit':u'將要退出。',
    'unexpectedError':u'非預期錯誤。\n{0}',
    'uninstallMonitor':u'解除安裝監控器…',
    'uninstallService':u'解除安裝服務…',
    'uninstallShortcuts':u'解除安裝快捷鍵…',
    'user':u'使用者',
    'validInteger':u'欄位「{0}」必須是整數。',
    'versionInstallNotValid':u'這個版本的安裝程式不適用於您的作業系統。\n請下載正確版本。{0}',
    'waiting':u'等待…',
    'warningLoginLogout':u'為了讓變更生效，使用者必須登出再登入。',
    'warningRemovePath':u'警告：目的資料夾已經存在，並且將被刪除。',
    'warningSpyingTool':u'請注意您如果沒有得到其使用者的允許，將無法存取遠端電腦。利用 DWService 做為間諜工具，可能違反您所在國家的法律。',
    'welcomeLicense':u'授權\n這個軟體是自由軟體與開放原始碼。\n它由一個基於 MPLv2 授權的主要成分所組成，加上多個由不同授權所規範的額外成分。想要獲得更多資訊，請造訪：https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'繼續安裝或執行這個軟體表示您同意 #TERMSANDCONDITIONS 與 #PRIVACYPOLICY',
    'welcomeSecurity':u'安全\n為了保護您的隱私，我們不會在我們的伺服器上儲存來自代理器的資訊。通訊是介於使用者之間，我們的伺服器與代理器之間有加密，因而第三方無法存取它們。',
    'welcomeSoftwareUpdates':u'軟體更新\n這個軟體會自動更新',
    'windowsAdminPrivileges':u'您必須有管理者權力才能安裝 DWAgent。\n請按一下右鍵以執行檔案，並按一下「以管理者身分運行」來啟始安裝程式。',
    'yes':u'是'
}
                                                                                                                                                                                                                                                                            ui/messages/sk.py                                                                                   0000644 0001750 0001750 00000024622 13743133531 013570  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Súhlasím',
    'agentName':u'Názov agenta',
    'alreadyInstalled':u'DWAgent je už nainštalovaný.\n\nAplikácia agenta sa automaticky aktualizuje na najnovšiu verziu. To znamená, že nemusíte manuálne inštalovať novšiu verziu.',
    'back':u'Späť',
    'cancel':u'Zrušiť',
    'cancelInstall':u'Zdieľania od užívateľov',
    'cancelUninstall':u'Odinštalácia bola prerušená.',
    'checkInstallCode':u'Kontrolujem inštalačný kód...',
    'chooseProxyType':u'Aký typ proxy chcete použiť?',
    'close':u'Zatvoriť',
    'code':u'Kód',
    'commands':u'Príkazy',
    'configureAgent':u'Nakonfiguruj agenta',
    'configureAgentDisabled':u'Agent vypnutý.',
    'configureAgentEnabled':u'Agent zapnutý.',
    'configureChangeInstallKey':u'Zmena inštalačného kódu',
    'configureChooseMonitorTrayIconVisibility':u'Chcete zobrazovať ikonku monitora v panely?',
    'configureChooseOperation':u'Vyberte prosím operáciu',
    'configureDisableAgent':u'Vypnúť agenta',
    'configureDisableAgentQuestion':u'Želáte si vypnúť agenta?',
    'configureEnableAgent':u'Zapnúť agenta',
    'configureEnableAgentQuestion':u'Želáte si zapnúť agenta?',
    'configureEnd':u'Konfigurácia bola ukončená.',
    'configureErrorConnection':u'Problém pripojenia. Skontrolujte, či je DWAgent služba spustená.',
    'configureExit':u'Koniec',
    'configureInsertPassword':u'Vložte heslo konfigurácie:',
    'configureInstallAgent':u'Ako uprednostňujete konfiguráciu agenta?',
    'configureInstallCode':u'Vložte inštalačný kód',
    'configureInstallNewAgent':u'Vytvoriť nového agenta',
    'configureInvalidPassword':u'Nesprávne heslo.',
    'configureKeyInstalled':u'Kľúč bol úspešne nainštalovaný.',
    'configureLater':u'Konfigurovať neskôr',
    'configureMonitor':u'Konfigurácia monitoru',
    'configurePassword':u'Konfigurácia hesla',
    'configurePasswordErrNoMatch':u'Heslo sa nezhoduje.',
    'configurePasswordUpdated':u'Heslo bolo aktualizované.',
    'configureProxy':u'Konfigurácia proxy',
    'configureProxyEnd':u'Konfigurácia Proxy bola úspešná.',
    'configureRemovePassword':u'Odstrániť heslo',
    'configureRemovePasswordQuestion':u'Chcete odstrániť heslo?',
    'configureSetPassword':u'Nastaviť heslo',
    'configureTitle':u'DWAgent - Konfigurácia',
    'configureTrayIconOK':u'Zobrazenie ikony na paneli, konfigurácia úspešná.',
    'configureTrayIconVisibility':u'Zobrazenie ikony na paneli.',
    'configureUninstallKeyQuestion':u'Odinštalovať aktuálny inštalačný kód?',
    'configureUninstallationKey':u'Odinštalovanie',
    'confirmExit':u'Ste si istý, že chcete skončiť?',
    'confirmInstall':u'Chcete nainštalovať DWAgent na \'{0}\'?',
    'confirmUninstall':u'Chcete odstrániť DWAgenta?',
    'copyFiles':u'Kopírovanie súborov...',
    'createNewAgent':u'Vytváranie agenta',
    'decline':u'Nesúhlasím',
    'downloadFile':u'Sťahovanie súboru {0}...',
    'dwsPassword':u'DWS heslo',
    'dwsUser':u'DWS užívateľ',
    'endInstall':u'Inštalácia je kompletná',
    'endInstallConfigLater':u'Inštalácia je kompletná.\nAgent  nie je nakonfigurovaný. Konfiguráciu môžete urobiť neskôr.',
    'endUninstall':u'Odinštalovanie bolo ukončené.',
    'enter':u'vložiť',
    'enterInstallCode':u'Vložte inštalačný kód',
    'enterInstallNewAgent':u'Vložte údaje na vytvorenie nového agenta.',
    'enterRunCode':u'Zadajte kód pripojenia',
    'error':u'Chyba',
    'errorAgentAlreadyExsists':u'Agent {0} už existuje.',
    'errorAgentMax':u'Maximálny počet agentov je prekročený.',
    'errorAgentNameNotValid':u'Názov agenta nie je platný. Nemôžete použiť znaky / \ | # @:.',
    'errorConnectionConfig':u'Chyba spojenia. Skontrolujte, či je služba DWAgent spustená.',
    'errorConnectionQuestion':u'Chyba spojenia. Skontrolujte pripojenie k internetu alebo konfiguráciu brány firewall.\nChcete konfigurovať proxy?',
    'errorInvalidCode':u'Chybný vložený kód.',
    'errorInvalidUserPassword':u'Nesprávný užívateľ alebo heslo',
    'fieldRequired':u'Pole \'{0}\' je potrebné.',
    'install':u'Inštalácia',
    'installMonitor':u'Inštaluje sa monitor',
    'installMonitorErr':u'Inštalácia monitoru bola neuúspešná.',
    'installService':u'Inštalácia služby',
    'installServiceErr':u'Inštalácia služby bola neúspešná.',
    'installShortcuts':u'Inštalácia odkazu ...',
    'installShortcutsErr':u'Inštalácia odkazu bola neúspešná',
    'linuxRootPrivileges':u'Na inštaláciu DWAgent musíte mať oprávnenia správcu (root.)\nSpustite skript pomocou používateľa správcu (root.)',
    'menuConfigure':u'Konfigurácia',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Odinštalácia',
    'missingInfoFile':u'Súbor info.json sa nenašiel.',
    'missingNative':u'Native sa nenašiel',
    'missingRuntime':u'Runtime sa nenašiel.',
    'monitorAgentDisabled':u'Agent vypnutý.',
    'monitorAgentEnabled':u'Agent zapnutý.',
    'monitorConfigure':u'Konfigurovať',
    'monitorConnections':u'Pripojenia',
    'monitorDisable':u'Zakázať',
    'monitorDisableAgentQuestion':u'Chcete zakázať službu agenta ?',
    'monitorEnable':u'Povoliť',
    'monitorEnableAgentQuestion':u'Chcete povoliť službu agenta ?',
    'monitorEnterPassword':u'Vložte heslo:',
    'monitorErrorConnectionConfig':u'Chyba spojenia. Skontrolujte, či je služba DWAgent spustená.',
    'monitorHide':u'Skryť',
    'monitorInvalidPassword':u'Chybné heslo.',
    'monitorShow':u'Ukáž',
    'monitorStatus':u'Stav',
    'monitorStatusDisabled':u'Vypnuté',
    'monitorStatusNoService':u'Žiadna služba',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Aktualizácia',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Odinštalovanie',
    'monitorUninstallNotRun':u'Nie je možné odinštalovať bez oprávnení používateľa root.\nSpustite príkaz dwaguninstall v prostredí shell.',
    'mustAccept':u'Ak chcete pokračovať, musíte vybrať možnosť {0}',
    'mustSelectOptions':u'Musíte vybrať jednu z možností.',
    'next':u'Nasledujúci',
    'no':u'Nie',
    'noTryAgain':u'Nie, skúste znova',
    'notInstalled':u'DWAgent nie je inštalovaný.',
    'ok':u'Dobre',
    'option':u'Voľba',
    'optionNotValid':u'Chybný výber voľby.',
    'or':u'alebo',
    'password':u'Heslo',
    'path':u'Cesta',
    'pathCreating':u'Vytváranie priečinka',
    'pathNotCreate':u'Priečinok sa nepodarilo vytvoriť. Neplatná cesta alebo nedostatočné oprávnenie.',
    'pressEnter':u'Pokračujte stlačením Enter.',
    'proxyAuthPassword':u'Heslo',
    'proxyAuthUser':u'Užívateľ',
    'proxyHost':u'Počítač',
    'proxyHttp':u'Http',
    'proxyInfo':u'Vložte informáciu o proxy.',
    'proxyNone':u'žiadny',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Systém',
    'reEnterCode':u'Zopakujte kód',
    'reEnterData':u'Zopakujte dáta',
    'rePassword':u'Zopakujte heslo',
    'removeFile':u'Odstrániť súbor...',
    'runWithoutInstallation':u'Spustiť',
    'runWithoutInstallationClosing':u'Relácia sa uzatvára...',
    'runWithoutInstallationConnecting':u'Relácia sa otvára...',
    'runWithoutInstallationEnd':u'Relácia je ukončená.',
    'runWithoutInstallationOnlineBottom':u'UPOZORNENIE:\nNezverejňujte tieto informácie nedôveryhodným osobám, inak im umožňujete prístup k tomuto agentovi. Takže ak si nie ste istí, čo robíte, zavrite túto aplikáciu.',
    'runWithoutInstallationOnlineBottomPutCode':u'UPOZORNENIE:\nAgent je teraz pripravený prijímať pripojenia. V prípade že si nie ste istý čo robíte, prosím zatvorte túto aplikáciu.',
    'runWithoutInstallationOnlinePassword':u'Heslo: {0}',
    'runWithoutInstallationOnlineTop':u'Relácia je aktívna.\nPre spojenie s týmto agentom navštívte https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Relácia je aktívna.',
    'runWithoutInstallationOnlineUser':u'Užívateľ: {0}',
    'runWithoutInstallationStarting':u'Agent sa spúšťa...',
    'runWithoutInstallationUnexpectedError':u'Neočakávaná chyba.\nnebolo možné spustiť DWAgent. Ak problém naďalej pretrváva, skúste prevziať najnovšie vydanie DWAgent, odstránte priečinok \'{0}\' a znova spustite DWAgent.',
    'runWithoutInstallationUpdating':u'Agent sa aktualizuje...',
    'runWithoutInstallationWait':u'Čakajte na nové prebiehajúce pripojenie (pokus {0}) ...',
    'selectPathInstall':u'Vyberte inštalačnú cestu:',
    'startService':u'Spúšťam službu...',
    'startServiceErr':u'Spustenie služby sa nepodarilo.',
    'titleInstall':u'DWAgent - Inštalácia',
    'titleUninstall':u'DWAgent - Odinštalácia',
    'toBack':u'návrat.',
    'toExit':u'ukončiť.',
    'unexpectedError':u'Neočakávaná chyba.\n{0}',
    'uninstallMonitor':u'Odinštalovanie monitora ...',
    'uninstallService':u'Odinštalovanie služby...',
    'uninstallShortcuts':u'Odinštalovanie zástupcu ...',
    'user':u'Užívateľ',
    'validInteger':u'Pole \'{0}\' musí byť celé číslo.',
    'versionInstallNotValid':u'Verzia inštalačného programu nie je správna pre váš operačný systém.\nStiahnite si správnu verziu. {0}',
    'waiting':u'Čakajte...',
    'warningRemovePath':u'Upozornenie, cieľová zložka už existuje, potom sa odstráni.',
    'welcomeLicense':u'Licencia\nTento softvér je bezplatný a open source.\nSkladá sa z jednej hlavnej zložky a niekoľkých príslušných komponentov definovaných ako "aplikácie" ("app"), ktoré by mohli byť riadené rôznymi licenciami. Ďalšie informácie nájdete na stránke https://www.dwservice.net/sk/licenses-sources.html',
    'welcomeSecurity':u'Zabezpečenie\nAby sme chránili vaše súkromie, zaručujeme, že na našich serveroch nebudú uložené žiadne informácie a komunikácia je šifrovaná, takže tretie strany ich nemôžu čítať.',
    'welcomeSoftwareUpdates':u'Aktualizácie softvéru\nAktualizácie tohto softvéru sú automatické.',
    'windowsAdminPrivileges':u'Na inštaláciu DWAgent musíte mať oprávnenia správcu.\nSpustite spustiteľný súbor "Spustiť ako správca".',
    'yes':u'Áno'
}
                                                                                                              ui/messages/hu.py                                                                                   0000644 0001750 0001750 00000031153 14137472004 013563  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Elfogadom',
    'agentName':u'Ügynök neve',
    'alreadyInstalled':u'A DWÜgynök már telepítve van.\n\nAz ügynök automatikusan frissül a legutóbbi verzióra. Ez azt jelenti, hogy nem kell manuálisan telepítenie az újabb frissítéseket.',
    'back':u'Vissza',
    'cancel':u'Mégse',
    'cancelInstall':u'A telepítés megszakadt.',
    'cancelUninstall':u'Az eltávolítás megszakadt.',
    'checkInstallCode':u'A telepítési kód ellenőrzése...',
    'chooseProxyType':u'Milyen proxy típust szeretne használni?',
    'close':u'Bezárás',
    'code':u'Kód',
    'commands':u'Parancsok',
    'configureAgent':u'Ügynök konfigurálása',
    'configureAgentDisabled':u'Ügynök letiltva.',
    'configureAgentEnabled':u'Ügynök engedélyezve.',
    'configureChangeInstallKey':u'Telepítési kód módosítása',
    'configureChooseMonitorTrayIconVisibility':u'Szeretné, hogy a figyelő ikonja megjelenjen a tálcán?',
    'configureChooseOperation':u'Kérjük, válasszon egy műveletet:',
    'configureDesktopNotification':u'Asztali értesítés',
    'configureDesktopNotificationOK':u'Az asztali értesítés sikeresen konfigurálva.',
    'configureDisableAgent':u'Ügynök letiltása',
    'configureDisableAgentQuestion':u'Szeretné letiltani az ügynököt?',
    'configureEnableAgent':u'Ügynök engedélyezése',
    'configureEnableAgentQuestion':u'Szeretné engedélyezni az ügynököt?',
    'configureEnd':u'A konfigurálás befejeződött.',
    'configureErrorConnection':u'Csatlakozási hiba. Kérjük, ellenőrizze, hogy fut-e a DWAgent szolgáltatás.',
    'configureExit':u'Kilépés',
    'configureInsertPassword':u'Kérjük, adja meg a konfigurációs jelszót:',
    'configureInstallAgent':u'Hogyan szeretné konfigurálni az ügynököt?',
    'configureInstallCode':u'Adja meg a telepítési kódot',
    'configureInstallNewAgent':u'Új ügynök létrehozása',
    'configureInvalidPassword':u'Érvénytelen jelszó.',
    'configureKeyInstalled':u'Kulcs sikeresen telepítve.',
    'configureLater':u'Konfigurálás később',
    'configureMonitor':u'Figyelő konfigurálása',
    'configurePassword':u'Konfigurációs jelszó szerkesztése',
    'configurePasswordErrNoMatch':u'A jelszavak nem egyeznek.',
    'configurePasswordUpdated':u'Jelszó frissítve.',
    'configureProxy':u'Proxy konfigurálása',
    'configureProxyEnd':u'A proxy konfigurálása sikeresen megtörtént.',
    'configureRemovePassword':u'Jelszó eltávolítása',
    'configureRemovePasswordQuestion':u'El szeretné távolítani a jelszót?',
    'configureSetPassword':u'Jelszó beállítása',
    'configureTitle':u'DWÜgynök - Konfigurálás',
    'configureTrayIconOK':u'Tálca ikon konfigurálása sikeresen megtörtént.',
    'configureTrayIconVisibility':u'Tálca ikon láthatósága',
    'configureUninstallKeyQuestion':u'Eltávolítja a jelenlegi telepítési kódot?',
    'configureUninstallationKey':u'Eltávolítás...',
    'confirmExit':u'Biztosan ki szeretne lépni?',
    'confirmInstall':u'Szeretné telepíteni a DWÜgynököt a(z) \'{0}\' helyre?',
    'confirmUninstall':u'El szeretné távolítani a DWÜgynök programot?',
    'copyFiles':u'Fájlok másolása...',
    'createNewAgent':u'Az ügynök létrehozása folyamatban...',
    'decline':u'Nem fogadom el',
    'desktopNotificationAutoHide':u'Automatikus elrejtés',
    'desktopNotificationNone':u'Nincs',
    'desktopNotificationVisible':u'Látható',
    'downloadFile':u'{0} fájl letöltése...',
    'dwsPassword':u'DWS jelszó',
    'dwsUser':u'DWS felhasználó',
    'endInstall':u'A telepítés befejeződött.',
    'endInstallConfigLater':u'A telepítés befejeződött.\nAz ügynök nem lett konfigurálva. A konfigurációt később is létrehozhatja.',
    'endUninstall':u'Az eltávolítás befejeződött.',
    'enter':u'enter',
    'enterInstallCode':u'Adja meg a telepítési kódot',
    'enterInstallNewAgent':u'Adjon meg adatokat egy új ügynök létrehozásához:',
    'enterRunCode':u'Írja be a csatlakozási kódot',
    'error':u'Hiba',
    'errorAgentAlreadyExsists':u'A(z) {0} ügynök már létezik.',
    'errorAgentMax':u'Túllépte az ügynökök maximális számát.',
    'errorAgentNameNotValid':u'Az ügynök neve érvénytelen. Nem használhatja a következő karaktereket: / \ | # @ : .',
    'errorConnectionConfig':u'Csatlakozási hiba. Kérjük, ellenőrizze, hogy fut-e a DWAgent szolgáltatás.',
    'errorConnectionQuestion':u'Csatlakozási hiba. Kérjük, ellenőrizze internetkapcsolatát vagy tűzfalát.\nSzeretne proxy-t beállítani?',
    'errorInvalidCode':u'A megadott kód érvénytelen.',
    'errorInvalidUserPassword':u'Érvénytelen felhasználó vagy jelszó.',
    'fieldRequired':u'A \'{0}\' mező kitöltése kötelező.',
    'install':u'Telepítés',
    'installMonitor':u'Figyelő telepítése...',
    'installMonitorErr':u'Figyelő telepítése sikertelen.',
    'installService':u'Szolgáltatás telepítése...',
    'installServiceErr':u'Szolgáltatás telepítése sikertelen.',
    'installShortcuts':u'Parancsikonok telepítése...',
    'installShortcutsErr':u'A parancsikon telepítése sikertelen.',
    'linuxRootPrivileges':u'A DWÜgynök telepítéséhez root jogosultságokkal kell rendelkeznie.\nKérjük, futtassa a szkriptet sudo-val vagy root-ként.',
    'menuConfigure':u'Konfigurálás',
    'menuMonitor':u'Figyelő',
    'menuUninstall':u'Eltávolítás',
    'missingInfoFile':u'Az info.json fájl nem található.',
    'missingNative':u'Natív nem található.',
    'missingRuntime':u'A futtatókörnyezet nem taláható.',
    'monitorActive':u'aktív',
    'monitorAgentDisabled':u'Ügynök letiltva.',
    'monitorAgentEnabled':u'Ügynök engedélyezve.',
    'monitorConfigure':u'Konfigurálás',
    'monitorConnections':u'Kapcsolatok',
    'monitorCurrentActivities':u'Jelenlegi tevékenységek',
    'monitorDisable':u'Letiltás',
    'monitorDisableAgentQuestion':u'Szeretné letiltani az ügynököt?',
    'monitorDownload':u'Letöltés',
    'monitorEnable':u'Engedélyezés',
    'monitorEnableAgentQuestion':u'Szeretné engedélyezni az ügynököt?',
    'monitorEnterPassword':u'Adja meg a jelszót:',
    'monitorErrorConnectionConfig':u'Csatlakozási hiba. Kérjük, ellenőrizze, hogy fut-e a DWAgent szolgáltatás.',
    'monitorHide':u'Elrejt',
    'monitorInvalidPassword':u'Érvénytelen jelszó.',
    'monitorNoActivities':u'Nincs tevékenység',
    'monitorScreenCapture':u'Képernyő-hozzáférés',
    'monitorSession':u'Munkamenet',
    'monitorShellSession':u'Shell hozzáférés',
    'monitorShow':u'Mutat',
    'monitorStatus':u'Állapot',
    'monitorStatusDisabled':u'Letiltva',
    'monitorStatusNoService':u'Nincs szolgáltatás',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Frissítés',
    'monitorTitle':u'DWÜgynök - Figyelő',
    'monitorUninstall':u'Eltávolítás',
    'monitorUninstallNotRun':u'Root jogosultságok nélkül nem lehet eltávolítani.\nFuttassa a dwaguninstall parancsot sudo-val vagy root-ként.',
    'monitorUpload':u'Feltöltés',
    'mustAccept':u'A folytatáshoz ki kell választania a(z) {0} lehetőséget',
    'mustSelectOptions':u'Ki kell választania egy lehetőséget.',
    'next':u'Tovább',
    'no':u'Nem',
    'noTryAgain':u'Nem, próbálja újra',
    'notInstalled':u'A DWÜgynök nincs telepítve.',
    'ok':u'OK',
    'option':u'Beállítás',
    'optionNotValid':u'A kiválasztott lehetőség érvénytelen.',
    'or':u'vagy',
    'password':u'Jelszó',
    'path':u'Elérési útvonal',
    'pathCreating':u'Mappa létrehozása...',
    'pathNotCreate':u'Nem sikerült létrehozni a mappát. Érvénytelen elérési útvonal vagy az engedély megtagadva.',
    'pressEnter':u'A folytatáshoz nyomja meg az Enter billentyűt.',
    'privacyPolicy':u'Adatvédelmi szabályzat',
    'proxyAuthPassword':u'Jelszó',
    'proxyAuthUser':u'Felhasználó',
    'proxyHost':u'Cím',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'Proxy-információ beillesztése.',
    'proxyNone':u'Nincs',
    'proxyPort':u'Port',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'Rendszer',
    'reEnterCode':u'Adja meg újra a kódot',
    'reEnterData':u'Adja meg újra az adatot',
    'rePassword':u'Jelszó ismételt megadása',
    'removeFile':u'Fájl eltávolítása...',
    'runWithoutInstallation':u'Futtatás',
    'runWithoutInstallationClosing':u'Munkamenet bezárása...',
    'runWithoutInstallationConnecting':u'Munkamenet megnyitása...',
    'runWithoutInstallationEnd':u'A munkamenet véget ért.',
    'runWithoutInstallationOnlineBottom':u'FIGYELMEZTETÉS:\nNe adja ki ezeket az információkat olyan embereknek, akikben nem bízik. Ez lehetővé teszi számukra, hogy hozzáférjenek ehhez az eszközhöz. Ha nem biztos benne, hogy mit csinál, kérjük, zárja be ezt az alkalmazást.',
    'runWithoutInstallationOnlineBottomPutCode':u'FIGYELMEZTETÉS:\nAz ügynök készen áll a csatlakozás elfogadására. Ha nem biztos benne, hogy mit csinál, kérjük, zárja be ezt az alkalmazást.',
    'runWithoutInstallationOnlinePassword':u'Jelszó: {0}',
    'runWithoutInstallationOnlineTop':u'A munkamenet aktív.\nAz ügynökhöz való csatlakozáshoz lépjen a https://www.dwservice.net webhelyre.',
    'runWithoutInstallationOnlineTopPutCode':u'A munkamenet aktív.',
    'runWithoutInstallationOnlineUser':u'Felhasználó: {0}',
    'runWithoutInstallationStarting':u'Ügynök indítása...',
    'runWithoutInstallationUnexpectedError':u'Váratlan hiba.\nA DWÜgynök nem tudott elindulni. Ha a probléma továbbra is fennáll, kérjük, töltse le a DWÜgynök legújabb verzióját, törölje a \'{0}\' mappát, és futtassa újra a DWÜgynököt.',
    'runWithoutInstallationUpdating':u'Ügynök frissítése...',
    'runWithoutInstallationWait':u'Várjon a folyamatban lévő új kapcsolatra (kísérlet {0})...',
    'selectPathInstall':u'Válassza ki a telepítési útvonalat:',
    'startService':u'Szolgáltatás indítása...',
    'startServiceErr':u'Nem sikerült elindítani a szolgáltatást.',
    'termsAndConditions':u'Felhasználási feltételek',
    'titleInstall':u'DWÜgynök - Telepítés',
    'titleUninstall':u'DWÜgynök - Eltávolítás',
    'toBack':u'visszalépni.',
    'toExit':u'kilépni.',
    'unexpectedError':u'Váratlan hiba.\n{0}',
    'uninstallMonitor':u'Figyelő eltávolítása...',
    'uninstallService':u'Szolgáltatás eltávolítása...',
    'uninstallShortcuts':u'Parancsikonok eltávolítása...',
    'user':u'Felhasználó',
    'validInteger':u'A \'{0}\' mezőnek egész számnak kell lennie.',
    'versionInstallNotValid':u'A telepítőnek ez a verziója nem megfelelő az Ön operációs rendszeréhez.\nKérjük, töltse le a megfelelő verziót. {0}',
    'waiting':u'Várakozás...',
    'warningLoginLogout':u'A módosítás érvénybe lépéséhez a felhasználónak ki kell jelentkeznie, majd újra be kell jelentkeznie.',
    'warningRemovePath':u'Figyelem: a célmappa már létezik, és törlésre kerül.',
    'warningSpyingTool':u'Kérjük, vegye figyelembe, hogy egy távoli számítógéphez nem férhet hozzá a felhasználó beleegyezése nélkül. A DWService kémkedési eszközként való használatával megsértheti a lakóhelye szerinti ország törvényeit.',
    'welcomeLicense':u'Licenc\nEz a szoftver ingyenes és nyílt forráskódú.\nEgy fő komponensből áll, amelyet az MPLv2 licenc alatt adtak ki, és több további komponensből, amelyek különböző licencek alá tartoznak. További információért látogasson el a következő weboldalra: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'A telepítés folytatásával vagy a szoftver futtatásával Ön elfogadja a következőket: #TERMSANDCONDITIONS és #PRIVACYPOLICY',
    'welcomeSecurity':u'Biztonság\nAz Ön adatainak védelme érdekében az ügynöktől származó információkat nem tároljuk a szervereinken. A felhasználók, szervereink és az ügynökök közötti kommunikáció titkosított, így harmadik felek nem férhetnek hozzá.',
    'welcomeSoftwareUpdates':u'Szoftverfrissítések\nEz a szoftver automatikusan frissül',
    'windowsAdminPrivileges':u'A DWÜgynök telepítéséhez rendszergazdai jogosultságokkal kell rendelkeznie.\nKérjük, a telepítő indításához kattintson a jobb gombbal a végrehajtható fájlra, és kattintson a "Futtatás rendszergazdaként" parancsra.',
    'yes':u'Igen'
}
                                                                                                                                                                                                                                                                                                                                                                                                                     ui/messages/es.py                                                                                   0000644 0001750 0001750 00000027543 14137471747 013603  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Aceptar',
    'agentName':u'Nombre del agente',
    'alreadyInstalled':u'DWAgente ya instalado.\n\nEl agente se actualiza automáticamente a la última versión. Esto significa que no es necesario instalar manualmente las actualizaciones más recientes.',
    'back':u'Volver',
    'cancel':u'Cancelar',
    'cancelInstall':u'La instalación ha sido cancelada.',
    'cancelUninstall':u'La desinstalación ha sido cancelada.',
    'checkInstallCode':u'Verificando código de instalación...',
    'chooseProxyType':u'¿Qué tipo de proxy desea usar?',
    'close':u'Cerrar',
    'code':u'Código',
    'commands':u'Comandos',
    'configureAgent':u'Configurar agente',
    'configureAgentDisabled':u'Agente deshabilitado.',
    'configureAgentEnabled':u'Agente habilitado.',
    'configureChangeInstallKey':u'Cambiar el código de instalación',
    'configureChooseMonitorTrayIconVisibility':u'¿Mostrar icono de la aplicación en la bandeja de iconos?',
    'configureChooseOperation':u'Por favor, elija una operación:',
    'configureDesktopNotification':u'Notificación de escritorio',
    'configureDesktopNotificationOK':u'Notificación de escritorio configurada correctamente.',
    'configureDisableAgent':u'Deshabilitar agente',
    'configureDisableAgentQuestion':u'¿Desea deshabilitar el agente?',
    'configureEnableAgent':u'Habilitar el agente',
    'configureEnableAgentQuestion':u'¿Desea activar el agente?',
    'configureEnd':u'La configuración ha sido completada',
    'configureErrorConnection':u'Error de conexión. Compruebe que el servicio DWAgent esté iniciado.',
    'configureExit':u'Salir',
    'configureInsertPassword':u'Por favor introduzca la contraseña:',
    'configureInstallAgent':u'¿Cómo prefiere configurar el agente?',
    'configureInstallCode':u'Ingrese el código de instalación',
    'configureInstallNewAgent':u'Crear un nuevo agente',
    'configureInvalidPassword':u'Contraseña inválida.',
    'configureKeyInstalled':u'Clave instalada correctamente.',
    'configureLater':u'Configurar después',
    'configureMonitor':u'Configurar monitor',
    'configurePassword':u'Configurar contraseña',
    'configurePasswordErrNoMatch':u'Las contraseñas no coinciden.',
    'configurePasswordUpdated':u'Contraseña actualizada.',
    'configureProxy':u'Configurar proxy',
    'configureProxyEnd':u'Proxy configurado correctamente.',
    'configureRemovePassword':u'Eliminar contraseña',
    'configureRemovePasswordQuestion':u'¿Desea eliminar la contraseña?',
    'configureSetPassword':u'Establecer contraseña',
    'configureTitle':u'Configuración DWAgent',
    'configureTrayIconOK':u'Visibilidad del icono en la bandeja configurada correctamente.',
    'configureTrayIconVisibility':u'Visibilidad del icono en la bandeja de sistema',
    'configureUninstallKeyQuestion':u'¿Desinstalar el código de instalación actual?',
    'configureUninstallationKey':u'Desintalación...',
    'confirmExit':u'¿Seguro que desea salir?',
    'confirmInstall':u'¿Desea instalar DWAgent en \'{0}\'?',
    'confirmUninstall':u'¿Desea eliminar DWAgent?',
    'copyFiles':u'Copiando archivos...',
    'createNewAgent':u'Creación del agente en progreso...',
    'decline':u'No acepto',
    'desktopNotificationAutoHide':u'Ocultar automáticamente',
    'desktopNotificationNone':u'Ninguna/o',
    'desktopNotificationVisible':u'Visible',
    'downloadFile':u'Descargando archivo {0}...',
    'dwsPassword':u'Contraseña DWS',
    'dwsUser':u'Usuario DWS',
    'endInstall':u'La instalación ha sido completada.',
    'endInstallConfigLater':u'La instalación se ha completado.\nEl agente no ha sido configurado. Puede proceder con la configuración después.',
    'endUninstall':u'Las desinstalación ha sido completada.',
    'enter':u'ingresar',
    'enterInstallCode':u'Ingresar el código de instalación',
    'enterInstallNewAgent':u'Ingresar datos para crear un nuevo agente:',
    'enterRunCode':u'Introduce el código de conexión',
    'error':u'Error',
    'errorAgentAlreadyExsists':u'El agente {0} ya existe.',
    'errorAgentMax':u'Se ha sobrepasado el número máximo de agentes.',
    'errorAgentNameNotValid':u'El nombre de agente es inválido. No puede usar los caracteres / \ | # @ : .',
    'errorConnectionConfig':u'Error en la conexión. Comprueba que el servicio DWAgent esté iniciado.',
    'errorConnectionQuestion':u'Error de conexión. Compruebe su conexión a internet o la configuración de su cortafuegos.\n¿Desea configurar un proxy?',
    'errorInvalidCode':u'El código introducido es inválido.',
    'errorInvalidUserPassword':u'Usuario inválido o contraseña incorrecta',
    'fieldRequired':u'Se requiere el campo \'{0}\'',
    'install':u'Instalar',
    'installMonitor':u'Instalando monitor...',
    'installMonitorErr':u'Falló la instalación del monitor',
    'installService':u'Instalando servicio...',
    'installServiceErr':u'Falló la instalación del servicio...',
    'installShortcuts':u'Creando accesos directos...',
    'installShortcutsErr':u'Falló la instalación de los accesos directos.',
    'linuxRootPrivileges':u'Debe tener privilegios de administrador para instalar DWAgent.\nPor favor inicie el script usando un usuario administrador.',
    'menuConfigure':u'Configurar',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Desinstalar',
    'missingInfoFile':u'No se encuentra el archivo info.json.',
    'missingNative':u'Nativo no encontrado.',
    'missingRuntime':u'Tiempo de ejecución no encontrado.',
    'monitorActive':u'activa/o',
    'monitorAgentDisabled':u'Agente deshabilitado.',
    'monitorAgentEnabled':u'Agente habilitado.',
    'monitorConfigure':u'Configurar',
    'monitorConnections':u'Conexiones',
    'monitorCurrentActivities':u'Actividades actuales',
    'monitorDisable':u'Deshabilitar',
    'monitorDisableAgentQuestion':u'¿Deshabilitar el agente?',
    'monitorDownload':u'Descargar',
    'monitorEnable':u'Habilitar',
    'monitorEnableAgentQuestion':u'¿Habilitar el agente?',
    'monitorEnterPassword':u'Ingresar contraseña:',
    'monitorErrorConnectionConfig':u'Error en la conexión. Por favor compruebe que el servicio DWAgent esté iniciado.',
    'monitorHide':u'Ocultar',
    'monitorInvalidPassword':u'Contraseña inválida.',
    'monitorNoActivities':u'Sin actividades',
    'monitorScreenCapture':u'Acceso a la pantalla',
    'monitorSession':u'Sesión',
    'monitorShellSession':u'Acceso a Shell',
    'monitorShow':u'Mostrar',
    'monitorStatus':u'Estado',
    'monitorStatusDisabled':u'Deshabilitado',
    'monitorStatusNoService':u'Sin servicio',
    'monitorStatusOffline':u'Fuera de línea',
    'monitorStatusOnline':u'En línea',
    'monitorStatusUpdating':u'Actualizando',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Desinstalar',
    'monitorUninstallNotRun':u'No se puede desinstalar sin permisos de administrador.\nEjecute el comando dwaguninstall desde la línea de comandos.',
    'monitorUpload':u'Subir',
    'mustAccept':u'Para continuar, debe seleccionar la opción {0}',
    'mustSelectOptions':u'Debe seleccionar una opción.',
    'next':u'Siguiente',
    'no':u'No',
    'noTryAgain':u'No, intentar de nuevo',
    'notInstalled':u'No se ha instalado DWAgent.',
    'ok':u'Ok',
    'option':u'Opción',
    'optionNotValid':u'La opción seleccionada es inválida.',
    'or':u'o',
    'password':u'Contraseña',
    'path':u'Ruta',
    'pathCreating':u'Crear carpeta...',
    'pathNotCreate':u'No se pudo crear la carpeta. Ruta incorrecta o permiso denegado.',
    'pressEnter':u'Presione Enter para continuar.',
    'privacyPolicy':u'Política de privacidad',
    'proxyAuthPassword':u'Contraseña',
    'proxyAuthUser':u'Usuario',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Ingrese información del proxy.',
    'proxyNone':u'Ninguno',
    'proxyPort':u'Puerto',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Sistema',
    'reEnterCode':u'Reingrese el código',
    'reEnterData':u'Reingrese los datos',
    'rePassword':u'Reescriba la contraseña',
    'removeFile':u'Borrando archivo...',
    'runWithoutInstallation':u'Ejecutar',
    'runWithoutInstallationClosing':u'Cerrando sesión...',
    'runWithoutInstallationConnecting':u'Abriendo sesión...',
    'runWithoutInstallationEnd':u'Sesión finalizada.',
    'runWithoutInstallationOnlineBottom':u'ADVERTENCIA:\nNo revelar esta información a personas que no son de confianza, de otro modo, les permitirá acceder a este agente. Por lo tanto, si no está seguro de lo que está haciendo, cierre esta aplicación.',
    'runWithoutInstallationOnlineBottomPutCode':u'ADVERTENCIA:\nAhora el agente está listo para aceptar la conexión. Si no está seguro de lo que está haciendo, cierre esta aplicación.',
    'runWithoutInstallationOnlinePassword':u'Password: {0}',
    'runWithoutInstallationOnlineTop':u'La sesión está activa.\nPara conectarse a este agente, vaya a https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'La sesión está activa',
    'runWithoutInstallationOnlineUser':u'User: {0}',
    'runWithoutInstallationStarting':u'Iniciando agente...',
    'runWithoutInstallationUnexpectedError':u'Error inesperado.\nNo se pudo iniciar DWAgent. Si el problema persiste, intenta descargar la ultima versión de DWAgent, elimine la carpeta \'{0}\' y ejecute DWAgent de nuevo.',
    'runWithoutInstallationUpdating':u'Actualizar Agente...',
    'runWithoutInstallationWait':u'Esperando por una nueva conexión en progreso (intento {0})...',
    'selectPathInstall':u'Seleccione la ruta de instalación:',
    'startService':u'Iniciando servicio...',
    'startServiceErr':u'Falló iniciar el servicio.',
    'termsAndConditions':u'Términos y condiciones',
    'titleInstall':u'Instalación de DWAgent',
    'titleUninstall':u'Desinstalación de DWAgent',
    'toBack':u'volver.',
    'toExit':u'salir.',
    'unexpectedError':u'Error inesperado.\n{0}',
    'uninstallMonitor':u'Desinstalando monitor...',
    'uninstallService':u'Desinstalando servicio...',
    'uninstallShortcuts':u'Eliminando accesos directos',
    'user':u'Usuario',
    'validInteger':u'El campo \'{0}\' debe ser un entero.',
    'versionInstallNotValid':u'La versión del instalador no corresponde con su sistema operativo.\nDescargue la versión correcta. {0}',
    'waiting':u'Esperando...',
    'warningLoginLogout':u'Para que este cambio surta efecto, el usuario debe cerrar la sesión y volver a iniciar sesión.',
    'warningRemovePath':u'Advertencia: la carpeta de destino ya existe y será eliminada.',
    'warningSpyingTool':u'Tenga en cuenta que no puede acceder a una computadora remota sin el consentimiento de su usuario. Al utilizar DWService como herramienta de espionaje, puede estar infringiendo las leyes de su país de residencia.',
    'welcomeLicense':u'Licencia\nEste software es gratuito y de código abierto.\nestá constituido de un componente principal y varios componentes accesorios llamados "app" que podrían regirse por diferentes licencias. Para obtener más información, visite: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Al continuar con la instalación o ejecutar este software, usted acepta los #TERMSANDCONDITIONS y la #PRIVACYPOLICY',
    'welcomeSecurity':u'Seguridad\nPara proteger su privacidad garantizamos que no se almacenará información en nuestros servidores y las comunicaciones se cifrarán para que terceros no puedan leerlas de ningún modo.',
    'welcomeSoftwareUpdates':u'Actualizaciones\nLas actualizaciones de este software son automáticas.',
    'windowsAdminPrivileges':u'Desbe tener privilegios de administrador para instalar DWAgent.\nPor favor inicie el instalador con \'Ejecutar como Administrador\'.',
    'yes':u'Si'
}
                                                                                                                                                             ui/messages/lt.py                                                                                   0000644 0001750 0001750 00000027072 14036550607 013577  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Aš sutinku',
    'agentName':u'Agento pavadinimas',
    'alreadyInstalled':u'DWAgent jau instaliuotas. \n\nAgentas automatiškai atsinaujina. Jums nereikia atnaujinti patiems.',
    'back':u'Atgal',
    'cancel':u'Atšaukti',
    'cancelInstall':u'Diegimas nutrauktas',
    'cancelUninstall':u'Diegimas nutrauktas',
    'checkInstallCode':u'Diegimo kodo tikrinimas',
    'chooseProxyType':u'Kokį tarpinį serverį norite naudoti ?',
    'close':u'Uždaryti',
    'code':u'Kodas',
    'commands':u'Komandos',
    'configureAgent':u'Konfigūruoti agentą',
    'configureAgentDisabled':u'Agentas išjungtas',
    'configureAgentEnabled':u'Agentas įjungtas',
    'configureChangeInstallKey':u'Pakeisti diegimo kodą',
    'configureChooseMonitorTrayIconVisibility':u'Ar norite rodyti piktogramą užduočių juostoje?',
    'configureChooseOperation':u'Pasirinkite operaciją:',
    'configureDesktopNotification':u'Pranešimas darbalaukyje',
    'configureDesktopNotificationOK':u'Darbalaukio pranešimas sėkmingai sukonfigūruotas.',
    'configureDisableAgent':u'Išjungti agentą',
    'configureDisableAgentQuestion':u'Ar norite išjungti agentą ?',
    'configureEnableAgent':u'Įjungti agentą',
    'configureEnableAgentQuestion':u'Ar norite įjungti agentą ?',
    'configureEnd':u'Konfigūravimas baigtas',
    'configureErrorConnection':u'Prijungimo klaida. Patikrinkite ar DWAgent servisas yra įjungtas.',
    'configureExit':u'Išeiti',
    'configureInsertPassword':u'Įrašykite konfigūravimo slaptažodį',
    'configureInstallAgent':u'Kaip Jūs norite konfigūruoti agentą ?',
    'configureInstallCode':u'Įveskite diegimo kodą',
    'configureInstallNewAgent':u'Sukurti naują agentą',
    'configureInvalidPassword':u'Neteisingas slaptažodis',
    'configureKeyInstalled':u'Raktas įdiegtas sėkmingai',
    'configureLater':u'Konfigūruoti vėliau',
    'configureMonitor':u'Konfigūruoti monitorių',
    'configurePassword':u'Konfigūruoti slaptažodį',
    'configurePasswordErrNoMatch':u'Slaptažodis neatitinka',
    'configurePasswordUpdated':u'Slaptažodis atjaujintas',
    'configureProxy':u'Konfigūruoti tarpinį serverį',
    'configureProxyEnd':u'Tarpinis serveris sėkmingai sukonfigūruotas',
    'configureRemovePassword':u'Pašalinti slaptažodį',
    'configureRemovePasswordQuestion':u'Ar norite pašalinti slaptažodį?',
    'configureSetPassword':u'Nustatyti slaptažodį',
    'configureTitle':u'DWAgent konfigūracija',
    'configureTrayIconOK':u'Piktogramos matomumas sėkmingai sukonfigūruotas.',
    'configureTrayIconVisibility':u'Piktogramos matomumas',
    'configureUninstallKeyQuestion':u'Pašalinti dabartinį diegimo kodą?',
    'configureUninstallationKey':u'Pašalinama...',
    'confirmExit':u'Ar tikrai kad norite išeiti?',
    'confirmInstall':u'Ar norite įdiegti DWAgent į „{0}“?',
    'confirmUninstall':u'Ar norite pašalinti DWAgent?',
    'copyFiles':u'Failai kopijuojami...',
    'createNewAgent':u'Kuriamas agentas...',
    'decline':u'Nesutinku',
    'desktopNotificationAutoHide':u'Automatiškai slėpti',
    'desktopNotificationNone':u'Nė vienas',
    'desktopNotificationVisible':u'Matomas',
    'downloadFile':u'Atsisiunčiamas failas{0}...',
    'dwsPassword':u'DWS slaptažodis',
    'dwsUser':u'DWS vartotojas',
    'endInstall':u'Diegimas baigtas.',
    'endInstallConfigLater':u'Diegimas baigtas.\nAgentas nebuvo sukonfigūruotas. Vėliau galėsite tęsti konfigūraciją.',
    'endUninstall':u'Pašalinimas baigtas.',
    'enter':u'įeiti',
    'enterInstallCode':u'Įveskite diegimo kodą',
    'enterInstallNewAgent':u'Įveskite duomenis, kad sukurtumėte naują agentą:',
    'enterRunCode':u'Įveskite ryšio kodą',
    'error':u'Klaida',
    'errorAgentAlreadyExsists':u'Agentas {0} jau egzistuoja.',
    'errorAgentMax':u'Viršytas maksimalus agentų skaičius.',
    'errorAgentNameNotValid':u'Agento vardas negalioja. Negalite naudoti ženklų / \ | # @:.',
    'errorConnectionConfig':u'Ryšio klaida. Patikrinkite, ar DWAgent servisas paleistas.',
    'errorConnectionQuestion':u'Ryšio klaida. Patikrinkite savo interneto ryšį arba ugniasienės konfigūraciją.\nAr norite sukonfigūruoti tarpinį serverį?',
    'errorInvalidCode':u'Įvestas kodas neteisingas.',
    'errorInvalidUserPassword':u'Netinkamas vartotojas arba slaptažodis.',
    'fieldRequired':u'Laukas „{0}“ yra būtinas.',
    'install':u'Laukia instaliacijos',
    'installMonitor':u'Diegiamas monitorius...',
    'installMonitorErr':u'Nepavyko įdiegti monitoriaus.',
    'installService':u'Diegiamas servisas...',
    'installServiceErr':u'Nepavyko įdiegti serviso.',
    'installShortcuts':u'Diegiamos nuorodos...',
    'installShortcutsErr':u'Nepavyko įdiegti nuorodų.',
    'linuxRootPrivileges':u'Norėdami įdiegti DWAgent, turite turėti Administratoriaus teises.\nPradėkite scenarijų naudodami administratoriaus teisėmis.',
    'menuConfigure':u'Konfigūruoti',
    'menuMonitor':u'Monitorius',
    'menuUninstall':u'Išinstaliuoti',
    'missingInfoFile':u'Failas info.json nerastas.',
    'missingNative':u'Native nerasta.',
    'missingRuntime':u'Klaidos nerasta.',
    'monitorActive':u'aktyvus',
    'monitorAgentDisabled':u'Agentas išjungtas.',
    'monitorAgentEnabled':u'Agentas įjungtas.',
    'monitorConfigure':u'Konfigūruoti',
    'monitorConnections':u'Ryšiai',
    'monitorCurrentActivities':u'Dabartinė veikla',
    'monitorDisable':u'Išjungti',
    'monitorDisableAgentQuestion':u'Ar norite išjungti agentą?',
    'monitorDownload':u'Atsisiųsti',
    'monitorEnable':u'Įgalinti',
    'monitorEnableAgentQuestion':u'Ar norite įjungti agentą?',
    'monitorEnterPassword':u'Įvesti slaptažodį:',
    'monitorErrorConnectionConfig':u'Ryšio klaida. Patikrinkite, ar DWAgent servisas paleistas.',
    'monitorHide':u'Slėpti',
    'monitorInvalidPassword':u'Netinkamas slaptažodis',
    'monitorNoActivities':u'Nėra jokios veiklos',
    'monitorScreenCapture':u'Ekrano prieiga',
    'monitorSession':u'Sesija',
    'monitorShellSession':u'Shell prieiga',
    'monitorShow':u'Rodyti',
    'monitorStatus':u'Statusas',
    'monitorStatusDisabled':u'Išungta',
    'monitorStatusNoService':u'Nėra ryšio su servisu',
    'monitorStatusOffline':u'Atsijungęs',
    'monitorStatusOnline':u'Prisijungęs',
    'monitorStatusUpdating':u'Atnaujinama',
    'monitorTitle':u'DWAgent - Monitorius',
    'monitorUninstall':u'Pašalinti',
    'monitorUninstallNotRun':u'Neįmanoma pašalinti be administratoriaus teisių.\nVykdykite komandą dwaguninstall administratoriaus teisėmis.',
    'monitorUpload':u'Įkelti',
    'mustAccept':u'Norėdami tęsti, turite pasirinkti {0}',
    'mustSelectOptions':u'Turite pasirinkti parinktį.',
    'next':u'Kitas',
    'no':u'Ne',
    'noTryAgain':u'Bandykite dar kartą',
    'notInstalled':u'„DWAgent“ neįdiegta.',
    'ok':u'Gerai',
    'option':u'Parinktis',
    'optionNotValid':u'Pasirinkta parinktis netinkama.',
    'or':u'arba',
    'password':u'Slaptažodis',
    'path':u'kelias',
    'pathCreating':u'Aplanko kūrimas...',
    'pathNotCreate':u'Nepavyko sukurti aplanko. Netinkamas kelias arba leidimas nesuteiktas.',
    'pressEnter':u'Norėdami tęsti, paspauskite „Enter“.',
    'privacyPolicy':u'Privatumo politika',
    'proxyAuthPassword':u'Slaptažodis',
    'proxyAuthUser':u'Naudotojas',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Įterpkite tarpinio serverio informaciją.',
    'proxyNone':u'Joks',
    'proxyPort':u'Prievadas',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Sistema',
    'reEnterCode':u'Iš naujo įveskite kodą',
    'reEnterData':u'Iš naujo įveskite duomenis',
    'rePassword':u'Pakartokite slaptažodį',
    'removeFile':u'Failas šalinama...',
    'runWithoutInstallation':u'Paleisti',
    'runWithoutInstallationClosing':u'Uždaroma sesija ...',
    'runWithoutInstallationConnecting':u'Atidaroma sesija ...',
    'runWithoutInstallationEnd':u'Sesija baigėsi.',
    'runWithoutInstallationOnlineBottom':u'ĮSPĖJIMAS:\nNeatskleiskite šios informacijos žmonėms, kuriems nepasitikite. Jei ne, leidžia jiems susisiekti su šiuo agentu. Taigi, jei nesate tikri, ką darote, uždarykite šią programą.',
    'runWithoutInstallationOnlineBottomPutCode':u'ĮSPĖJIMAS:\nDabar agentas yra pasirengęs priimti ryšį. Taigi, jei nesate tikri, ką darote, uždarykite šią programą.',
    'runWithoutInstallationOnlinePassword':u'Slaptažodis: {0}',
    'runWithoutInstallationOnlineTop':u'Sesija aktyvi.\nNorėdami prisijungti prie šio agento, eikite į https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Sesija aktyvi.',
    'runWithoutInstallationOnlineUser':u'Vartotojas: {0}',
    'runWithoutInstallationStarting':u'Agentas paleidžiamas ...',
    'runWithoutInstallationUnexpectedError':u'Netikėta klaida.\nNepavyko paleisti DWAgent. Jei problema išlieka, pabandykite atsisiųsti naujausią „DWAgent“ versiją, ištrinkite aplanką „{0}“ ir paleiskite „DWAgent“ dar kartą.',
    'runWithoutInstallationUpdating':u'Agentų atnaujinimas ...',
    'runWithoutInstallationWait':u'Palaukite, kol vyksta naujas susijungimas (bandymas {0}) ...',
    'selectPathInstall':u'Pasirinkite diegimo kelią:',
    'startService':u'Paleidžiamas servisas...',
    'startServiceErr':u'Nepavyko paleisti serviso.',
    'termsAndConditions':u'Terminai ir sąlygos',
    'titleInstall':u'DWAgent - diegimas',
    'titleUninstall':u'DWAgent - pašalinimas',
    'toBack':u'grįžti atgal.',
    'toExit':u'išeiti.',
    'unexpectedError':u'Netikėta klaida.\n{0}',
    'uninstallMonitor':u'Pašalinamas monitorius ...',
    'uninstallService':u'Pašalinama servisas ...',
    'uninstallShortcuts':u'Pašalinamos nuorodos ...',
    'user':u'Vartotojas',
    'validInteger':u'Laukas „{0}“ turi būti sveikasis skaičius.',
    'versionInstallNotValid':u'Diegimo programos versija netinkama jūsų operacinei sistemai.\nAtsisiųskite tinkamą versiją. {0}',
    'waiting':u'Laukiama...',
    'warningLoginLogout':u'Kad šis pakeitimas įsigaliotų, vartotojas turi atsijungti ir prisijungti dar kartą.',
    'warningRemovePath':u'Įspėjimas paskirties aplankas jau yra, tada jis bus ištrintas.',
    'warningSpyingTool':u'Atminkite, kad negalite pasiekti nuotolinio kompiuterio be jo vartotojo sutikimo. Naudodami „DWService“ kaip šnipinėjimo įrankį galite pažeisti savo gyvenamosios šalies įstatymus.',
    'welcomeLicense':u'Licencija\nŠi programinė įranga yra nemokama ir atvira.\nJį sudaro vienas pagrindinis komponentas ir keli pagalbiniai komponentai, apibrėžti „programa“, kurią gali valdyti skirtingos licencijos. Norėdami gauti daugiau informacijos, apsilankykite https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Tęsdami diegimą arba vykdydami šią programinę įrangą sutinkate su #TERMSANDCONDITIONS ir #PRIVACYPOLICY',
    'welcomeSecurity':u'Saugumas\nNorėdami apsaugoti jūsų privatumą, mes garantuojame, kad jokia informacija nebus saugoma mūsų serveriuose, o ryšiai yra šifruojami, kad trečiosios šalys jų niekaip negalėtų skaityti.',
    'welcomeSoftwareUpdates':u'Programinės įrangos atnaujinimai\nŠios programinės įrangos atnaujinimai yra automatiniai.',
    'windowsAdminPrivileges':u'Norėdami įdiegti DWAgent, turite turėti administratoriaus teises.\nPradėkite vykdomąjį failą „vykdyti kaip administratorių“.',
    'yes':u'Taip'
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ui/messages/pt.py                                                                                   0000644 0001750 0001750 00000027146 14137471757 013617  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Eu aceito',
    'agentName':u'Nome do agente',
    'alreadyInstalled':u'DWAgent já instalado.\n\nO agente atualiza automaticamente para a última versão. Isso significa que não necessita de instalar manualmente as novas atualizações.',
    'back':u'Voltar',
    'cancel':u'Cancelar',
    'cancelInstall':u'A instalação foi cancelada.',
    'cancelUninstall':u'A desinstalação foi cancelada.',
    'checkInstallCode':u'A verificar o código de instalação...',
    'chooseProxyType':u'Qual o tipo de proxy que deseja usar?',
    'close':u'Fechar',
    'code':u'Código',
    'commands':u'Comandos',
    'configureAgent':u'Configurar agente',
    'configureAgentDisabled':u'Agente desativado.',
    'configureAgentEnabled':u'Agente ativado.',
    'configureChangeInstallKey':u'Alterar código de instalação',
    'configureChooseMonitorTrayIconVisibility':u'Deseja exibir o monitor na barra de notificações?',
    'configureChooseOperation':u'Escolha uma operação:',
    'configureDesktopNotification':u'Notificação na área de trabalho',
    'configureDesktopNotificationOK':u'Notificação na área de trabalho configurada com sucesso.',
    'configureDisableAgent':u'Desativar agente',
    'configureDisableAgentQuestion':u'Deseja desativar o agente?',
    'configureEnableAgent':u'Ativar agente',
    'configureEnableAgentQuestion':u'Deseja ativar o agente?',
    'configureEnd':u'Configuração completada',
    'configureErrorConnection':u'Erro de ligação. Verifique se o serviço DWAgent está iniciado.',
    'configureExit':u'Sair',
    'configureInsertPassword':u'Insira senha de configuração:',
    'configureInstallAgent':u'Configurar o agente?',
    'configureInstallCode':u'Insira o código de instalação',
    'configureInstallNewAgent':u'Criando um novo agente',
    'configureInvalidPassword':u'Senha inválida.',
    'configureKeyInstalled':u'Chave instalada com sucesso.',
    'configureLater':u'Configurar mais tarde',
    'configureMonitor':u'Configurar monitor',
    'configurePassword':u'Configurar senha',
    'configurePasswordErrNoMatch':u'Senha não confere.',
    'configurePasswordUpdated':u'Senha atualizada.',
    'configureProxy':u'Configurar proxy',
    'configureProxyEnd':u'Proxy configurado com sucesso.',
    'configureRemovePassword':u'Remover senha',
    'configureRemovePasswordQuestion':u'Deseja remover a senha?',
    'configureSetPassword':u'Definir senha',
    'configureTitle':u'DWAgent - Configuração',
    'configureTrayIconOK':u'Visibilidade do ícone da área de notificação configurado com sucesso.',
    'configureTrayIconVisibility':u'Visibilidade do ícone da área de notificação.',
    'configureUninstallKeyQuestion':u'Desinstalar o código de instalação atual?',
    'configureUninstallationKey':u'Desinstalação...',
    'confirmExit':u'Tem a certeza que deseja sair?',
    'confirmInstall':u'Deseja instalar o DWAgent em \'{0}\'?',
    'confirmUninstall':u'Deseja remover o DWAgent?',
    'copyFiles':u'Copiando ficheiros...',
    'createNewAgent':u'Criação do agente em progresso...',
    'decline':u'Eu não aceito',
    'desktopNotificationAutoHide':u'Ocultar automáticamente',
    'desktopNotificationNone':u'Nenhum',
    'desktopNotificationVisible':u'Visível',
    'downloadFile':u'A efectuar download do ficheiro {0}...',
    'dwsPassword':u'Senha DWS',
    'dwsUser':u'Utilizador DWS',
    'endInstall':u'Instalação concluída com sucesso.',
    'endInstallConfigLater':u'Instalação concluída com sucesso.\nO agente não foi configurado. Poderá configurá-lo depois.',
    'endUninstall':u'Desinstalação concluída com sucesso.',
    'enter':u'entrar',
    'enterInstallCode':u'Inserir o código de instalação',
    'enterInstallNewAgent':u'Insira os dados para criar um novo agente:',
    'enterRunCode':u'Insira o código da ligação',
    'error':u'Erro',
    'errorAgentAlreadyExsists':u'O agente {0} já existe.',
    'errorAgentMax':u'Número máximo de agentes atingido.',
    'errorAgentNameNotValid':u'O nome do agente não é válido. Não pode usar os caracteres / \ | # @ : .',
    'errorConnectionConfig':u'Erro de ligação. Por favor verifique se o serviço DWAgent está iniciado.',
    'errorConnectionQuestion':u'Erro de ligação. Por favor verifique sua ligação à internet ou a configuração da firewall.\nDeseja configurar proxy?',
    'errorInvalidCode':u'O código inserido é inválido.',
    'errorInvalidUserPassword':u'Utilizador ou senha inválidos.',
    'fieldRequired':u'O campo \'{0}\' é obrigatório.',
    'install':u'Instalar',
    'installMonitor':u'A instalar monitor...',
    'installMonitorErr':u'Instalação do monitor falhou.',
    'installService':u'A instalar serviço',
    'installServiceErr':u'Instalação do serviço falhou.',
    'installShortcuts':u'A instalar atalhos',
    'installShortcutsErr':u'Instalação dos atalhos falharam.',
    'linuxRootPrivileges':u'Necessita de ter privilégios de root para instalar o DWAgent.\nPor favor inicie o script usando um utilizador root.',
    'menuConfigure':u'Configurar',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Desinstalar',
    'missingInfoFile':u'Ficheiro info.json não encontrado.',
    'missingNative':u'Native não encontrado.',
    'missingRuntime':u'Runtime não encontrado.',
    'monitorActive':u'ativo',
    'monitorAgentDisabled':u'Agente desativado.',
    'monitorAgentEnabled':u'Agente ativado.',
    'monitorConfigure':u'Configurar',
    'monitorConnections':u'Ligações',
    'monitorCurrentActivities':u'Actividades Actuais',
    'monitorDisable':u'Desativar',
    'monitorDisableAgentQuestion':u'Deseja desativar o agente?',
    'monitorDownload':u'Download',
    'monitorEnable':u'Ativar',
    'monitorEnableAgentQuestion':u'Deseja ativar o agente?',
    'monitorEnterPassword':u'Insira a senha:',
    'monitorErrorConnectionConfig':u'Erro de ligação. Por favor verifique se o serviço DWAgent está iniciado.',
    'monitorHide':u'Esconder',
    'monitorInvalidPassword':u'Senha inválida.',
    'monitorNoActivities':u'Sem actividades',
    'monitorScreenCapture':u'Captura de ecrâ',
    'monitorSession':u'Sessão',
    'monitorShellSession':u'Shell',
    'monitorShow':u'Mostrar',
    'monitorStatus':u'Estado',
    'monitorStatusDisabled':u'Desativado',
    'monitorStatusNoService':u'Sem serviço',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'A atualizar',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Desinstalar',
    'monitorUninstallNotRun':u'Não pode desinstalar sem permissões de root.\nExecute o comando dwaguninstall na shell.',
    'monitorUpload':u'Upload',
    'mustAccept':u'Para continuar, deve selecionar a opção {0}',
    'mustSelectOptions':u'Deve selecionar uma opção.',
    'next':u'Seguinte',
    'no':u'Não',
    'noTryAgain':u'Não, tente novamente',
    'notInstalled':u'DWAgent não instalado.',
    'ok':u'Ok',
    'option':u'Opção',
    'optionNotValid':u'Opção selecionada é inválida.',
    'or':u'ou',
    'password':u'Senha',
    'path':u'Caminho',
    'pathCreating':u'Criação de pasta...',
    'pathNotCreate':u'Não foi possível criar a pasta. Caminho inválido ou permissão negada.',
    'pressEnter':u'Pressione enter para continuar.',
    'privacyPolicy':u'Política de Privacidade',
    'proxyAuthPassword':u'Senha',
    'proxyAuthUser':u'Utilizador',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Insira as informações de proxy.',
    'proxyNone':u'Nenhum',
    'proxyPort':u'Porta',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Sistema',
    'reEnterCode':u'Reinsira o código',
    'reEnterData':u'Reinsira os dados',
    'rePassword':u'Redigite a senha',
    'removeFile':u'Removendo ficheiro...',
    'runWithoutInstallation':u'Executar',
    'runWithoutInstallationClosing':u'Fechando sessão',
    'runWithoutInstallationConnecting':u'Abrindo sessão:',
    'runWithoutInstallationEnd':u'Sessão finalizada.',
    'runWithoutInstallationOnlineBottom':u'ATENÇÃO:\nNão divulgue essas informações a pessoas que não são confiáveis, pois de outra forma irá permitir que elas acedam a este agente. Então, se não tem certeza do que está a fazer, feche esta aplicação.',
    'runWithoutInstallationOnlineBottomPutCode':u'AVISO:\nAgora o agente está pronto para receber a ligação. Se não tem a certeza do que está a fazer, por favor feche esta aplicação.',
    'runWithoutInstallationOnlinePassword':u'Senha: {0}',
    'runWithoutInstallationOnlineTop':u'A sessão está ativa.\nPara se conectar a este agente vá para https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'A sessão está ativa.',
    'runWithoutInstallationOnlineUser':u'Utilizador: {0}',
    'runWithoutInstallationStarting':u'Iniciando agente...',
    'runWithoutInstallationUnexpectedError':u'Erro inesperado.\nNão foi possível iniciar o DWAgent. Se o problema persistir, tente efetuar o download da última versão do DWAgent, apague a pasta \'{0}\' e execute o DWAgent novamente.',
    'runWithoutInstallationUpdating':u'Atualizando agente...',
    'runWithoutInstallationWait':u'Aguarde pela nova ligação em progresso (tentativa {0})...',
    'selectPathInstall':u'Selecione o caminho de instalação:',
    'startService':u'Iniciando serviço...',
    'startServiceErr':u'Inicialização do serviço falhou.',
    'termsAndConditions':u'Termos e Condições',
    'titleInstall':u'DWAgent - Instalação',
    'titleUninstall':u'DWAgent - Desinstalação',
    'toBack':u'para voltar.',
    'toExit':u'para sair.',
    'unexpectedError':u'Erro inesperado.\n{0}',
    'uninstallMonitor':u'Desinstalando monitor...',
    'uninstallService':u'Desinstalando serviço...',
    'uninstallShortcuts':u'Desinstalando atalhos...',
    'user':u'Utilizador',
    'validInteger':u'O campo \'{0}\' precisa ser um inteiro.',
    'versionInstallNotValid':u'A versão do instalador não é a correta para o seu sistema operativo.\nPor favor efetue o download da versão correta. {0}',
    'waiting':u'Aguardando...',
    'warningLoginLogout':u'Para que esta alteração tenha efeito, o utilizador deve fazer logout e login novamente.',
    'warningRemovePath':u'Aviso: a pasta de destino já existe então ela será apagada.',
    'warningSpyingTool':u'Esteja ciente de que não pode aceder a um computador remoto sem o consentimento de seu utilizador. Ao usar o DWService como uma ferramenta de espionagem, poderá estar a infringir as leis do seu país.',
    'welcomeLicense':u'Licença\nEste software é gratuito e open source.\nEle consiste de um componente principal e vários componentes acessórios definidos "app" que podem ser regidos por diferentes licenças. Para mais informações visite: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Ao prosseguir com a instalação ou executar este software, estará a concordar com os #TERMSANDCONDITIONS e com a #PRIVACYPOLICY',
    'welcomeSecurity':u'Segurança\nPara proteger sua privacidade nós garantimos que nenhuma informação será armazenada nos nossos servidores e as comunicações são criptografadas para que terceiros não possam acessá-las.',
    'welcomeSoftwareUpdates':u'Atualizações de software\nAs atualizações deste software são automáticas.',
    'windowsAdminPrivileges':u'Deve ter privilégios de administrador para instalar o DWAgent.\nPor favor inicie o executável com \'Executar como administrador\'.',
    'yes':u'Sim'
}
                                                                                                                                                                                                                                                                                                                                                                                                                          ui/messages/sv.py                                                                                   0000644 0001750 0001750 00000026507 14137472006 013610  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Jag accepterar',
    'agentName':u'Agentnamn',
    'alreadyInstalled':u'DWAgent redan installerat.\n\nAgenten uppdaterar automatiskt till den senaste versionen. Det betyder att du inte behöver installera nyare uppdateringar manuellt.',
    'back':u'Tillbaka',
    'cancel':u'Avbryt',
    'cancelInstall':u'Installationen avbröts.',
    'cancelUninstall':u'Jag accepterar',
    'checkInstallCode':u'Kontrollerar installationskod...',
    'chooseProxyType':u'Vilken proxytyp vill du använda?',
    'close':u'Stäng',
    'code':u'Kod',
    'commands':u'Kommandon',
    'configureAgent':u'Konfigurera agenten',
    'configureAgentDisabled':u'Agenten inaktiverad.',
    'configureAgentEnabled':u'Agenten aktiverad.',
    'configureChangeInstallKey':u'Byt installationskod',
    'configureChooseMonitorTrayIconVisibility':u'Vill du visa monitor i aktivitetsfältet?',
    'configureChooseOperation':u'Välj en operation:',
    'configureDesktopNotification':u'Skrivbordsavisering',
    'configureDesktopNotificationOK':u'Skrivbordsavisering framgångsrikt konfigurerad.',
    'configureDisableAgent':u'Inaktivera agenten',
    'configureDisableAgentQuestion':u'Vill du avaktivera agenten?',
    'configureEnableAgent':u'Aktivera agenten',
    'configureEnableAgentQuestion':u'Vill du aktivera agenten?',
    'configureEnd':u'Konfigurationen har slutförts.',
    'configureErrorConnection':u'Anslutningsfel. Kontrollera om DWAgent-tjänsten är igång.',
    'configureExit':u'Avsluta',
    'configureInsertPassword':u'Ange konfigurationslösenord:',
    'configureInstallAgent':u'Hur föredrar du att konfigurera agenten?',
    'configureInstallCode':u'Lägga in installationskod',
    'configureInstallNewAgent':u'Skapa en ny agent',
    'configureInvalidPassword':u'Felaktigt lösenord.',
    'configureKeyInstalled':u'Nyckeln korrekt installerad.',
    'configureLater':u'Konfigurera senare',
    'configureMonitor':u'Konfigurera monitor',
    'configurePassword':u'Konfigurera lösenord',
    'configurePasswordErrNoMatch':u'Lösenorden är olika.',
    'configurePasswordUpdated':u'Lösenurdet uppdaterat.',
    'configureProxy':u'Konfigurera proxy',
    'configureProxyEnd':u'Proxy konfigurerad.',
    'configureRemovePassword':u'Ta bort lösenord',
    'configureRemovePasswordQuestion':u'Vill du ta bort lösenordet?',
    'configureSetPassword':u'Välj lösenord',
    'configureTitle':u'DWAgent - Konfiguration',
    'configureTrayIconOK':u'Aktivitetsfältsikons synlighet konfigurerad.',
    'configureTrayIconVisibility':u'Aktivitetsfältsikons synlighet',
    'configureUninstallKeyQuestion':u'Avinstallera nuvarande installationskod?',
    'configureUninstallationKey':u'Avinstallerar...',
    'confirmExit':u'Är du säker på att du vill avsluta?',
    'confirmInstall':u'Vill du installera DWAgent på \'{0}\'?',
    'confirmUninstall':u'Vill du ta bort DWAgent?',
    'copyFiles':u'Kopierar filer...',
    'createNewAgent':u'Skapa agent pågår...',
    'decline':u'Jag accepterar inte',
    'desktopNotificationAutoHide':u'Göm automatiskt',
    'desktopNotificationNone':u'Ingen',
    'desktopNotificationVisible':u'Synlig',
    'downloadFile':u'Laddar ned fil {0}...',
    'dwsPassword':u'DWS lösenord',
    'dwsUser':u'DWS användare',
    'endInstall':u'Installation har slutförts.',
    'endInstallConfigLater':u'Installation har slutförts.\nAgenten har inte konfigurerats. Du kan fortfarande fortsätta med konfigurationen senare.',
    'endUninstall':u'Avinstallationen är klar.',
    'enter':u'enter',
    'enterInstallCode':u'Skriv in installationskod',
    'enterInstallNewAgent':u'Ange data för att skapa en ny agent:',
    'enterRunCode':u'Ange anslutningskoden',
    'error':u'Fel',
    'errorAgentAlreadyExsists':u'Agenten {0} existerar redan.',
    'errorAgentMax':u'Maximalt antal agenter har överskridits.',
    'errorAgentNameNotValid':u'Agentnamnet är inte giltigt. Du kan inte använda tecknen / \ | # @ : .',
    'errorConnectionConfig':u'Anslutningsfel. Kontrollera om DWAgent-tjänsten är igång.',
    'errorConnectionQuestion':u'Anslutningsfel. Kontrollera din internetanslutning eller brandväggs-konfiguration.\nVill du konfigurera proxy?',
    'errorInvalidCode':u'Inskriven kod är felaktig.',
    'errorInvalidUserPassword':u'Ogiltig användare eller lösenord.',
    'fieldRequired':u'Fältet \'{0}\' är obligatoriskt.',
    'install':u'Installera',
    'installMonitor':u'Installerar monitor...',
    'installMonitorErr':u'Installation av monitor misslyckades.',
    'installService':u'Installerar tjänst...',
    'installServiceErr':u'Installation av tjänsten misslyckades.',
    'installShortcuts':u'Installerar genvägar...',
    'installShortcutsErr':u'Installationen av genvägar misslyckades.',
    'linuxRootPrivileges':u'Du måste ha root privilegier för att installera DWAgent.\nStarta skriptet som root-användaren.',
    'menuConfigure':u'Konfigurera',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Avinstallera',
    'missingInfoFile':u'Filen info.json ej hittad.',
    'missingNative':u'Native ej hittad.',
    'missingRuntime':u'Runtime ej hittad.',
    'monitorActive':u'aktiv',
    'monitorAgentDisabled':u'Agenten inaktiverad.',
    'monitorAgentEnabled':u'Agenten aktiverad.',
    'monitorConfigure':u'Konfigurera',
    'monitorConnections':u'Anslutningar',
    'monitorCurrentActivities':u'Aktuella aktiviteter',
    'monitorDisable':u'Inaktivera',
    'monitorDisableAgentQuestion':u'Vill du inaktivera agenten?',
    'monitorDownload':u'Ladda ned',
    'monitorEnable':u'Aktivera',
    'monitorEnableAgentQuestion':u'Vill du aktivera agenten?',
    'monitorEnterPassword':u'Skriv in lösenord:',
    'monitorErrorConnectionConfig':u'Anslutningsfel. Kontrollera om DWAgent-tjänsten är igång.',
    'monitorHide':u'Göm',
    'monitorInvalidPassword':u'Felaktigt lösenord.',
    'monitorNoActivities':u'Inga aktiviteter',
    'monitorScreenCapture':u'Skärminspelning',
    'monitorSession':u'Session',
    'monitorShellSession':u'Skal',
    'monitorShow':u'Visa',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Inaktiverad',
    'monitorStatusNoService':u'Ingen service',
    'monitorStatusOffline':u'Ej tillgänglig',
    'monitorStatusOnline':u'Tillgänglig',
    'monitorStatusUpdating':u'Uppdaterar',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Avinstallera',
    'monitorUninstallNotRun':u'Du kan inte avinstallera utan root-behörigheter.\nKör kommandot dwaguninstall i terminalsessionen.',
    'monitorUpload':u'Ladda upp',
    'mustAccept':u'För att fortsätta måste du välja alternativet {0}',
    'mustSelectOptions':u'Du måste välja ett alternativ.',
    'next':u'Nästa',
    'no':u'Nej',
    'noTryAgain':u'Nej, försök igen.',
    'notInstalled':u'DWAgent ej installerad.',
    'ok':u'Ok',
    'option':u'Alternativ',
    'optionNotValid':u'Det valda alternativet är ogiltigt.',
    'or':u'eller',
    'password':u'Lösenord',
    'path':u'Sökväg',
    'pathCreating':u'Mapp skapande...',
    'pathNotCreate':u'Mappen kunde ej skapas. Ogiltig sökväg eller behörighet nekad.',
    'pressEnter':u'Tryck på enter för att fortsätta.',
    'privacyPolicy':u'Integritetspolicy',
    'proxyAuthPassword':u'Lösenord',
    'proxyAuthUser':u'Användare',
    'proxyHost':u'Värd',
    'proxyHttp':u'Http',
    'proxyInfo':u'Skriv in proxy info.',
    'proxyNone':u'Ingen',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'System',
    'reEnterCode':u'Skriv in koden igen',
    'reEnterData':u'Ange data igen',
    'rePassword':u'Skriv lösenord igen',
    'removeFile':u'Raderar fil...',
    'runWithoutInstallation':u'Kör',
    'runWithoutInstallationClosing':u'Stanger session...',
    'runWithoutInstallationConnecting':u'Öppnar session...',
    'runWithoutInstallationEnd':u'Session avslutad.',
    'runWithoutInstallationOnlineBottom':u'VARNING:\nOffentliggör inte denna information till personer som inte är betrodda, eftersom de då kan ansluta till den här agenten. Så om du är osäker på vad gör du, vänligen avsluta denna ansökan.',
    'runWithoutInstallationOnlineBottomPutCode':u'VARNING:\nNu är agenten redo att acceptera anslutningar. Så om du är osäker på vad gör du, vänligen stäng denna applikation.',
    'runWithoutInstallationOnlinePassword':u'Lösenord: {0}',
    'runWithoutInstallationOnlineTop':u'Sessionen är aktiv.\nFör att ansluta till den här agenten, gå till https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Sessionen är aktiv.',
    'runWithoutInstallationOnlineUser':u'Användare: {0}',
    'runWithoutInstallationStarting':u'Startar agent...',
    'runWithoutInstallationUnexpectedError':u'Oväntat fel.\nDet var inte möjligt att starta DWAgent. Om problemet kvarstår, försök ladda ner den senaste versionen av DWAgent, ta bort mappen "{0}" och kör DWAgent igen.',
    'runWithoutInstallationUpdating':u'Uppdaterar agent...',
    'runWithoutInstallationWait':u'Vänta på den nya anslutningen (försök {0})...',
    'selectPathInstall':u'Välj sökväg till installationen:',
    'startService':u'Startar tjänsten...',
    'startServiceErr':u'Start av tjänsten misslyckades.',
    'termsAndConditions':u'Villkor',
    'titleInstall':u'DWAgent - Installation',
    'titleUninstall':u'DWAgent - Avinstallation',
    'toBack':u'för att gå tillbaka.',
    'toExit':u'för att avsluta.',
    'unexpectedError':u'Oväntat fel.\n{0}',
    'uninstallMonitor':u'Avinstallerar monitor...',
    'uninstallService':u'Avinstallerar tjänst...',
    'uninstallShortcuts':u'Avinstallerar genvägar...',
    'user':u'Användare',
    'validInteger':u'Fältet \'{0}\' måste vara ett heltal.',
    'versionInstallNotValid':u'Versionen av installationsprogrammet är inte korrekt för ditt operativsystem.\nVar god ladda ner rätt version. {0}',
    'waiting':u'Väntar...',
    'warningLoginLogout':u'För att denna ändring ska träda i kraft måste användaren logga ut och logga in igen.',
    'warningRemovePath':u'Varning: om destinationsmappen redan finns kommer den att tas bort.',
    'warningSpyingTool':u'Tänk på att du inte får ansluta till en fjärrdator utan fjärrdatorns användares medgivande. Genom att använda DWService som ett spioneringsverktyg kan du bryta mot lagar i ditt hemland.',
    'welcomeLicense':u'Licens\nDenna programvara är fri och öppen källkod.\nDen består av en huvudkomponent och flera tillbehörskomponenter definierade som "app", som kan styras av olika licenser. För mer information besök: https://www.dwservice.net/sv/licenses-sources.html',
    'welcomePrivacyTerms':u'Genom att fortsätta med installationen eller köra denna programvara godkänner du #TERMSANDCONDITIONS och #PRIVACYPOLICY',
    'welcomeSecurity':u'Säkerhet\nFör att skydda din integritet garanterar vi att ingen information lagras på våra servrar, och kommunikationen är krypterad så att tredje part inte kan läsa dem.',
    'welcomeSoftwareUpdates':u'Mjukvaruuppdateringar\nUppdatering av denna programvara sker automatiskt.',
    'windowsAdminPrivileges':u'Du måste ha administratörsbehörigheter för att installera DWAgent.\nStarta programmet med \'Kör som administratör\'.',
    'yes':u'Ja'
}
                                                                                                                                                                                         ui/messages/da.py                                                                                   0000644 0001750 0001750 00000026620 14111660672 013540  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Jeg accepterer',
    'agentName':u'Agentnavn',
    'alreadyInstalled':u'DWAgent er allerede installeret.\n\nAgent opdaterer automatisk til den sidste version. Det betyder, at du ikke behøver manuelt at installere nyere opdateringer.',
    'back':u'Tilbage',
    'cancel':u'Annuller',
    'cancelInstall':u'Installationen blev annulleret.',
    'cancelUninstall':u'Afinstallationen blev annulleret.',
    'checkInstallCode':u'Kontrollerer installationskode...',
    'chooseProxyType':u'Hvilken type proxy vil du benytte?',
    'close':u'Luk',
    'code':u'Kode',
    'commands':u'Kommandoer',
    'configureAgent':u'Konfigurer agent',
    'configureAgentDisabled':u'Agent deaktiveret.',
    'configureAgentEnabled':u'Agent aktiveret.',
    'configureChangeInstallKey':u'Ændre installationskode',
    'configureChooseMonitorTrayIconVisibility':u'Vil du have agenten vist som bakkeikon?',
    'configureChooseOperation':u'Vælg venligst en handling:',
    'configureDesktopNotification':u'Skrivebordsnotifikation',
    'configureDesktopNotificationOK':u'Skrivebordsnotifikationer er konfigureret med succes.',
    'configureDisableAgent':u'Deaktiver agent',
    'configureDisableAgentQuestion':u'Er du sikker på at du vil deaktivere agenten?',
    'configureEnableAgent':u'Aktiver agent',
    'configureEnableAgentQuestion':u'Vil du aktivere agenten?',
    'configureEnd':u'Opsætningen er fuldført',
    'configureErrorConnection':u'Forbindelsesfejl. Tjek venligst at DWAgent servicen er startet.',
    'configureExit':u'Afslut',
    'configureInsertPassword':u'Indsæt venligst konfigurationskodeordet:',
    'configureInstallAgent':u'Hvordan foretrækker du at konfigurere agenten?',
    'configureInstallCode':u'Indtastning af installationskoden',
    'configureInstallNewAgent':u'Opretter en ny agent',
    'configureInvalidPassword':u'Forkert kodeord.',
    'configureKeyInstalled':u'Nøgle installeret med succes.',
    'configureLater':u'Konfigurer senere',
    'configureMonitor':u'Konfigurer monitor',
    'configurePassword':u'Konfigurer kodeord',
    'configurePasswordErrNoMatch':u'Adgangskoderne stemmer ikke overens.',
    'configurePasswordUpdated':u'Kodeord opdateret.',
    'configureProxy':u'Konfigurer proxy',
    'configureProxyEnd':u'Proxy konfigureret med succes.',
    'configureRemovePassword':u'Fjern kodeord',
    'configureRemovePasswordQuestion':u'Vil Du fjerne kodeordet?',
    'configureSetPassword':u'Indstil kodeord',
    'configureTitle':u'DWAgent - Konfiguration',
    'configureTrayIconOK':u'Synlighed af bakkeikon, konfigureret med succes.',
    'configureTrayIconVisibility':u'Synlighed af bakkeikon',
    'configureUninstallKeyQuestion':u'Afinstaller nuværende installations kode?',
    'configureUninstallationKey':u'Afinstallation...',
    'confirmExit':u'Er du sikker på du vil afslutte',
    'confirmInstall':u'Vil du også installere DWAgent I mappen \'{0}\'?',
    'confirmUninstall':u'Vil du afinstallere DWAgent?',
    'copyFiles':u'Kopierer filer...',
    'createNewAgent':u'Agentoprettelse i gang...',
    'decline':u'Jeg accepterer ikke',
    'desktopNotificationAutoHide':u'Skjul automatisk',
    'desktopNotificationNone':u'Ingen',
    'desktopNotificationVisible':u'Synlig',
    'downloadFile':u'Downloader fil {0}...',
    'dwsPassword':u'DWS kodeord',
    'dwsUser':u'DWS bruger',
    'endInstall':u'Installationen er fuldført.',
    'endInstallConfigLater':u'Installationen er fuldført.\nAgenten er ikke konfigureret. Du kan ændre dette senere.',
    'endUninstall':u'Afinstallation fuldført.',
    'enter':u'indtast',
    'enterInstallCode':u'Indtast installationskode',
    'enterInstallNewAgent':u'Indtast data for at oprette en ny agent:',
    'enterRunCode':u'Indtast forbindelselskoden',
    'error':u'Fejl',
    'errorAgentAlreadyExsists':u'Agent {0} eksisterer allerede.',
    'errorAgentMax':u'Maksimalt antal agenter er overskredet .',
    'errorAgentNameNotValid':u'Agent navnet er ikke gyldigt. Du kan ikke bruge tegnene / \ # @ : .',
    'errorConnectionConfig':u'Forbindelsesfejl. Kontroller, om DWAgent-tjenesten er startet.',
    'errorConnectionQuestion':u'Forbindelsesfejl. Tjek venligst din internetforbindelse eller firewall-konfiguration.\nVil du konfigurere proxy?',
    'errorInvalidCode':u'Koden er ugyldig.',
    'errorInvalidUserPassword':u'Forkert brugernavn eller kodeord.',
    'fieldRequired':u'Feltet \'{0}\' er påkrævet.',
    'install':u'Installer',
    'installMonitor':u'Installation af monitor...',
    'installMonitorErr':u'Installation af monitor mislykkedes.',
    'installService':u'Installation af service...',
    'installServiceErr':u'Installations tjenesten mislykkedes.',
    'installShortcuts':u'Installation af genveje...',
    'installShortcutsErr':u'Installations genveje mislykkedes.',
    'linuxRootPrivileges':u'Du skal have root privilegier for at installere DWAgent.\nStart venligst scriptet ved hjælp af root-brugeren.',
    'menuConfigure':u'Konfigurer',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Afinstaller',
    'missingInfoFile':u'Filen info.json ikke fundet.',
    'missingNative':u'Native ikke fundet.',
    'missingRuntime':u'Runtime ikke fundet.',
    'monitorActive':u'aktiv',
    'monitorAgentDisabled':u'Agent deaktiveret.',
    'monitorAgentEnabled':u'Agent aktiveret.',
    'monitorConfigure':u'Konfigurer',
    'monitorConnections':u'Forbindelser',
    'monitorCurrentActivities':u'Nuværende aktiviteter',
    'monitorDisable':u'Deaktiver',
    'monitorDisableAgentQuestion':u'Vil du deaktivere agenten?',
    'monitorDownload':u'Download',
    'monitorEnable':u'Aktiver',
    'monitorEnableAgentQuestion':u'Vil du aktivere agenten?',
    'monitorEnterPassword':u'Indtast Kodeord',
    'monitorErrorConnectionConfig':u'Forbindelsesfejl. Tjek venligst om DWAgent-tjenesten er startet.',
    'monitorHide':u'Skjul',
    'monitorInvalidPassword':u'Forkert Kodeord!',
    'monitorNoActivities':u'Ingen aktiviteter',
    'monitorScreenCapture':u'skærm-dump',
    'monitorSession':u'Session',
    'monitorShellSession':u'Shell',
    'monitorShow':u'Vis',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Deaktiveret',
    'monitorStatusNoService':u'Ingen service',
    'monitorStatusOffline':u'Ikke forbundet',
    'monitorStatusOnline':u'Forbundet',
    'monitorStatusUpdating':u'Opdatere',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Afinstaller',
    'monitorUninstallNotRun':u'Du kan ikke afinstallere uden adminstrator-rettigheder.\nKør kommandoen dwaguninstall i et terminal/kommandovindue.',
    'monitorUpload':u'Upload',
    'mustAccept':u'For at kunne fortsætte, skal du vælge mulighed {0}',
    'mustSelectOptions':u'Du skal vælge en valgmulighed.',
    'next':u'Næste',
    'no':u'Nej',
    'noTryAgain':u'Nej, prøv igen',
    'notInstalled':u'DWAgent er ikke installeret.',
    'ok':u'OK',
    'option':u'Valgmulighed',
    'optionNotValid':u'Den valgte valgmulighed er ikke gyldig.',
    'or':u'eller',
    'password':u'Kodeord',
    'path':u'Sti',
    'pathCreating':u'Folder dannelse...',
    'pathNotCreate':u'Kunne ikke lave folderen. Stien er ugyldig, eller manglende rettigheder.',
    'pressEnter':u'Tryk på retur for at fortsætte.',
    'privacyPolicy':u'Privatlivspolitik',
    'proxyAuthPassword':u'Kodeord',
    'proxyAuthUser':u'Bruger',
    'proxyHost':u'Agent',
    'proxyHttp':u'Http',
    'proxyInfo':u'Indsæt proxy-information.',
    'proxyNone':u'Ingen',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'System',
    'reEnterCode':u'Indtast koden igen',
    'reEnterData':u'Indtast data igen',
    'rePassword':u'Indtast kodeordet igen',
    'removeFile':u'Fjerner filen...',
    'runWithoutInstallation':u'Kør',
    'runWithoutInstallationClosing':u'Lukker session...',
    'runWithoutInstallationConnecting':u'Åbner session...',
    'runWithoutInstallationEnd':u'Sessionen er afsluttet.',
    'runWithoutInstallationOnlineBottom':u'ADVARSEL:\nDu bør ikke dele denne information med andre som der ikke er tillid til, da det vil give dem adgang til denne agent. Så hvis du ikke er sikker på, hvad du gør, bør du lukke denne applikation.',
    'runWithoutInstallationOnlineBottomPutCode':u'ADVARSEL:\nAgenten er nu klar til at modtage en forbindelse. Hvis du ikke er sikker på hvad du gør, bør du lukke denne applikation.',
    'runWithoutInstallationOnlinePassword':u'Kodeord: {0}',
    'runWithoutInstallationOnlineTop':u'Sessionen er aktiv.\nFor at forbinde til denne agent, gå til https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Sessionen er aktiv.',
    'runWithoutInstallationOnlineUser':u'Bruger: {0}',
    'runWithoutInstallationStarting':u'Agenten starter...',
    'runWithoutInstallationUnexpectedError':u'Uventet fejl.\nDet var ikke muligt at starte DWAgent. Hvis problemet fortsætter, så prøv at downloade den seneste udgave af DWAgent, slet folderen \'{0}\' og køre DWAgent igen.',
    'runWithoutInstallationUpdating':u'Agenten opdateres...',
    'runWithoutInstallationWait':u'Vent til den nye forbindelse oprettes (forsøg {0})...',
    'selectPathInstall':u'Vælg stien til installationen:',
    'startService':u'Starter servicen...',
    'startServiceErr':u'Fejl ved start af servicen...',
    'termsAndConditions':u'Vilkår og betingelser',
    'titleInstall':u'DWAgent - Installation',
    'titleUninstall':u'DWAgent - Afinstallation',
    'toBack':u'for at vende tilbage.',
    'toExit':u'for at afslutte.',
    'unexpectedError':u'Uventet fejl.\n{0}',
    'uninstallMonitor':u'Afinstallerer monitor...',
    'uninstallService':u'Afinstallerer service...',
    'uninstallShortcuts':u'Afinstallerer genveje...',
    'user':u'Bruger',
    'validInteger':u'Feltet \'{0}\' skal være et heltal.',
    'versionInstallNotValid':u'Installationsprogrammet er ikke den korrekte version for dit operativsystem.\nDownload venligst den korrekte version. {0}',
    'waiting':u'Venter...',
    'warningLoginLogout':u'Brugeren skal logge ud og ind igen før ændringen træder i kraft.',
    'warningRemovePath':u'Advarsel destinationsfolderen eksisterer allerede, derefter vil den blive slettet.',
    'warningSpyingTool':u'Vær opmærksom på, at du muligvis ikke må tilgå en fjerncomputer uden brugerens tilladelse. Ved at anvende DWService som et spionværktøj kan du være i konflikt med loven i det land du bor i.',
    'welcomeLicense':u'Licens\nDenne software er gratis og Open Source.\nDen består af en hovedkomponent og adskillige tilhørende komponenter, defineret som "apps" som kan være reguleret af forskellige licenser. For flere informationer, besøg https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Ved at fortsætte installationen eller ved at afvikle denne softeware accepterer du #TERMSANDCONDITIONS og #PRIVACYPOLICY',
    'welcomeSecurity':u'Sikkerhed\nFor at beskytte dit privatliv garanterer vi, at ingen information vil blive opbevaret på vores servere, og at kommunikationer er krypterede så trediepart ikke kan aflæse dem.',
    'welcomeSoftwareUpdates':u'Softwareopdateringer\nDenne software bliver automatisk opdateret.',
    'windowsAdminPrivileges':u'Du skal have administatorrettigheder for at installere DWAgent.\nKør venligst programmet igen med "Kør som administrator"',
    'yes':u'Ja'
}
                                                                                                                ui/messages/el.py                                                                                   0000644 0001750 0001750 00000042374 14113374076 013562  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Αποδέχομαι',
    'agentName':u'Όνομα Agent',
    'alreadyInstalled':u'Το DWAgent έχει ήδη εγκατασταθεί.\n\nΟ DWAgent ενημερώνεται αυτόματα στην τελευταία έκδοση. Αυτό σημαίνει ότι δεν χρειάζεται να κάνετε χειροκίνητα ενημερώσεις.',
    'back':u'Πίσω',
    'cancel':u'Άκυρο',
    'cancelInstall':u'Η εγκατάσταση ακυρώθηκε.',
    'cancelUninstall':u'Η απεγκατάσταση ακυρώθηκε.',
    'checkInstallCode':u'Έλεγχος κωδικού εγκατάστασης ...',
    'chooseProxyType':u'Τύπος διαμεσολαβητή (proxy) που θέλετε να χρησιμοποιήσετε;',
    'close':u'Κλείσιμο',
    'code':u'Κωδικός',
    'commands':u'Εντολές',
    'configureAgent':u'Ρύθμιση agent',
    'configureAgentDisabled':u'Ο Agent απενεργοποιήθηκε.',
    'configureAgentEnabled':u'Ο Agent ενεργοποιήθηκε.',
    'configureChangeInstallKey':u'Αλλαγή κωδικού εγκατάστασης',
    'configureChooseMonitorTrayIconVisibility':u'Επιθυμείτε εμφάνιση εικονιδίου ειδοποίησης (tray icon);',
    'configureChooseOperation':u'Παρακαλώ επιλέξτε λειτουργία:',
    'configureDesktopNotification':u'Ειδοποίηση επιφάνειας εργασίας',
    'configureDesktopNotificationOK':u'Η ειδοποίηση επιφάνειας εργασίας διαμορφώθηκε με επιτυχία.',
    'configureDisableAgent':u'Απενεργοποίηση agent',
    'configureDisableAgentQuestion':u'Θέλετε να απενεργοποιήσετε τον agent;',
    'configureEnableAgent':u'Ενεργοποίηση agent',
    'configureEnableAgentQuestion':u'Θέλετε να ενεργοποιηθεί ο agent;',
    'configureEnd':u'Η διαμόρφωση έχει ολοκληρωθεί.',
    'configureErrorConnection':u'Σφάλμα σύνδεσης.  Ελέγξτε αν έχει ξεκινήσει η υπηρεσία DWAgent.',
    'configureExit':u'Έξοδος',
    'configureInsertPassword':u'Παρακαλώ εισάγετε κωδικό ρυθμίσεων:',
    'configureInstallAgent':u'Πώς προτιμάτε να διαμορφώσετε τον agent;',
    'configureInstallCode':u'Εισαγωγή κωδικού εγκατάστασης',
    'configureInstallNewAgent':u'Δημιουργία νέου agent',
    'configureInvalidPassword':u'Λανθασμένος κωδικός.',
    'configureKeyInstalled':u'Το κλειδί εγκαταστάθηκε με επιτυχία.',
    'configureLater':u'Ρύθμιση αργότερα',
    'configureMonitor':u'Ρύθμιση οθόνης',
    'configurePassword':u'Ρύθμιση κωδικού πρόσβασης',
    'configurePasswordErrNoMatch':u'Οι κωδικοί δεν ταιριάζουν.',
    'configurePasswordUpdated':u'Ο κωδικός ενημερώθηκε.',
    'configureProxy':u'Ρύθμιση διαμεσολαβητή (proxy)',
    'configureProxyEnd':u'Επιτυχής ρύθμιση διαμεσολαβητή (proxy)',
    'configureRemovePassword':u'Κατάργηση του κωδικού πρόσβασης',
    'configureRemovePasswordQuestion':u'Θέλετε να καταργήσετε τον κωδικό πρόσβασης;',
    'configureSetPassword':u'Ορισμός κωδικού πρόσβασης',
    'configureTitle':u'DWAgent - Ρυθμίσεις',
    'configureTrayIconOK':u'Η εμφάνιση εικονιδίου ειδοποίησης ρυθμίστηκε με επιτυχία.',
    'configureTrayIconVisibility':u'Εμφάνιση εικονιδίου',
    'configureUninstallKeyQuestion':u'Απεγκατάσταση τρέχοντος κωδικού εγκατάστασης;',
    'configureUninstallationKey':u'Απεγκατάσταση....',
    'confirmExit':u'Είστε σίγουροι ότι θέλετε έξοδο;',
    'confirmInstall':u'Θέλετε να εγκαταστήσετε το DWAgent στο \'{0}\'?',
    'confirmUninstall':u'Θέλετε να αφαιρέσετε τον DWAgent;',
    'copyFiles':u'Αντιγραφή αρχείων...',
    'createNewAgent':u'Δημιουργία agent σε εξέλιξη...',
    'decline':u'Δεν αποδέχομαι',
    'desktopNotificationAutoHide':u'Αυτόματη απόκρυψη',
    'desktopNotificationNone':u'Καθόλου',
    'desktopNotificationVisible':u'Ορατό',
    'downloadFile':u'Λήψη αρχείου {0}...',
    'dwsPassword':u'DWS κωδικός πρόσβασης',
    'dwsUser':u'DWS χρήστης',
    'endInstall':u'Η εγκατάσταση ολοκληρώθηκε.',
    'endInstallConfigLater':u'Η εγκατάσταση ολοκληρώθηκε.\nΔεν έχει ρυθμιστεί ο agent.  Μπορείτε να προχωρήσετε στη ρύθμιση αργότερα.',
    'endUninstall':u'Η κατάργηση της εγκατάστασης ολοκληρώθηκε.',
    'enter':u'είσοδος',
    'enterInstallCode':u'Εισάγετε τον κωδικό εγκατάστασης',
    'enterInstallNewAgent':u'Εισάγετε δεδομένα δημιουργίας νέου agent:',
    'enterRunCode':u'Εισάγετε τον κωδικό σύνδεσης',
    'error':u'Σφάλμα',
    'errorAgentAlreadyExsists':u'O agent {0} υπάρχει ήδη.',
    'errorAgentMax':u'Υπέρβαση του μέγιστου αριθμού των agents.',
    'errorAgentNameNotValid':u'Το όνομα του agent δεν είναι έγκυρο.  Δεν μπορείτε να χρησιμοποιήσετε τους χαρακτήρες / \ |  # @ : .',
    'errorConnectionConfig':u'Σφάλμα σύνδεσης. Παρακαλώ ελέγξτε εάν έχει ξεκινήσει η υπηρεσία DWagent.',
    'errorConnectionQuestion':u'Σφάλμα σύνδεσης. Ελέγξτε τη σύνδεση στο διαδίκτυο ή τη διαμόρφωση του τείχους προστασίας.\nΘέλετε να ρυθμίσετε τον διακομιστή μεσολάβησης (proxy);',
    'errorInvalidCode':u'Ο κωδικός που καταχωρίσατε δεν είναι έγκυρος.',
    'errorInvalidUserPassword':u'Μη έγκυρος χρήστης ή κωδικός πρόσβασης.',
    'fieldRequired':u'Το πεδίο \'{0}\' απαιτείται.',
    'install':u'Εγκατάσταση',
    'installMonitor':u'Εγκατάσταση οθόνης...',
    'installMonitorErr':u'Η εγκατάσταση οθόνης απέτυχε...',
    'installService':u'Εγκατάσταση υπηρεσίας...',
    'installServiceErr':u'Η εγκατάσταση υπηρεσίας απέτυχε.',
    'installShortcuts':u'Εγκατάσταση συντομεύσεων...',
    'installShortcutsErr':u'Η εγκατάσταση συντομεύσεων απέτυχε.',
    'linuxRootPrivileges':u'Πρέπει να έχετε δικαιώματα root για να εγκαταστήσετε το DWAgent.\nΞεκινήστε τη δέσμη ενεργειών (script) χρησιμοποιώντας τον χρήστη root.',
    'menuConfigure':u'Διαμορφώστε',
    'menuMonitor':u'Οθόνη',
    'menuUninstall':u'Απεγκατάσταση',
    'missingInfoFile':u'Το αρχείο info.json δεν βρέθηκε.',
    'missingNative':u'Native not found.',
    'missingRuntime':u'Runtime not found.',
    'monitorActive':u'ενεργό',
    'monitorAgentDisabled':u'Agent απενεργοποιημένος.',
    'monitorAgentEnabled':u'Agent ενεργοποιημένος.',
    'monitorConfigure':u'Διαμόρφωση',
    'monitorConnections':u'Συνδέσεις',
    'monitorCurrentActivities':u'Τρέχουσες δραστηριότητες',
    'monitorDisable':u'Απενεργοποίηση',
    'monitorDisableAgentQuestion':u'Θέλετε να απενεργοποίησετε τον agent;',
    'monitorDownload':u'Λήψη',
    'monitorEnable':u'Ενεργοποίηση',
    'monitorEnableAgentQuestion':u'Θέλετε να ενεργοποίησετε τον agent;',
    'monitorEnterPassword':u'Εισάγετε τον κωδικό πρόσβασης:',
    'monitorErrorConnectionConfig':u'Σφάλμα σύνδεσης. Ελέγξτε αν έχει ξεκινήσει η υπηρεσία DWAgent.',
    'monitorHide':u'Απόκρυψη',
    'monitorInvalidPassword':u'Λανθασμένος κωδικός.',
    'monitorNoActivities':u'Καμία δραστηριότητα',
    'monitorScreenCapture':u'πρόσβαση οθόνης',
    'monitorSession':u'Συνεδρία',
    'monitorShellSession':u'πρόσβαση στο τερματικό',
    'monitorShow':u'Εμφάνιση',
    'monitorStatus':u'Κατάσταση',
    'monitorStatusDisabled':u'Απενεργοποιημένο',
    'monitorStatusNoService':u'Δεν υπάρχει υπηρεσία',
    'monitorStatusOffline':u'Εκτός σύνδεσης',
    'monitorStatusOnline':u'Σε σύνδεση',
    'monitorStatusUpdating':u'Ενημέρωση',
    'monitorTitle':u'DWAgent - Οθόνη',
    'monitorUninstall':u'Απεγκατάσταση',
    'monitorUninstallNotRun':u'Δεν μπορείτε να απεγκαταστήσετε χωρίς δικαιώματα root.\nΕκτελέστε την εντολή dwaguninstall στο κέλυφος (shell).',
    'monitorUpload':u'μεταφόρτωση',
    'mustAccept':u'Για να συνεχίσετε, πρέπει να επιλέξετε την επιλογή {0}',
    'mustSelectOptions':u'Πρέπει να επιλέξετε μια επιλογή.',
    'next':u'Επόμενο',
    'no':u'Όχι',
    'noTryAgain':u'Όχι, προσπαθείστε πάλι',
    'notInstalled':u'Το DWAgent δεν είναι εγκατεστημένο.',
    'ok':u'Εντάξει',
    'option':u'Επιλογή',
    'optionNotValid':u'Η επιλεγμένη επιλογή δεν είναι έγκυρη.',
    'or':u'ή',
    'password':u'Κωδικός πρόσβασης',
    'path':u'Διαδρομή',
    'pathCreating':u'Δημιουργία φακέλου...',
    'pathNotCreate':u'Δεν ήταν δυνατή η δημιουργία του φακέλου. Μη έγκυρη διαδρομή ή δεν έχετε άδεια.',
    'pressEnter':u'Πατήστε το πλήκτρο enter για να συνεχίσετε.',
    'privacyPolicy':u'Πολιτική απορρήτου',
    'proxyAuthPassword':u'Κωδικός πρόσβασης',
    'proxyAuthUser':u'Χρήστης',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Εισάγετε πληροφορίες διακομιστή μεσολάβησης (proxy).',
    'proxyNone':u'Κανένα',
    'proxyPort':u'Θύρα',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Σύστημα',
    'reEnterCode':u'Εισαγάγετε ξανά τον κωδικό',
    'reEnterData':u'Επανεισάγετε τα δεδομένα',
    'rePassword':u'Εισάγετε ξανά τον κωδικό πρόσβασης',
    'removeFile':u'Κατάργηση αρχείου...',
    'runWithoutInstallation':u'Εκτέλεση',
    'runWithoutInstallationClosing':u'Κλείσιμο συνεδρίας...',
    'runWithoutInstallationConnecting':u'Έναρξη συνεδρίας...',
    'runWithoutInstallationEnd':u'Η συνεδρία τελείωσε.',
    'runWithoutInstallationOnlineBottom':u'ΠΡΟΕΙΔΟΠΟΙΗΣΗ:\nΜην αποκαλύπτετε αυτές τις πληροφορίες σε μη έμπιστα πρόσωπα, ειδάλλως θα τους επιτρέψετε να έχουν πρόσβαση σε αυτόν τον υπολογιστή. Αν δεν είστε σίγουροι τι κάνετε, κλείστε αυτήν την εφαρμογή.',
    'runWithoutInstallationOnlineBottomPutCode':u'ΠΡΟΕΙΔΟΠΟΙΗΣΗ:\nΤώρα ο agent είναι έτοιμος να δεχτεί σύνδεση. Εάν δεν είστε σίγουροι τι κάνετε, παρακαλώ κλείστε αυτήν την εφαρμογή.',
    'runWithoutInstallationOnlinePassword':u'Κωδικός: {0}',
    'runWithoutInstallationOnlineTop':u'Η συνεδρία είναι ενεργή.\nΓια να συνδεθείτε με αυτόν τον υπολογιστή, μεταβείτε στη διεύθυνση https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Η συνεδρία είναι ενεργή.',
    'runWithoutInstallationOnlineUser':u'Χρήστης: {0}',
    'runWithoutInstallationStarting':u'Έναρξη agent...',
    'runWithoutInstallationUnexpectedError':u'Απρόσμενο σφάλμα.\nΔεν ήταν δυνατό να ξεκινήσει το DWAgent. Εάν το πρόβλημα παραμένει, δοκιμάστε να κατεβάσετε την τελευταία έκδοση του DWAgent, να διαγράψετε το φάκελο \'{0}\' και να εκτελέσετε ξανά το DWAgent.',
    'runWithoutInstallationUpdating':u'Ενημέρωση agent...',
    'runWithoutInstallationWait':u'Αναμονή νέας σύνδεσης σε εξέλιξη (απόπειρα {0}) ...',
    'selectPathInstall':u'Επιλέξτε τη διαδρομή εγκατάστασης:',
    'startService':u'Εκκίνηση υπηρεσίας...',
    'startServiceErr':u'Η εκκίνηση της υπηρεσίας απέτυχε.',
    'termsAndConditions':u'Οροι και Προϋποθέσεις',
    'titleInstall':u'DWAgent - Εγκατάσταση',
    'titleUninstall':u'DWAgent - Απεγκατάσταση',
    'toBack':u'για μετάβαση πίσω.',
    'toExit':u'για έξοδο.',
    'unexpectedError':u'Απρόσμενο σφάλμα.\n{0}',
    'uninstallMonitor':u'Απεγκατάσταση οθόνης...',
    'uninstallService':u'Απεγκατάσταση υπηρεσίας...',
    'uninstallShortcuts':u'Απεγκατάσταση συντομεύσεων...',
    'user':u'Χρήστης',
    'validInteger':u'Το πεδίο \'{0}\' πρέπει να είναι ακέραιος αριθμός.',
    'versionInstallNotValid':u'Η έκδοση του προγράμματος εγκατάστασης δεν είναι η σωστή για το λειτουργικό σας σύστημα.\nΠαρακαλώ κάνετε λήψη της σωστής έκδοσης. {0}',
    'waiting':u'Αναμονή...',
    'warningLoginLogout':u'Για να τεθεί σε ισχύ αυτή η αλλαγή, ο χρήστης πρέπει να αποσυνδεθεί και να συνδεθεί ξανά.',
    'warningRemovePath':u'Προειδοποίηση, ο φάκελος προορισμού υπάρχει ήδη οπότε θα διαγραφεί.',
    'warningSpyingTool':u'Λάβετε υπόψη ότι δεν πρέπει να έχετε πρόσβαση σε έναν απομακρυσμένο υπολογιστή χωρίς τη συγκατάθεση του χρήστη του. Χρησιμοποιώντας το DWService ως εργαλείο κατασκοπείας, ενδέχεται να παραβιάζετε νόμους στη χώρα διαμονής σας.',
    'welcomeLicense':u'Αδεια\nΑυτό το λογισμικό είναι δωρεάν λογισμικό ανοιχτού κώδικα (free & open source). \nΑποτελείται από ένα κύριο στοιχείο και διάφορα πρόσθετα που ορίζονται ως "app" και τα οποία ενδέχεται να διέπονται από διαφορετικές άδειες. Για περισσότερες πληροφορίες επισκεφτείτε: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Συνεχίζοντας την εγκατάσταση ή εκτελώντας αυτό το λογισμικό, αποδέχεστε τους #TERMSANDCONDITIONS και τους #PRIVACYPOLICY',
    'welcomeSecurity':u'Ασφάλεια\nΠροκειμένου να προστατεύσουμε το ιδιωτικό σας απόρρητο, εγγυόμαστε ότι δεν θα αποθηκεύονται πληροφορίες στους διακομιστές μας ενώ οι επικοινωνίες είναι κρυπτογραφημένες, έτσι ώστε να μην μπορούν να διαβαστούν με κανένα τρόπο από τρίτους.',
    'welcomeSoftwareUpdates':u'Ενημερώσεις λογισμικού\nΟι ενημερώσεις αυτού του λογισμικού είναι αυτόματες.',
    'windowsAdminPrivileges':u'Πρέπει να έχετε δικαιώματα διαχειριστή για να εγκαταστήσετε το DWAgent.\nΞεκινήστε το εκτελέσιμο με  "εκτέλεση ως διαχειριστής".',
    'yes':u'Ναί'
}
                                                                                                                                                                                                                                                                    ui/messages/hr.py                                                                                   0000644 0001750 0001750 00000023375 13422307023 013561  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'runWithoutInstallationClosing':u'Zatvaranje sesije...',
    'configureInvalidPassword':u'Pogrešna lozinka',
    'configureEnd':u'Konfiguracija je završena.',
    'noTryAgain':u'Ne, pokušajte ponovno.',
    'chooseProxyType':u'Kakav proxy želite koristiti?',
    'monitorTitle':u'DWAgent - Monitor',
    'agentName':u'Ime agenta',
    'installShortcutsErr':u'Instalacija prečaca nije uspjela.',
    'runWithoutInstallationUpdating':u'Nadogradnja Agenta...',
    'proxyHttp':u'Http',
    'proxyPort':u'Port',
    'runWithoutInstallationOnlineTop':u'Sesija je aktivna. \nZa spajanje na ovog agenta posjetite https://www.dwservice.net',
    'cancelUninstall':u'Deinstalacija je bila prekinuta.',
    'back':u'Natrag',
    'toExit':u'za izlaz',
    'pathNotCreate':u'Izrada mape nije uspjela. Pogrešna putanja ili odbijen pristup. Provjerite putanju i dozvole mape.',
    'configureRemovePassword':u'Ukloni lozinku.',
    'welcomeSoftwareUpdates':u'Ažuriranja softvera\nAžuriranja ovog softvera su automatski.',
    'monitorDisableAgentQuestion':u'Želite li onemogućiti agenta?',
    'errorConnectionQuestion':u'Mrežna pogreška- Molimo provjerite vašu internet vezu ili postavke vatrozida.\nŽelite li podesiti proxy?',
    'titleUninstall':u'DWAgent - Deinstalacija',
    'installShortcuts':u'Instaliram prečace...',
    'dwsPassword':u'DWS lozinka',
    'configureExit':u'Izlaz',
    'uninstallService':u'Deinstaliram servis...',
    'monitorStatusOffline':u'Izvan mreže',
    'configureInsertPassword':u'Unesite lozinku konfiguracije:',
    'monitorStatusNoService':u'Nema usluge',
    'configureChangeInstallKey':u'Promjeni kod instalacije.',
    'monitorUninstall':u'Deinstaliraj',
    'reEnterCode':u'Ponovno unesite kod',
    'monitorEnable':u'Omogući',
    'copyFiles':u'Kopiram datoteke...',
    'removeFile':u'Uklanjanje datoteke...',
    'configureEnableAgent':u'Omogući agenta',
    'configureProxyEnd':u'Proxy uspješno podešen.',
    'mustSelectOptions':u'Morate odabrati opciju',
    'unexpectedError':u'Neočekivana pogreška. \n{0}',
    'code':u'Kod',
    'monitorHide':u'Sakrij',
    'proxyAuthPassword':u'Lozinka',
    'errorAgentNameNotValid':u'Ime agenta nije ispravno.  Zabranjeni znakovi su:  / \ | # @ : .',
    'validInteger':u'Polje "{0}" mora biti cijeli broj.',
    'confirmExit':u'Sigurno želite izaći?',
    'configureTrayIconVisibility':u'Vidljivost tray ikone.',
    'monitorConnections':u'Veze',
    'fieldRequired':u'Polje \'{0}\' je obavezno',
    'decline':u'Ne prihvaćam',
    'password':u'Lozinka',
    'installMonitorErr':u'Instalacija monitora nije uspjela.',
    'missingInfoFile':u'Datoteka info.json nije pronađena',
    'alreadyInstalled':u'DWAgent je već instaliran na ovome računalu.\n\nAgent je podešen na automatsku nadogradnju, pa nije potrebna ručna instalacija novih verzija.',
    'configureUninstallationKey':u'Deinstalacija...',
    'configureChooseMonitorTrayIconVisibility':u'Želite li prikaz monitora u tray ikoni?',
    'installMonitor':u'Instaliram monitor...',
    'errorInvalidUserPassword':u'Pogrešno korisničko ime ili lozinka.',
    'rePassword':u'Ponovno upišite lozinku',
    'runWithoutInstallationUnexpectedError':u'Neočekivana greška.\nNije moguće pokrenuti DWAgent--a. Ukoliko se progrem ponovi, pokupajte preuzeti posljednju inačicu DWAgent-a, obrišite mapu \'{0}\' i pokrenite DWAgenta ponovno.',
    'enterInstallNewAgent':u'Unesite podatke za izradu novog agenta',
    'no':u'Ne',
    'selectPathInstall':u'Odaberite instalacijsku putanju:',
    'confirmUninstall':u'Želite li ukloniti DWAgent?',
    'next':u'Dalje',
    'ok':u'Ok',
    'monitorStatusUpdating':u'Nadogradnja',
    'or':u'ili',
    'versionInstallNotValid':u'Verzija instalacijskog programa nije ispravna za vaš operativni sustav.\nPreuzmite ispravnu verziju. {0}',
    'monitorStatus':u'Status',
    'proxySocks4a':u'Socks4a',
    'cancel':u'Prekini',
    'linuxRootPrivileges':u'Morate imati root ovlasti za instalaciju DWAgent-a\nPonovno pokrenite skriptu kao root korisnik,',
    'errorInvalidCode':u'Uneseni kod nije ispravan.',
    'configureInstallNewAgent':u'Izrada novog agenta',
    'error':u'Greška',
    'menuMonitor':u'Monitor',
    'runWithoutInstallation':u'Pokreni',
    'proxySocks4':u'Socks4',
    'proxySocks5':u'Socks5',
    'monitorUninstallNotRun':u'Ne možete deinstalirati bez root ovlasti.\nPokrenite naredbu dwaguninstall u shell-u.',
    'path':u'Putanja',
    'welcomeSecurity':u'Sigurnosti\nDa bismo zaštitili vašu privatnost jamčimo da se na našim poslužiteljima neće pohranjivati ​​nikakvi podaci, a komunikacije su šifrirane kako ih treće strane ne bi mogle čitati.',
    'monitorStatusOnline':u'Na mreži',
    'windowsAdminPrivileges':u'Morate imati administratorske ovlasti za instalaciju DWAgenta.\nPokrenite izvršnu datoteku s opcijom "pokreni kao administrator".',
    'user':u'Korisnik',
    'monitorAgentDisabled':u'Agent onemogućen.',
    'configureTrayIconOK':u'VIdljivost tray ikone uspješno podešena.',
    'runWithoutInstallationWait':u'Čekanje na novi pokušaj spajanja (attempt {0})...',
    'enter':u'enter',
    'proxyAuthUser':u'Korisnik',
    'notInstalled':u'DWAgent nije instaliran.',
    'configureEnableAgentQuestion':u'Želite li omogućiti agenta?',
    'proxyInfo':u'Unesite podatke proxyja.',
    'monitorShow':u'Prikaži',
    'runWithoutInstallationOnlineBottom':u'UPOZORENJE: \nNe prenosite slijedeće podatke osobama kojima ne vjerujete, Davanjem podataka  dopuštate udaljeni pristup bez nadzora. Ako niste sigurni što radite, molimo Vas da zatvorite aplikaciju.',
    'startService':u'Pokretanje servisa...',
    'errorAgentMax':u'Premašen najveći broj agenata.',
    'configureLater':u'Podesi kasnije',
    'option':u'Opcija',
    'installServiceErr':u'Instalacija servisa nije uspjela.',
    'configureDisableAgent':u'Onemogući agenta.',
    'configurePasswordUpdated':u'Lozinka promijenjena.',
    'errorAgentAlreadyExsists':u'Agent {0} već postoji.',
    'configureUninstallKeyQuestion':u'Deinstalirati trenutni instalacijski kod?',
    'configureChooseOperation':u'Molimo izaberite operaciju:',
    'configureAgent':u'Konfiguriraj Agenta',
    'configureRemovePasswordQuestion':u'Želite li ukloniti lozinku?',
    'configureErrorConnection':u'Greška u komunikaciji. Provjerite da li je DWAgent servis pokrenut.',
    'menuUninstall':u'Deinstaliraj',
    'startServiceErr':u'Pokretanje servisa neuspješno.',
    'configureDisableAgentQuestion':u'Želite li onemogućiti agenta?',
    'createNewAgent':u'Kreiranje agenta...',
    'missingNative':u'Lokalizacija nije pronađena.',
    'toBack':u'za povratak',
    'proxySystem':u'Sistem',
    'proxyHost':u'Domaćin',
    'monitorStatusDisabled':u'Onemogućeno',
    'installService':u'Instalacija servisa...',
    'mustAccept':u'Za nastavak odaberite opciju {0}',
    'monitorConfigure':u'Podesi',
    'runWithoutInstallationOnlineUser':u'Korisnik: {0}',
    'waiting':u'Čekam...',
    'configureAgentDisabled':u'Agent onemugućen.',
    'monitorInvalidPassword':u'Pogrešna lozinka',
    'configureSetPassword':u'Postavi lozinku',
    'optionNotValid':u'Odabrana opcija je neispravna',
    'runWithoutInstallationConnecting':u'Otvaranje sesije',
    'enterInstallCode':u'Unesite instalacijski kod',
    'configureKeyInstalled':u'Ključ instaliran uspješno.',
    'configureInstallCode':u'Unos instalacijskog koda',
    'pathCreating':u'Izrada mape...',
    'endInstallConfigLater':u'Instalacija je završena.\nAgent nije podešen. Podešavanje možete obaviti i naknadno.',
    'endUninstall':u'Deinstalacija je završena',
    'errorConnectionConfig':u'Mrežna pogreška. Provjerite status servisa DWAgent',
    'monitorDisable':u'Onemogući',
    'warningRemovePath':u'Upozorenje da odredišna mapa već postoji i bit će izbrisana.',
    'cancelInstall':u'Instalacija je bila prekinuta.',
    'monitorErrorConnectionConfig':u'Mrežna pogreška. Provjerite status DWAgent servisa.',
    'menuConfigure':u'Podešavanja',
    'configureInstallAgent':u'Kako želite podesiti agenta?',
    'confirmInstall':u'Želite li instalirati DWAgent na \'{0}\'?',
    'dwsUser':u'DWS korisnik:',
    'configureAgentEnabled':u'Agent omogućen.',
    'titleInstall':u'DWAgent - Instalacija',
    'checkInstallCode':u'Provjeravam kod instalacije...',
    'pressEnter':u'Pritisnite enter za nastavak.',
    'endInstall':u'Instalacija je završena.',
    'missingRuntime':u'Runtime nije pronađen.',
    'runWithoutInstallationEnd':u'Sesija završena.',
    'yes':u'Da',
    'downloadFile':u'Preuzimanje datoteke {0}...',
    'runWithoutInstallationOnlinePassword':u'Lozinka: {0}',
    'reEnterData':u'Ponovno unesite podatke',
    'configureTitle':u'DWAgent - Podešenja',
    'configureProxy':u'Podesi proxy',
    'monitorAgentEnabled':u'Agent omogućen',
    'runWithoutInstallationStarting':u'Pokretanje agenta...',
    'accept':u'Prihvaćam',
    'configurePasswordErrNoMatch':u'Lozinke se ne podudaraju.',
    'welcomeLicense':u'Licenca\nOvaj softver je besplatan i otvorenog koda.\nSastoji se od jedne glavne komponente i nekoliko dodatnih komponenti definiranih "aplikacija" koje bi mogle biti regulirane različitim licencama. Za više informacija posjetite: https://www.dwservice.net/en/licenses-sources.html',
    'commands':u'Naredbe',
    'close':u'Zatvori',
    'monitorEnterPassword':u'Unesite lozinku',
    'configurePassword':u'Postavi lozinku',
    'uninstallShortcuts':u'Deinstaliram prečace...',
    'install':u'Instaliraj',
    'configureMonitor':u'Podesi monitor',
    'uninstallMonitor':u'Deinstaliram monitor...',
    'proxyNone':u'Ništa.',
    'monitorEnableAgentQuestion':u'Želite li omogućiti klijenta?'
}
                                                                                                                                                                                                                                                                   ui/messages/et.py                                                                                   0000644 0001750 0001750 00000026252 14137472011 013561  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Nõustun',
    'agentName':u'Agendi nimi',
    'alreadyInstalled':u'DWAgent on juba installitud.\n\nAgent värskendab automaatselt viimast versiooni. See tähendab, et te ei pea uuemaid värskendusi käsitsi installima.',
    'back':u'Tagasi',
    'cancel':u'Tühista',
    'cancelInstall':u'Paigaldamine tühistati.',
    'cancelUninstall':u'Eemaldamine tühistati',
    'checkInstallCode':u'Paigalduskoodi kontrollimine ...',
    'chooseProxyType':u'Millist puhverserverit soovite kasutada?',
    'close':u'Sulge',
    'code':u'Kood',
    'commands':u'Käsud',
    'configureAgent':u'Agendi konfigureerimine',
    'configureAgentDisabled':u'Agent on keelatud.',
    'configureAgentEnabled':u'Agent on lubatud.',
    'configureChangeInstallKey':u'Muuda paigalduskood',
    'configureChooseMonitorTrayIconVisibility':u'Kas soovite kuvada ikooni tegumiribal?',
    'configureChooseOperation':u'Valige operatsioon:',
    'configureDesktopNotification':u'Töölaua teavitused',
    'configureDesktopNotificationOK':u'Töölaua teavitused on edukalt seadistatud.',
    'configureDisableAgent':u'Keela agent',
    'configureDisableAgentQuestion':u'Kas soovite vahendit keelata?',
    'configureEnableAgent':u'Luba agent',
    'configureEnableAgentQuestion':u'Kas soovite agenti lubada?',
    'configureEnd':u'Konfiguratsioon on lõpetatud.',
    'configureErrorConnection':u'Ühenduse viga. Palun kontrollige, kas DWAgent teenust alustatakse.',
    'configureExit':u'Välju',
    'configureInsertPassword':u'Palun sisesta config parool:',
    'configureInstallAgent':u'Kuidas soovite agenti konfigureerida?',
    'configureInstallCode':u'Paigalduskoodi sisestamine',
    'configureInstallNewAgent':u'Uue agendi loomine',
    'configureInvalidPassword':u'Vale parool.',
    'configureKeyInstalled':u'Võti on edukalt installitud.',
    'configureLater':u'Konfigureerige hiljem',
    'configureMonitor':u'Monitori seadistamine',
    'configurePassword':u'Parooli seadistamine',
    'configurePasswordErrNoMatch':u'Parool ei sobi.',
    'configurePasswordUpdated':u'Parool uuendatud.',
    'configureProxy':u'Puhverserveri seadistamine',
    'configureProxyEnd':u'Proksi seadistatakse edukalt',
    'configureRemovePassword':u'Eemalda parool',
    'configureRemovePasswordQuestion':u'Kas soovite parooli eemaldada?',
    'configureSetPassword':u'Määra parool',
    'configureTitle':u'DWAgent - Seadistamine',
    'configureTrayIconOK':u'Salveikooni nähtavus, seadistatud edukalt.',
    'configureTrayIconVisibility':u'Salve ikooni nähtavus',
    'configureUninstallKeyQuestion':u'Kas soovid paigalduskoodi desinstallida?',
    'configureUninstallationKey':u'Desinstallimine ...',
    'confirmExit':u'Kas olete kindel, et soovite väljuda?',
    'confirmInstall':u'Kas soovite installida DWAgent\'i "{0}"?',
    'confirmUninstall':u'Kas soovite eemaldada DWAgent?',
    'copyFiles':u'Failide kopeerimine ...',
    'createNewAgent':u'Agendi loomine käsil...',
    'decline':u'Ei nõustu',
    'desktopNotificationAutoHide':u'Peiad automaatselt',
    'desktopNotificationNone':u'Puuduvad',
    'desktopNotificationVisible':u'Nähtaval',
    'downloadFile':u'Faili allalaadimine {0} ...',
    'dwsPassword':u'DWS parool',
    'dwsUser':u'DWS kasutaja',
    'endInstall':u'Paigaldus on lõpetatud.',
    'endInstallConfigLater':u'Paigaldus on lõpetatud.\nAgent ei ole konfigureeritud. Konfiguratsiooni saate siiski jätkata hiljem.',
    'endUninstall':u'Desinstallimine on lõpetatud.',
    'enter':u'sisesta',
    'enterInstallCode':u'Sisesta installeerimise kood',
    'enterInstallNewAgent':u'Sisesta andmed uue agendi loomiseks:',
    'enterRunCode':u'Sisesta ühendamise kood',
    'error':u'Viga',
    'errorAgentAlreadyExsists':u'Agent {0} juba eksiteerib',
    'errorAgentMax':u'Agentide maksimaalne arv ületatud.',
    'errorAgentNameNotValid':u'Agendi nimi sisaldab keelatud tähemärke. Keelatud märgid: / \ | # @ : .',
    'errorConnectionConfig':u'Ühenduse viga. Kontrolli kas DWAgent  service töötab ühendatavas arvutis',
    'errorConnectionQuestion':u'Ühendumise viga. Kontrolli interneti ühendust või tulemüüri seadeid.\nKas soovid konfigureerida proxy ühenduse?',
    'errorInvalidCode':u'Sisestatud kood ei ole õige.',
    'errorInvalidUserPassword':u'Vale kasutaja või parool.',
    'fieldRequired':u'Välja \'{0}\' täitmine on kohustuslik.',
    'install':u'Paigalda',
    'installMonitor':u'Lisan monitori...',
    'installMonitorErr':u'Monitori lisamine nurjus.',
    'installService':u'Paigaldan service moodulit...',
    'installServiceErr':u'Service mooduli paigaldus ebaõnnestus.',
    'installShortcuts':u'Paigaldan otseteid...',
    'installShortcutsErr':u'Otseteede paigaldus nurjus.',
    'linuxRootPrivileges':u'Sa pead olema root privileegidega kasutaja DWAgent paigaldamiseks.\nPalun käivita script root kasutaja alt.',
    'menuConfigure':u'Konfigureeri',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Deinstalleeri',
    'missingInfoFile':u'Ei leia faili info.json.',
    'missingNative':u'Loomulikku (Native) ei leitud.',
    'missingRuntime':u'Käitusaega (Runtime) ei leitud',
    'monitorActive':u'aktiivne',
    'monitorAgentDisabled':u'Agent keelatud.',
    'monitorAgentEnabled':u'Agent lubatud.',
    'monitorConfigure':u'Konfigureeri',
    'monitorConnections':u'Ühendused',
    'monitorCurrentActivities':u'Hetke tegevused',
    'monitorDisable':u'Keela',
    'monitorDisableAgentQuestion':u'Kas tahad agenti keelata?',
    'monitorDownload':u'Lae alla',
    'monitorEnable':u'Luba',
    'monitorEnableAgentQuestion':u'Kas tahad seda agenti lubada?',
    'monitorEnterPassword':u'Sisesta parool:',
    'monitorErrorConnectionConfig':u'Ühenduse viga. Kontrolli kas DWAgent teenus on käivitunud.',
    'monitorHide':u'Peida',
    'monitorInvalidPassword':u'Vale parool.',
    'monitorNoActivities':u'Pole tegevusi',
    'monitorScreenCapture':u'Ekraanitõmmis',
    'monitorSession':u'Sessioon',
    'monitorShellSession':u'Käsukest',
    'monitorShow':u'Näita',
    'monitorStatus':u'Olek',
    'monitorStatusDisabled':u'Keelatud',
    'monitorStatusNoService':u'Teenus puudub',
    'monitorStatusOffline':u'Võrguühenduseta',
    'monitorStatusOnline':u'Võrgus saadaval',
    'monitorStatusUpdating':u'Uuendan',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Desinstalli',
    'monitorUninstallNotRun':u'Sa ei saa desinstallida ilma root õigusteta.\nKäivita käsurealt käsk "sudo dwaguninstall".',
    'monitorUpload':u'Lae ülesse',
    'mustAccept':u'Et jätkata pead valima valiku {0}',
    'mustSelectOptions':u'Pead valima valiku',
    'next':u'Järgmine',
    'no':u'Ei',
    'noTryAgain':u'Ei, proovi uuesti.',
    'notInstalled':u'DWAgent pole installeeritud.',
    'ok':u'Ok',
    'option':u'Valik',
    'optionNotValid':u'Valitud valik pole õige.',
    'or':u'või',
    'password':u'Parool',
    'path':u'Rada',
    'pathCreating':u'Kausta loomine...',
    'pathNotCreate':u'Ei saanud kausta luua. Vale kausta asukoht või puuduvad admin õigused.',
    'pressEnter':u'Jätkamiseks vajuta Enter klahvi',
    'privacyPolicy':u'Andmekaitse põhimõtted',
    'proxyAuthPassword':u'Parool',
    'proxyAuthUser':u'Kasutaja',
    'proxyHost':u'Võõrustaja',
    'proxyHttp':u'Http',
    'proxyInfo':u'Sisesta puhverserveri info.',
    'proxyNone':u'Puudub',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Süsteem',
    'reEnterCode':u'Sisesta kood uuesti',
    'reEnterData':u'Sisesta andmed uuesti',
    'rePassword':u'Sisesta parool uuesti',
    'removeFile':u'Eemaldan faili...',
    'runWithoutInstallation':u'Käivita',
    'runWithoutInstallationClosing':u'Sulgen sessiooni...',
    'runWithoutInstallationConnecting':u'Avan sessiooni...',
    'runWithoutInstallationEnd':u'Sessioon lõppes.',
    'runWithoutInstallationOnlineBottom':u'HOIATUS:\nÄra avalda antud informatsiooni inimestele keda sa ei saa usaldada ega luba neil teist viisi sellele agendile ligi pääseda. Kui sa pole kindel mida teed siis palun sulge see rakendus.',
    'runWithoutInstallationOnlineBottomPutCode':u'HOIATUS:\nNüüd on agent ühendumiseks valmis. Kui sa pole kindel mida teed, siis palun sulge see rakendus.',
    'runWithoutInstallationOnlinePassword':u'Parool: {0}',
    'runWithoutInstallationOnlineTop':u'Sessioon on aktiivne.\nSelle agendiga ühendumiseks mine https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Sessioon on aktiivne.',
    'runWithoutInstallationOnlineUser':u'Kasutaja: {0}',
    'runWithoutInstallationStarting':u'Agent käivitub...',
    'runWithoutInstallationUnexpectedError':u'Ootamatu viga.\nPolnud võimalik DWAgendi rakendust käivitada. Kui probleem püsib, proovi alla laadida uusim versioon, kustuta kaust \'{0}\' ja käivita DWAgent uuesti.',
    'runWithoutInstallationUpdating':u'Agendi uuendamine...',
    'runWithoutInstallationWait':u'Oota uue ühenduse loomist (katse {0})...',
    'selectPathInstall':u'Vali paigalduse asukoht:',
    'startService':u'Käivitan teenust...',
    'startServiceErr':u'Teenuse käivitus ebaõnnestus.',
    'termsAndConditions':u'Üldtingimused',
    'titleInstall':u'DWAgent - Paigaldamine',
    'titleUninstall':u'DWAgent - Eemaldamine',
    'toBack':u'mine tagasi.',
    'toExit':u'väljapääsuni.',
    'unexpectedError':u'Ootamatu viga.\n{0}',
    'uninstallMonitor':u'Deinstallin monitori...',
    'uninstallService':u'Deinstallin teenust...',
    'uninstallShortcuts':u'Eemaldan otseteid...',
    'user':u'Kasutaja',
    'validInteger':u'Väli \'{0}\' peab olema täisarv.',
    'versionInstallNotValid':u'Paigaldusprogrammi versioon ei vasta sinu operatsiooni süsteemile.\nPalun lae alla õige versioon. {0}',
    'waiting':u'Ootan...',
    'warningLoginLogout':u'Selle muudatuse jõustumiseks peab kasutaja välja logima ja uuesti sisse logima.',
    'warningRemovePath':u'Hoiatus- kui sihtkaust juba eksisteerib, siis see kustutatakse.',
    'warningSpyingTool':u'Pange palun tähele, et kaugarvutile juurdepääsu ei tohi kasutada ilma kaugarvuti kasutaja nõusolekuta. Kasutades DWService\'i nuhkimisvahendina, võite rikkuda oma asukohariigi seadusi.',
    'welcomeLicense':u'Litsents\nSee tarkvara on tasuta ja avatud lähtekoodiga.\nSee koosneb ühest põhikomponendist ja mitmest lisakomponendist, mis on määratletud kui "rakendus" ja mida võiks reguleerida erinevate litsentsidega. Lisateabe saamiseks külastage: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Jätkates selle tarkvara installimist või selle käitamist, nõustute #TERMSANDCONDITIONS ja #PRIVACYPOLICY',
    'welcomeSecurity':u'Turvalisus\nTeie privaatsuse kaitsmiseks tagame, et meie serverites ei salvestata ühtegi teavet ja side on krüpteeritud nii, et kolmandad osapooled ei saa neid andmeid lugeda.',
    'welcomeSoftwareUpdates':u'Tarkvara uuendused\nSelle tarkvara värskendused on automaatsed.',
    'windowsAdminPrivileges':u'DWAgenti paigaldamiseks peate omama administraatoriõigusi.\nKäivita paigaldusprogramm käsuga \'käivita administraatorina\'.',
    'yes':u'Jah'
}
                                                                                                                                                                                                                                                                                                                                                      ui/messages/az.py                                                                                   0000644 0001750 0001750 00000030114 14137472016 013560  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Qəbul edirəm',
    'agentName':u'Istifadəçi adı',
    'alreadyInstalled':u'DWAgent artıq quraşdırılıb.\n\nAgent avtomatik olaraq son versiyaya yenilənir. Bu o deməkdir ki, daha yeni yeniləmələri əl ilə quraşdırmanıza ehtiyac yoxdur.',
    'back':u'cArxa',
    'cancel':u'Ləğv et',
    'cancelInstall':u'Quraşdırma ləğv edildi.',
    'cancelUninstall':u'Silinmə ləğv edildi.',
    'checkInstallCode':u'Quraşdırma kodu yoxlanılır...',
    'chooseProxyType':u'Hansı proxy növündən istifadə etmək istəyirsiniz?',
    'close':u'Yaxın',
    'code':u'Kod',
    'commands':u'əmr',
    'configureAgent':u'Agenti konfiqurasiya edin',
    'configureAgentDisabled':u'Agent əlildir.',
    'configureAgentEnabled':u'Agent aktivdir.',
    'configureChangeInstallKey':u'Quraşdırma kodunu dəyişdirin',
    'configureChooseMonitorTrayIconVisibility':u'Tepsidəki monitor nişanını göstərmək istəyirsiniz?',
    'configureChooseOperation':u'Zəhmət olmasa bir əməliyyat seçin:',
    'configureDesktopNotification':u'Masaüstü bildiriş',
    'configureDesktopNotificationOK':u'Masaüstü bildirişi uğurla konfiqurasiya edildi.',
    'configureDisableAgent':u'Agenti deaktiv edin',
    'configureDisableAgentQuestion':u'Agenti söndürmək istəyirsiniz?',
    'configureEnableAgent':u'Agenti aktiv edin',
    'configureEnableAgentQuestion':u'Agenti aktivləşdirmək istəyirsiniz?',
    'configureEnd':u'Konfiqurasiya tamamlandı.',
    'configureErrorConnection':u'Əlaqə xətası. Xahiş edirəm DWAgent xidmətinin işlədiyini yoxlayın.',
    'configureExit':u'Çıx',
    'configureInsertPassword':u'Zəhmət olmasa konfiqurasiya parolunu daxil edin:',
    'configureInstallAgent':u'Agenti necə konfiqurasiya etmək istərdiniz?',
    'configureInstallCode':u'Quraşdırma kodunu daxil edin',
    'configureInstallNewAgent':u'Yeni agent yaratmaq',
    'configureInvalidPassword':u'Etibarsız Şifrə.',
    'configureKeyInstalled':u'Key installed succesfully.',
    'configureLater':u'Sonra konfiqurasiya edin',
    'configureMonitor':u'Monitoru konfiqurasiya edin',
    'configurePassword':u'Konfiqurasiya parolunu redaktə edin',
    'configurePasswordErrNoMatch':u'Parollar uyğun gəlmir.',
    'configurePasswordUpdated':u'Şifrə yeniləndi.',
    'configureProxy':u'Proxy konfiqurasiya edin',
    'configureProxyEnd':u'Proxy uğurla konfiqurasiya edildi.',
    'configureRemovePassword':u'Şifrəni silin',
    'configureRemovePasswordQuestion':u'Parolu silmək istəyirsiniz?',
    'configureSetPassword':u'Parol seçin',
    'configureTitle':u'DWAgent - Konfiqurasiya',
    'configureTrayIconOK':u'Tabla nişanı uğurla konfiqurasiya edildi.',
    'configureTrayIconVisibility':u'Tepsiya nişanının görünməsi',
    'configureUninstallKeyQuestion':u'Cari quraşdırma kodu silinsin?',
    'configureUninstallationKey':u'Silinir ...',
    'confirmExit':u'Çıxmaq istədiyinizə əminsiniz?',
    'confirmInstall':u'DWAgent-i \'{0}\' quraşdırmaq istəyirsiniz?',
    'confirmUninstall':u'DWAgent silmək istəyirsiniz?',
    'copyFiles':u'Fayllar kopyalanır ...',
    'createNewAgent':u'Agent yaradılması davam edir ...',
    'decline':u'Qəbul etmirəm',
    'desktopNotificationAutoHide':u'Avtomatik olaraq gizlədin',
    'desktopNotificationNone':u'Yoxdur',
    'desktopNotificationVisible':u'Görünən',
    'downloadFile':u'{0} faylı endirilir ...',
    'dwsPassword':u'DWS parolu',
    'dwsUser':u'DWS istifadəçisi',
    'endInstall':u'Quraşdırma başa çatıb.',
    'endInstallConfigLater':u'Quraşdırma başa çatıb.\nAgent konfiqurasiya edilməyib. Yenidən konfiqurasiya yarada bilərsiniz.',
    'endUninstall':u'Silinmə tamamlandı.',
    'enter':u'daxil edin',
    'enterInstallCode':u'Quraşdırma kodunu daxil edin',
    'enterInstallNewAgent':u'Yeni agent yaratmaq üçün məlumat daxil edin:',
    'enterRunCode':u'Bağlantı kodunu daxil edin',
    'error':u'Xəta',
    'errorAgentAlreadyExsists':u'Agent {0} artıq mövcuddur.',
    'errorAgentMax':u'Maksimum agent sayını keçdi.',
    'errorAgentNameNotValid':u'Agent adı etibarlı deyil. / \ | Simvollarından istifadə edə bilməzsiniz # @:.',
    'errorConnectionConfig':u'Əlaqə xətası. Xahiş edirəm DWAgent xidmətinin işlədiyini yoxlayın.',
    'errorConnectionQuestion':u'Əlaqə xətası. Zəhmət olmasa internet bağlantınızı və ya təhlükəsizlik divarınızı yoxlayın.\nBir proxy konfiqurasiya etmək istəyirsiniz?',
    'errorInvalidCode':u'Girilən kod etibarsızdır.',
    'errorInvalidUserPassword':u'Yanlış istifadəçi və ya parol.',
    'fieldRequired':u'\'{0}\' sahəsi tələb olunur.',
    'install':u'Yüklemek',
    'installMonitor':u'Monitor quraşdırılır ...',
    'installMonitorErr':u'Quraşdırma monitoru alınmadı.',
    'installService':u'Xidmət quraşdırılır ...',
    'installServiceErr':u'Xidmət quraşdırılması uğursuz oldu.',
    'installShortcuts':u'Qısayollar quraşdırılır ...',
    'installShortcutsErr':u'Qısayol quraşdırıla bilmədi.',
    'linuxRootPrivileges':u'DWAgent qurmaq üçün kök imtiyazlarınız olmalıdır.\nZəhmət olmasa skripti sudo ilə və ya kök olaraq çalıştırın.',
    'menuConfigure':u'Konfiqurasiya edin',
    'menuMonitor':u'Ekran',
    'menuUninstall':u'Sil',
    'missingInfoFile':u'Fayl məlumatı.json tapılmadı.',
    'missingNative':u'Yerli tapılmadı.',
    'missingRuntime':u'İş vaxtı tapılmadı.',
    'monitorActive':u'aktivdir',
    'monitorAgentDisabled':u'Agent əlildir.',
    'monitorAgentEnabled':u'Agent aktivdir.',
    'monitorConfigure':u'Konfiqurasiya edin',
    'monitorConnections':u'Əlaqələr',
    'monitorCurrentActivities':u'Cari fəaliyyətlər',
    'monitorDisable':u'Deaktiv edin',
    'monitorDisableAgentQuestion':u'Agenti söndürmək istəyirsiniz?',
    'monitorDownload':u'Yükləyin',
    'monitorEnable':u'Aktiv edin',
    'monitorEnableAgentQuestion':u'Agenti aktivləşdirmək istəyirsiniz?',
    'monitorEnterPassword':u'Parol daxil edin:',
    'monitorErrorConnectionConfig':u'Əlaqə xətası. Xahiş edirəm DWAgent xidmətinin işlədiyini yoxlayın.',
    'monitorHide':u'Gizlədin',
    'monitorInvalidPassword':u'Etibarsız Şifrə.',
    'monitorNoActivities':u'Fəaliyyət yoxdur',
    'monitorScreenCapture':u'Ekrana giriş',
    'monitorSession':u'Sessiya',
    'monitorShellSession':u'Qabıq girişi',
    'monitorShow':u'Göstər',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Əlildir',
    'monitorStatusNoService':u'Xidmət yoxdur',
    'monitorStatusOffline':u'Oflayn',
    'monitorStatusOnline':u'Onlayn',
    'monitorStatusUpdating':u'Yenilənir',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Sil',
    'monitorUninstallNotRun':u'Kök icazələri olmadan silə bilməzsiniz.\nSudo ilə və ya kök kimi dwaguninstall əmrini işə salın.',
    'monitorUpload':u'Yükləmək',
    'mustAccept':u'Davam etmək üçün {0} seçimini seçməlisiniz',
    'mustSelectOptions':u'Bir seçim seçməlisiniz.',
    'next':u'Növbəti',
    'no':u'Yox',
    'noTryAgain':u'Xeyr, yenidən cəhd edin',
    'notInstalled':u'DWAgent quraşdırılmayıb.',
    'ok':u'tamam',
    'option':u'Seçim',
    'optionNotValid':u'Seçilmiş seçim etibarsızdır.',
    'or':u'və ya',
    'password':u'Şifrə',
    'path':u'Yol',
    'pathCreating':u'Qovluq yaradılması ...',
    'pathNotCreate':u'Qovluq yarana bilmədi. Yanlış yol və ya icazə rədd edildi.',
    'pressEnter':u'Davam etmək üçün enter düyməsini basın.',
    'privacyPolicy':u'Gizlilik Siyasəti',
    'proxyAuthPassword':u'Şifrə',
    'proxyAuthUser':u'İstifadəçi',
    'proxyHost':u'Ev sahibi',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'Vəkil məlumatını daxil edin.',
    'proxyNone':u'Yoxdur',
    'proxyPort':u'Liman',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'Sistem',
    'reEnterCode':u'Kodu yenidən daxil edin',
    'reEnterData':u'Məlumatları yenidən daxil edin',
    'rePassword':u'Parolu yenidən yığın',
    'removeFile':u'Fayl silinir ...',
    'runWithoutInstallation':u'Qaç',
    'runWithoutInstallationClosing':u'Bağlanış sessiyası ...',
    'runWithoutInstallationConnecting':u'Sessiya açılır ...',
    'runWithoutInstallationEnd':u'Sessiya başa çatdı.',
    'runWithoutInstallationOnlineBottom':u'XƏBƏRDARLIQ:\nBu məlumatları etibar etmədiyiniz insanlara açıqlamayın. Bu cihazı əldə etmələrinə imkan verəcəkdir. Nə etdiyinizdən əmin deyilsinizsə, xahiş edirəm bu tətbiqi bağlayın.',
    'runWithoutInstallationOnlineBottomPutCode':u'XƏBƏRDARLIQ:\nAgent artıq bir əlaqə qəbul etməyə hazırdır. Nə etdiyinizdən əmin deyilsinizsə, xahiş edirəm bu tətbiqi bağlayın.',
    'runWithoutInstallationOnlinePassword':u'Şifrə: {0}',
    'runWithoutInstallationOnlineTop':u'Sessiya aktivdir.\nBu agentə qoşulmaq üçün https://www.dwservice.net saytına daxil olun',
    'runWithoutInstallationOnlineTopPutCode':u'Sessiya aktivdir.',
    'runWithoutInstallationOnlineUser':u'İstifadəçi: {0}',
    'runWithoutInstallationStarting':u'Agentin işə salınması ...',
    'runWithoutInstallationUnexpectedError':u'Gözlənilməz səhv.\nDWAgent başlaya bilmədi. Problem davam edərsə, xahiş edirəm DWAgent-in ən son versiyasını yükləyin, \'{0}\' qovluğunu silin və DWAgent-i yenidən çalıştırın.',
    'runWithoutInstallationUpdating':u'Agent yeniləməsi ...',
    'runWithoutInstallationWait':u'Yeni əlaqənin davam etməsini gözləyin (cəhd {0}) ...',
    'selectPathInstall':u'Quraşdırma yolunu seçin:',
    'startService':u'Xidmət başlayır ...',
    'startServiceErr':u'Xidmətə başlamaq alınmadı.',
    'termsAndConditions':u'Şərtlər və Qaydalar',
    'titleInstall':u'DWAgent - Quraşdırma',
    'titleUninstall':u'DWAgent - Silinmə',
    'toBack':u'geriyə qayıtmaq.',
    'toExit':u'çıxmaq.',
    'unexpectedError':u'Gözlənilməz səhv.\n{0}',
    'uninstallMonitor':u'Monitor silinir ...',
    'uninstallService':u'Xidmət silinir ...',
    'uninstallShortcuts':u'Qısayollar silinir ...',
    'user':u'İstifadəçi',
    'validInteger':u'\'{0}\' sahəsi bir tam olmalıdır.',
    'versionInstallNotValid':u'Quraşdırıcının bu versiyası əməliyyat sisteminiz üçün düzgün deyil.\nXahiş edirəm düzgün versiyanı yükləyin. {0}',
    'waiting':u'Gözləyirəm ...',
    'warningLoginLogout':u'Bu dəyişikliyin qüvvəyə minməsi üçün istifadəçi yenidən çıxış etməli və giriş etməlidir.',
    'warningRemovePath':u'Xəbərdarlıq: təyinat qovluğu artıq mövcuddur və silinəcəkdir.',
    'warningSpyingTool':u'Lütfən, istifadəçinin razılığı olmadan uzaq bir kompüterə daxil ola bilməyəcəyinizi unutmayın. DWService\'i casusluq vasitəsi kimi istifadə edərək, yaşadığınız ölkədəki qanunları pozmuş ola bilərsiniz.',
    'welcomeLicense':u'Lisenziya\nBu proqram pulsuz və açıq mənbəlidir.\nMPLv2 lisenziyası altında buraxılmış bir əsas komponentdən və fərqli lisenziyalarla idarə olunan bir neçə əlavə komponentdən ibarətdir. Daha çox məlumat üçün müraciət edin: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Bu proqramı quraşdırmağa və ya işə salmaqla #TERMSANDCONDITIONS və #PRIVACYPOLICY qəbul edirsiniz',
    'welcomeSecurity':u'Təhlükəsizlik\nMəxfiliyinizi qorumaq üçün agentdəki məlumatları serverlərimizdə saxlamırıq. İstifadəçilər, serverlərimiz və agentlərimiz arasında rabitə şifrələnir ki, üçüncü tərəflər onlara daxil ola bilməsin.',
    'welcomeSoftwareUpdates':u'Proqram yeniləmələri\nBu proqram avtomatik olaraq yenilənir',
    'windowsAdminPrivileges':u'DWAgent qurmaq üçün inzibati imtiyazlarınız olmalıdır.\nZəhmət olmasa yürütülə bilən düyməni vurun və quraşdırıcıyı başlamaq üçün \'idarəçi olaraq çalıştır\' düyməsini basın.',
    'yes':u'Bəli'
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                    ui/messages/__init__.py                                                                             0000644 0001750 0001750 00000000601 13422307023 014672  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''
import resources

restext=resources.ResText("ui.messages")

def set_locale(lng):
    restext.set_locale(lng)

def get_message(key):
    return restext.get(key)                                                                                                                               ui/messages/pl.py                                                                                   0000644 0001750 0001750 00000026706 14137471743 013603  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Akceptuję',
    'agentName':u'Nazwa agenta',
    'alreadyInstalled':u'DWAgent jest już zainstalowany.\n\nAgent automatycznie aktualizuje się do najnowszej wersji. Znaczy to, że nie będziesz musiał instalować aktualizacji ręcznie.',
    'back':u'Cofnij',
    'cancel':u'Anuluj',
    'cancelInstall':u'Instalacja została anulowana',
    'cancelUninstall':u'Dezinstalacja została anulowana',
    'checkInstallCode':u'Sprawdzanie kodu instalacji...',
    'chooseProxyType':u'Jakiego typu proxy chcesz użyć?',
    'close':u'Zamknij',
    'code':u'Kod',
    'commands':u'Polecenia',
    'configureAgent':u'Konfiguruj agenta',
    'configureAgentDisabled':u'Agent wyłączony',
    'configureAgentEnabled':u'Agent włączony',
    'configureChangeInstallKey':u'Zmień kod instalacji',
    'configureChooseMonitorTrayIconVisibility':u'Czy wyświetlać ikonę w tray\'u',
    'configureChooseOperation':u'Wybierz operację:',
    'configureDesktopNotification':u'Powiadomienia',
    'configureDesktopNotificationOK':u'Powiadomienia zostały skonfigurowane pomyślnie.',
    'configureDisableAgent':u'Wyłącz agenta',
    'configureDisableAgentQuestion':u'Czy chcesz wyłączyć agenta?',
    'configureEnableAgent':u'Włącz agenta',
    'configureEnableAgentQuestion':u'Czy chcesz włączyć agenta?',
    'configureEnd':u'Konfiguracja została zakończona.',
    'configureErrorConnection':u'Problem z połączeniem. Proszę sprawdzić czy usługa DWAgent jest uruchomiona.',
    'configureExit':u'Wyjście',
    'configureInsertPassword':u'Proszę podać hasło konfiguracji:',
    'configureInstallAgent':u'Jak chcesz skonfigurować agenta?',
    'configureInstallCode':u'Podaj kod instalacji',
    'configureInstallNewAgent':u'Utwórz nowego agenta',
    'configureInvalidPassword':u'Złe hasło.',
    'configureKeyInstalled':u'Klucz zainstalowany pomyślnie.',
    'configureLater':u'Skonfiguruj później',
    'configureMonitor':u'Skonfiguruj monitor',
    'configurePassword':u'Skonfiguruj hasło',
    'configurePasswordErrNoMatch':u'Hasła nie są takie same.',
    'configurePasswordUpdated':u'Hasło zaktualizowane.',
    'configureProxy':u'Skonfiguruj proxy',
    'configureProxyEnd':u'Proxy skonfigurowane prawidłowo.',
    'configureRemovePassword':u'Usuń hasło.',
    'configureRemovePasswordQuestion':u'Czy chcesz usunąć hasło?',
    'configureSetPassword':u'Ustaw hasło',
    'configureTitle':u'DWAgent - konfiguracja',
    'configureTrayIconOK':u'Widoczność ikony w tray\'u - skonfigurowano pomyślnie.',
    'configureTrayIconVisibility':u'Widoczność ikony w tray\'u',
    'configureUninstallKeyQuestion':u'Odinstalować obecny kod instalacyjny?',
    'configureUninstallationKey':u'Dezinstalacja...',
    'confirmExit':u'Czy jesteś pewien, że chcesz wyjść?',
    'confirmInstall':u'Chcesz zainstalować DWAgent w \'{0}\'?',
    'confirmUninstall':u'Czy chcesz usunąć DWAgent?',
    'copyFiles':u'Kopiowanie plików...',
    'createNewAgent':u'Tworzenie agenta w toku...',
    'decline':u'Nie zgadzam się',
    'desktopNotificationAutoHide':u'Automatycznie ukryj',
    'desktopNotificationNone':u'Brak',
    'desktopNotificationVisible':u'Widoczne',
    'downloadFile':u'Pobieranie pliku {0}...',
    'dwsPassword':u'DWS hasło',
    'dwsUser':u'DWS użytkownik',
    'endInstall':u'Instalacja została zakończona.',
    'endInstallConfigLater':u'Instalacja została zakończona.\nAgent nie został skonfigurowany. Możesz skonfigurować go później.',
    'endUninstall':u'Odinstalowywanie zakończyło się.',
    'enter':u'wprowadź',
    'enterInstallCode':u'Wprowadź kod instalacji',
    'enterInstallNewAgent':u'Wprowadź dane, aby stworzyć nowego agenta:',
    'enterRunCode':u'Wprowadź kod połączenia',
    'error':u'Błąd',
    'errorAgentAlreadyExsists':u'Agent {0} już istnieje.',
    'errorAgentMax':u'Przekroczono maksymalną liczbę agentów.',
    'errorAgentNameNotValid':u'Nazwa agenta nie jest prawidłowa. Nie możesz użyć znaków / \ | # @ : .',
    'errorConnectionConfig':u'Błąd połączenia. Sprawdź czy serwis DWAgent jest uruchomiony.',
    'errorConnectionQuestion':u'Błąd połączenia. Proszę sprawdzić połączenie internetowe lub konfigurację zapory.\nCzy chcesz skonfigurować proxy?',
    'errorInvalidCode':u'Wprowadzono błędny kod.',
    'errorInvalidUserPassword':u'Nieprawidłowy użytkownik lub hasło.',
    'fieldRequired':u'Pole \'{0}\' jest wymagane.',
    'install':u'Zainstaluj',
    'installMonitor':u'Instalowanie monitora...',
    'installMonitorErr':u'Instalacja monitora nie powiodła się.',
    'installService':u'Instalowanie serwisu...',
    'installServiceErr':u'Instalacja serwisu nie powiodła się.',
    'installShortcuts':u'Instalacja skrótów...',
    'installShortcutsErr':u'Instalacja skrótów nie powiodła się.',
    'linuxRootPrivileges':u'Potrzebujesz uprawnień administratora, aby zainstalować DWAgent.\nProszę rozpocząć skrypt używając użytkownika administracyjnego.',
    'menuConfigure':u'Konfiguruj',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Odinstaluj',
    'missingInfoFile':u'Plik info.json nie znaleziony.',
    'missingNative':u'Nie znaleziono natywnej wersji.',
    'missingRuntime':u'Nie znaleziono pliku wykonywalnego.',
    'monitorActive':u'aktywny',
    'monitorAgentDisabled':u'Agent wyłączony.',
    'monitorAgentEnabled':u'Agent włączony.',
    'monitorConfigure':u'Konfiguruj',
    'monitorConnections':u'Połączenia',
    'monitorCurrentActivities':u'Obecne połączenia',
    'monitorDisable':u'Wyłącz',
    'monitorDisableAgentQuestion':u'Czy chcesz wyłączyć agenta?',
    'monitorDownload':u'Pobieranie',
    'monitorEnable':u'Włącz',
    'monitorEnableAgentQuestion':u'Czy chcesz włączyć agenta?',
    'monitorEnterPassword':u'Wprowadź hasło:',
    'monitorErrorConnectionConfig':u'Błąd połączenia. Proszę sprawdzić czy serwis DWAgent jest uruchomiony.',
    'monitorHide':u'Ukryj',
    'monitorInvalidPassword':u'Nieprawidłowe hasło.',
    'monitorNoActivities':u'Brak aktywności',
    'monitorScreenCapture':u'Przechwytywanie ekranu',
    'monitorSession':u'Sesja',
    'monitorShellSession':u'Terminal',
    'monitorShow':u'Pokaż',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Wyłączony',
    'monitorStatusNoService':u'Brak serwisu',
    'monitorStatusOffline':u'Wyłączony',
    'monitorStatusOnline':u'Włączony',
    'monitorStatusUpdating':u'Aktualizacja',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Odinstaluj',
    'monitorUninstallNotRun':u'Nie możesz odinstalować bez praw administratora.\nUruchom komendę dwaguninstall w konsoli.',
    'monitorUpload':u'Wgrywanie',
    'mustAccept':u'Aby kontynuować, musisz wybrać opcję {0}',
    'mustSelectOptions':u'Musisz wybrać opcję.',
    'next':u'Dalej',
    'no':u'Nie',
    'noTryAgain':u'Nie, spróbuj ponownie',
    'notInstalled':u'DWAgent nie zainstalowany.',
    'ok':u'Ok',
    'option':u'Opcja',
    'optionNotValid':u'Wybrana opcja jest nieprawidłowa.',
    'or':u'lub',
    'password':u'Hasło',
    'path':u'Ścieżka',
    'pathCreating':u'Tworzenie folderu...',
    'pathNotCreate':u'Nie można stworzyć folderu. Nieprawidłowa ścieżka, lub odmowa dostępu.',
    'pressEnter':u'Wciśnij enter, aby kontynuować.',
    'privacyPolicy':u'Polityka prywatności',
    'proxyAuthPassword':u'Hasło',
    'proxyAuthUser':u'Użytkownik',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Wprowadź dane proxy.',
    'proxyNone':u'Brak',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Systemowe',
    'reEnterCode':u'Wprowadź kod ponownie',
    'reEnterData':u'Wprowadź dane ponownie',
    'rePassword':u'Powtórz hasło',
    'removeFile':u'Usuwanie pliku...',
    'runWithoutInstallation':u'Uruchom',
    'runWithoutInstallationClosing':u'Zamykanie sesji...',
    'runWithoutInstallationConnecting':u'Otwieranie sesji...',
    'runWithoutInstallationEnd':u'Sesja zakończona.',
    'runWithoutInstallationOnlineBottom':u'UWAGA:\nNie ujawniaj tych informacji ludziom, którym nie ufasz, ani nie pozwalaj na dostęp w żaden inny sposób. Jeśli nie wiesz co robisz, proszę zamknąć tę aplikację.',
    'runWithoutInstallationOnlineBottomPutCode':u'UWAGA:\nAgent jest teraz gotowy do przyjmowania połączeń. Jeśli nie jesteś pewien co robisz, zamknij ten program.',
    'runWithoutInstallationOnlinePassword':u'Hasło: {0}',
    'runWithoutInstallationOnlineTop':u'Sesja jest aktywna.\nAby połączyć się z tym agentem odwiedź https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Sesja jest aktywna.',
    'runWithoutInstallationOnlineUser':u'Użytkownik: {0}',
    'runWithoutInstallationStarting':u'Uruchamianie agenta...',
    'runWithoutInstallationUnexpectedError':u'Niespodziewany błąd.\nNie udało się uruchomić DWAgent. Jeśli problem będzie dalej występować, spróbuj pobrać najnowszą wersję DWAgent, usuń folder \'{0}\' i uruchom DWAgent ponownie.',
    'runWithoutInstallationUpdating':u'Aktualizacja agenta...',
    'runWithoutInstallationWait':u'Oczekiwanie na nowe połączenie (próba {0})...',
    'selectPathInstall':u'Wybierz folder instalacji:',
    'startService':u'Uruchamianie serwisu...',
    'startServiceErr':u'Uruchamianie serwisu nie powiodło się.',
    'termsAndConditions':u'Warunki Użytkowania',
    'titleInstall':u'DWAgent - Instalacja',
    'titleUninstall':u'DWAgent - Deinstalacja',
    'toBack':u'aby wrócić.',
    'toExit':u'aby wyjść.',
    'unexpectedError':u'Niespodziewany błąd.\n{0}',
    'uninstallMonitor':u'Odinstalowywanie monitora...',
    'uninstallService':u'Odinstalowywanie serwisu...',
    'uninstallShortcuts':u'Odinstalowywanie skrótów...',
    'user':u'Użytkownik',
    'validInteger':u'Pole \'{0}\' musi być liczbą całkowitą.',
    'versionInstallNotValid':u'Wersja instalatora nie jest prawidłowa dla Twojego systemu operacyjnego.\nProszę pobrać prawidłową wersję. {0}',
    'waiting':u'Czekam...',
    'warningLoginLogout':u'Aby zmiany weszły w życie, musisz wylogować się i zalogować ponownie.',
    'warningRemovePath':u'Ostrzeżenie. Jeśli folder docelowy istnieje, zostanie usunięty.',
    'warningSpyingTool':u'Nie łącz się z komputerem bez pozwolenia jego użytkownika. Jeśli używasz DWService jako programu szpiegowskiego, możesz łamać prawo swojego kraju.',
    'welcomeLicense':u'Licencja\nTo jest wolne i otwarte oprogramowanie.\nSkłada się z jednego głównego komponentu i kilku dodatkowych, które mogą wykorzystywać inne licencje. Aby dowiedzieć się więcej, odwiedź: https://www.dwservice.net/pl/licenses-sources.html',
    'welcomePrivacyTerms':u'#TERMSANDCONDITIONSLINK, #PRIVACYPOLICYLINK - Instalując program wyrażasz na nie zgodę.',
    'welcomeSecurity':u'Bezpieczeństwo\nAby chronić Twoją prywatność, gwarantujemy, że żadne informacje nie będą gromadzone na naszych serwerach, a komunikacja jest szyfrowana, aby osoby trzecie nie mogły jej odczytać.',
    'welcomeSoftwareUpdates':u'Aktualizacje oprogramowania\nOprogramowanie aktualizuje się automatycznie.',
    'windowsAdminPrivileges':u'Musisz mieć uprawnienia administratora, aby zainstalować DWAgent.\nProszę uruchomić plik wykonywalny z opcją \'uruchom jako administrator\'.',
    'yes':u'Tak'
}
                                                          ui/messages/uk.py                                                                                   0000644 0001750 0001750 00000037050 14113374076 013574  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Я приймаю',
    'agentName':u'Назва агента',
    'alreadyInstalled':u'DWAgent вже встановлено.\n\nАгент автоматично оновлюється до останньої версії. Це означає, що вам не потрібно вручну встановлювати новіші оновлення.',
    'back':u'Назад',
    'cancel':u'Відміна',
    'cancelInstall':u'Встановлення скасовано.',
    'cancelUninstall':u'Видалення було скасовано.',
    'checkInstallCode':u'Перевірка коду встановлення...',
    'chooseProxyType':u'Який тип proxy ви хочете використовувати?',
    'close':u'Закрити',
    'code':u'Код',
    'commands':u'Команди',
    'configureAgent':u'Налаштування агента',
    'configureAgentDisabled':u'Агент вимкнений.',
    'configureAgentEnabled':u'Агент ввімкнено.',
    'configureChangeInstallKey':u'Змінити інсталяційний код',
    'configureChooseMonitorTrayIconVisibility':u'Хочете показати значок монітора у треї?',
    'configureChooseOperation':u'Виберіть операцію:',
    'configureDesktopNotification':u'Сповіщення на робочому столі',
    'configureDesktopNotificationOK':u'Сповіщення на робочому столі налаштовано успішно.',
    'configureDisableAgent':u'Вимкннути агент',
    'configureDisableAgentQuestion':u'Ви хочете вимкнути агента?',
    'configureEnableAgent':u'Увімкнути агент',
    'configureEnableAgentQuestion':u'Хочете увімкнути агента?',
    'configureEnd':u'Конфігурування завершена.',
    'configureErrorConnection':u'Помилка з\'єднання. Перевірте, чи запущено службу DWAgent.',
    'configureExit':u'вихід',
    'configureInsertPassword':u'Введіть пароль конфігурації:',
    'configureInstallAgent':u'Як ви вважаєте за краще налаштувати агента?',
    'configureInstallCode':u'Введення коду встановлення',
    'configureInstallNewAgent':u'Створення нового агента',
    'configureInvalidPassword':u'Недійсний пароль.',
    'configureKeyInstalled':u'Ключ успішно встановлено.',
    'configureLater':u'Налаштувати пізніше',
    'configureMonitor':u'Налаштувати монітор',
    'configurePassword':u'Налаштувати пароль',
    'configurePasswordErrNoMatch':u'Пароль не співпадає.',
    'configurePasswordUpdated':u'Пароль оновлено.',
    'configureProxy':u'Налаштувати проксі',
    'configureProxyEnd':u'Проксі налаштовано успішно.',
    'configureRemovePassword':u'Видалити пароль',
    'configureRemovePasswordQuestion':u'Ви хочете видалити пароль?',
    'configureSetPassword':u'Встановити пароль',
    'configureTitle':u'DWAgent - конфігурація',
    'configureTrayIconOK':u'Видимість значка у треї успішно налаштована.',
    'configureTrayIconVisibility':u'Видимість значка у треї',
    'configureUninstallKeyQuestion':u'Видалити поточний код установки?',
    'configureUninstallationKey':u'Видалення',
    'confirmExit':u'Ви впевнені що хочете вийти?',
    'confirmInstall':u'Ви хочете встановити DWAgent у \'{0}\'?',
    'confirmUninstall':u'Ви хочете видалити DWAgent?',
    'copyFiles':u'Копіювання файлів ...',
    'createNewAgent':u'Створення агента ...',
    'decline':u'Я не приймаю',
    'desktopNotificationAutoHide':u'Автоматично приховувати',
    'desktopNotificationNone':u'Жоден',
    'desktopNotificationVisible':u'видимий',
    'downloadFile':u'Скачування файлу {0}...',
    'dwsPassword':u'Пароль DWS',
    'dwsUser':u'Користувач DWS',
    'endInstall':u'Встановлення завершено.',
    'endInstallConfigLater':u'Встановлення завершено.\nАгент не налаштований. Ви можете продовжити налаштування пізніше.',
    'endUninstall':u'Видалення завершено.',
    'enter':u'введіть',
    'enterInstallCode':u'Введіть код установки',
    'enterInstallNewAgent':u'Введіть дані, щоб створити нового агента:',
    'enterRunCode':u'Введіть код з\'єднання',
    'error':u'Помилка',
    'errorAgentAlreadyExsists':u'Агент {0} вже існує.',
    'errorAgentMax':u'Перевищено максимальну кількість агентів.',
    'errorAgentNameNotValid':u'Назва агента недійсна. Не можна використовувати символи  / \ | # @ : .',
    'errorConnectionConfig':u'Помилка з\'єднання. Перевірте, чи запущено службу DWAgent.',
    'errorConnectionQuestion':u'Помилка з\'єднання. Перевірте підключення до Інтернету або налаштування брандмауера.\nВи хочете налаштувати проксі-сервер?',
    'errorInvalidCode':u'Введений код недійсний.',
    'errorInvalidUserPassword':u'Недійсний користувач або пароль.',
    'fieldRequired':u'Поле \'{0}\' є обов\'язковим.',
    'install':u'Встановити',
    'installMonitor':u'Встановлення монітора ...',
    'installMonitorErr':u'Помилка встановлення монітора.',
    'installService':u'Встановлення служби ...',
    'installServiceErr':u'Помилка інсталяції служби.',
    'installShortcuts':u'Встановлення ярликів ...',
    'installShortcutsErr':u'Не вдалося встановити ярлики інсталяції.',
    'linuxRootPrivileges':u'Для встановлення DWAgent необхідно мати права адміністратора.\nЗапустіть скрипт від імені адміністратора.',
    'menuConfigure':u'Налаштувати',
    'menuMonitor':u'Монітор',
    'menuUninstall':u'Видалити',
    'missingInfoFile':u'Файл info.json не знайдено.',
    'missingNative':u'Native не знайдено',
    'missingRuntime':u'Runtime не знайдено.',
    'monitorActive':u'Активний',
    'monitorAgentDisabled':u'Агент вимкнено.',
    'monitorAgentEnabled':u'Агент увімкнено.',
    'monitorConfigure':u'Налаштувати',
    'monitorConnections':u'З\'єднання',
    'monitorCurrentActivities':u'Поточна діяльність',
    'monitorDisable':u'Вимкнути',
    'monitorDisableAgentQuestion':u'Ви хочете вимкнути агента?',
    'monitorDownload':u'Скачати',
    'monitorEnable':u'Увімкнути',
    'monitorEnableAgentQuestion':u'Хочете увімкнути агента?',
    'monitorEnterPassword':u'Введіть пароль:',
    'monitorErrorConnectionConfig':u'Помилка з\'єднання. Перевірте, чи запущено службу DWAgent.',
    'monitorHide':u'Приховати',
    'monitorInvalidPassword':u'Недійсний пароль.',
    'monitorNoActivities':u'Жодної діяльності',
    'monitorScreenCapture':u'Скріншот',
    'monitorSession':u'Сесія',
    'monitorShellSession':u'Оболонка',
    'monitorShow':u'Показати',
    'monitorStatus':u'Стан',
    'monitorStatusDisabled':u'Вимкнено',
    'monitorStatusNoService':u'Не обслуговується',
    'monitorStatusOffline':u'Офлайн',
    'monitorStatusOnline':u'Онлайн',
    'monitorStatusUpdating':u'Оновлення',
    'monitorTitle':u'DWAgent - монітор',
    'monitorUninstall':u'Видалити',
    'monitorUninstallNotRun':u'Ви не можете видалити без прав адміністратора.\nЗапустіть команду dwaguninstall в оболонці.',
    'monitorUpload':u'Завантажити',
    'mustAccept':u'Щоб продовжити, потрібно вибрати опцію {0}',
    'mustSelectOptions':u'Необхідно вибрати опцію.',
    'next':u'Далі',
    'no':u'Ні',
    'noTryAgain':u'Ні, спробуйте ще раз',
    'notInstalled':u'DWAgent не встановлено.',
    'ok':u'Ok',
    'option':u'опція',
    'optionNotValid':u'Вибрана опція недійсна.',
    'or':u'або',
    'password':u'Пароль',
    'path':u'Шлях до',
    'pathCreating':u'Створення папки ...',
    'pathNotCreate':u'Не вдалося створити папку. Недійсний шлях або дозвіл заборонено.',
    'pressEnter':u'Натисніть enter, щоб продовжити.',
    'privacyPolicy':u'Політика конфіденційності',
    'proxyAuthPassword':u'Пароль',
    'proxyAuthUser':u'Користувач',
    'proxyHost':u'Хост',
    'proxyHttp':u'Http',
    'proxyInfo':u'Вставити інформацію про проксі.',
    'proxyNone':u'Немає',
    'proxyPort':u'Порт',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Система',
    'reEnterCode':u'Введіть код повторно',
    'reEnterData':u'Введіть дані повторно',
    'rePassword':u'Повторіть пароль',
    'removeFile':u'Видалення файлу ...',
    'runWithoutInstallation':u'Запустити',
    'runWithoutInstallationClosing':u'Закриття сеансу ...',
    'runWithoutInstallationConnecting':u'Відкриття сеансу ...',
    'runWithoutInstallationEnd':u'Сесія закінчилася.',
    'runWithoutInstallationOnlineBottom':u'УВАГА:\nНе розголошувати цю інформацію людям, яким не довіряєте, інакше дозвольте їм отримати доступ до цього агента. Отже, якщо ви не впевнені, що робите, закрийте цю програму.',
    'runWithoutInstallationOnlineBottomPutCode':u'УВАГА:\nТепер агент готовий приймати з\'єднання. Отже, якщо ви не впевнені, що робите, закрийте цю програму.',
    'runWithoutInstallationOnlinePassword':u'Пароль: {0}',
    'runWithoutInstallationOnlineTop':u'Сеанс активний.\nЩоб підключитися до цього агента, перейдіть на сторінку https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Сеанс активний.',
    'runWithoutInstallationOnlineUser':u'Користувач: {0}',
    'runWithoutInstallationStarting':u'Запуск агента ...',
    'runWithoutInstallationUnexpectedError':u'Неочікувана помилка.\nНе вдалося запустити DWAgent. Якщо проблема не зникає, спробуйте скачати останню версію DWAgent, видаліть папку \'{0}\' і знову запустіть DWAgent.',
    'runWithoutInstallationUpdating':u'Оновлення агента ...',
    'runWithoutInstallationWait':u'Зачекайте, поки відбуватиметься нове з\'єднання (спроба {0}) ...',
    'selectPathInstall':u'Виберіть шлях встановлення:',
    'startService':u'Запуск служби ...',
    'startServiceErr':u'Помилка запуску служби.',
    'termsAndConditions':u'Правила та умови',
    'titleInstall':u'DWAgent - Установка',
    'titleUninstall':u'DWAgent - Видалення',
    'toBack':u'повернутися.',
    'toExit':u'до виходу.',
    'unexpectedError':u'Неочікувана помилка.\n{0}',
    'uninstallMonitor':u'Видалення монітора ...',
    'uninstallService':u'Видалення служби ...',
    'uninstallShortcuts':u'Видалення ярликів ...',
    'user':u'Користувач',
    'validInteger':u'Поле \'{0}\' має бути цілим числом.',
    'versionInstallNotValid':u'Версія інсталятора неправильна для вашої операційної системи.\nСкачайте правильну версію. {0}',
    'waiting':u'Очікування ...',
    'warningLoginLogout':u'Щоб ця зміна набрала чинності, користувач повинен вийти та ввійти ще раз.',
    'warningRemovePath':u'Попередження: папка призначення вже існує, вона буде видалена.',
    'warningSpyingTool':u'Зверніть увагу, що ви не можете отримати доступ до віддаленого комп’ютера без згоди його користувача. Використовуючи DWService як інструмент шпигунства, ви, можливо, порушуєте закони вашої країни проживання.',
    'welcomeLicense':u'Ліцензія\nЦе програмне забезпечення є вільним і з відкритим кодом.\nВін складається з одного основного компонента і декількох додаткових компонентів, визначених "app", які можуть регулюватися різними ліцензіями. Додаткова інформація-на сайті: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Продовжуючи встановлення або запуск цього програмного забезпечення, ви погоджуєтесь з #TERMSANDCONDITIONS і #PRIVACYPOLICY',
    'welcomeSecurity':u'Безпека\nЩоб захистити вашу конфіденційність, ми гарантуємо, що на наших серверах не буде збережено жодної інформації, а зв\'язок буде зашифрованим, тому треті сторони не зможуть їх прочитати.',
    'welcomeSoftwareUpdates':u'Оновлення програмного забезпечення\nОновлення цього програмного забезпечення є автоматичними.',
    'windowsAdminPrivileges':u'Для встановлення DWAgent необхідно мати права адміністратора.\nБудь ласка, запустіть виконуваний файл із \'запустити від імені адміністратора\'.',
    'yes':u'Так'
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ui/messages/no.py                                                                                   0000644 0001750 0001750 00000023666 13560001665 013575  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Jeg godtar',
    'agentName':u'Agentnavn',
    'alreadyInstalled':u'DWAgent er allerede installert.\n\nAgenten vil automatisk oppdatere seg til nyere versjon. Dette betyr at du aldri mer vil trenge å manuelt installere oppdateringer.',
    'back':u'Tilbake',
    'cancel':u'Avbryt',
    'cancelInstall':u'Installasjonen ble kanselert.',
    'cancelUninstall':u'Jeg godtar',
    'checkInstallCode':u'Sjekker installasjonskode...',
    'chooseProxyType':u'Hvilken proxy vil du bruke?',
    'close':u'Lukk',
    'code':u'Kode',
    'commands':u'Kommandoer',
    'configureAgent':u'Konfigurer agent',
    'configureAgentDisabled':u'Agenten er deaktivert.',
    'configureAgentEnabled':u'Agenten er på.',
    'configureChangeInstallKey':u'Endre installasjonskode',
    'configureChooseMonitorTrayIconVisibility':u'Vil du vise agenten i oppgavelinjen?',
    'configureChooseOperation':u'Vennligst velg en oppgave:',
    'configureDisableAgent':u'Deaktiver agent',
    'configureDisableAgentQuestion':u'Ønsker du å deaktivere agenten?',
    'configureEnableAgent':u'Slå på agent',
    'configureEnableAgentQuestion':u'Ønsker du å slå på agenten?',
    'configureEnd':u'Konfigurasjonen er fullført.',
    'configureErrorConnection':u'Tilkoblingsfeil. Vær vennlig å sjekke om DWAgent tjenesten kjører.',
    'configureExit':u'Gå ut',
    'configureInsertPassword':u'Venligst skriv konfigurasjonspassord:',
    'configureInstallAgent':u'Hvordan foretrekker du å konfigurere agenten?',
    'configureInstallCode':u'Skriv inn installasjonskoden',
    'configureInstallNewAgent':u'Lag ny agent',
    'configureInvalidPassword':u'Ugyldig passord',
    'configureKeyInstalled':u'Nøkkel ble installert',
    'configureLater':u'Konfigurer senere',
    'configureMonitor':u'Konfigurer monitor',
    'configurePassword':u'Konfigurer passord',
    'configurePasswordErrNoMatch':u'Passordene er ikke like',
    'configurePasswordUpdated':u'Passord oppdatert.',
    'configureProxy':u'Konfigurer proxy.',
    'configureProxyEnd':u'Proxy er nå konfigurert.',
    'configureRemovePassword':u'Fjern passord',
    'configureRemovePasswordQuestion':u'Ønsker du å fjerne passordet?',
    'configureSetPassword':u'Sett passord',
    'configureTitle':u'DWAgent - konfigurasjon',
    'configureTrayIconOK':u'Skuff ikon synlighet, konfigurert vellykket.',
    'configureTrayIconVisibility':u'Skuff ikon synlighet',
    'configureUninstallKeyQuestion':u'Fjern den gjeldende installasjonskoden?',
    'configureUninstallationKey':u'Avinstallerer...',
    'confirmExit':u'Ønsker du å avslutte?',
    'confirmInstall':u'Vil du installere DWAgent til \'{0}\'?',
    'confirmUninstall':u'Ønsker du å fjerne DWAgent?',
    'copyFiles':u'Kopierer filer...',
    'createNewAgent':u'Oppretter agent...',
    'decline':u'Jeg godtar ikke',
    'downloadFile':u'Last ned fil {0}...',
    'dwsPassword':u'DWS passord',
    'dwsUser':u'DWS bruker',
    'endInstall':u'Installasjonen er fullført.',
    'endInstallConfigLater':u'Installasjon er fullført.\nAgenten har ikke blitt konfigurert. Du kan fortsette med konfigurasjonen senere.',
    'endUninstall':u'Avinstallering fullført.',
    'enter':u'skriv inn',
    'enterInstallCode':u'Skriv inn installasjonskoden',
    'enterInstallNewAgent':u'Angi data for å lage en ny agent:',
    'enterRunCode':u'Skriv inn tilkoblingskoden',
    'error':u'Feil',
    'errorAgentAlreadyExsists':u'Agenten {0} finnes allerede.',
    'errorAgentMax':u'Overgått maksimum antall agenter.',
    'errorAgentNameNotValid':u'Agent navnet er ikke gyldig. Du kan ikke bruke symbolene / \ | # @ : .',
    'errorConnectionConfig':u'Tilkoblingsfeil. Vær så snill å sjekke om DWAgent tjenesten er startet.',
    'errorConnectionQuestion':u'Tilkoblingsfeil. Vær så snill å sjekke internett tilkoblingen din eller brannmur konfigurasjonen.\nVil du konfigurere proxy?',
    'errorInvalidCode':u'Koden angitt er invalid.',
    'errorInvalidUserPassword':u'Ugyldig bruker eller passord.',
    'fieldRequired':u'Feltet \'{0}\' er krevet.',
    'install':u'Installer',
    'installMonitor':u'Installerer monitor...',
    'installMonitorErr':u'Installasjon monitor feilet.',
    'installService':u'Installerer tjeneste...',
    'installServiceErr':u'Installasjon tjeneste feilet.',
    'installShortcuts':u'Installerer snarveier...',
    'installShortcutsErr':u'Installasjon snarveier feilet.',
    'linuxRootPrivileges':u'Du må ha rot privilegier for å installere DWAgent.\nVennligst start skriptet ved bruk av rot bruker.',
    'menuConfigure':u'Konfigurer',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Avinstaller',
    'missingInfoFile':u'Fil info.json ikke funnet.',
    'missingNative':u'Native ikke funnet.',
    'missingRuntime':u'Runtime ikke funnet.',
    'monitorAgentDisabled':u'Agent deaktivert.',
    'monitorAgentEnabled':u'Agent aktivert.',
    'monitorConfigure':u'Konfigurer',
    'monitorConnections':u'Tilkoblinger',
    'monitorDisable':u'Deaktiver',
    'monitorDisableAgentQuestion':u'Vil du deaktivere agenten?',
    'monitorEnable':u'Aktiver',
    'monitorEnableAgentQuestion':u'Vil du aktivere agenten?',
    'monitorEnterPassword':u'Angi passord:',
    'monitorErrorConnectionConfig':u'Tilkoblingsfeil. Vær så snill å sjekke om DWAgent tjenesten er startet.',
    'monitorHide':u'Skjul',
    'monitorInvalidPassword':u'Ugyldig passord.',
    'monitorShow':u'Vis',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Deaktivert',
    'monitorStatusNoService':u'Ingen tjeneste',
    'monitorStatusOffline':u'Av nett',
    'monitorStatusOnline':u'På nett',
    'monitorStatusUpdating':u'Oppdaterer',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Avinstaller',
    'monitorUninstallNotRun':u'Du kan ikke installere uten rot permisjoner.\nKjør kommandoen dwaguninstall i shell.',
    'mustAccept':u'For å fortsette, må du velge alternativ {0}',
    'mustSelectOptions':u'Du må velge et alternativ.',
    'next':u'Neste',
    'no':u'Nei',
    'noTryAgain':u'Nei, prøv igjen',
    'notInstalled':u'DWAgent ikke installert.',
    'ok':u'Ok',
    'option':u'Alternativ',
    'optionNotValid':u'Alternativ valgt er ugyldig.',
    'or':u'eller',
    'password':u'Passord',
    'path':u'Sti',
    'pathCreating':u'Mappe opprettelse...',
    'pathNotCreate':u'Kunne ikke lage mappe. Ugyldig sti eller permisjon benektet.',
    'pressEnter':u'Trykk på enter for å fortsette.',
    'proxyAuthPassword':u'Passord',
    'proxyAuthUser':u'Bruker',
    'proxyHost':u'Vert',
    'proxyHttp':u'Http',
    'proxyInfo':u'Sett inn proxy informasjon.',
    'proxyNone':u'Ingen',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'System',
    'reEnterCode':u'Skriv koden på nytt',
    'reEnterData':u'Skriv data-en på nytt',
    'rePassword':u'Skriv passord igjen',
    'removeFile':u'Fjerner fil...',
    'runWithoutInstallation':u'Kjør',
    'runWithoutInstallationClosing':u'Lukker økt...',
    'runWithoutInstallationConnecting':u'Åpner økt...',
    'runWithoutInstallationEnd':u'Økt avsluttet.',
    'runWithoutInstallationOnlineBottom':u'ADVARSEL:\nIkke del denne informasjonen med folk som ikke er klarert, ellers vil du tillate dem tilgang til denne agenten. Dersom du ikke er sikker på hva du gjør, vær så snill å lukke denne applikasjonen.',
    'runWithoutInstallationOnlineBottomPutCode':u'ADVARSEL:\nAgenten er nå klar til tilkobling',
    'runWithoutInstallationOnlinePassword':u'Passord: {0}',
    'runWithoutInstallationOnlineTop':u'Denne økten er aktiv.\nFor å koble til denne agenten gå til https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Økten er aktiv.',
    'runWithoutInstallationOnlineUser':u'Bruker: {0}',
    'runWithoutInstallationStarting':u'Agent oppstart...',
    'runWithoutInstallationUnexpectedError':u'Uforventet feil.\nDet var ikke mulig å starte DWAgent. Hvis problemet fortsetter, prøv å laste ned den nyeste utgaven av DWAgent, slett mappen \'{0}\' og kjør DWAgent igjen.',
    'runWithoutInstallationUpdating':u'Agent oppdatering...',
    'runWithoutInstallationWait':u'Vent på den nye tilkoblingen i prosess (forsøk {0})...',
    'selectPathInstall':u'Velg en ny installasjons vei:',
    'startService':u'Starter tjenesten...',
    'startServiceErr':u'Tjeneste start feilet.',
    'titleInstall':u'DWAgent - Installasjon',
    'titleUninstall':u'DWAgent - Avinstallasjon',
    'toBack':u'å gå tilbake.',
    'toExit':u'å gå ut av.',
    'unexpectedError':u'Uforventet feil.\n{0}',
    'uninstallMonitor':u'Avinstallerer monitor...',
    'uninstallService':u'Avinstallerer tjeneste...',
    'uninstallShortcuts':u'Avinstallerer snarveier...',
    'user':u'Bruker',
    'validInteger':u'Feltet \'{0}\' må være et integer.',
    'versionInstallNotValid':u'Versjonen av installatøren er ikke korrekt for ditt operativsystem.\nVær så snill å laste ned korrekt versjon. {0}',
    'waiting':u'Venter...',
    'warningRemovePath':u'Advarsel destinasjons mappen eksisterer allerede da blir den slettet',
    'welcomeLicense':u'Lisens\nDette programvare er gratis og åpen kilde.\nDen består av en hoved komponent og flere tilbehør komponenter definert "app" som kan bli styrt av forskjellige lisenser. For mer informasjon besøk: https://www.dwservice.net/en/licenses-sources.html',
    'welcomeSecurity':u'Sikkerhet\nFor å beskytte ditt privatliv garanterer vi at ingen informasjon vil bli lagret i våre servere og kommunikasjoner er kryptert så tredjepartier ikke kan lese de.',
    'welcomeSoftwareUpdates':u'Programvare oppdateringer\nOppdateringene til denne programvaren er automatisk.',
    'windowsAdminPrivileges':u'Du må ha administrator privilegier for å installere DWAgent.\nVær så snill å starte den kjørbare med \'kjør som administrator\'.',
    'yes':u'Ja'
}
                                                                          ui/messages/default.py                                                                              0000755 0001750 0001750 00000026112 14127306343 014576  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'I accept',
    'agentName':u'Agent name',
    'alreadyInstalled':u'DWAgent already installed.\n\nThe agent automatically updates to the last version. It means that you do not need to manually install newer updates.',
    'back':u'Back',
    'cancel':u'Cancel',
    'cancelInstall':u'The installation was canceled.',
    'cancelUninstall':u'The uninstallation was canceled.',
    'checkInstallCode':u'Checking installation code...',
    'chooseProxyType':u'What proxy type do you want to use?',
    'close':u'Close',
    'code':u'Code',
    'commands':u'Commands',
    'configureAgent':u'Configure agent',
    'configureAgentDisabled':u'Agent disabled.',
    'configureAgentEnabled':u'Agent enabled.',
    'configureChangeInstallKey':u'Change installation code',
    'configureChooseMonitorTrayIconVisibility':u'Do you want show monitor icon in tray?',
    'configureChooseOperation':u'Please choose an operation:',
    'configureDisableAgent':u'Disable agent',
    'configureDisableAgentQuestion':u'Do you want disable the agent?',
    'configureEnableAgent':u'Enable agent',
    'configureEnableAgentQuestion':u'Do you want enable the agent?',
    'configureEnd':u'Configuration has been completed.',
    'configureErrorConnection':u'Connection error. Please check if the DWAgent service is running.',
    'configureExit':u'Exit',
    'configureInsertPassword':u'Please enter config password:',
    'configureInstallAgent':u'How would you like to configure the agent?',
    'configureInstallCode':u'Enter the installation code',
    'configureInstallNewAgent':u'Creating a new agent',
    'configureInvalidPassword':u'Invalid password.',
    'configureKeyInstalled':u'Key installed successfully.',
    'configureLater':u'Configure later',
    'configureMonitor':u'Configure monitor',
    'configurePassword':u'Edit configuration password',
    'configurePasswordErrNoMatch':u'The passwords do not match.',
    'configurePasswordUpdated':u'Password updated.',
    'configureProxy':u'Configure proxy',
    'configureProxyEnd':u'Proxy configured successfully.',
    'configureRemovePassword':u'Remove password',
    'configureRemovePasswordQuestion':u'Do you want remove the password?',
    'configureSetPassword':u'Set password',
    'configureTitle':u'DWAgent - Configuration',
    'configureTrayIconOK':u'Tray icon configured successfully.',
    'configureTrayIconVisibility':u'Tray icon visibility',
    'configureUninstallKeyQuestion':u'Uninstall the current installation code?',
    'configureUninstallationKey':u'Uninstallation...',
    'confirmExit':u'Are you sure you want to exit?',
    'confirmInstall':u'Would you want install DWAgent to \'{0}\'?',
    'confirmUninstall':u'Do you want remove DWAgent?',
    'copyFiles':u'Copying files...',
    'createNewAgent':u'Agent creation in progress...',
    'decline':u'I do not accept',
    'downloadFile':u'Downloading file {0}...',
    'dwsPassword':u'DWS password',
    'dwsUser':u'DWS user',
    'endInstall':u'Installation has been completed.',
    'endInstallConfigLater':u'Installation has completed.\nThe agent has not been configured. You can still create the configuration later.',
    'endUninstall':u'Uninstallation has completed.',
    'enter':u'enter',
    'enterInstallCode':u'Enter the installation code',
    'enterInstallNewAgent':u'Enter data to create a new agent:',
    'enterRunCode':u'Enter the connection code',
    'error':u'Error',
    'errorAgentAlreadyExsists':u'The agent {0} already exists.',
    'errorAgentMax':u'Exceeded maximum number of agents.',
    'errorAgentNameNotValid':u'The agent name is not valid. You can not use the characters / \ | # @ : .',
    'errorConnectionConfig':u'Connection error. Please check if the DWAgent service is running.',
    'errorConnectionQuestion':u'Connection error. Please check your internet connection or firewall.\nDo you want to configure a proxy?',
    'errorInvalidCode':u'The code entered is invalid.',
    'errorInvalidUserPassword':u'Invalid user or password.',
    'fieldRequired':u'The field \'{0}\' is required.',
    'install':u'Install',
    'installMonitor':u'Installing monitor...',
    'installMonitorErr':u'Installation monitor failed.',
    'installService':u'Installing service...',
    'installServiceErr':u'Service installation failed.',
    'installShortcuts':u'Installing shortcuts...',
    'installShortcutsErr':u'Shortcut installation failed.',
    'linuxRootPrivileges':u'You must have root privileges to install DWAgent.\nPlease run the script with sudo or as root.',
    'menuConfigure':u'Configure',
    'menuMonitor':u'Monitor',
    'menuUninstall':u'Uninstall',
    'missingInfoFile':u'File info.json not found.',
    'missingNative':u'Native not found.',
    'missingRuntime':u'Runtime not found.',
    'monitorAgentDisabled':u'Agent disabled.',
    'monitorAgentEnabled':u'Agent enabled.',
    'monitorConfigure':u'Configure',
    'monitorConnections':u'Connections',
    'monitorDisable':u'Disable',
    'monitorDisableAgentQuestion':u'Do you want disable the agent?',
    'monitorEnable':u'Enable',
    'monitorEnableAgentQuestion':u'Do you want enable the agent?',
    'monitorEnterPassword':u'Enter password:',
    'monitorErrorConnectionConfig':u'Connection error. Please check if the DWAgent service is running.',
    'monitorHide':u'Hide',
    'monitorInvalidPassword':u'Invalid password.',
    'monitorShow':u'Show',
    'monitorStatus':u'Status',
    'monitorStatusDisabled':u'Disabled',
    'monitorStatusNoService':u'No service',
    'monitorStatusOffline':u'Offline',
    'monitorStatusOnline':u'Online',
    'monitorStatusUpdating':u'Updating',
    'monitorTitle':u'DWAgent - Monitor',
    'monitorUninstall':u'Uninstall',
    'monitorUninstallNotRun':u'You can not uninstall without root permissions.\nRun the command dwaguninstall with sudo or as root.',
    'mustAccept':u'In order to continue, you must select the option {0}',
    'mustSelectOptions':u'You must select an option.',
    'next':u'Next',
    'no':u'No',
    'noTryAgain':u'No, try again',
    'notInstalled':u'DWAgent not installed.',
    'ok':u'OK',
    'option':u'Option',
    'optionNotValid':u'Selected option is invalid.',
    'or':u'or',
    'password':u'Password',
    'path':u'Path',
    'pathCreating':u'Folder creation...',
    'pathNotCreate':u'Could not create the folder. Invalid path or permission denied.',
    'pressEnter':u'Press enter to continue.',
    'proxyAuthPassword':u'Password',
    'proxyAuthUser':u'User',
    'proxyHost':u'Host',
    'proxyHttp':u'HTTP',
    'proxyInfo':u'Insert proxy info.',
    'proxyNone':u'None',
    'proxyPort':u'Port',
    'proxySocks4':u'SOCKS4',
    'proxySocks4a':u'SOCKS4a',
    'proxySocks5':u'SOCKS5',
    'proxySystem':u'System',
    'reEnterCode':u'Re-enter the code',
    'reEnterData':u'Re-enter the data',
    'rePassword':u'Retype Password',
    'removeFile':u'Removing file...',
    'runWithoutInstallation':u'Run',
    'runWithoutInstallationClosing':u'Closing session...',
    'runWithoutInstallationConnecting':u'Opening session...',
    'runWithoutInstallationEnd':u'Session ended.',
    'runWithoutInstallationOnlineBottom':u'WARNING:\nDo not disclose this information to people you don\'t trust. It will allow them to access this device. If you are not sure what are you doing, please close this application.',
    'runWithoutInstallationOnlineBottomPutCode':u'WARNING:\nThe agent is now ready to accept a connection. If you are not sure what are you doing, please close this application.',
    'runWithoutInstallationOnlinePassword':u'Password: {0}',
    'runWithoutInstallationOnlineTop':u'The session is active.\nTo connect to this agent go to https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'The session is active.',
    'runWithoutInstallationOnlineUser':u'User: {0}',
    'runWithoutInstallationStarting':u'Agent startup...',
    'runWithoutInstallationUnexpectedError':u'Unexpected error.\nDWAgent was unable to start. If the problem persists, please download the latest release of DWAgent, delete the folder \'{0}\' and run DWAgent again.',
    'runWithoutInstallationUpdating':u'Agent update...',
    'runWithoutInstallationWait':u'Wait for the new connection in progress (attempt {0})...',
    'selectPathInstall':u'Select the installation path:',
    'startService':u'Starting service...',
    'startServiceErr':u'Failed to start service.',
    'titleInstall':u'DWAgent - Installation',
    'titleUninstall':u'DWAgent - Uninstallation',
    'toBack':u'to go back.',
    'toExit':u'to exit.',
    'unexpectedError':u'Unexpected error.\n{0}',
    'uninstallMonitor':u'Uninstalling monitor...',
    'uninstallService':u'Uninstalling service...',
    'uninstallShortcuts':u'Uninstalling shortcuts...',
    'user':u'User',
    'validInteger':u'The field \'{0}\' must be an integer.',
    'versionInstallNotValid':u'This version of the installer is not correct for your operating system.\nPlease download the correct version. {0}',
    'waiting':u'Waiting...',
    'warningRemovePath':u'Warning: the destination folder already exists and will be deleted.',
    'welcomeLicense':u'License\nThis software is free and open source.\nIt consists of one main component released under the MPLv2 license and several additional components that are governed by different licenses. For more information, visit: https://www.dwservice.net/en/licenses-sources.html',
    'welcomeSecurity':u'Security\nTo protect your privacy we don\'t store information from the agent on our servers. Communications between users, our servers and agents are encrypted so that third parties can\'t access them.',
    'welcomeSoftwareUpdates':u'Software updates\nThis software updates automatically',
    'welcomePrivacyTerms':u'By proceeding with the installation or running this software you agree to the #TERMSANDCONDITIONS and the #PRIVACYPOLICY',
    'termsAndConditions': u'Terms and Conditions',
    'privacyPolicy': u'Privacy policy',
    'windowsAdminPrivileges':u'You must have administrative privileges to install DWAgent.\nPlease right click the executable and click \'run as administrator\' to start the installer.',
    'yes':u'Yes',
    'monitorCurrentActivities': u'Current activities',
    'monitorNoActivities': u'No activities',
    'monitorSession': u'Session',
    'monitorScreenCapture': u'Screen access',
    'monitorShellSession': u'Shell access',
    'monitorDownload': u'Download',
    'monitorUpload': u'Upload',
    'monitorActive': u'active',
    'configureDesktopNotification': u'Desktop notification',
    'configureDesktopNotificationOK': u'Desktop notification configured successfully.',
    'desktopNotificationVisible': u'Visible',
    'desktopNotificationAutoHide': u'Automatically hide',
    'desktopNotificationNone': u'None',
    'warningSpyingTool': u'Please be aware that you may not access a remote computer without the consent of its user. By using DWService as a spying tool you may be infringing laws in your country of residence.',
    'warningLoginLogout': u'For this change to take effect, the user must logout and login again.'
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                      ui/messages/ru.py                                                                                   0000644 0001750 0001750 00000037137 14137472002 013603  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

data={
    'accept':u'Принимаю',
    'agentName':u'Имя агента',
    'alreadyInstalled':u'DWAgent уже установлен.\n\nАгент автоматически обновляется до последней версии. Это означает, что вам не нужно вручную устанавливать новые обновления.',
    'back':u'Назад',
    'cancel':u'Отмена',
    'cancelInstall':u'Установка была отменена.',
    'cancelUninstall':u'Деинсталляция была отменена.',
    'checkInstallCode':u'Проверка кода установки...',
    'chooseProxyType':u'Какой тип прокси вы хотите использовать?',
    'close':u'Закрыть',
    'code':u'Код',
    'commands':u'Команды',
    'configureAgent':u'Настроить агента',
    'configureAgentDisabled':u'Агент отключен.',
    'configureAgentEnabled':u'Агент включен.',
    'configureChangeInstallKey':u'Сменить код установки',
    'configureChooseMonitorTrayIconVisibility':u'Показывать значок монитора в трее?',
    'configureChooseOperation':u'Пожалуйста, выберите дейстие:',
    'configureDesktopNotification':u'Уведомления на рабочем столе',
    'configureDesktopNotificationOK':u'Уведомления на рабочем столе настроены.',
    'configureDisableAgent':u'Отключить агента',
    'configureDisableAgentQuestion':u'Вы хотите отключить агента?',
    'configureEnableAgent':u'Включить агента',
    'configureEnableAgentQuestion':u'Вы хотите включить агента?',
    'configureEnd':u'Настройка завершена.',
    'configureErrorConnection':u'Ошибка соединения. Проверьте, что служба DWAgent запущена.',
    'configureExit':u'Выход',
    'configureInsertPassword':u'Пожалуйста, вставьте пароль конфигурации:',
    'configureInstallAgent':u'Как вы хотите настроить агента?',
    'configureInstallCode':u'Введите код установки',
    'configureInstallNewAgent':u'Создание нового агента',
    'configureInvalidPassword':u'Неверный пароль.',
    'configureKeyInstalled':u'Ключ установлен успешно.',
    'configureLater':u'Настроить позже',
    'configureMonitor':u'Настроить мониторинг',
    'configurePassword':u'Настроить пароль',
    'configurePasswordErrNoMatch':u'Пароль не совпадает.',
    'configurePasswordUpdated':u'Пароль обновлен.',
    'configureProxy':u'Настроить прокси',
    'configureProxyEnd':u'Прокси настроен успешно.',
    'configureRemovePassword':u'Убрать пароль',
    'configureRemovePasswordQuestion':u'Хотите убрать пароль?',
    'configureSetPassword':u'Установить пароль',
    'configureTitle':u'DWAgent - Настройки',
    'configureTrayIconOK':u'Видимость значка в трее настроена успешно.',
    'configureTrayIconVisibility':u'Видимость значка в трее',
    'configureUninstallKeyQuestion':u'Удалить текущий код установки?',
    'configureUninstallationKey':u'Удаление...',
    'confirmExit':u'Действительно выйти?',
    'confirmInstall':u'Хотите установить DWAgent на \'{0}\'?',
    'confirmUninstall':u'Хотите удалить DWAgent?',
    'copyFiles':u'Копирую...',
    'createNewAgent':u'Создание агента...',
    'decline':u'Не принимаю',
    'desktopNotificationAutoHide':u'Автоматическое скрытие уведомления',
    'desktopNotificationNone':u'Без уведомления',
    'desktopNotificationVisible':u'Видимое уведомление',
    'downloadFile':u'Скачивание файла {0}...',
    'dwsPassword':u'DWS пароль',
    'dwsUser':u'DWS пользователь',
    'endInstall':u'Установка завершена.',
    'endInstallConfigLater':u'Установка завершена.\nАгент не был настроен. Вы можете приступить к конфигурации позднее.',
    'endUninstall':u'Удаление завершено.',
    'enter':u'ввод',
    'enterInstallCode':u'Введите код установки',
    'enterInstallNewAgent':u'Введите данные для создания нового агента:',
    'enterRunCode':u'Введите код соединения',
    'error':u'Ошибка',
    'errorAgentAlreadyExsists':u'Агент {0} уже существует.',
    'errorAgentMax':u'Превышено максимальное число агентов.',
    'errorAgentNameNotValid':u'Имя агента недопустимо. Нельзя использовать символы / \ | # @ : .',
    'errorConnectionConfig':u'Ошибка соединения. Проверьте, запущена ли служба DWAgent.',
    'errorConnectionQuestion':u'Ошибка соединения. Проверьте подключение к интернету или настройки брандмауэра.\nХотите настроить прокси?',
    'errorInvalidCode':u'Введенный код недействителен.',
    'errorInvalidUserPassword':u'Неверное имя пользователя или пароль.',
    'fieldRequired':u'Поле \'{0}\' является обязательным.',
    'install':u'Установить',
    'installMonitor':u'Мониторинг устанавливается...',
    'installMonitorErr':u'Не удалось установить мониторинг.',
    'installService':u'Установка службы...',
    'installServiceErr':u'Не удалось установить службу.',
    'installShortcuts':u'Установка ярлыков...',
    'installShortcutsErr':u'Не удалось установить ярлыки.',
    'linuxRootPrivileges':u'У вас должны быть права суперпользователя, чтобы установить DWAgent.\nЗапустите скрипт с помощью пользователя root.',
    'menuConfigure':u'Настройка',
    'menuMonitor':u'Мониторинг',
    'menuUninstall':u'Удаление',
    'missingInfoFile':u'Файл info.json не найден.',
    'missingNative':u'Native не найден.',
    'missingRuntime':u'Runtime не найден.',
    'monitorActive':u'активно',
    'monitorAgentDisabled':u'Агент отключен.',
    'monitorAgentEnabled':u'Агент включен.',
    'monitorConfigure':u'Настройка',
    'monitorConnections':u'Соединения',
    'monitorCurrentActivities':u'Активные соединения',
    'monitorDisable':u'Отключить',
    'monitorDisableAgentQuestion':u'Хотите отключить агента?',
    'monitorDownload':u'Скачать',
    'monitorEnable':u'Включить',
    'monitorEnableAgentQuestion':u'Хотите включить агента?',
    'monitorEnterPassword':u'Введите пароль:',
    'monitorErrorConnectionConfig':u'Ошибка соединения. Проверьте, запущена ли служба DWAgent.',
    'monitorHide':u'Скрыть',
    'monitorInvalidPassword':u'Неверный пароль.',
    'monitorNoActivities':u'Активности нет',
    'monitorScreenCapture':u'Захват экрана',
    'monitorSession':u'Сессия',
    'monitorShellSession':u'Консоль',
    'monitorShow':u'Показать',
    'monitorStatus':u'Состояние',
    'monitorStatusDisabled':u'Выключено',
    'monitorStatusNoService':u'Не обслуживается',
    'monitorStatusOffline':u'Офлайн',
    'monitorStatusOnline':u'Онлайн',
    'monitorStatusUpdating':u'Обновление',
    'monitorTitle':u'DWAgent - Мониторинг',
    'monitorUninstall':u'Удаление',
    'monitorUninstallNotRun':u'Вы не можете удалить без прав суперпользователя.\nЗапустите команду dwaguninstall в консоли.',
    'monitorUpload':u'Закачать',
    'mustAccept':u'Для продолжения необходимо выбрать опцию {0}',
    'mustSelectOptions':u'Необходимо выбрать опцию.',
    'next':u'Далее',
    'no':u'Нет',
    'noTryAgain':u'Нет, попробовать еще раз',
    'notInstalled':u'DWAgent не установлен.',
    'ok':u'Ok',
    'option':u'Опции',
    'optionNotValid':u'Выбранный параметр недопустим.',
    'or':u'или',
    'password':u'Пароль',
    'path':u'Путь',
    'pathCreating':u'Создание папки...',
    'pathNotCreate':u'Папка не создана. Неверный путь или запрещен доступ.',
    'pressEnter':u'Нажмите Enter для продолжения.',
    'privacyPolicy':u'Политика конфиденциальности',
    'proxyAuthPassword':u'Пароль',
    'proxyAuthUser':u'Пользователь',
    'proxyHost':u'Host',
    'proxyHttp':u'Http',
    'proxyInfo':u'Введите информацию о прокси-сервере.',
    'proxyNone':u'Нет',
    'proxyPort':u'Port',
    'proxySocks4':u'Socks4',
    'proxySocks4a':u'Socks4a',
    'proxySocks5':u'Socks5',
    'proxySystem':u'Система',
    'reEnterCode':u'Введите код еще раз',
    'reEnterData':u'Введите данные еще раз',
    'rePassword':u'Повторите пароль',
    'removeFile':u'Удаление файла...',
    'runWithoutInstallation':u'Запустить',
    'runWithoutInstallationClosing':u'Закрытие сеанса...',
    'runWithoutInstallationConnecting':u'Открытие сеанса...',
    'runWithoutInstallationEnd':u'Сеанс закончен.',
    'runWithoutInstallationOnlineBottom':u'ПРЕДУПРЕЖДЕНИЕ:\nНе сообщайте эту информацию людям, которым не доверяете, иначе позволите им получить доступ к агенту. Если вы не понимаете до конца, что именно вы делаете, пожалуйста, закройте это приложение.',
    'runWithoutInstallationOnlineBottomPutCode':u'Внимание: \nсейчас агент готов принимать соединение. Если вы не уверены в том, что делаете, - закройте это окно.',
    'runWithoutInstallationOnlinePassword':u'Пароль: {0}',
    'runWithoutInstallationOnlineTop':u'Сеанс активен.\nДля подключения к агенту перейдите по ссылке https://www.dwservice.net',
    'runWithoutInstallationOnlineTopPutCode':u'Сессия активна.',
    'runWithoutInstallationOnlineUser':u'Пользователь: {0}',
    'runWithoutInstallationStarting':u'Агент запускается...',
    'runWithoutInstallationUnexpectedError':u'Непредвиденная ошибка.\nDWAgent не был запущен. Если проблема сохранится, попробуйте загрузить последнюю версию DWAgent, удалите папку "{0} " и запустите DWAgent снова.',
    'runWithoutInstallationUpdating':u'Агент обновляется...',
    'runWithoutInstallationWait':u'Ожидаем нового соединения (попытка {0})...',
    'selectPathInstall':u'Выберите путь установки:',
    'startService':u'Служба запускается...',
    'startServiceErr':u'Не удалось запустить службу.',
    'termsAndConditions':u'Условия использования',
    'titleInstall':u'DWAgent - Установка',
    'titleUninstall':u'DWAgent - Удаление',
    'toBack':u'назад.',
    'toExit':u'выход.',
    'unexpectedError':u'Непредвиденная ошибка.\n{0}',
    'uninstallMonitor':u'Удаление мониторинга...',
    'uninstallService':u'Удаление службы...',
    'uninstallShortcuts':u'Удаление ярлыков...',
    'user':u'Пользователь',
    'validInteger':u'Поле \'{0}\' должно быть целым числом.',
    'versionInstallNotValid':u'Версия установщика не подходит для вашей операционной системы.\nСкачайте правильную версию. {0}',
    'waiting':u'Ожидание...',
    'warningLoginLogout':u'Чтобы изменение вступило в силу, пользователь должен выйти и снова войти в систему.',
    'warningRemovePath':u'Предупреждение: целевая папка уже существует и будет удалена.',
    'warningSpyingTool':u'Важно! Вы не имеете права осуществлять доступ к удаленному компьютеру без согласия пользователя. Используя DWService в противоправных целях, вы нарушаете уголовный закон.',
    'welcomeLicense':u'Лицензия\nЭто программное обеспечение является бесплатным и открытым (open source).\nОно состоит из одного основного компонента и нескольких дополнительных компонентов, которые могут регулироваться различными лицензиями. Для получения дополнительной информации посетите: https://www.dwservice.net/en/licenses-sources.html',
    'welcomePrivacyTerms':u'Устанавливая или запуская данный программный продукт, вы соглашаетесь с политикой в отношении обработки персональных данных (#PRIVACYPOLICY) и пользовательским соглашением (#TERMSANDCONDITIONS).',
    'welcomeSecurity':u'Безопасность\nДля защиты вашей конфиденциальности мы гарантируем, что никакая информация не будет храниться на наших серверах, сетевые соединения зашифрованы, так что третьи лица не могут прочитать их в любом случае.',
    'welcomeSoftwareUpdates':u'Обновление программного обеспечения\nОбновления программного обеспечения осуществляются автоматически.',
    'windowsAdminPrivileges':u'Необходимо иметь права администратора для установки DWAgent.\nЗапустите исполняемый от имени администратора.',
    'yes':u'Да'
}
                                                                                                                                                                                                                                                                                                                                                                                                                                 ui/installer.py                                                                                     0000755 0001750 0001750 00000346021 14140470054 013340  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import os
import hashlib
import json
import shutil
import time
import sys
import messages
import ui
import communication
import stat
import platform
import listener
import gdi
import importlib
import zlib
import base64
import ipc
import ctypes
import subprocess
import utils


_MAIN_URL = "https://www.dwservice.net/"
_MAIN_URL_QA = "https://qa.dwservice.net/"
_MAIN_URL_DEV = "https://dev.dwservice.net/dws_site/"
_NATIVE_PATH = u'native'
_RUNTIME_PATH = u'runtime'
_INSTALLER_VERSION=1

def get_native():
    if gdi.is_windows():
        return NativeWindows()
    elif gdi.is_linux():
        return NativeLinux()
    elif gdi.is_mac():
        return NativeMac()
        
def stop_monitor(installpath):
    try:
        stopfilename = installpath + utils.path_sep + u"monitor.stop"
        if not utils.path_exists(stopfilename):
            stopfile = utils.file_open(stopfilename, "w", encoding='utf-8')
            stopfile.close()
        time.sleep(5) #Attende in modo che si chiudono i monitor
        utils.path_remove(stopfilename) 
    except:
        None

class NativeLinux:
    def __init__(self):
        self._name=None
        self._current_path=None
        self._install_path=None
        self._etc_path=None
        self._logo_path=u"/ui/images/logo.png"
    
    def set_name(self, k):
        self._name=k
        self._etc_path = u"/etc/" + self._name.lower()
    
    def set_logo_path(self, pth):
        self._logo_path=pth
    
    def set_current_path(self, pth):
        self._current_path=pth
    
    def set_install_path(self, pth):
        self._install_path=pth
        
    def set_install_log(self, log):
        self._install_log=log
        
    def get_proposal_path(self):
        return u"/usr/share/" + self._name.lower()
    
    def get_install_path(self) :
        if utils.path_exists(self._etc_path):
            f = utils.file_open(self._etc_path)
            try:
                ar = json.loads(f.read())
                pth = ar['path']
                if utils.path_exists(pth):
                    return pth
            finally:
                f.close()
        return  None
    
    def is_task_running(self, pid):
        try:
            os.kill(pid, 0)
        except OSError:
            return False
        return True
    
    def check_init_run(self):
        return None         
     
    def check_init_install(self, onlycheck=False):
        if os.geteuid() != 0: #DEVE ESSERE EUID
            return messages.get_message("linuxRootPrivileges")
        return None
    
    def check_init_uninstall(self):
        if os.geteuid() != 0: #DEVE ESSERE EUID
            return messages.get_message("linuxRootPrivileges")
        return None

    def stop_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc stop", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def start_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc start", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def replace_key_file(self, path, lst):
        fin = utils.file_open(path, "r", encoding='utf-8')
        data = fin.read()
        fin.close()
        fout = utils.file_open(path, "w", encoding='utf-8')
        for k in lst:
            data = data.replace(k,lst[k])
        fout.write(data)
        fout.close()
    
    def get_replace_list(self):
        return {
                u"@NAME@": self._name, 
                u"@EXE_NAME@": self._name.lower(), 
                u"@PATH_DWA@": self._install_path,
                u"@PATH_LOGOOS@": self._install_path + self._logo_path
            }
    
    def prepare_file_service(self, pth):
        lstrepl = self.get_replace_list()
        fdwagsvc=pth + utils.path_sep + u"dwagsvc"
        self.replace_key_file(fdwagsvc, lstrepl)
        utils.path_change_permissions(fdwagsvc,  stat.S_IRWXU + stat.S_IRGRP + stat.S_IROTH)
        fdwagent=pth + utils.path_sep + u"dwagent.service"
        if self._name.lower()!=u"dwagent":
            utils.path_rename(fdwagent,pth + utils.path_sep  + self._name.lower() + u".service")
            fdwagent=pth + utils.path_sep  + self._name.lower() + u".service"
        self.replace_key_file(fdwagent, lstrepl)
        utils.path_change_permissions(fdwagent,  stat.S_IRUSR + stat.S_IWUSR + stat.S_IRGRP + stat.S_IROTH)
    
    def prepare_file_sh(self, pth):
        lstrepl = self.get_replace_list()        
        appf=pth + utils.path_sep + u"dwagent"        
        if self._name.lower()!=u"dwagent":
            utils.path_rename(appf, pth + utils.path_sep + self._name.lower())
            appf=pth + utils.path_sep + self._name.lower()
        self.replace_key_file(appf, lstrepl)        
        utils.path_change_permissions(appf,  stat.S_IRWXU + stat.S_IRGRP +  stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        
        appf=pth + utils.path_sep + u"configure"
        self.replace_key_file(appf, lstrepl)
        utils.path_change_permissions(appf,  stat.S_IRWXU + stat.S_IRGRP +  stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        
        appf=pth + utils.path_sep + u"uninstall"
        self.replace_key_file(appf, lstrepl)
        utils.path_change_permissions(appf,  stat.S_IRWXU + stat.S_IRGRP +  stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        
        #Menu
        fmenuconf=pth + utils.path_sep + u"dwagent.desktop"
        if utils.path_exists(fmenuconf):
            if self._name.lower()!=u"dwagent":
                utils.path_rename(fmenuconf, pth + utils.path_sep + self._name.lower() + u".desktop")
                fmenuconf=pth + utils.path_sep + self._name.lower() + u".desktop"        
            self.replace_key_file(fmenuconf, lstrepl)
            utils.path_change_permissions(fmenuconf,  stat.S_IRWXU + stat.S_IRGRP + stat.S_IRWXO)
        
    
    #LO USA ANCHE agent.py
    def prepare_file_monitor(self, pth):
        lstrepl = self.get_replace_list()
        appf=pth + utils.path_sep + u"systray"
        if utils.path_exists(appf):
            self.replace_key_file(appf, lstrepl)
            utils.path_change_permissions(appf,  stat.S_IRWXU + stat.S_IRGRP +  stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        
        fmenusystray=pth + utils.path_sep + u"systray.desktop"
        if utils.path_exists(fmenusystray):
            self.replace_key_file(fmenusystray, lstrepl)
            utils.path_change_permissions(fmenusystray,  stat.S_IRWXU + stat.S_IRGRP + stat.S_IRWXO)
    
    def prepare_file(self):
        self.prepare_file_service(self._install_path + utils.path_sep + u"native")
        self.prepare_file_sh(self._install_path + utils.path_sep + u"native")
        self.prepare_file_monitor(self._install_path + utils.path_sep + u"native")
    
    def prepare_file_runonfly(self, runcode):
        None
    
    def start_runonfly(self, runcode):
        pargs=[]
        pargs.append(sys.executable)
        pargs.append(u'agent.py')
        pargs.append(u'-runonfly')
        pargs.append(u'-filelog')
        if runcode is not None:
            pargs.append(u'runcode=' + runcode)
        
        libenv = os.environ
        libenv["LD_LIBRARY_PATH"]=utils.path_absname(self._current_path + utils.path_sep + u"runtime" + utils.path_sep + u"lib")
        return subprocess.Popen(pargs, env=libenv)

    
    def prepare_runtime_by_os(self,ds):
        utils.path_makedir(ds)
        utils.path_makedir(ds + utils.path_sep + u"bin")
        utils.path_makedir(ds + utils.path_sep + u"lib")
        utils.path_symlink(sys.executable, ds + utils.path_sep + u"bin" + utils.path_sep + self._name.lower())
        return True;
    
    def install_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc install", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def delete_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc delete", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def install_auto_run_monitor(self):
        try:
            pautos = u"/etc/xdg/autostart"
            utils.path_copy(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"systray.desktop", pautos + utils.path_sep + self._name.lower() + u"_systray.desktop")
            utils.path_change_permissions(pautos + utils.path_sep + self._name.lower() + u"_systray.desktop",  stat.S_IRWXU + stat.S_IRGRP + stat.S_IRWXO)
            #SI DEVE LANCIARE CON L'UTENTE CONNESSO A X
            #Esegue il monitor
            #os.system(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwaglnc systray &")
        except:
            None
        return True
    
    def remove_auto_run_monitor(self):
        try:
            fnm = u"/etc/xdg/autostart/" + self._name.lower() + u"_systray.desktop"
            if utils.path_exists(fnm):
                utils.path_remove(fnm)
        except:
            None
        return True
    
    def install_extra(self):
        return True
    
    def install_shortcuts(self):
        try:
            #Crea MENU
            utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc install_shortcuts", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
            
            #CREA /etc/dwagent
            if utils.path_exists(self._etc_path):
                utils.path_remove(self._etc_path)
            ar = {'path': self._install_path}
            s = json.dumps(ar, sort_keys=True, indent=1)
            f = utils.file_open(self._etc_path, 'wb')
            f.write(s)
            f.close()
            return True
        except:
            return False
        
        
    def remove_shortcuts(self) :
        try:
            #RIMUOVE /etc/dwagent
            if utils.path_exists(self._etc_path):
                utils.path_remove(self._etc_path)
                
            #RIMUOVE MENU
            utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc uninstall_shortcuts", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
        
            return True
        except:
            return False

class NativeMac:
    def __init__(self):
        self._name=None
        self._current_path = None
        self._install_path = None
        self._svcnm = None
        self._guilncnm = None
        self._systraynm = None
        self._logo_path=u"/ui/images/logo.icns"

    def set_name(self, k):
        self._name=k
        if self._name.lower()==u"dwagent":            
            self._svcnm = u"net.dwservice.agsvc"
            self._guilncnm = u"net.dwservice.agguilnc"
            self._systraynm = u"net.dwservice.agsystray"
        else:
            self._svcnm = u"com.apiremoteaccess." + self._name.lower() + u"svc"
            self._guilncnm = u"com.apiremoteaccess." + self._name.lower() + u"lnc"
            self._systraynm = u"com.apiremoteaccess." + self._name.lower() +  u"systray"
        
    def set_logo_path(self, pth):
        self._logo_path=pth
    
    def set_current_path(self, pth):
        self._current_path=pth

    def set_install_path(self, pth):
        self._install_path=pth
        
    def set_install_log(self, log):
        self._install_log=log
        
    def get_proposal_path(self):
        return u'/Library/' + self._name 
    
    def get_install_path(self) :        
        ldpth = u"/Library/LaunchDaemons/" + self._svcnm + u".plist"
        if utils.path_exists(ldpth) and utils.path_islink(ldpth):
            return utils.path_dirname(utils.path_dirname(utils.path_realname(ldpth)))
        
        if self._name.lower()==u"dwagent":
            #KEEP FOR COMPATIBILITY
            oldlncdmn_path = u"/Library/LaunchDaemons/net.dwservice.agent.plist"
            if utils.path_exists(oldlncdmn_path) and utils.path_islink(oldlncdmn_path):
                return utils.path_dirname(utils.path_dirname(utils.path_realname(oldlncdmn_path)))
            #KEEP FOR COMPATIBILITY                        
            oldlncdmn_path = u"/System/Library/LaunchDaemons/org.dwservice.agent.plist"
            if utils.path_exists(oldlncdmn_path) and utils.path_islink(oldlncdmn_path):
                return utils.path_dirname(utils.path_dirname(utils.path_realname(oldlncdmn_path)))        
        
        return None             
    
    def is_task_running(self, pid):
        try:
            os.kill(pid, 0)
        except OSError:
            return False
        return True
    
    def check_init_run(self):
        return None
    
    def check_init_install(self, onlycheck=False):
        if os.geteuid() != 0: #MUST BE EUID
            if onlycheck:
                return messages.get_message("linuxRootPrivileges")
            else:
                f = utils.file_open(u"runasadmin.install", 'wb')
                f.close()
                raise SystemExit
        return None
    
    def check_init_uninstall(self):
        if os.geteuid() != 0: #MUST BE EUID
            return messages.get_message(u"linuxRootPrivileges")
        return None

    def _get_os_ver(self):
        try:
            sver = platform.mac_ver()[0]
            ar = sver.split(".")
            if len(ar)==0:
                return [99999,99999]
            elif len(ar)==1:
                return [int(ar[0]),0]
            else:
                return [int(ar[0]),int(ar[1])]
        except:
            return [99999,99999]

    def _bootstrap_agent(self,pn):
        arver=self._get_os_ver()
        if arver[0]<10 or (arver[0]==10 and arver[1]<=9):
            utils.system_call(u"sudo -u $(id -nu `stat -f '%u' /dev/console`) launchctl load -S Aqua /Library/LaunchAgents/" + pn, shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
        else:
            utils.system_call(u"launchctl bootstrap gui/`stat -f '%u' /dev/console` /Library/LaunchAgents/" + pn, shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
    
    def _bootout_agent(self,pn):
        arver=self._get_os_ver()
        if arver[0]<10 or (arver[0]==10 and arver[1]<=9):
            utils.system_call(u"launchctl unload /Library/LaunchAgents/" + pn, shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
            utils.system_call(u"for USER in `users`; do sudo -u $USER launchctl unload -S Aqua /Library/LaunchAgents/" + pn + "; done", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
        else:
            utils.system_call(u"launchctl bootout gui/0 /Library/LaunchAgents/" + pn, shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
            utils.system_call(u"for USER in `users`; do launchctl bootout gui/`id -u $USER` /Library/LaunchAgents/" + pn + "; done", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
            self._install_log.flush()
        
    def stop_service(self):
        #Arresta GUILauncher
        self._bootout_agent(self._guilncnm + u".plist")
        ret =utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc stop", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def start_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc start", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        bret = (ret==0)
        if bret:
            #Avvia GUILauncher
            self._bootstrap_agent(self._guilncnm + u".plist")
        return bret
    
    def get_replace_list(self):
        return {
            u"@NAME@": self._name, 
            u"@EXE_NAME@": self._name.lower(), 
            u"@PATH_DWA@": self._install_path,
            u"@PATH_LOGOOS@": self._install_path + self._logo_path,
            u"@LDNAME_SERVICE@": self._svcnm ,
            u"@LDNAME_GUILNC@": self._guilncnm ,
            u"@LDNAME_SYSTRAY@": self._systraynm 
        }
    
    def replace_key_file(self, path, enc,  lst):
        fin=utils.file_open(path, "r", enc)
        data = fin.read()
        fin.close()
        fout=utils.file_open(path,"w", enc)
        for k in lst:
            data = data.replace(k,lst[k])
        fout.write(data)
        fout.close()
            
    def prepare_file_service(self, pth):
        lstrepl = self.get_replace_list()
        #Service
        fapp=pth + utils.path_sep + "dwagsvc"
        self.replace_key_file(fapp, "utf-8", lstrepl)
        utils.path_change_permissions(fapp,  stat.S_IRWXU + stat.S_IRGRP + stat.S_IROTH)
        
        fapp=pth + utils.path_sep + "dwagsvc.plist"
        self.replace_key_file(fapp, "utf-8", lstrepl)
        utils.path_change_permissions(fapp,  stat.S_IRUSR + stat.S_IWUSR + stat.S_IRGRP + stat.S_IROTH)
        
        #GUI Launcher
        fapp=pth + utils.path_sep + "dwagguilnc"
        utils.path_change_permissions(fapp,  stat.S_IRWXU + stat.S_IRGRP + stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        
        fapp=pth + utils.path_sep + "dwagguilnc.plist"
        self.replace_key_file(fapp, "utf-8", lstrepl)
        utils.path_change_permissions(fapp,  stat.S_IRUSR + stat.S_IWUSR + stat.S_IRGRP + stat.S_IROTH)
    
    def prepare_file_app(self, pth):
        utils.path_makedir(pth + u"/DWAgent.app/Contents/Resources")
        utils.path_copy(self._install_path + self._logo_path, pth + u"/DWAgent.app/Contents/Resources/Icon.icns")
        shutil.copytree(pth + u"/DWAgent.app",pth + u"/Configure.app")
        shutil.copytree(pth + u"/DWAgent.app",pth + u"/Uninstall.app")
        idname=u"net.dwservice."
        if self._name.lower()!=u"dwagent":
            shutil.move(pth + u"/DWAgent.app",pth + u"/" + self._name + u".app")            
            idname=u"com.apiremoteaccess."
        
        #DWAGENT        
        utils.path_change_permissions(pth + u"/" + self._name + u".app/Contents/MacOS/Run",  stat.S_IRUSR + stat.S_IWUSR + stat.S_IXUSR + stat.S_IRGRP + stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)           
        lstrepl = self.get_replace_list()
        lstrepl["@MOD_DWA@"]=u"monitor"
        self.replace_key_file(pth + u"/" + self._name + u".app/Contents/MacOS/Run", "utf-8", lstrepl)
        lstrepl["@ID_NAME@"]=idname + lstrepl["@EXE_NAME@"] 
        self.replace_key_file(pth + u"/" + self._name + u".app/Contents/Info.plist", "utf-8", lstrepl)        
        
        #CONFIGURE
        utils.path_change_permissions(pth + u"/Configure.app/Contents/MacOS/Run",  stat.S_IRUSR + stat.S_IWUSR + stat.S_IXUSR + stat.S_IRGRP + stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        lstrepl = self.get_replace_list()
        lstrepl["@MOD_DWA@"]=u"configure"
        self.replace_key_file(pth + u"/Configure.app/Contents/MacOS/Run", "utf-8", lstrepl)
        lstrepl["@NAME@"]=u"Configure"
        lstrepl["@EXE_NAME@"]=u"configure"        
        lstrepl["@ID_NAME@"]=idname + lstrepl["@EXE_NAME@"]
        self.replace_key_file(pth + u"/Configure.app/Contents/Info.plist", "utf-8", lstrepl)                
        
        #UNINSTALL        
        utils.path_change_permissions(pth + u"/Uninstall.app/Contents/MacOS/Run",  stat.S_IRUSR + stat.S_IWUSR + stat.S_IXUSR + stat.S_IRGRP + stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        lstrepl = self.get_replace_list()
        lstrepl["@MOD_DWA@"]=u"uninstall"
        self.replace_key_file(pth + u"/Uninstall.app/Contents/MacOS/Run", "utf-8", lstrepl)
        lstrepl["@NAME@"]=u"Uninstall"
        lstrepl["@EXE_NAME@"]=u"uninstall"        
        lstrepl["@ID_NAME@"]=idname + lstrepl["@EXE_NAME@"]
        self.replace_key_file(pth + u"/Uninstall.app/Contents/Info.plist", "utf-8", lstrepl)                
        
    
    def prepare_file_monitor(self, pth):
        lstrepl = self.get_replace_list()
        
        fapp=pth + utils.path_sep + "dwagsystray"
        utils.path_change_permissions(fapp,  stat.S_IRWXU + stat.S_IRGRP + stat.S_IXGRP + stat.S_IROTH + stat.S_IXOTH)
        
        fapp=pth + utils.path_sep + "dwagsystray.plist"
        self.replace_key_file(fapp, "utf-8", lstrepl)
        utils.path_change_permissions(fapp,  stat.S_IRUSR + stat.S_IWUSR + stat.S_IRGRP + stat.S_IROTH)
        
    
    def prepare_file(self):
        self.prepare_file_service(self._install_path + utils.path_sep + u"native")
        self.prepare_file_app(self._install_path + utils.path_sep + u"native")
        self.prepare_file_monitor(self._install_path + utils.path_sep + u"native")
    
    def prepare_file_runonfly(self, runcode):
        None

    def start_runonfly(self, runcode):
        pargs=[]
        pargs.append(sys.executable)
        pargs.append(u'agent.py')
        pargs.append(u'-runonfly')
        pargs.append(u'-filelog')
        if runcode is not None:
            pargs.append(u'runcode=' + runcode)
        libenv = os.environ
        libenv["LD_LIBRARY_PATH"]=utils.path_absname(self._current_path + utils.path_sep + u"runtime" + utils.path_sep + u"lib")
        return subprocess.Popen(pargs, env=libenv)

    def prepare_runtime_by_os(self,ds):
        return False;
    
    def install_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc install", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def delete_service(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc delete", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def install_auto_run_monitor(self):
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc installAutoRun", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        bret = (ret==0)
        if bret:
            #Avvia systray
            self._bootstrap_agent(self._systraynm + u".plist")
        return bret
        
    
    def remove_auto_run_monitor(self):
        #Chiude tutti systray
        self._bootout_agent(self._systraynm + u".plist")
        ret = utils.system_call(self._install_path + utils.path_sep + u"native" + utils.path_sep + u"dwagsvc removeAutoRun", shell=True, stdout=self._install_log, stderr=subprocess.STDOUT)
        self._install_log.flush()
        return ret==0
    
    def install_extra(self):
        return True
    
    def install_shortcuts(self):
        try:
            pathsrc = self._install_path + utils.path_sep + u"native/"
            pathdst = u"/Applications/"
            if utils.path_exists(pathdst):
                shutil.copytree(pathsrc + self._name + u".app", pathdst + self._name +u".app", symlinks=True)
            return True
        except:
            return False
        
        
    def remove_shortcuts(self) :
        try:
            pathsrc = u"/Applications/" + self._name + u".app"
            if utils.path_exists(pathsrc):
                utils.path_remove(pathsrc)
            return True
        except:
            return False


if gdi.is_windows():
    import types
    import _subprocess
    from ctypes import byref, windll, c_char_p, c_wchar_p, c_void_p, Structure, sizeof, c_wchar, WinError
    from ctypes.wintypes import BYTE, WORD, LPWSTR, BOOL, DWORD, LPVOID, HANDLE

    class NativeWindowsPopenUnicodeSTARTUPINFOW(Structure):
        _fields_ = [
            ("cb",              DWORD),  ("lpReserved",    LPWSTR),
            ("lpDesktop",       LPWSTR), ("lpTitle",       LPWSTR),
            ("dwX",             DWORD),  ("dwY",           DWORD),
            ("dwXSize",         DWORD),  ("dwYSize",       DWORD),
            ("dwXCountChars",   DWORD),  ("dwYCountChars", DWORD),
            ("dwFillAtrribute", DWORD),  ("dwFlags",       DWORD),
            ("wShowWindow",     WORD),   ("cbReserved2",   WORD),
            ("lpReserved2",     ctypes.POINTER(BYTE)), ("hStdInput",     HANDLE),
            ("hStdOutput",      HANDLE), ("hStdError",     HANDLE),
        ]
    
    
    class NativeWindowsPopenUnicodePROCESS_INFORMATION(Structure):
        _fields_ = [
            ("hProcess",         HANDLE), ("hThread",          HANDLE),
            ("dwProcessId",      DWORD),  ("dwThreadId",       DWORD),
        ]
    
    
    class NativeWindowsPopenUnicodeHANDLE(ctypes.c_void_p):
    
        def __init__(self, *a, **kw):
            super(NativeWindowsPopenUnicodeHANDLE, self).__init__(*a, **kw)
            self.closed = False
    
        def Close(self):
            if not self.closed:
                windll.kernel32.CloseHandle(self)
                self.closed = True
    
        def __int__(self):
            return self.value

    
    NativeWindowsPopenUnicodeCreateProcessW = windll.kernel32.CreateProcessW
    NativeWindowsPopenUnicodeCreateProcessW.argtypes = [
        c_char_p, c_wchar_p, c_void_p,
        c_void_p, BOOL, DWORD, LPVOID, c_char_p,
        ctypes.POINTER(NativeWindowsPopenUnicodeSTARTUPINFOW), ctypes.POINTER(NativeWindowsPopenUnicodePROCESS_INFORMATION),
    ]
    NativeWindowsPopenUnicodeCreateProcessW.restype = BOOL

    class NativeWindowsPopenUnicode(subprocess.Popen):
        
        def _createProcessW(self, executable, args, _p_attr, _t_attr,
                          inherit_handles, creation_flags, env, cwd,
                          startup_info):
            si = NativeWindowsPopenUnicodeSTARTUPINFOW(
                dwFlags=startup_info.dwFlags,
                wShowWindow=startup_info.wShowWindow,
                cb=sizeof(NativeWindowsPopenUnicodeSTARTUPINFOW),
                hStdInput=int(startup_info.hStdInput),
                hStdOutput=int(startup_info.hStdOutput),
                hStdError=int(startup_info.hStdError),
            )    
            wenv = None
            if env is not None:
                '''
                env = (utils.str_new("").join([
                    utils.str_new("%s=%s\0") % (k, v)
                    for k, v in env.items()])) + utils.str_new("\0")
                '''
                appenv=[]
                for k, v in env.items():
                    k = utils.str_new(k)
                    n= ctypes.windll.kernel32.GetEnvironmentVariableW(k, None, 0)
                    if n>0:
                        buf= ctypes.create_unicode_buffer(u'\0'*n)
                        ctypes.windll.kernel32.GetEnvironmentVariableW(k, buf, n)
                        appenv.append(utils.str_new("%s=%s\0") % (k , buf.value))
                appenv.append(utils.str_new("\0"))
                env = utils.str_new("").join(appenv)
                wenv = (c_wchar * len(env))()
                wenv.value = env
        
            pi = NativeWindowsPopenUnicodePROCESS_INFORMATION()
            creation_flags |= 0x00000400 #CREATE_UNICODE_ENVIRONMENT
        
            if NativeWindowsPopenUnicodeCreateProcessW(executable, args, None, None,
                              inherit_handles, creation_flags,
                              wenv, cwd, byref(si), byref(pi)):
                return (NativeWindowsPopenUnicodeHANDLE(pi.hProcess), NativeWindowsPopenUnicodeHANDLE(pi.hThread),
                        pi.dwProcessId, pi.dwThreadId)
            raise WinError()
    
    
        def _execute_child(self, args, executable, preexec_fn, close_fds,
                               cwd, env, universal_newlines,
                               startupinfo, creationflags, shell, to_close,
                               p2cread, p2cwrite,
                               c2pread, c2pwrite,
                               errread, errwrite):
                """Execute program (MS Windows version)"""
    
                if not isinstance(args, types.StringTypes):
                    args = subprocess.list2cmdline(args)
    
                # Process startup details
                if startupinfo is None:
                    startupinfo = subprocess.STARTUPINFO()
                if None not in (p2cread, c2pwrite, errwrite):
                    startupinfo.dwFlags |= _subprocess.STARTF_USESTDHANDLES
                    startupinfo.hStdInput = p2cread
                    startupinfo.hStdOutput = c2pwrite
                    startupinfo.hStdError = errwrite
    
                if shell:
                    startupinfo.dwFlags |= _subprocess.STARTF_USESHOWWINDOW
                    startupinfo.wShowWindow = _subprocess.SW_HIDE
                    comspec = os.environ.get("COMSPEC", utils.str_new("cmd.exe"))
                    args = utils.str_new('{} /c "{}"').format (comspec, args)
                    if (_subprocess.GetVersion() >= 0x80000000 or
                            utils.path_basename(comspec).lower() == "command.com"):
                        w9xpopen = self._find_w9xpopen()
                        args = utils.str_new('"%s" %s') % (w9xpopen, args)
                        creationflags |= _subprocess.CREATE_NEW_CONSOLE
    
                def _close_in_parent(fd):
                    fd.Close()
                    to_close.remove(fd)
    
                try:
                    hp, ht, pid, tid = self._createProcessW(executable, args,
                                             None, None,
                                             int(not close_fds),
                                             creationflags,
                                             env,
                                             cwd,
                                             startupinfo)
                except subprocess.pywintypes.error as e:
                    raise WindowsError(*e.args)
                finally:
                    if p2cread is not None:
                        _close_in_parent(p2cread)
                    if c2pwrite is not None:
                        _close_in_parent(c2pwrite)
                    if errwrite is not None:
                        _close_in_parent(errwrite)
    
                self._child_created = True
                self._handle = hp
                self.pid = pid
                ht.Close()



    NativeWindowsRegCloseKey = ctypes.windll.advapi32.RegCloseKey
    NativeWindowsRegCloseKey.restype = ctypes.c_long
    NativeWindowsRegCloseKey.argtypes = [ctypes.c_void_p]
    
    NativeWindowsRegOpenKeyEx = ctypes.windll.advapi32.RegOpenKeyExW
    NativeWindowsRegOpenKeyEx.restype = ctypes.c_long
    NativeWindowsRegOpenKeyEx.argtypes = [ctypes.c_void_p, ctypes.c_wchar_p, ctypes.c_ulong,
                             ctypes.c_ulong, ctypes.POINTER(ctypes.c_void_p)]
    
    RegQueryValueEx = ctypes.windll.advapi32.RegQueryValueExW
    RegQueryValueEx.restype = ctypes.c_long
    RegQueryValueEx.argtypes = [ctypes.c_void_p, ctypes.c_wchar_p, ctypes.POINTER(ctypes.wintypes.DWORD), ctypes.POINTER(ctypes.wintypes.DWORD),
                                ctypes.POINTER(ctypes.wintypes.BYTE), ctypes.POINTER(ctypes.wintypes.DWORD)]



class NativeWindows:
        
    def __init__(self):
        self._name=None
        self._current_path=None
        self._install_path=None
        self._os_env=None
        self._py_exe=None
        self._runtime=None
        self._logo_path=u"\\ui\\images\\logo.ico"
    
    def set_name(self, k):
        self._name=k
        self._runtime=k.lower() + u".exe"
    
    def set_logo_path(self, pth):
        self._logo_path=pth
    
    def set_current_path(self, pth):
        self._current_path=pth
    
    def set_install_path(self, pth):
        self._install_path=pth
        
    def set_install_log(self, log):
        None
        #self._install_log=log

    def get_proposal_path(self):
        return utils.str_new(os.environ["ProgramFiles"]) + utils.path_sep + self._name
    
    def get_install_path(self) :
        vret = None
        try:
            rk = ctypes.c_void_p()
            #HKEY_LOCAL_MACHINE = 0x80000002
            ret = NativeWindowsRegOpenKeyEx(ctypes.c_void_p(0x80000002), u"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + self._name, 0, 0x20019, ctypes.cast(ctypes.byref(rk), ctypes.POINTER(ctypes.c_void_p)))
            if ret == 0:
                sz = 256
                tp = ctypes.wintypes.DWORD()
                while True:
                    tmp_size = ctypes.wintypes.DWORD(sz)
                    buf = ctypes.create_string_buffer(sz)
                    ret = RegQueryValueEx(rk, u"InstallLocation", ctypes.POINTER(ctypes.wintypes.DWORD)(),
                                         ctypes.byref(tp),
                                         ctypes.cast(buf, ctypes.POINTER(ctypes.wintypes.BYTE)), ctypes.byref(tmp_size))
                    if ret != 234:
                        break
                    sz *= 2
                if ret == 0:
                    if tp.value == 1 or tp.value == 2:
                        vret = ctypes.wstring_at(buf, tmp_size.value // 2).rstrip(u'\x00')
                    elif tp.value != 4 or tp.value != 7:
                        vret = ctypes.string_at(buf, tmp_size.value)
                
                NativeWindowsRegCloseKey(rk)
            return vret
        except:
            None 
        return None
    
    def is_task_running(self, pid):
        return gdi.is_windows_task_running(pid)
    
    def check_init_run(self):
        if gdi.is_windows_user_in_admin_group():
            if gdi.is_windows_run_as_admin():
                if gdi.is_windows_process_elevated():
                    return None
                else:
                    f = utils.file_open(u"runasadmin.install", "wb", encoding='utf-8')
                    f.close()
                    raise SystemExit
            else:
                f = utils.file_open(u"runasadmin.run", "wb", encoding='utf-8')
                f.close()
                raise SystemExit
        else:
            return None
    
    def check_init_install(self, onlycheck=False):
        if gdi.is_windows_user_in_admin_group() and gdi.is_windows_run_as_admin():
            if gdi.is_windows_process_elevated():
                return None
            else:
                if onlycheck:
                    return messages.get_message("windowsAdminPrivileges")
                else:
                    f = utils.file_open(u"runasadmin.install", "wb", encoding='utf-8')
                    f.close()
                    raise SystemExit
        else:
            if onlycheck:
                return messages.get_message("windowsAdminPrivileges")
            else:
                f = utils.file_open(u"runasadmin.install", "wb", encoding='utf-8')
                f.close()
                raise SystemExit
                        
    
    def check_init_uninstall(self):
        if gdi.is_windows_user_in_admin_group() and gdi.is_windows_run_as_admin():
            try:
                if gdi.is_windows_process_elevated():
                    return None
                else:
                    return messages.get_message("windowsAdminPrivileges")
            except:
                return None #XP
        else:
            return messages.get_message("windowsAdminPrivileges")
        
    
    def prepare_file(self):
        #Scrive service.properties
        pth=self._install_path
        arf = []
        arf.append(u''.join([u"serviceName=",self._name,u"\r\n"]))
        arf.append(u''.join([u"iconPath=" ,  pth, self._logo_path + u"\r\n"]))
        #FIX UNICODE PATH
        arf.append(u''.join([u"pythonHome=runtime\r\n"]))
        arf.append(u''.join([u"pythonPath=",  pth, utils.path_sep, u"runtime", utils.path_sep, self._runtime, u"\r\n"]))
        arf.append(u"parameters=-S -m agent -filelog")
        f=utils.file_open(pth + utils.path_sep + u'native' + utils.path_sep + u'service.properties', 'w', encoding='utf-8') 
        f.write(u''.join(arf))
        f.close()
    
    def prepare_file_runonfly(self, runcode):
        #Scrive service.properties
        pth=self._install_path
        arf = []
        arf.append(u''.join([u"serviceName=",self._name + u"RunOnFly",u"\r\n"]))
        arf.append(u''.join([u"iconPath=" ,  pth, self._logo_path + u"\r\n"]))
        #FIX UNICODE PATH
        ar = self._current_path.split(utils.path_sep)
        arf.append(u''.join([u"pythonHome=.." + utils.path_sep + ar[len(ar)-1] + utils.path_sep + u"runtime\r\n"]))
        arf.append(u''.join([u"pythonPath=",  self._current_path, utils.path_sep, u"runtime", utils.path_sep, self._runtime, u"\r\n"]))
        arf.append(u"parameters=-S -m agent -runonfly -filelog")        
        if runcode is not None:
            arf.append(u" runcode=" + runcode)
        
        f=utils.file_open(pth + utils.path_sep + u'native' + utils.path_sep + u'service.properties', 'w', encoding='utf-8') 
        f.write(u''.join(arf))
        f.close()        
        self._os_env = os.environ
        self._os_env['PYTHONHOME'] = u".." + utils.path_sep + ar[len(ar)-1] + utils.path_sep + u"runtime"
        self._py_exe = self._current_path + utils.path_sep + u"runtime" + utils.path_sep + self._runtime    
    
    def start_runonfly(self, runcode):
        pargs=[]
        pargs.append(self._py_exe)
        pargs.append(u'-S')
        pargs.append(u'-m')
        pargs.append(u'agent')
        pargs.append(u'-runonfly')
        pargs.append(u'-filelog')
        if runcode is not None:
            pargs.append(u'runcode=' + runcode)         
        
        badmin=False
        if gdi.is_windows_user_in_admin_group() and gdi.is_windows_run_as_admin():
            try:
                if gdi.is_windows_process_elevated():
                    badmin=True
            except:
                badmin=True #XP
        if badmin:
            bsvcok=False
            cmd=u'"' + u'native' + utils.path_sep + u'dwagsvc.exe" startRunOnFly'
            appout = NativeWindowsPopenUnicode(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate() 
            lines = appout[0].splitlines()
            for l in lines:
                if l=='OK':
                    bsvcok = True
            if bsvcok==False:
                return NativeWindowsPopenUnicode(pargs, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=self._os_env)
            else:
                return None
        else:
            return NativeWindowsPopenUnicode(pargs, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=self._os_env)
    
    def prepare_runtime_by_os(self,ds):
        return False;    
    
    def executecmd(self, cmd):
        appout = NativeWindowsPopenUnicode(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
        lines = appout[0].splitlines()
        for l in lines:
            if l=='OK':
                return True
        return False
    
    def stop_service(self):
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" stopService'
        return self.executecmd(cmd)
    
    def start_service(self):
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" startService'
        return self.executecmd(cmd)
    
    def install_service(self):
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" installService'
        return self.executecmd(cmd)
    
    def delete_service(self):
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" deleteService'
        return self.executecmd(cmd)
        
    def install_auto_run_monitor(self):
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" installAutoRun'
        b = self.executecmd(cmd)
        if b==True:
            #Esegue il monitor
            cmdmon=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwaglnc.exe" systray' 
            NativeWindowsPopenUnicode(cmdmon, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
        return b    
    
    def remove_auto_run_monitor(self):
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" removeAutoRun'
        return self.executecmd(cmd)
    
    def install_extra(self):
        return True
    
    def install_shortcuts(self) :        
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" installShortcuts'
        return self.executecmd(cmd)
            
    def remove_shortcuts(self) :
        cmd=u'"' + self._install_path + utils.path_sep + u'native' + utils.path_sep + u'dwagsvc.exe" removeShortcuts'
        return self.executecmd(cmd)


class Install:
    
    def __init__(self):
        self._gotoopt=None
        self._silent=False
        self._options={}
        self._native = get_native()
        self._main_url = None
        self._ambient="PROD"
        self._uinterface=None
        self._current_path=None;
        self._install_path=ui.VarString()
        self._install_log_path=None
        self._install_log=None
        self._inatall_agent_mode=None
        self._install_code=ui.VarString()
        self._run_code=ui.VarString()
        self._install_newag_user=ui.VarString()
        self._install_newag_password=ui.VarString("", True)
        self._install_newag_name=ui.VarString()
        self._proxy_type=ui.VarString("SYSTEM")
        self._proxy_host=ui.VarString("")
        self._proxy_port=ui.VarString("")
        self._proxy_user=ui.VarString("")
        self._proxy_password=ui.VarString("", True)
        self._proxy = None
        self._ipc_client = None
        self._name = None
        self._listen_port = 7950
        self._runWithoutInstall = False
        self._runWithoutInstallProxySet = False;
        self._runWithoutInstallAgentAlive = True
        self._runWithoutInstallAgentCloseByClient=False
        self._runWithoutInstallAgentCloseEnd=True
        self._bmock=False
        
    
    def _get_message(self, key):
        smsg = messages.get_message(key)
        if self._name is not None:
            return smsg.replace(u"DWAgent",self._name)
        else:
            return smsg
    
    def _get_main_url(self):
        if self._main_url is not None:
            return self._main_url
        elif self._ambient=="QA":
            return _MAIN_URL_QA
        elif self._ambient=="DEV":
            return _MAIN_URL_DEV
        return _MAIN_URL

    def _uinterface_action(self,e):
        if e["action"]=="CLOSE":
            self._runWithoutInstallAgentAlive=False
            self._runWithoutInstallAgentCloseByClient=True
            if self._uinterface.is_gui():
                cnt=0
                while not self._runWithoutInstallAgentCloseEnd:
                    time.sleep(1)
                    cnt+=1
                    if cnt>=20:
                        break
    
    def start(self, aropts={}):
        self._options=aropts
        
        #debug purpose
        if 'mock' in self._options:
            self._bmock = self._options['mock']
        
        #Load install.json
        appjs=None
        if utils.path_exists("install.json"):
            f=None
            try:
                f = utils.file_open("install.json")
                appjs = json.loads(f.read())
            except:
                None
            finally:
                if f is not None:
                    f.close()
        elif 'install.json' in self._options:
            appjs = self._options['install.json']
            del self._options['install.json']
        if appjs is not None:
            for p in appjs:
                if p=="lang":
                    messages.set_locale(appjs[p])
                else:
                    self._options[p]=appjs[p]
                    
        self._gotoopt=None
        if "mainurl" in self._options:
            self._main_url=self._options["mainurl"]
        if "logpath" in self._options:
            self._install_log_path=self._options["logpath"]
            if self._install_log_path[len(self._install_log_path)-1:]==utils.path_sep or self._install_log_path[len(self._install_log_path)-1:]=='"':
                self._install_log_path=self._install_log_path[0:len(self._install_log_path)-1]
            if utils.path_isdir(self._install_log_path):
                self._install_log_path = self._install_log_path + utils.path_sep + "dwaginstall.log"
        if "gotoopt" in self._options:
            self._gotoopt=self._options["gotoopt"]
        bgui=True
        if "gui" in self._options:
            bgui=self._options["gui"]
        self._silent=False;
        if "silent" in self._options:
            self._silent=self._options["silent"]
            if self._silent:
                bgui=False
                messages.set_locale(None)
            self._gotoopt="install"        
                
        if "name" in self._options:
            self._name=utils.str_new(self._options["name"])
            self._native.set_name(self._name)
        else:
            self._native.set_name(u"DWAgent")
        
        self._current_path=utils.os_getcwd()
        if self._current_path.endswith(utils.path_sep) is True:
            self._current_path=self._current_path[0:len(self._current_path)-1]
        self._native.set_current_path(self._current_path)
        if self._silent:
            self._runWithoutInstall=False
        prmsui = {}
        if "title" in self._options:
            prmsui["title"]=self._options["title"]
        else:
            prmsui["title"]="DWAgent"
        if "topinfo" in self._options:
            prmsui["topinfo"]=self._options["topinfo"]
        if "topimage" in self._options:
            prmsui["topimage"]=self._options["topimage"]
        applg = gdi._get_logo_from_conf(self._options,None)
        if applg != "":
            prmsui["logo"]=applg
        if "leftcolor" in self._options:
            prmsui["leftcolor"]=self._options["leftcolor"]
        self._uinterface = ui.UI(prmsui, self.step_init)
        
        if not self._silent:
            self._uinterface.set_action(self._uinterface_action)
        self._uinterface.start(bgui) 
        self.close_req()
                
        #CHIUDE LOG
        try:
            if self._install_log is not None:
                self._install_log.close()
        except:
            None
        
        

    '''def _read_info_file(self):
        try:
            f = utils.file_open("info.json")
            prop = json.loads(f.read())
            f.close()   
            return prop
        except Exception:
            return None'''
    
    def step_init(self, curui):
        #Verifica version dell'installer se è valida per la macchina
        if not gdi.is_windows() and not gdi.is_linux() and not gdi.is_mac():
            return ui.Message(self._get_message('versionInstallNotValid').format(""))
        if not self._silent:
            chs = ui.Chooser()
            if "welcometext" in self._options:
                m=utils.str_new(self._options["welcometext"])
            else:            
                m=self._get_message('welcomeLicense') + "\n\n" 
                m+=self._get_message('welcomeSecurity') + "\n\n" 
                m+=self._get_message('welcomeSoftwareUpdates') + "\n\n\n"
                m+=self._get_message('welcomePrivacyTerms')
                                
                p1 = m.index("https://www.dwservice.net/")
                p2 = m.index(".html",p1)
                surl= m[p1:p2+5]
                chs.add_message_hyperlink(p1, len(surl), "https://www.dwservice.net/licenses-sources.html")
                
                mtc = self._get_message('termsAndConditions')                
                ptc = m.index("#TERMSANDCONDITIONS")                
                chs.add_message_hyperlink(ptc, len(mtc), "https://www.dwservice.net/terms-and-conditions.html")
                m=m.replace("#TERMSANDCONDITIONS", mtc)
                
                mpp = self._get_message('privacyPolicy')
                ppp = m.index("#PRIVACYPOLICY")                
                chs.add_message_hyperlink(ppp, len(mpp), "https://www.dwservice.net/gdpr.html")
                m=m.replace("#PRIVACYPOLICY", mpp)
                
                
                
            chs.set_message(m)            
            chs.set_message_height(300)
            if "mode" in self._options and self._options["mode"]=="install":
                chs.add("install", self._get_message('install'))
            elif "mode" in self._options and self._options["mode"]=="run":
                chs.add("runWithoutInstallation", self._get_message('runWithoutInstallation'))
            else:
                chs.add("install", self._get_message('install'))
                chs.add("runWithoutInstallation", self._get_message('runWithoutInstallation'))
            chs.add("decline", self._get_message('decline'))
            chs.set_variable(ui.VarString("decline"))
            chs.set_accept_key("install;runWithoutInstallation")
            
            if self._gotoopt is not None:
                return self.step_install_choose(chs)
            else:
                chs.next_step(self.step_install_choose)
                return chs
        else:
            return self.step_install_choose(curui)
    
    def step_install_choose(self, curui):
        sopt=None
        if self._gotoopt is not None and self._gotoopt=="install":
            self._gotoopt=None
            sopt="install"
        elif self._gotoopt is not None and self._gotoopt=="run":
            self._gotoopt=None
            sopt="run"
        elif self._gotoopt is not None:
            self._gotoopt=None
            return self.step_init(curui)
        else:
            if curui.get_key() is None and curui.get_variable().get()=="runWithoutInstallation":
                if not self._silent:
                    if not self._bmock:
                        msg = self._native.check_init_run()
                        if msg is not None:
                            return ui.Message(msg)
                    sopt="run"
            else:
                if not self._silent:
                    if not self._bmock:
                        msg = self._native.check_init_install()
                        if msg is not None:
                            return ui.Message(msg)
                sopt="install"
                
        if sopt=="run":
            self._runWithoutInstall=True
            return self.step_install(curui)
        else:
            self._runWithoutInstall=False
            return self.step_check_already_install(curui)

    def step_check_already_install(self, curui):
        if not self._bmock:
            pth = self._native.get_install_path()
        else:
            pth=None
        if pth is not None:     
            if self._silent:       
                try:
                    if self._install_log_path is not None:
                        if self._install_log is None:
                            self._install_log = utils.file_open(self._install_log_path, "wb", encoding='utf-8')
                        self._append_log(self._get_message('alreadyInstalled'))
                        self._install_log.close()
                        self._install_log=None
                        
                except:
                    None
            return ui.Message(self._get_message('alreadyInstalled'))
        else:
            if not self._silent:
                #Scelta percorso
                ipt = ui.Inputs()
                if self._install_path.get() is None:
                    self._install_path.set(self._native.get_proposal_path())
                ipt.set_message(self._get_message('selectPathInstall'))
                ipt.add('path', self._get_message('path'), self._install_path, True)
                ipt.prev_step(self.step_init)
                ipt.next_step(self.step_check_install_path)
                return ipt
            else:
                self._install_path.set(self._native.get_proposal_path())
                return self.step_check_install_path(curui)


    def step_check_install_path(self, curui):
        pth = self._install_path.get()
        if pth.startswith("#DEV#"):
            self._ambient="DEV"
            pth=pth[5:]
            self._install_path.set(pth)
        elif pth.startswith("#QA#"):
            self._ambient="QA"
            pth=pth[4:]
            self._install_path.set(pth)
        if not self._silent:
            if not self._bmock and utils.path_exists(pth):
                m=self._get_message('confirmInstall').format(pth) + u'\n' + self._get_message('warningRemovePath')
            else:
                m=self._get_message('confirmInstall').format(pth)
            chs = ui.Chooser()
            chs.set_message(m)
            chs.add("yes", self._get_message('yes'))
            chs.add("no", self._get_message('no'))
            chs.set_variable(ui.VarString("no"))
            chs.set_accept_key("yes")
            chs.prev_step(self.step_check_already_install)
            chs.next_step(self.step_install)
            return chs
        else:
            return self.step_install(curui)
    
    def _download_progress(self, rtp):
        if "downloadtext" in self._options:
            dwnmsg=self._options["downloadtext"]
        else:
            dwnmsg=self._get_message('downloadFile')
        perc = int((float(rtp.get_byte_transfer()) / float(rtp.get_byte_length())) * 100.0)
        msg=dwnmsg.format(rtp.get_property('file_name'))
        prog = rtp.get_property('prog_start') + ((rtp.get_property('prog_end') - rtp.get_property('prog_start')) * (float(perc)/100.0))
        if "downloadtext" in self._options:
            perc=None
        self._uinterface.wait_message(msg, perc, prog)
    
    def _download_file(self, node_url, name, version, pstart,  pend):
        pth = self._install_path.get()
        url = node_url +  "getAgentFile.dw?name=" + name + "&version=" + version
        file_name = pth + utils.path_sep + name
        #Scarica il file
        rtp = communication.Response_Transfer_Progress({'on_data': self._download_progress})
        rtp.set_property('file_name', name)
        rtp.set_property('prog_start', pstart)
        rtp.set_property('prog_end', pend)
        communication.download_url_file(url, file_name, self._proxy, rtp)
    
    def _check_hash_file(self, name, shash):
        pth = self._install_path.get()
        fpath=pth + utils.path_sep + name
        
        md5 = hashlib.md5()
        with utils.file_open(fpath,'rb') as f: 
            for chunk in iter(lambda: f.read(8192), b''): 
                md5.update(chunk)
        h = md5.hexdigest()
        if h!=shash:
            raise Exception("Hash not valid. (file '{0}').".format(name))

    def _unzip_file(self, name, unzippath):
        pth = self._install_path.get()
        #Decoprime il file
        if unzippath!='':
            unzippath+=utils.path_sep 
        fpath=pth + utils.path_sep + name
        zfile = utils.zipfile_open(fpath)
        for nm in zfile.namelist():
            npath=pth + utils.path_sep + unzippath
            appnm = nm
            appar = nm.split("/")
            if (len(appar)>1):
                appnm = appar[len(appar)-1]
                npath+= nm[0:len(nm)-len(appnm)].replace("/",utils.path_sep)
            if not utils.path_exists(npath):
                utils.path_makedirs(npath)
            npath+=appnm
            fd = utils.file_open(npath,"wb")
            fd.write(zfile.read(nm))
            fd.close()
        zfile.close()
        
        #TO REMOVE 03/11/2021 KEEP COMPATIBILITY WITH OLD LINUX INSTALLER
        try:
            if name=="agent.zip":
                if utils.path_exists(unzippath + "daemon.pyc"):
                    utils.path_remove(unzippath + "daemon.pyc")                    
        except:
            None
    
    def load_prop_json(self, fname):
        f = utils.file_open(fname)
        prp  = json.loads(f.read())
        f.close()
        return prp        
    
    def store_prop_json(self, prp, fname):
        s = json.dumps(prp, sort_keys=True, indent=1)
        f = utils.file_open(fname, 'wb')
        f.write(s)
        f.close()
    
    def obfuscate_password(self, pwd):
        return base64.b64encode(zlib.compress(pwd))

    def read_obfuscated_password(self, enpwd):
        return zlib.decompress(base64.b64decode(enpwd))
    
    def _copy_custom_images(self, prpconf, pth):
        ar = ["topimage", "logoxos", "logo16x16", "logo32x32", "logo48x48"]
        for nm in ar:
            if nm in prpconf and utils.path_exists(prpconf[nm]):
                dstpth = pth + utils.path_sep + "ui" + utils.path_sep + "images" + utils.path_sep + "custom"
                if not utils.path_exists(dstpth):
                    utils.path_makedirs(dstpth)
                utils.path_copy(self._options[nm], dstpth + utils.path_sep + self._options[nm])
    
    def _download_files(self, pstart, pend):
        iniperc=0;
        if "downloadtext" in self._options:
            dwnmsg=self._options["downloadtext"]
            iniperc=None
        else:
            dwnmsg=self._get_message('downloadFile')
        
        if self._bmock:
            msg=dwnmsg.format(u'MOCK')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(2)
            self._uinterface.wait_message(msg, None,  pend)
            return
        
        pth = self._install_path.get()
        fileversions = {}
        
        msg=dwnmsg.format(u'config.xml')
        self._uinterface.wait_message(msg,  iniperc,  pstart)
        prpconf = communication.get_url_prop(self._get_main_url() + "getAgentFile.dw?name=config.xml", self._proxy)
        if "name" in self._options:
            prpconf["name"] = self._options["name"]
        if "topinfo" in self._options:
            prpconf["topinfo"]=self._options["topinfo"]
        if "topimage" in self._options and utils.path_exists(self._options["topimage"]):
            prpconf["topimage"]=self._options["topimage"]                        
        if "logoxos" in self._options and utils.path_exists(self._options["logoxos"]):
            prpconf["logoxos"]=self._options["logoxos"]
            self._native.set_logo_path(utils.path_sep + u"ui" + utils.path_sep + u"images" + utils.path_sep + u"custom" + utils.path_sep + prpconf["logoxos"])        
        if "logo16x16" in self._options and utils.path_exists(self._options["logo16x16"]):
            prpconf["logo16x16"]=self._options["logo16x16"]
        if "logo32x32" in self._options and utils.path_exists(self._options["logo32x32"]):
            prpconf["logo32x32"]=self._options["logo32x32"]
        if "logo48x48" in self._options and utils.path_exists(self._options["logo48x48"]):
            prpconf["logo48x48"]=self._options["logo48x48"]
        if "leftcolor" in self._options:
            prpconf["leftcolor"]=self._options["leftcolor"]                    
        if not self._runWithoutInstall:
            if "listenport" in self._options:
                prpconf['listen_port'] = self._options["listenport"]
            else:
                prpconf['listen_port'] = self._listen_port
        
        if self._runWithoutInstall:
            try:
                if utils.path_exists(self._install_path.get() + utils.path_sep +  u'config.json'):
                    appconf = self.load_prop_json(self._install_path.get() + utils.path_sep +  u'config.json')
                    if "preferred_run_user" in appconf:
                        prpconf["preferred_run_user"]=appconf["preferred_run_user"]
            except:
                None
        
        
        self._copy_custom_images(prpconf, pth)
        self.store_prop_json(prpconf, pth + utils.path_sep + u'config.json')
        
        if not (self._runWithoutInstall and utils.path_exists(pth + utils.path_sep + u"config.json") 
                and utils.path_exists(pth + utils.path_sep + u"fileversions.json") and utils.path_exists(pth + utils.path_sep + u"agent.py") 
                and utils.path_exists(pth + utils.path_sep + u"communication.py") and utils.path_exists(pth + utils.path_sep + u"ipc.py")):
            msg=dwnmsg.format('files.xml')
            self._uinterface.wait_message(msg, iniperc,  pstart)
            prpfiles = communication.get_url_prop(self._get_main_url() + "getAgentFile.dw?name=files.xml", self._proxy )
            
            if "nodeUrl" in prpfiles:
                node_url = prpfiles['nodeUrl']
            if node_url is None or node_url=="":
                raise Exception("Download files: Node not available.")        
            
            fls = []
            
            import detectinfo
            appnsfx = detectinfo.get_native_suffix()
            if not self._runWithoutInstall:
                if appnsfx is not None:
                    fls.append({'name':u'agentupd_' + appnsfx + '.zip', 'unzippath':u'native'})
            
            fls.append({'name':'agent.zip', 'unzippath':u''})
            if not self._runWithoutInstall:
                fls.append({'name':u'agentui.zip', 'unzippath':u''})
            fls.append({'name':u'agentapps.zip', 'unzippath':u''})
            
            if appnsfx is not None:
                if not appnsfx=="linux_generic":
                    if not self._runWithoutInstall:
                        fls.append({'name':u'agentui_' + appnsfx + u'.zip', 'unzippath':u'native'})
                    fls.append({'name':u'agentlib_' + appnsfx + u'.zip', 'unzippath':u'native'})
            step = (pend-pstart) / float(len(fls))
            pos = pstart
            for i in range(len(fls)):
                fnm=fls[i]['name'];
                file_name = pth + utils.path_sep + fnm
                #Elimina file
                try:
                    utils.path_remove(file_name)
                except Exception:
                    None
                #Scarica file
                self._append_log(u"Download file " + fnm + " ...")
                self._download_file(node_url, fnm, prpfiles[fnm + '@version'], pos,  pos+step)
                self._append_log(u"Download file " + fnm + u".OK!")
                #Verifica hash
                self._append_log(u"Check file hash " + fnm + " ...")
                self._check_hash_file(fnm, prpfiles[fnm + '@hash'])
                self._append_log(u"Check file hash " + fnm + u".OK!")
                #Unzip file
                self._append_log(u"Unzip file " + fnm + " ...")
                self._unzip_file(fnm, fls[i]['unzippath'])
                self._append_log(u"Unzip file " + fnm + u".OK!")
                #Elimina file
                try:
                    utils.path_remove(file_name)
                except Exception:
                    None
                fileversions[fnm ]=prpfiles[fnm + '@version']
                pos+=step
            
            #Scrive files.json
            self.store_prop_json(fileversions, pth + utils.path_sep + u'fileversions.json')
        
    
    def _count_file_in_path(self, valid_path):
        x = 0
        for root, dirs, files in utils.path_walk(valid_path):
            for f in files:
                x = x+1
        return x

    def _copy_tree_file(self, fs, fd, msginfo):
        if utils.path_isdir(fs):
            if not utils.path_exists(fd):
                utils.path_makedirs(fd)
            lst=utils.path_list(fs)
            for fname in lst:
                self._copy_tree_file(fs + utils.path_sep + fname, fd + utils.path_sep + fname, msginfo)
        else:
            msginfo["progr"]+=msginfo["step"]
            perc =  int(((msginfo["progr"] - msginfo["pstart"] ) / (msginfo["pend"] - msginfo["pstart"] )) * 100.0)
            self._uinterface.wait_message(msginfo["message"], perc,  msginfo["progr"])
            if utils.path_exists(fd):
                utils.path_remove(fd)
            if utils.path_islink(fs):
                linkto = utils.path_readlink(fs)
                utils.path_symlink(linkto, fd)
            else:
                utils.path_copy(fs, fd)
                
        
    def _copy_tree(self, fs, ds, msg, pstart, pend):
        self._uinterface.wait_message(msg, 0, pstart)
        #Conta file
        nfile = self._count_file_in_path(fs)
        step = (pend-pstart) / nfile
        self._copy_tree_file(fs, ds, {'message':msg,  'pstart':pstart,  'pend':pend,  'progr':pstart, 'step':step })
    
    def _make_directory(self, pstart, pend):
        if self._bmock:
            return 
            
        pth = self._install_path.get()
        if utils.path_exists(pth):
            self._uinterface.wait_message(self._get_message('removeFile'), None, pstart)
            try:
                try:
                    self._native.stop_service()
                    self._native.delete_service()
                except:
                    None 
                utils.path_remove(pth)
            except:
                raise Exception(u'Can not remove path.') #Inserire messaggio in lingua
            
        #Crea le cartelle necessarie
        try:
            self._uinterface.wait_message(self._get_message('pathCreating'),  None, pend)
            utils.path_makedirs(pth)
        except:
            raise Exception(self._get_message('pathNotCreate'))
        
    def copy_runtime(self,pstart, pend):
        if self._bmock:
            msg=self._get_message('copyFiles')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(1)
            self._uinterface.wait_message(msg,  None,  pend)
            return
        ds=self._install_path.get() + utils.path_sep + "runtime"
        msg=self._get_message('copyFiles')
        if utils.path_exists(_RUNTIME_PATH):
            self._copy_tree(_RUNTIME_PATH,ds,msg,pstart,pend)
        else:
            if not self._native.prepare_runtime_by_os(ds):
                raise Exception(self._get_message('missingRuntime'))
    
    
    def copy_native(self,pstart, pend):
        if self._bmock:
            msg=self._get_message('copyFiles')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(1)
            self._uinterface.wait_message(msg,  None,  pend)
            return
        
        if not utils.path_exists(_NATIVE_PATH):
            raise Exception(self._get_message('missingNative'))            
        ds=self._install_path.get() + utils.path_sep + "native"
        msg=self._get_message('copyFiles')
        self._copy_tree(_NATIVE_PATH,ds,msg,0.76, 0.8)
        
        #CREATE installer.ver
        dsver=ds + utils.path_sep + "installer.ver"
        if utils.path_exists(dsver):
            utils.path_remove(dsver)
        fver = utils.file_open(dsver,"wb")
        fver.write(utils.str_to_bytes(str(_INSTALLER_VERSION)))
        fver.close()
        
    
    def _install_service(self, pstart, pend):
        if self._bmock:
            msg=self._get_message('installService')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(1)
            msg=self._get_message('startService')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(1)
            self._uinterface.wait_message(msg,  None,  pend)
            return
        msg=self._get_message('installService')
        self._uinterface.wait_message(msg, None,  pstart)
        
        #Rimuove un eventuale vecchia installazione
        self._append_log(u"Service - Try to remove dirty installation...")
        self._native.stop_service()
        self._native.delete_service()
                
        #Installa nuovo servizio
        self._append_log(u"Service - Installation...")
        if not self._native.install_service():
            raise Exception(self._get_message('installServiceErr'))
            
        #avvia il servizio
        self._append_log(u"Service - Starting...")
        msg=self._get_message('startService')
        self._uinterface.wait_message(msg, None,  pend)
        if not self._native.start_service():
            raise Exception(self._get_message("startServiceErr"))        
    
    def _install_monitor(self, pstart, pend):
        if self._bmock:
            msg=self._get_message('installMonitor')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(1)
            self._uinterface.wait_message(msg,  None,  pend)
            return
        
        msg=self._get_message('installMonitor')
        self._uinterface.wait_message(msg,  None, pstart)        
        
        #Arresta un eventuale monitor attivo
        self._append_log(u"Monitor - Stopping...")
        stop_monitor(self._install_path.get())
        
        #Rimuove vecchia installazione
        self._append_log(u"Monitor - Try to remove dirty installation...")
        self._native.remove_auto_run_monitor()
        
        self._append_log(u"Monitor - Installing...")
        if not self._native.install_auto_run_monitor():
            raise Exception(self._get_message('installMonitorErr'))
        self._uinterface.wait_message(msg,  None, pend)
    
    def _install_shortcuts(self, pstart, pend):
        if self._bmock:
            msg=self._get_message('installShortcuts')
            self._uinterface.wait_message(msg,  None,  pstart)
            time.sleep(1)
            self._uinterface.wait_message(msg,  None,  pend)
            return
        
        msg=self._get_message('installShortcuts')
        self._uinterface.wait_message(msg,  None, pstart)
        
        #Rimuove collegamenti
        self._append_log(u"Shortcut - Try to remove dirty installation...")
        self._native.remove_shortcuts()
        
        #Installazione collegamneti
        self._append_log(u"Shortcut - Installing...")
        if not self._native.install_shortcuts():
            raise Exception(self._get_message('installShortcutsErr'))
        self._uinterface.wait_message(msg,  None, pend)
    
    def step_config_init(self, curui):
        chs = ui.Chooser()
        m=self._get_message('configureInstallAgent')
        chs.set_message(m)
        chs.set_key("chooseInstallMode")
        chs.set_param('firstConfig',curui.get_param('firstConfig',False))
        chs.add("installCode", self._get_message('configureInstallCode'))
        chs.add("installNewAgent", self._get_message('configureInstallNewAgent'))        
        chs.set_variable(ui.VarString("installCode"))
        chs.next_step(self.step_config)
        if "installputcode" in self._options and self._options["installputcode"]:
            return self.step_config(chs)
        return chs
    
    def step_config(self, curui):
        if curui.get_param('tryAgain',False):
            if curui.get_variable().get()=='configureLater':
                return ui.Message(self._get_message('endInstallConfigLater'))
        
        if curui.get_key() is not None and curui.get_key()=='chooseInstallMode':
            self._inatall_agent_mode=curui.get_variable().get()
        
        if self._inatall_agent_mode=="installNewAgent":
            ipt = ui.Inputs()
            ipt.set_key('configure')
            ipt.set_param('firstConfig',curui.get_param('firstConfig',False))
            ipt.set_message(self._get_message('enterInstallNewAgent'))
            if self._install_newag_user.get() is None:
                self._install_newag_user.set("")
            ipt.add('user', self._get_message('dwsUser'), self._install_newag_user, True)
            if self._install_newag_password.get() is None:
                self._install_newag_password.set("")
            ipt.add('password', self._get_message('dwsPassword'), self._install_newag_password, True)
            if self._install_newag_name.get() is None:
                self._install_newag_name.set("")
            ipt.add('name', self._get_message('agentName'), self._install_newag_name, True)
        else:
            ipt = ui.Inputs()
            ipt.set_key('configure')
            ipt.set_param('firstConfig',curui.get_param('firstConfig',False))
            if self._install_code.get() is None:
                self._install_code.set("")
            ipt.set_message(self._get_message('enterInstallCode'))
            ipt.add('code', self._get_message('code'), self._install_code, True)
        if not ("installputcode" in self._options and self._options["installputcode"]):            
            ipt.prev_step(self.step_config_init)
        ipt.next_step(self.step_config_install_request)
        return ipt
    
    def send_req(self, req, prms=None):
        try:
            if self._ipc_client==None or self._ipc_client.is_close():
                self._ipc_client=listener.IPCClient(self._install_path.get())
            return self._ipc_client.send_request("admin", "", req, prms)
        except: 
            return 'ERROR:REQUEST_TIMEOUT'
    
    def close_req(self):
        if self._ipc_client!=None and not self._ipc_client.is_close():
            self._ipc_client.close()
    
    def _send_password_config(self):
        if "configPassword" in self._options:
            self.send_req("change_pwd",{'password': self._options["configPassword"]})
    
    def _send_proxy_config(self):
        pt = ''
        if self._proxy.get_port() is not None:
            pt=str(self._proxy.get_port())
        return self.send_req("set_proxy",{'type': self._proxy.get_type(), 
                                   'host': self._proxy.get_host(), 
                                   'port': pt, 
                                   'user': self._proxy.get_user(), 
                                   'password': self._proxy.get_password()})
    
    def step_configure_proxy_type(self, curui):
        chs = ui.Chooser()
        chs.set_key(curui.get_key())
        chs.set_message(self._get_message('chooseProxyType'))
        chs.add("SYSTEM", self._get_message('proxySystem'))
        chs.add("HTTP", self._get_message('proxyHttp'))
        chs.add("SOCKS4", self._get_message('proxySocks4'))
        chs.add("SOCKS4A", self._get_message('proxySocks4a'))
        chs.add("SOCKS5", self._get_message('proxySocks5'))
        chs.add("NONE", self._get_message('proxyNone'))
        chs.set_variable(self._proxy_type)
        if curui.get_key()=="install":
            if not self._runWithoutInstall:
                chs.prev_step(self.step_check_install_path)
            else:
                chs.prev_step(self.step_init)
        elif curui.get_key()=="runonfly":
            None #non abilita il tasto prev
        else:
            chs.prev_step(self.step_config)
        chs.next_step(self.step_configure_proxy_info)
        return chs
    
    def step_configure_proxy_info(self, curui):
        if curui.get_variable().get()=='HTTP' or curui.get_variable().get()=='SOCKS4' or curui.get_variable().get()=='SOCKS4A' or curui.get_variable().get()=='SOCKS5':
            ipt = ui.Inputs()
            ipt.set_key(curui.get_key())
            ipt.set_message(self._get_message('proxyInfo'))
            ipt.add('proxyHost', self._get_message('proxyHost'), self._proxy_host,  True)
            ipt.add('proxyPort', self._get_message('proxyPort'), self._proxy_port,  True)
            ipt.add('proxyAuthUser', self._get_message('proxyAuthUser'), self._proxy_user,  False)
            ipt.add('proxyAuthPassword', self._get_message('proxyAuthPassword'), self._proxy_password,  False)
            ipt.prev_step(self.step_configure_proxy_type)
            ipt.next_step(self.step_configure_proxy_set)
            return ipt
        else:
            self._proxy_host.set("")
            self._proxy_port.set("")
            self._proxy_user.set("")
            self._proxy_password.set("")
            return self.step_configure_proxy_set(curui)
    
    def step_configure_proxy_set(self, curui):
        if curui.get_param('tryAgain',False):
            if curui.get_variable() is not None and curui.get_variable().get()=='configureLater':
                return self.step_config(curui)
        #Verifica se la porta è numerica
        oldprx = self._proxy
        self._proxy=communication.ProxyInfo()
        self._proxy.set_type(self._proxy_type.get())
        self._proxy.set_host(self._proxy_host.get())
        if self._proxy_type.get()=='HTTP' or self._proxy_type.get()=='SOCKS4' or self._proxy_type.get()=='SOCKS4A' or self._proxy_type.get()=='SOCKS5':
            try:
                self._proxy.set_port(int(self._proxy_port.get()))
            except:
                self._proxy = oldprx
                return ui.ErrorDialog(self._get_message("validInteger") .format(self._get_message('proxyPort')))
        self._proxy.set_user(self._proxy_user.get())
        self._proxy.set_password(self._proxy_password.get())
        if curui.get_key()=='install':
            curui.set_key('retryDownloadProxy')
            return self.step_install(curui)
        elif curui.get_key()=="runonfly":
            curui.set_key('retryRunOnFlyProxy')
            return self.step_runonfly(curui)
        else:
            try:
                s=self._send_proxy_config()
                if s=='OK':
                    return self.step_config_install_request(curui)
                elif s=="ERROR:REQUEST_TIMEOUT":
                    return ui.ErrorDialog(self._get_message('errorConnectionConfig'))
                else:
                    return ui.ErrorDialog(s) 
            except:
                chs = ui.Chooser()
                chs.set_key(curui.get_key())
                chs.set_param("tryAgain", True)
                chs.set_message(self._get_message('errorConnectionConfig'))
                chs.add("noTryAgain", self._get_message('noTryAgain'))
                chs.add("configureLater", self._get_message('configureLater'))
                chs.set_variable(ui.VarString("noTryAgain"))
                chs.prev_step(self.step_config)
                chs.next_step(self.step_configure_proxy_set)
                return chs
            return self._configure_proxy_set(curui)

    def step_config_install_request(self, curui):
        if self._bmock:
            self._append_log(u"End Installation.")
            return ui.Message(self._get_message('endInstall'))
        
        if not self._silent:
            if curui.get_param('tryAgain',False):
                if curui.get_variable().get()=='configureLater':
                    return ui.Message(self._get_message('endInstallConfigLater'))
                elif curui.get_variable().get()=='configProxy':
                    return self.step_configure_proxy_type(curui)
        
        if self._silent:
            if "key" in self._options:
                self._inatall_agent_mode="installCode"
                self._install_code.set(self._options["key"])
            elif "user" in self._options and "password" in self._options:
                self._inatall_agent_mode="installNewAgent"
                self._install_newag_user.set(self._options["user"])
                self._install_newag_password.set(self._options["password"])
                if "agentName" in self._options:
                    self._install_newag_name.set(self._options["agentName"])
                else:
                    self._install_newag_name.set(platform.node())
            else:
                self._append_log(u"End Installation.")
                return ui.Message(self._get_message('endInstall'))
            
        if self._inatall_agent_mode=="installNewAgent":
            self._append_log(u"Create new Agent ...")
            msg=self._get_message('createNewAgent')
        else:
            self._append_log(u"Check Install Code ...")
            msg=self._get_message('checkInstallCode')            
        self._uinterface.wait_message(msg)
        page = None
        try:
            #Imposta il proxy
            if curui.get_param('firstConfig',False) and self._proxy is not None:
                s=self._send_proxy_config()
                if s!='OK':
                    if s=="ERROR:REQUEST_TIMEOUT":
                        self._append_log(u"Error Configure: Request timeout")
                        return ui.ErrorDialog(self._get_message('errorConnectionConfig'))
                    else:
                        self._append_log(u"Error Configure: " + s)
                        return ui.ErrorDialog(s)
            #Verifica codice
            s = None
            if self._inatall_agent_mode=="installNewAgent":
                s = self.send_req("install_new_agent",{'user': self._install_newag_user.get(), 'password': self._install_newag_password.get(), 'name':self._install_newag_name.get()})
            else:
                s = self.send_req("install_key",{'code': self._install_code.get().strip().replace(" ", "")})
            if s=='OK':
                self._append_log(u"End Installation.")
                return ui.Message(self._get_message('endInstall'))
            elif s=="ERROR:INVALID_CODE" or s=="ERROR:INVALID_USER_PASSWORD" or s=="ERROR:NAME_NOT_VALID" or s=="ERROR:ALREADY_EXISTS" or s=="ERROR:AGENT_MAX":
                if not self._silent:
                    chs = ui.Chooser()
                    chs.set_key('configure')
                    chs.set_param('tryAgain',True)
                    if s=="ERROR:INVALID_CODE":
                        chs.set_message(self._get_message('errorInvalidCode'))
                    elif s=="ERROR:INVALID_USER_PASSWORD":
                        chs.set_message(self._get_message('errorInvalidUserPassword'))
                    elif s=="ERROR:NAME_NOT_VALID":
                        chs.set_message(self._get_message('errorAgentNameNotValid'))
                    elif s=="ERROR:ALREADY_EXISTS":
                        chs.set_message(self._get_message('errorAgentAlreadyExsists').format(self._install_newag_name.get()))
                    elif s=="ERROR:AGENT_MAX":
                        chs.set_message(self._get_message('errorAgentMax'))
                    else:
                        chs.set_message(s)
                    chs.add("reEnter", self._get_message('reEnterData'))
                    chs.add("configureLater", self._get_message('configureLater'))
                    chs.set_variable(ui.VarString("reEnter"))
                    chs.next_step(self.step_config)
                    chs.prev_step(self.step_config)
                    return chs
                else:
                    appse=s.split(":")[1];
                    self._append_log(u"Error Configure: " + appse)
                    return ui.ErrorDialog(appse)
            elif s=="ERROR:CONNECT_ERROR":
                if not self._silent:
                    chs = ui.Chooser()
                    chs.set_key('configure')
                    chs.set_param('tryAgain',True)
                    chs.set_message(self._get_message('errorConnectionQuestion'))
                    chs.add("configProxy", self._get_message('yes'))
                    chs.add("noTryAgain", self._get_message('noTryAgain'))
                    chs.add("configureLater", self._get_message('configureLater'))
                    chs.set_variable(ui.VarString("noTryAgain"))
                    chs.prev_step(self.step_config)
                    chs.next_step(self.step_config_install_request)
                    return chs
                else:
                    appse="Connect Error";
                    self._append_log(u"Error Configure: " + appse)
                    return ui.ErrorDialog(appse)
            
            elif s=="ERROR:REQUEST_TIMEOUT":
                self._append_log(u"Error Configure: Request timeout")
                return ui.ErrorDialog(self._get_message('errorConnectionConfig'))
            else:
                self._append_log(u"Error Configure: " + s)
                return ui.ErrorDialog(s) 
        except Exception as e:
            if not self._silent:
                chs = ui.Chooser()
                chs.set_key('configure')
                chs.set_param('tryAgain',True)
                chs.set_message(self._get_message('errorConnectionConfig'))
                chs.add("noTryAgain", self._get_message('noTryAgain'))
                chs.add("configureLater", self._get_message('configureLater'))
                chs.set_variable(ui.VarString("noTryAgain"))
                chs.prev_step(self.step_config)
                chs.next_step(self.step_config_install_request)
                return chs
            else:
                self._append_log(u"Error Configure: " + utils.exception_to_string(e))
                return ui.ErrorDialog(utils.exception_to_string(e))
        finally:
            if page is not None:
                page.close()
    
    def _append_log(self, txt):
        try:
            if not self._bmock:
                if self._install_log is not None:
                    self._install_log.write(utils.str_new(time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())) + u" - " + txt + u"\n")
                    self._install_log.flush()
        except:
            None    
    
    def _runonfly_update(self,pthsrc,pthdst):
        lst=utils.path_list(pthsrc)
        for fname in lst:
            if utils.path_isfile(pthsrc + utils.path_sep + fname):
                if utils.path_isfile(pthdst + utils.path_sep + fname):
                    utils.path_remove(pthdst + utils.path_sep + fname)
                utils.path_copy(pthsrc + utils.path_sep + fname, pthdst + utils.path_sep + fname)
            elif utils.path_isdir(pthsrc + utils.path_sep + fname):
                self._runonfly_update(pthsrc + utils.path_sep + fname,pthdst + utils.path_sep + fname)
    
    
    #COMPATIBILITA' VERSIONI PRECEDENTI DI RUNONFLY
    def _fix_runonfly_old_version(self):
        if utils.path_exists(u"fileversions.json"):            
            fver = self.load_prop_json('fileversions.json')
            if 'agent.zip' in fver:
                lver = int(fver['agent.zip'])
                if lver<1484751796000:
                    self._append_log(u"Fixing old version...")
                    sys.path.insert(0,self._install_path.get())
                    objlib = importlib.import_module("agent")
                    try:
                        if utils.is_py2():
                            reload(objlib)                            
                        else:
                            importlib.reload(objlib)
                        func = getattr(objlib,  'Main')
                        appcls = func(["-runonfly","-filelog"])
                        #IMPOSTARE IL PROXY
                        appcls._read_config_file()
                        appcls._load_config()
                        appcls._update_ready=False
                        bnoupd = appcls._check_update()
                        #appcls.set_runonfly_action(self._runonfly_action)
                        #appcls.start()
                    finally:
                        if appcls is not None:
                            try:
                                appcls.unload_library()
                            except:
                                None
                        sys.path.remove(sys.path[0])
                    if bnoupd:
                        raise Exception("") #GESTITO IN step_runonfly
                    return True
        return False                
        
    def _step_runonfly_conn_msg(self, usr, pwd):
        appwmsg=[]        
        if "runputcode" in self._options and self._options["runputcode"]:
            if "runtoptext" in self._options:                            
                appwmsg.append(self._options["runtoptext"])
            else:
                appwmsg.append(self._get_message("runWithoutInstallationOnlineTopPutCode"))
            appwmsg.append(u"\n\n\n\n")
            if "runbottomtext" in self._options:                            
                appwmsg.append(self._options["runbottomtext"])
            else:
                appwmsg.append(self._get_message("runWithoutInstallationOnlineBottomPutCode"))
        else:
            if "runtoptext" in self._options:                            
                appwmsg.append(self._options["runtoptext"])
            else:
                appwmsg.append(self._get_message("runWithoutInstallationOnlineTop"))
            appwmsg.append(u"\n\n")
            appwmsg.append(self._get_message("runWithoutInstallationOnlineUser").format(usr))
            appwmsg.append(u"\n\n")
            appwmsg.append(self._get_message("runWithoutInstallationOnlinePassword").format(pwd))
            appwmsg.append(u"\n\n")
            if "runbottomtext" in self._options:                            
                appwmsg.append(self._options["runbottomtext"])
            else:
                appwmsg.append(self._get_message("runWithoutInstallationOnlineBottom"))
        self._uinterface.wait_message(u"".join(appwmsg), allowclose=True)
     
    def step_runonfly_putcode(self, curui):
        ipt = ui.Inputs()
        ipt.set_key('configure')
        #ipt.set_param('firstConfig',curui.get_param('firstConfig',False))
        if self._run_code.get() is None:
            self._run_code.set("")
        ipt.set_message(self._get_message('enterRunCode'))
        ipt.add('code', self._get_message('code'), self._run_code, True)
        ipt.prev_step(self.step_init)
        ipt.next_step(self.step_runonfly)
        return ipt
     
    def step_runonfly(self, curui):
        if self._bmock:
            self._uinterface.wait_message(self._get_message("runWithoutInstallationStarting"))
            time.sleep(1)
            self._step_runonfly_conn_msg("MOCK","MOCK")
            while self._runWithoutInstallAgentAlive:
                time.sleep(1)
            return ui.Message(self._get_message('runWithoutInstallationEnd')) 
        
        #Prepare file
        self._append_log(u"Prepare file...")
        if "runputcode" in self._options and self._options["runputcode"]:
            self._native.prepare_file_runonfly(self._run_code.get())
        else:
            self._native.prepare_file_runonfly(None)
        self._append_log(u"Prepare file.OK!")
        
        #Start agent
        if self._proxy is not None:
            prpconf = self.load_prop_json(self._install_path.get() + utils.path_sep +  u'config.json')
            if self._proxy.get_type() is not None:
                prpconf['proxy_type'] = self._proxy.get_type()
            if self._proxy.get_host() is not None:
                prpconf['proxy_host'] = self._proxy.get_host()
            if self._proxy.get_port() is not None:
                prpconf['proxy_port'] = self._proxy.get_port()
            if self._proxy.get_user() is not None:
                prpconf['proxy_user'] = self._proxy.get_user()
            else:
                prpconf['proxy_user'] = ""
            if self._proxy.get_password() is not None:
                prpconf['proxy_password'] = self.obfuscate_password(self._proxy.get_password())
            else:
                prpconf['proxy_password'] = ""
            self.store_prop_json(prpconf, self._install_path.get() + utils.path_sep +  u'config.json')
        
        if curui.get_key() is not None and curui.get_key()=='retryRunOnFly':
            if curui.get_variable().get()=='configProxy':
                curui.set_key('runonfly')
                return self.step_configure_proxy_type(curui)
        
        self._append_log(u"Changing current directory to " + utils.path_absname(self._install_path.get()) + " ...")
        utils.system_changedir(self._install_path.get())
        self._runWithoutInstallAgentCloseEnd=False
        runcode_notfound=False
        runcode_connected=False
        pstipc=None
        try:   
            while self._runWithoutInstallAgentAlive:
                self._uinterface.wait_message(self._get_message("runWithoutInstallationStarting"))
                self._append_log(u"Starting...")
                if utils.path_exists(u"update"):
                    self._append_log(u"Updating...")
                    self._uinterface.wait_message(self._get_message("runWithoutInstallationUpdating"))
                    self._runonfly_update(u"update",".")
                    utils.path_remove(u"update")
            
                #COMPATIBILITA' VERSIONI PRECEDENTI DI RUNONFLY
                if self._fix_runonfly_old_version():
                    if utils.path_exists(u"update"):
                        self._uinterface.wait_message(self._get_message("runWithoutInstallationUpdating"))
                        self._runonfly_update(u"update",".")
                        utils.path_remove(u"update")
            
                #CHECK FILE
                if utils.path_exists(u"dwagent.pid"):
                    utils.path_remove(u"dwagent.pid")
                if utils.path_exists(u"dwagent.start"):
                    utils.path_remove(u"dwagent.start")
                if utils.path_exists(u"dwagent.stop"):
                    utils.path_remove(u"dwagent.stop")
                if utils.path_exists(u"dwagent.status"):
                    utils.path_remove(u"dwagent.status")
                
                #Scrive pid
                f = utils.file_open(u"dwagent.pid", 'wb')
                f.write(str(os.getpid()))
                f.close()            
                 
                #Avvia il servizio
                self._append_log(u"Run... ")
                if "runputcode" in self._options and self._options["runputcode"]:
                    ponfly=self._native.start_runonfly(self._run_code.get())
                else:
                    ponfly=self._native.start_runonfly(None)
                #Attende L'avvio
                cnt=0
                while (not utils.path_exists(u"dwagent.start")):
                    time.sleep(1)
                    cnt+=1
                    if cnt>10: #10 Secondi
                        raise Exception("") #GESTITO SOTTO
                if utils.path_exists(u"dwagent.start"):
                    utils.path_remove(u"dwagent.start")
                self._append_log(u"Started.")
                
                #GESTISCE STATO
                pstipc = ipc.Property()
                pstipc.open("runonfly")
                agpid=int(pstipc.get_property("pid"))
                curst=""
                while self._native.is_task_running(agpid) and (ponfly is None or ponfly.poll() is None):
                    st = pstipc.get_property("status")
                    if st!=curst:
                        curst=st
                        if st=="CONNECTED":
                            if "runputcode" in self._options and self._options["runputcode"]:
                                runcode_connected=True
                                self._step_runonfly_conn_msg(None,None)
                            else:            
                                usr=pstipc.get_property("user")
                                usr=usr[0:3] + u"-" + usr[3:6] + u"-" + usr[6:9] + u"-" + usr[9:]
                                self._step_runonfly_conn_msg(usr, pstipc.get_property("password"))                            
                        elif st=="CONNECTING":
                            self._uinterface.wait_message(self._get_message("runWithoutInstallationConnecting"), allowclose=True)
                        elif st=="RUNCODE_NOTFOUND":
                            if "runputcode" in self._options and self._options["runputcode"]:
                                self._runWithoutInstallAgentAlive=False
                                if runcode_connected:
                                    self._runWithoutInstallAgentCloseByClient=True
                                else:
                                    runcode_notfound=True
                        elif st is not None and st.startswith("WAIT:"):
                            retry=int(st.split(":")[1])
                            if retry>3:
                                self._runWithoutInstallAgentAlive=False
                            else:
                                self._uinterface.wait_message(self._get_message("runWithoutInstallationWait").format(str(retry)), allowclose=True)

                    if self._runWithoutInstallAgentAlive==False:
                        break
                    time.sleep(1)
                
                if runcode_notfound==False:
                    self._uinterface.wait_message(self._get_message("runWithoutInstallationClosing"))
                
                f = utils.file_open(u"dwagent.stop", 'wb')
                f.close()
                cnt=0
                while self._native.is_task_running(agpid) and (ponfly is None or ponfly.poll() is None):
                    time.sleep(1)
                    cnt+=1
                    if cnt>5: #5 Secondi
                        break
                
                pstipc.close()
                pstipc=None
                time.sleep(1)
                
        except Exception as e:
            f = utils.file_open(u"dwagent.stop", 'wb')
            f.close()
            try:
                if pstipc is not None:
                    pstipc.close()
                    pstipc=None
            except:
                None
            utils.system_changedir(self._current_path)
            self._runWithoutInstallAgentCloseEnd=True
            #Se non è partito l'agente potrebbe dipendere da un problema di file corrotti
            self._append_log(u"Error: " + utils.exception_to_string(e) + u"\n" + utils.get_stacktrace_string())
            return ui.Message(self._get_message("runWithoutInstallationUnexpectedError").format(utils.path_absname(self._install_path.get())) + "\n\n" + utils.exception_to_string(e))
            
        
        utils.system_changedir(self._current_path)
        self._runWithoutInstallAgentCloseEnd=True
        if self._runWithoutInstallAgentCloseByClient:            
            return ui.Message(self._get_message('runWithoutInstallationEnd'))  
        else:
            self._runWithoutInstallAgentAlive=True
            if runcode_notfound:
                return ui.ErrorDialog(self._get_message('errorInvalidCode'))                
            else:
                chs = ui.Chooser()
                chs.set_key("retryRunOnFly")
                chs.set_message(self._get_message('errorConnectionQuestion'))
                chs.add("configProxy", self._get_message('yes'))
                chs.add("noTryAgain", self._get_message('noTryAgain'))
                chs.set_variable(ui.VarString("noTryAgain"))
                chs.next_step(self.step_runonfly)
                return chs
        
            
    
    def step_install(self, curui):
        if utils.path_exists(self._current_path + utils.path_sep + "ambient.dev"):
            self._ambient="DEV"
        elif utils.path_exists(self._current_path + utils.path_sep + "ambient.qa"):
            self._ambient="QA"
            
        if not self._silent:
            if curui.get_key() is None and curui.get_variable().get()=="no":
                return ui.Message(self._get_message('cancelInstall'))
            
            if curui.get_key() is not None and curui.get_key()=='retryDownload':
                if curui.get_variable().get()=='configProxy':
                    curui.set_key('install')
                    return self.step_configure_proxy_type(curui)
        
        
        if self._runWithoutInstall:
            if self._name is None:
                self._install_path.set(u".." + utils.path_sep + u"dwagentonfly")
            else:
                self._install_path.set(u".." + utils.path_sep + self._name.lower() + u"onfly")
            #Carica proxy da file
            if self._runWithoutInstallProxySet==False and utils.path_exists(self._install_path.get() + utils.path_sep + u"config.json"):
                self._runWithoutInstallProxySet=True
                prpconf=self.load_prop_json(self._install_path.get() + utils.path_sep + u"config.json")
                if 'proxy_type' in prpconf and prpconf['proxy_type']!="":
                    self._proxy=communication.ProxyInfo()
                    self._proxy.set_type(prpconf['proxy_type'])
                    self._proxy_type.set(prpconf['proxy_type'])
                    if 'proxy_host' in prpconf:
                        self._proxy.set_host(prpconf['proxy_host'])
                        self._proxy_host.set(prpconf['proxy_host'])
                    if 'proxy_port' in prpconf and prpconf['proxy_port']!="":
                        self._proxy.set_port(prpconf['proxy_port'])
                        self._proxy_port.set(str(prpconf['proxy_port']))
                    if 'proxy_user' in prpconf:
                        self._proxy.set_user(prpconf['proxy_user'])
                        self._proxy_user.set(prpconf['proxy_user'])
                    if 'proxy_password' in prpconf and prpconf['proxy_password']!="":
                        self._proxy.set_password(self.obfuscate_password(prpconf['proxy_password']))
        
        if self._silent: 
            #SETUP PROXY
            if "proxyType" in self._options:
                self._proxy=communication.ProxyInfo()
                self._proxy.set_type(self._options["proxyType"])
            if self._proxy is not None and "proxyHost" in self._options:
                self._proxy.set_host(self._options["proxyHost"])
            if self._proxy is not None and "proxyPort" in self._options:
                self._proxy.set_port(int(self._options["proxyPort"]))
            if self._proxy is not None and "proxyUser" in self._options:
                self._proxy.set_user(self._options["proxyUser"])
            if self._proxy is not None and "proxyPassword" in self._options:
                self._proxy.set_password(self._options["proxyPassword"])
        
        pth = self._install_path.get()
        if pth.endswith(utils.path_sep) is True:
            pth=pth[0:len(pth)-1]
        
        if not self._bmock:
            if self._runWithoutInstall and not utils.path_exists(pth):
                utils.path_makedir(pth)
                
        #Inizializza log
        if not self._bmock:
            if self._install_log is None:
                try:
                    if self._install_log_path is not None:
                        try:
                            self._install_log = utils.file_open(self._install_log_path, "wb", encoding='utf-8')
                        except:
                            None
                    if self._install_log is None:
                        self._install_log = utils.file_open(u'install.log', "wb", encoding='utf-8')
                except:
                    try:
                        self._install_log = utils.file_open(u".." + utils.path_sep + u'dwagent_install.log', "wb", encoding='utf-8')                    
                    except:
                        None
            
        
        self._install_path.set(utils.str_new(pth))
        #Imposta path per native
        self._native.set_install_path(utils.str_new(pth))
        self._native.set_install_log(self._install_log)
            
            
        try:
            #Verifica permessi di amministratore (SOLO se silent altrimenti gia' lo ha fatto precedentemente
            if self._silent: 
                msg = self._native.check_init_install(True)
                if msg is not None:
                    raise Exception(msg)
                if self._proxy is None:
                    self._append_log(u"Proxy NONE.")
                else:
                    self._append_log(u"Proxy " + self._proxy.get_type() + u" " + self._proxy.get_host() + u":" + str(self._proxy.get_port()) + u".")
        
            
            if not self._runWithoutInstall:
                if curui.get_key()!='retryDownload' and curui.get_key()!='retryDownloadProxy':
                    #Crea cartella
                    self._append_log(u"Make folder " + pth + u"...")
                    self._make_directory(0.01, 0.02)
                    self._append_log(u"Make folder " + pth + u".OK!")
                                        
            #Copia Licenza
            if not self._bmock:
                pthlic = self._install_path.get() + utils.path_sep + u"LICENSES"
                if not utils.path_exists(pthlic):
                    utils.path_makedirs(pthlic)
                    #if not self._runWithoutInstall:
                    utils.path_copy(u"LICENSES" + utils.path_sep + u"README", self._install_path.get() + utils.path_sep + u"README")
                    utils.path_copy(u"LICENSES" + utils.path_sep + u"runtime", pthlic + utils.path_sep + u"runtime")
                    utils.path_copy(u"LICENSES" + utils.path_sep + u"core", pthlic + utils.path_sep + u"core")
                    utils.path_copy(u"LICENSES" + utils.path_sep + u"ui", pthlic + utils.path_sep + u"ui")
            #Download file
            try:
                self._append_log(u"Download files...")
                if not self._runWithoutInstall:
                    self._download_files(0.03, 0.5)
                else:
                    self._download_files(0.01, 0.9)
                self._append_log(u"Download files.OK!")
            except Exception as e:
                if not self._silent:
                    self._append_log(u"Error Download files: " + utils.exception_to_string(e) + u"\n" + utils.get_stacktrace_string())
                    chs = ui.Chooser()
                    chs.set_key("retryDownload")
                    chs.set_message(utils.exception_to_string(e) + u"\n\n" + self._get_message('errorConnectionQuestion'))
                    chs.add("configProxy", self._get_message('yes'))
                    chs.add("noTryAgain", self._get_message('noTryAgain'))
                    chs.set_variable(ui.VarString("noTryAgain"))
                    if not self._runWithoutInstall:
                        chs.prev_step(self.step_check_install_path)
                    else:
                        chs.prev_step(self.step_init)
                        self._install_path.set(None)
                    chs.next_step(self.step_install)
                    return chs
                else:
                    raise Exception(u"Error Download files: " + utils.exception_to_string(e) + u"\n" + utils.get_stacktrace_string())
            
            if not self._runWithoutInstall:
                #Copia Runtime
                self._append_log(u"Copy runtime...")
                self.copy_runtime(0.51, 0.75)
                self._append_log(u"Copy runtime.OK!")
                #Copia Native
                self._append_log(u"Copy native...")
                self.copy_native(0.76, 0.8)           
                self._append_log(u"Copy native.OK!")
                #Prepare file
                self._append_log(u"Prepare file...")
                if not self._bmock:
                    self._native.prepare_file()
                self._append_log(u"Prepare file.OK!")
                
                #Installa Servizio
                self._append_log(u"Install service...")
                self._install_service(0.81, 0.85)
                self._append_log(u"Install service.OK!")
                
                #Installa Monitor
                self._append_log(u"Install monitor...")
                self._install_monitor(0.86, 0.90)
                self._append_log(u"Install monitor.OK!")
                
                #Installa Shortcuts
                self._append_log(u"Install Shortcuts...")
                self._install_shortcuts(0.91,  1)
                self._append_log(u"Install Shortcuts.OK!")
                
                #Installazioni specifiche per os
                self._append_log(u"Install Extra OS...")
                if not self._bmock:
                    self._native.install_extra()
                self._append_log(u"Install Extra OS.OK!")
                
                #Inizia la configurazione
                if not self._silent:
                    curui.set_param('firstConfig',True)
                    return self.step_config_init(curui)
                else:
                    curui.set_param('firstConfig',False)
                    if self._proxy is not None:
                        self._send_proxy_config()
                    self._send_password_config()
                    return self.step_config_install_request(curui)
                
            else:
                #Aggiorna cacerts.pem
                if not self._bmock:
                    utils.path_copy('cacerts.pem',self._install_path.get() + utils.path_sep + 'cacerts.pem')
                
                #Copia Native
                self._append_log(u"Copy native...")
                self.copy_native(0.91, 1)
                self._append_log(u"Copy native.OK!")
                
                if "runputcode" in self._options and self._options["runputcode"]:
                    return self.step_runonfly_putcode(curui)
                else:                    
                    return self.step_runonfly(curui)
            
        except Exception as e:            
            self._append_log(u"Error Install: " + utils.exception_to_string(e))
            return ui.ErrorDialog(utils.exception_to_string(e)) 
            

class Uninstall:
    def __init__(self):
        self._native = get_native()
        self._uinterface=None
        self._install_path=None
        self._options=None
        #self._install_log_path=None
        self._silent=False;
        self._name=None
    
    def _get_message(self, key):
        smsg = messages.get_message(key)
        if self._name is not None:
            return smsg.replace(u"DWAgent",self._name)
        else:
            return smsg
        
    def start(self, aropts={}):
        self._options=aropts
        #if "logpath" in self._options:
        #    self._install_log_path=self._options["logpath"]
        bgui=True
        if "gui" in self._options:
            bgui=self._options["gui"]
        self._silent=False;
        if "silent" in self._options:
            self._silent=self._options["silent"]
            if self._silent:
                bgui=False
                messages.set_locale(None)     
        
        confjson={}
        try:
            f = utils.file_open('config.json')
            confjson = json.loads(f.read())
            f.close()
        except Exception:
            None
        prmsui={}
        if "name" in confjson:
            self._name=utils.str_new(confjson["name"])
            self._native.set_name(self._name)
        else:
            self._native.set_name(u"DWAgent")
        prmsui["title"]=self._get_message('titleUninstall')
        if "topinfo" in confjson:
            prmsui["topinfo"]=confjson["topinfo"]
        if "topimage" in confjson:
            prmsui["topimage"]=u"ui" + utils.path_sep + u"images" + utils.path_sep + u"custom" + utils.path_sep + confjson["topimage"]
        applg = gdi._get_logo_from_conf(confjson, u"ui" + utils.path_sep + u"images" + utils.path_sep + u"custom" + utils.path_sep)
        if applg != "":
            prmsui["logo"]=applg
        if "leftcolor" in confjson:
            prmsui["leftcolor"]=confjson["leftcolor"]
        self._uinterface = ui.UI(prmsui, self.step_init)
        self._uinterface.start(bgui)
        
        #CHIUDE IL LOG
        try:
            if self._install_log is not None:
                self._install_log.close()
        except:
            None
        
    def step_init(self, curui):
        msg = self._native.check_init_uninstall()
        if msg is not None:
            return ui.Message(msg)
        self._install_path = self._native.get_install_path()
        if self._install_path is None:
            return ui.Message(self._get_message('notInstalled'))
        else:
            if self._silent==False:
                self._install_path = utils.str_new(self._install_path)
                #Conferma disinstallazione
                chs = ui.Chooser()
                chs.set_message(self._get_message('confirmUninstall'))
                chs.add("yes", self._get_message('yes'))
                chs.add("no", self._get_message('no'))
                chs.set_variable(ui.VarString("no"))
                chs.set_accept_key("yes")
                chs.next_step(self.step_remove)
                return chs
            else:
                return self.step_remove(curui)
    
    def _uninstall_monitor(self, pstart, pend):
        msg=self._get_message('uninstallMonitor')
        self._uinterface.wait_message(msg,  None, pstart)
        stop_monitor(self._install_path)
        self._native.remove_auto_run_monitor()
    
    def _uninstall_service(self, pstart, pend):
        msg=self._get_message('uninstallService')
        self._uinterface.wait_message(msg,  None, pstart)
        self._native.stop_service()
        self._native.delete_service()
    
    def _uninstall_shortcuts(self, pstart, pend):
        msg=self._get_message('uninstallShortcuts')
        self._uinterface.wait_message(msg,  None, pstart)
        self._native.remove_shortcuts()
    
    def _append_log(self, txt):
        try:
            if self._install_log is not None:
                self._install_log.write(utils.str_new(time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())) + u" - " + txt + u"\n")
                self._install_log.flush()
        except:
            None   
    
    def step_remove(self, curui):
        if self._silent==False:
            if curui.get_key() is None and curui.get_variable().get()=="no":
                return ui.Message(self._get_message('cancelUninstall'))
        try:
            #Inizializza log
            try:
                self._install_log = utils.file_open(u"unistall.log", "wb", encoding='utf-8')
            except:
                try:
                    self._install_log = utils.file_open(u".." + utils.path_sep + u"dwagent_unistall.log", "wb", encoding='utf-8')                    
                except:
                    None
            
            self._native.set_install_path(self._install_path)
            self._native.set_install_log(self._install_log)
            
            self._append_log(u"Uninstall monitor...")
            self._uninstall_monitor(0.01, 0.4)
            
            self._append_log(u"Uninstall service...")
            self._uninstall_service(0.41, 0.8)
            
            self._append_log(u"Uninstall shortcuts...")
            self._uninstall_shortcuts(0.81, 1)
    
            #Scrive file per eliminazione della cartella
            f = utils.file_open(self._install_path + utils.path_sep + u"agent.uninstall", "w")
            f.write("\x00")
            f.close()

            self._append_log(u"End Uninstallation.")
            return ui.Message(self._get_message('endUninstall'))
        except Exception as e:
            self._append_log(u"Error Uninstall: " + utils.exception_to_string(e))
            return ui.ErrorDialog(utils.exception_to_string(e))
            

def fmain(args): #SERVE PER MACOS APP
    i = None
    arotps={}
    arotps["gui"]=True
    for arg in args: 
        if arg.lower() == "uninstall":
            i = Uninstall()
        elif arg.lower() == "-console":
            arotps["gui"]=False
        elif arg.lower() == "-silent":
            arotps["silent"]=True
        elif arg.lower().startswith("gotoopt="):
            arotps["gotoopt"]=arg[8:]
        elif arg.lower().startswith("key="):
            arotps["key"]=arg[4:]
        elif arg.lower().startswith("user="):
            arotps["user"]=arg[5:]
        elif arg.lower().startswith("password="):
            arotps["password"]=arg[9:]
        elif arg.lower().startswith("name="):
            arotps["agentName"]=arg[5:]            
        elif arg.lower().startswith("proxytype="):            
            arotps["proxyType"]=arg[10:]
        elif arg.lower().startswith("proxyhost="):            
            arotps["proxyHost"]=arg[10:]
        elif arg.lower().startswith("proxyport="):            
            arotps["proxyPort"]=arg[10:]
        elif arg.lower().startswith("proxyuser="):            
            arotps["proxyUser"]=arg[10:]
        elif arg.lower().startswith("proxypassword="):            
            arotps["proxyPassword"]=arg[14:]
        elif arg.lower().startswith("configpassword="):
            arotps["configPassword"]=arg[15:]
        elif arg.lower().startswith("logpath="):
            arotps["logpath"]=arg[8:]
        elif arg.lower().startswith("lang="):
            try:
                messages.set_locale(arg[5:])
            except:
                None            
    if i is None:
        i = Install()
    i.start(arotps)    
    sys.exit(0)
    
if __name__ == "__main__":
    fmain(sys.argv)    
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ui/ui.py                                                                                            0000644 0001750 0001750 00000076675 14133525655 012006  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import messages
import os
import sys
import threading
import gdi
import traceback
import utils

_WIDTH=760
_HEIGHT=500
_HEIGHT_BOTTOM=55
_WIDTH_LEFT=90
_CONTENT_WIDTH=_WIDTH-_WIDTH_LEFT
_CONTENT_HEIGHT=_HEIGHT-_HEIGHT_BOTTOM
_GAP_TEXT=20

class VarString:
        
    def __init__(self, value = None,  password= False):
        self._value=value
        self._password=password
    
    def is_password(self):
        return self._password
    
    def set(self, v):
        self._value=v
    
    def get(self):
        return self._value

class BaseUI:
    def __init__(self):
        self._cancel=False
        self._prev_step=None
        self._next_step=None
        self._key=None
        self._params={}
  
    def set_key(self,  k):
        self._key=k
        
    def get_key(self):
        return self._key
    
    def set_param(self,  k, v):
        self._params[k]=v
        
    def get_param(self, k, d=None):
        if k in self._params:
            return self._params[k]
        else:
            return d
        
    def is_next_enabled(self):
        return self._next_step is not None
    
    def is_back_enabled(self):
        return self._prev_step is not None
    
    def prev_step(self, np):
        self._prev_step=np
    
    def next_step(self, np):
        self._next_step=np
    
    def fire_prev_step(self):
        if self._prev_step is not None:
            return self._prev_step(self)
        return None
        
    def fire_next_step(self):
        if self._next_step is not None:
            return self._next_step(self)
        return None

class Message(BaseUI):
    def __init__(self, msg=''):
        BaseUI.__init__(self)
        self._message=msg
    
    def set_message(self, msg):
        self._message=msg
        
    def get_message(self):
        return self._message
    
class Inputs(BaseUI):
   
    def __init__(self):
        BaseUI.__init__(self)
        self._message=None
        self._arinputs=[]
    
    def set_message(self, msg):
        self._message=msg
        
    def get_message(self):
        return self._message
    
    def add(self, key, label, variable, mandatory):
        self._arinputs.append({'key':key,  'label':label,  'variable':variable,  'mandatory':mandatory })
    
    def get_inputs(self):
        return self._arinputs
    
    def fire_next_step(self):
        #Verifica mandatory
        for i in range(len(self._arinputs)):
            inp = self._arinputs[i]
            if inp['mandatory'] is True and inp['variable'].get().strip()=="":
                return ErrorDialog(messages.get_message("fieldRequired").format(inp['label']))
        return BaseUI.fire_next_step(self)

    def on_validate(self,e):
        for i in range(len(self._arinputs)):
            inp = self._arinputs[i]
            if inp["key"]==e["source"].get_name():
                inp["variable"].set(e["source"].get_text())
                break
        
class Chooser(BaseUI):
        
    def __init__(self):
        BaseUI.__init__(self)
        self._archooser=[]
        self._selected_key=None
        self._variable=None
        self._message=None
        self._message_hyperlink=[]
        self._message_height=100
        self._accept_key=None
        self._main=None
        self._selected=None
        
        
    def set_message(self, m):
        self._message=m
    
    def add_message_hyperlink(self, ps, ln, url):
        self._message_hyperlink.append({"start":ps, "length":ln, "url": url})
    
    def set_message_height(self, h):
        self._message_height=h
    
    def get_message_height(self):
        return self._message_height
    
    def get_message(self):
        return self._message
    
    def get_message_hyperlinks(self):
        return self._message_hyperlink
    
    def set_accept_key(self, k):
        self._accept_key=k
    
    def get_accept_key(self):
        return self._accept_key
    
    def is_accept_key(self,s):
        if self._accept_key is not None:
            ar = self._accept_key.split(";")
            for i in ar:
                if i==s:
                    return True
        return False
    
    def add(self, key, label):
        self._archooser.append({'key':key,  'label':label})
    
    def get_choices(self):
        return self._archooser
    
    def get_variable(self):
        return self._variable
        
    def set_variable(self, v):
        self._variable=v
    
    def fire_next_step(self):
        #Verifica se selezionato
        bok = False
        for i in range(len(self._archooser)):
            inp = self._archooser[i]
            if self._variable.get()==inp["key"]:
                bok = True
                break
        if not bok:
            return ErrorDialog(messages.get_message("mustSelectOptions"))
        return BaseUI.fire_next_step(self)
    
    def set_main(self, main):
        self._main=main
        self._disble_next_button()

    def on_selected(self,e):
        if e["action"]=="SELECTED":
            self.get_variable().set(e["source"].get_name())
            self._disble_next_button()
    
    def is_next_enabled(self):
        if self._main is not None and self.get_accept_key() is not None:
            if self.is_accept_key(self.get_variable().get()):
                return self._next_step is not None
            else:
                return False
        return self._next_step is not None
    
    def _disble_next_button(self):
        if self._main is not None and self.get_accept_key() is not None:
            if self.is_accept_key(self.get_variable().get()):
                self._main._enable_next_button()
            else:
                self._main._disable_next_button()
                
class ErrorDialog():
    
    def __init__(self, msg):
        self._message=msg
    
    def get_message(self):
        return self._message

class AsyncInvoke(threading.Thread):
    def __init__(self, main, func, callback=None):
        threading.Thread.__init__(self, name="User_Interface")
        self._func=func
        self._callback=callback
        self._main=main
    
    def run(self):
        try:
            self._main._wait_ui=None
            self._main.wait_message(messages.get_message("waiting"))
            ret=self._func()  
        except SystemExit:
            self._main._action=None
            self._main.close()
            return         
        except Exception as e:
            msg = e.__class__.__name__
            if e.args is not None and len(e.args)>0 and e.args[0] != '':
                msg = e.args[0]
            ret=ErrorDialog(messages.get_message('unexpectedError').format(msg))
        if self._callback is not None:
            self._callback(ret)

'''
class DialogMessage(gdi.DialogMessage):
    def on_keyboard(self,tp,c,shift,ctrl,alt,meta):
        if alt==1 and tp==u"CHAR" and c==u"o":
            self._ok_action(None)
        if alt==1 and tp==u"CHAR" and c==u"y":
            self._yes_action(None)
        if alt==1 and tp==u"CHAR" and c==u"n":
            self._no_action(None)
        #print(tp + " " + c + " " + str(alt))
        gdi.Window.on_keyboard(self, tp, c, shift, ctrl, alt, meta)

class Window(gdi.Window):
    def setUI(self,v):
        self._ui=v
    
    def on_keyboard(self,tp,c,shift,ctrl,alt,meta):
        if alt==1 and tp==u"CHAR" and c==u"c" and self._ui._cur_step_ui is not None:
            self._ui.close()
            return
        if alt==1 and tp==u"CHAR" and c==u"b" and self._ui._cur_step_ui is not None:
            if self._ui._cur_step_ui.is_back_enabled():
                self._ui.back()
            return
        if alt==1 and tp==u"CHAR" and c==u"n" and self._ui._cur_step_ui is not None:
            if self._ui._cur_step_ui.is_next_enabled():
                if hasattr(self._ui._cur_step_ui,"on_validate"):
                    fc = self.get_focus_component()
                    if fc is not None:
                        self._ui._cur_step_ui.on_validate({"source":fc})
                self._ui.next()
            return
        if alt==1 and tp==u"CHAR" and c==u"u" and self._ui._cur_step_ui is not None:
            if self._ui._cur_step_ui.on_selected:
                cmps = self._ui._pnlmain.get_components();
                for i in range(len(cmps)):
                    if i>=1:
                        rb = cmps[i]
                        if rb.get_selected():
                            if i>1:
                                rb.set_selected(False)
                                cmps[i-1].set_selected(True)
                                self._ui._cur_step_ui.on_selected({"source":cmps[i-1]})
                            break;
        if alt==1 and tp==u"CHAR" and  c==u"d" and self._ui._cur_step_ui is not None:
            if self._ui._cur_step_ui.on_selected:
                cmps = self._ui._pnlmain.get_components();
                for i in range(len(cmps)):
                    if i>=1:
                        rb = cmps[i]
                        if rb.get_selected():
                            if i<len(cmps)-1:
                                rb.set_selected(False)
                                cmps[i+1].set_selected(True)
                                self._ui._cur_step_ui.on_selected({"source":cmps[i+1]})
                            break;
        #print(tp + " " + c + " " + str(alt))
        gdi.Window.on_keyboard(self, tp, c, shift, ctrl, alt, meta)
'''
            
class UI():
    def __init__(self, params, step_init):
        self._title = "DWAgent"
        if "title" in params:
            self._title = utils.str_new(params["title"])
        self._logo = None
        self._topimage = None
        self._topinfo = None
        self._leftcolor = None
        if "logo" in params:
            self._logo = utils.str_new(params["logo"])
        if "topimage" in params:
            self._topimage = utils.str_new(params["topimage"])
        if "topinfo" in params:
            self._topinfo = utils.str_new(params["topinfo"])
        if "leftcolor" in params:
            self._leftcolor = params["leftcolor"]
        self._step_init=step_init
        self._cur_step_ui=None
        self._wait_ui=None
        self._action=None
        self._closing=False
        self._is_raw_input=False
        self._gui_enable=False
        self._prev_msg_wait=""
    
    def set_action(self,f):
        self._action=f
    
    def is_gui(self):
        return self._gui_enable
    
    def start(self, bgui=True):
        if bgui:
            try:
                if gdi.is_linux():
                    if not "DISPLAY" in os.environ:
                        raise("NODIPLAY") 
                    d = os.environ["DISPLAY"]
                    if d is None or d=="":
                        raise("NODIPLAY")    
                self._gui_enable=True
                self._guimode_start()
            except Exception as e:
                self._gui_enable=False
                self._clmode_start()
        else:
            self._gui_enable=False
            self._clmode_start()
    
    def _prepare_step(self, stp):
        if not self._closing:
            self._prev_msg_wait=""
            self._prepare_buttons(stp)
            func = getattr(self,  '_show_' + stp.__class__.__name__ .lower())
            func(stp)
    
    def next(self):
        if self._gui_enable==True:            
            self._guimode_next(None)
        else:
            self._clmode_next()
            
    def back(self):
        if self._gui_enable==True:
            self._guimode_back(None)
        else:
            self._clmode_back()
    
    def _op_complete(self, app):
        if app is None and self._wait_ui is not None:
            self._prepare_step(self._cur_step_ui)
        elif app.__class__.__name__ .lower()=='errordialog':
            self._show_error(app.get_message())
        else:
            self._cur_step_ui = app
            self._prepare_step(self._cur_step_ui)
            
    def _signal_close(self, signal, frame):
        if self._gui_enable is False:
            print("")
        if self._is_raw_input:
            raise Exception("#EXIT");
        else:
            self.close()
    
    def _printcl(self, msg):
        #print("ENC:" + sys.stdout.encoding)
        if sys.stdout.encoding is None:
            print(msg)
        else:
            print(msg.encode(sys.stdout.encoding,'replace'))
    
    def _raw_input(self,msg,bpasswd=False):
        try:
            appmsg=msg + u" "
            if sys.stdout.encoding is not None:
                appmsg=appmsg.encode(sys.stdout.encoding,'replace')
            self._is_raw_input=True
            if not bpasswd:
                sr = raw_input(appmsg)
            else:
                import getpass
                sr = getpass.getpass(appmsg)
            sr=sr.decode('utf-8','replace')
            if sr.lower()==u"#exit":
                raise Exception("#EXIT")
            elif sr.lower()==u"#back":
                raise Exception("#BACK")
            self._is_raw_input=False
            return sr
        except Exception as e:
            self._is_raw_input=False
            msg = utils.exception_to_string(e)
            if msg==u"#EXIT":
                self.close()
            elif msg==u"#BACK":
                if self._cur_step_ui.is_back_enabled():
                    self._clmode_back()
                else:
                    return u""
            else:
                self._printcl(u"")
                self._printcl(u"")
                self._printcl(messages.get_message('unexpectedError').format(utils.str_new(traceback.format_exc(),errors='replace')))
                self.close()
            return None
        
    
    def close(self):
        self._closing=True
        if self._action is not None:
            self._action({"action":"CLOSE"})
        if self._gui_enable is True:
            self._app.destroy()
                
        
    def _clmode_next(self):
        try:
            self.wait_message(messages.get_message("waiting"))
            ret=self._cur_step_ui.fire_next_step()
        except Exception:
            ret=ErrorDialog(messages.get_message('unexpectedError').format(utils.str_new(traceback.format_exc(),errors='replace')))
        self._op_complete(ret)
    
    def _clmode_back(self):
        try:
            self.wait_message(messages.get_message("waiting"))
            ret=self._cur_step_ui.fire_prev_step()
        except Exception:
            ret=ErrorDialog(messages.get_message('unexpectedError').format(utils.str_new(traceback.format_exc(),errors='replace')))            
        self._op_complete(ret)
     
    def _clmode_start(self):
        try:
            import signal 
            signal.signal(signal.SIGINT, self._signal_close)
            signal.signal(signal.SIGTERM, self._signal_close)
            signal.signal(signal.SIGQUIT, self._signal_close)
        except:
            None            
        
        self._printcl(u"")
        self._printcl(u"****************************************")
        self._printcl(messages.get_message('commands') + u":")
        self._printcl(u" #BACK <" + messages.get_message('enter')  + "> " + messages.get_message('toBack'))
        self._printcl(u" #EXIT <" + messages.get_message('enter')  + "> " + messages.get_message('toExit'))
        self._printcl(u"****************************************")            
        try:
            self._cur_step_ui=self._step_init(BaseUI())
            if isinstance(self._cur_step_ui,ErrorDialog):
                self._cur_step_ui=Message(self._cur_step_ui.get_message())
        except Exception as e:            
            self._cur_step_ui=Message("Error: " + utils.exception_to_string(e))        
        self._prepare_step(self._cur_step_ui)
        self._printcl(u"")
    
    def _guimode_next(self, e):
        if e["action"]=="PERFORMED":
            self._guimode_execute(self._cur_step_ui.fire_next_step, self._op_complete)
        
    def _guimode_back(self, e):
        if e["action"]=="PERFORMED":
            self._guimode_execute(self._cur_step_ui.fire_prev_step, self._op_complete)
        
    def _guimode_close_action(self, e):
        if e["action"]=="DIALOG_YES":
            self._guimode_execute(self.close)
    
    def _guimode_close(self, e):
        if e["action"]=="PERFORMED":
            if self._cur_step_ui is None or (self._cur_step_ui.is_next_enabled() or self._cur_step_ui.is_back_enabled()) :
                dlgerr = gdi.DialogMessage(gdi.DIALOGMESSAGE_ACTIONS_YESNO,gdi.DIALOGMESSAGE_LEVEL_INFO,parentwin=self._app, logopath=self._logo)
                dlgerr.set_title(self._title)
                dlgerr.set_message(messages.get_message('confirmExit'))
                dlgerr.set_action(self._guimode_close_action)
                dlgerr.show();
            else:
                self.close()
    
    def _guimode_action(self, e):
        if e["action"]==u"ONCLOSE":
            e["cancel"]=True
            if self._btclose.is_enable():
                self._guimode_close(e)
    
    def _guimode_step_init_start(self):
        self._guimode_execute(self._guimode_step_init, self._guimode_step_init_callback)        
    
    def _guimode_step_init(self):
        ui=None
        try:
            ui=self._step_init(BaseUI())
            if isinstance(ui,ErrorDialog):
                ui=Message(ui.get_message())
        except Exception as e:            
            ui=Message("Error: " + utils.exception_to_string(e))
        return ui
    
    def _guimode_step_init_callback(self,curui):
        self._cur_step_ui=curui
        self._prepare_step(self._cur_step_ui)
    
    
    def _guimode_start(self):
        
        gdi.gdw_lib() #Se non è presente la libreria va in errore quindi in modalita console
                
        self._top_height=0
        if self._topimage is not None:
            self._top_height=gdi.get_image_size(self._topimage)["height"]
        elif self._topinfo is not None:
            self._top_height=(22*len(self._topinfo.split("\n"))) + 10
        
        self._app = gdi.Window(gdi.WINDOW_TYPE_NORMAL_NOT_RESIZABLE, logopath=self._logo)
        #self._app = Window(gdi.WINDOW_TYPE_NORMAL_NOT_RESIZABLE, logopath=self._logo)
        #self._app.setUI(self)
        
        self._app.set_title(self._title)
        self._app.set_size(_WIDTH, _HEIGHT+self._top_height)
        self._app.set_show_position(gdi.WINDOW_POSITION_CENTER_SCREEN)
        self._app.set_action(self._guimode_action)
        
        pnl_left = gdi.Panel();
        pnl_left.set_position(0, self._top_height)
        pnl_left.set_size(_WIDTH_LEFT,_HEIGHT)
        
        if self._leftcolor is not None:
            pnl_left.set_background_gradient(self._leftcolor, "FFFFFF", gdi.GRADIENT_DIRECTION_LEFTRIGHT)
        else:
            pnl_left.set_background_gradient("83e5ff", "FFFFFF", gdi.GRADIENT_DIRECTION_LEFTRIGHT)
        self._app.add_component(pnl_left)
        
        if self._topimage is not None:
            pnl_top = gdi.ImagePanel();
            pnl_top.set_position(0, 0)
            pnl_top.set_filename(self._topimage)
            pnl_top.set_size(_WIDTH,self._top_height)
            self._app.add_component(pnl_top)
        elif self._topinfo is not None:
            pnl_top = gdi.Panel();
            pnl_top.set_position(0, 0)
            pnl_top.set_size(_WIDTH,self._top_height)
            pnl_top.set_background("d9d9d9")
            self._app.add_component(pnl_top)
            
            pnl_top_text = gdi.Label()
            pnl_top_text.set_position(10,0)
            pnl_top_text.set_size(_WIDTH-(2*10),self._top_height)
            pnl_top_text.set_wordwrap(True)
            pnl_top_text.set_foreground("000000")
                        
            pnl_top_text.set_text(self._topinfo)
            pnl_top.add_component(pnl_top_text)
        
        
        pnl_bottom = gdi.Panel();
        pnl_bottom.set_position(0, _CONTENT_HEIGHT+self._top_height)
        pnl_bottom.set_size(_WIDTH,_HEIGHT_BOTTOM)
        self._app.add_component(pnl_bottom)
        
        wbtn=140
        hbtn=36
        
        self._btback = gdi.Button();
        self._btback.set_position(10, 10)
        self._btback.set_size(wbtn, hbtn)
        self._btback.set_text(messages.get_message('back'))
        self._btback.set_enable(False);
        self._btback.set_action(self._guimode_back)
        pnl_bottom.add_component(self._btback)
                
        self._btnext = gdi.Button();
        self._btnext.set_position(10+wbtn+5, 10)
        self._btnext.set_size(wbtn, hbtn)
        self._btnext.set_text(messages.get_message('next'))
        self._btnext.set_enable(False);
        self._btnext.set_action(self._guimode_next)
        pnl_bottom.add_component(self._btnext)
        
        self._btclose = gdi.Button();
        self._btclose.set_position(_WIDTH-wbtn-10, 10)
        self._btclose.set_size(wbtn, hbtn)
        self._btclose.set_text(messages.get_message('close'))
        self._btclose.set_enable(False);
        self._btclose.set_action(self._guimode_close)
        pnl_bottom.add_component(self._btclose)
        
        self._pnlmain=None
        self._cur_step_ui=None
        self._step_init_run=False
        
        self._guimode_step_init_start()
        self._app.show()
        gdi.loop()
        
    
    def _guimode_execute(self, func, callback=None):
        ac = AsyncInvoke(self, func, callback)
        ac.start()
   
    def _prepare_main_panel(self):
        if self._gui_enable is True:
            if (self._pnlmain is not None):
                self._pnlmain.remove_all_components()
            else:
                self._pnlmain = gdi.Panel();
                self._pnlmain.set_background("ffffff")
                self._pnlmain.set_position(_WIDTH_LEFT, self._top_height)
                self._pnlmain.set_size(_CONTENT_WIDTH,_CONTENT_HEIGHT)
                self._app.add_component(self._pnlmain)

    def _prepare_buttons(self,  curui):
        if self._gui_enable is True:
            self._btnext.set_enable(curui.is_next_enabled())
            self._btback.set_enable(curui.is_back_enabled())
            self._btclose.set_enable(True)
    
    def _disable_next_button(self):
        if self._gui_enable is True:
            self._btnext.set_enable(False)
    
    def _enable_next_button(self):
        if self._gui_enable is True:
            self._btnext.set_enable(True)
    
    def _show_error_gui_ok(self,e):
        if self._wait_ui is not None and e["action"]==u"MOUSECLICK":
            self._prepare_step(self._cur_step_ui)
            
    def _show_error(self,  msg):
        if self._gui_enable is True:
            dlgerr = gdi.DialogMessage(gdi.DIALOGMESSAGE_ACTIONS_OK,gdi.DIALOGMESSAGE_LEVEL_ERROR,parentwin=self._app, logopath=self._logo)
            dlgerr.set_title(self._title)
            dlgerr.set_message(msg)
            dlgerr.set_action(self._show_error_gui_ok)
            dlgerr.show();
        else:
            self._printcl(u"")
            self._printcl(messages.get_message('error') + u": " + msg)
            if self._raw_input(messages.get_message('pressEnter')) is not None:
                self._prepare_step(self._cur_step_ui)
            
    
    def wait_message(self, msg, perc=None, progr=None, allowclose=False):
        if self._gui_enable is True:
            if perc is not None:
                msg=msg + "     (" + str(perc) + "%)"
            self._wait_message_gui(msg, progr, allowclose)
        else:
            if self._prev_msg_wait!=msg:
                self._prev_msg_wait=msg
                if allowclose:
                    msg+=u"\n\nCTRL+C " + messages.get_message('toExit') + u"\n" 
                self._printcl(msg) 
    
    def _wait_message_gui(self, msg, progr=None, allowclose=False):
        if self._wait_ui is None:
            self._btnext.set_enable(False)
            self._btback.set_enable(False)
            self._btclose.set_enable(allowclose)
            self._prepare_main_panel()
            lbl=gdi.Label()
            lbl.set_wordwrap(True)
            lbl.set_position(_GAP_TEXT,(_CONTENT_HEIGHT/2)-60)
            lbl.set_size(_CONTENT_WIDTH-(2*_GAP_TEXT),60)
            lbl.set_text_align(gdi.TEXT_ALIGN_LEFTTOP)
            self._pnlmain.add_component(lbl)
            pbar = gdi.ProgressBar()
            pbar.set_position(_GAP_TEXT,_CONTENT_HEIGHT/2)
            pbar.set_size(_CONTENT_WIDTH-(2*_GAP_TEXT),24)
            self._pnlmain.add_component(pbar)
            self._wait_ui={'label':lbl,  'progress':pbar}
        else:
            self._btclose.set_enable(allowclose)
            lbl=self._wait_ui['label']
            pbar=self._wait_ui['progress']
        
        if 'label_value' not in self._wait_ui or self._wait_ui['label_value'] !=msg:
            lbl.set_text(msg)
        self._wait_ui['label_value']=msg
        if progr is None:
            if 'progress_value' not in self._wait_ui or self._wait_ui['progress_value'] is not None:
                pbar.set_y(-100)
                lbl.set_y(0)
                lbl.set_height(_CONTENT_HEIGHT)
                lbl.set_text_align(gdi.TEXT_ALIGN_LEFTMIDDLE)
            self._wait_ui['progress_value']=None
        else:
            if 'progress_value' not in self._wait_ui  or self._wait_ui['progress_value'] is None or self._wait_ui['progress_value']!=progr:
                lbl.set_y((_CONTENT_HEIGHT/2)-40)
                lbl.set_height(30)
                lbl.set_text_align(gdi.TEXT_ALIGN_LEFTTOP)
                pbar.set_y(_CONTENT_HEIGHT/2)
                pbar.set_percent(progr)                
            self._wait_ui['progress_value']=progr
            
            
        
    def _clmode_read(self, msg,  bpwd=False):
        ui = self._cur_step_ui;
        if not ui.is_next_enabled() and not ui.is_back_enabled():
            self.close()
            return None #Termina Installazione
        if not bpwd:
            return self._raw_input(msg)
        else:
            return self._raw_input(msg,True)
    
    def _show_message(self,  msg):
        if self._gui_enable is True:
            self._prepare_main_panel()
            w=_CONTENT_WIDTH-(2*_GAP_TEXT)
            h=_CONTENT_HEIGHT-(2*_GAP_TEXT)
            
            l = gdi.Label()
            l.set_position(_GAP_TEXT,_GAP_TEXT)
            l.set_size(w,h)
            l.set_wordwrap(True)
            l.set_text(msg.get_message())
            self._pnlmain.add_component(l)
        else:
            self._printcl(u"")
            self._printcl(msg.get_message())
            rd = self._clmode_read(messages.get_message('pressEnter'))
            if rd is not None:
                self._clmode_next()

    def _show_inputs(self,  inps):
        if self._gui_enable is True:
            self._prepare_main_panel()
            w=_CONTENT_WIDTH-(2*_GAP_TEXT)
            h=100
            
            l = gdi.Label()
            l.set_position(_GAP_TEXT,_GAP_TEXT)
            l.set_size(w,h)
            l.set_wordwrap(True)
            l.set_text_align(gdi.TEXT_ALIGN_LEFTTOP)
            l.set_text(inps.get_message())
            self._pnlmain.add_component(l)

            lblw=170
            ar = inps.get_inputs()
            p=120
            for i in range(len(ar)):
                inp=ar[i]
                #LABEL
                l = gdi.Label()
                l.set_position(_GAP_TEXT,p)
                l.set_size(lblw-1,30)
                l.set_text(inp['label'])
                self._pnlmain.add_component(l)
                
                #TEXTBOX
                t = gdi.TextBox()
                t.set_name(inp['key'])
                t.set_position(_GAP_TEXT+lblw,p)
                t.set_size(_CONTENT_WIDTH-(4*_GAP_TEXT)-lblw,30)
                t.set_text(inp['variable'].get())
                if inp['variable'].is_password():
                    t.set_password_mask(True)
                self._pnlmain.add_component(t)
                t.set_validate(inps.on_validate)
                if i==0:
                    t.focus()
                p+=36
        else:
            self._printcl(u"")
            self._printcl(inps.get_message())
            ar = inps.get_inputs()
            for i in range(len(ar)):
                inp=ar[i]
                v=inp['variable'].get()
                if v is None:
                    v=u""
                if v!=u"" and not inp['variable'].is_password():
                    v=u" (" + v + u")"
                rd = self._clmode_read(inp['label']  +  v + u":", inp['variable'].is_password())
                if rd is not None:
                    if rd.strip()!=u"":
                        inp['variable'].set(rd)
                else:
                    return
            self._clmode_next()
                            
            
    def _show_chooser(self,  chs):
        if self._gui_enable is True:
            self._prepare_main_panel()
            h=chs.get_message_height()
            w=_CONTENT_WIDTH-(2*_GAP_TEXT)
            l = gdi.Label() 
            l.set_wordwrap(True)
            l.set_text_align(gdi.TEXT_ALIGN_LEFTTOP)
            l.set_text(chs.get_message())
            
            if len(chs.get_message_hyperlinks())>0:
                for i in range(len(chs.get_message_hyperlinks())):
                    itm=chs.get_message_hyperlinks()[i]
                    l.add_hyperlink("k" + str(i), itm["start"], itm["length"], itm["url"])  
            
            l.set_position(_GAP_TEXT, _GAP_TEXT)
            l.set_size(w, h)
            
            self._pnlmain.add_component(l)
        
            ar = chs.get_choices()
            p=h+_GAP_TEXT
            for i in range(len(ar)):
                inp=ar[i]
                rb = gdi.RadioButton()
                rb.set_text(inp['label'])
                rb.set_position(_GAP_TEXT, p)
                rb.set_size(_CONTENT_WIDTH-(2*_GAP_TEXT), 30)
                rb.set_name(inp['key'])
                rb.set_group("RADIOBUTTON")
                if chs.get_variable().get()==inp['key']:
                    rb.set_selected(True);
                rb.set_action(chs.on_selected)
                self._pnlmain.add_component(rb)
                p+=30
            chs.set_main(self)
        else:
            self._printcl(u"")
            self._printcl(chs.get_message())
            self._printcl(u"")
            ar = chs.get_choices()
            df = u""
            ar_idx_accept=[]
            idx_default=None
            for i in range(len(ar)):
                inp=ar[i]
                self._printcl(str(i+1) + u". " + inp['label'])
                if chs.get_variable().get()==inp['key']:
                    idx_default=i+1
                    df = u" (" + str(idx_default) + u")"
                if chs.is_accept_key(inp['key']):
                    ar_idx_accept.append(i+1)
            rd = self._clmode_read(messages.get_message('option') + df + u":")
            if rd is not None:
                if rd=="":
                    rd=str(idx_default)
                try:
                    ird=int(rd)
                    if (ird>len(ar)):
                        raise Exception("")
                    if len(ar_idx_accept) > 0:
                        serr=[]
                        berr=True
                        for idxcur in ar_idx_accept:
                            serr.append(str(idxcur))
                            if ird==idxcur:
                                berr=False
                        if berr:
                            self._show_error(messages.get_message('mustAccept').format((u" " + messages.get_message('or') + u" ").join(serr)))
                            return
                    inp=ar[ird-1]
                except:
                    self._show_error(messages.get_message('optionNotValid'))
                    return
                chs.get_variable().set(inp['key'])
                self._clmode_next()
                
            
                                                                   ui/gdi.py                                                                                           0000755 0001750 0001750 00000226656 14140515765 012132  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''
import ctypes
import _ctypes
import utils
import platform
import sys
import time
import threading
import struct
import messages
import images
import subprocess
import json

WINDOW_TYPE_NORMAL=0
WINDOW_TYPE_NORMAL_NOT_RESIZABLE=1
WINDOW_TYPE_DIALOG=100
WINDOW_TYPE_POPUP=200
WINDOW_TYPE_TOOL=300

WINDOW_POSITION_XY=0
WINDOW_POSITION_CENTER_SCREEN=1

TEXT_ALIGN_LEFTMIDDLE=0
TEXT_ALIGN_LEFTTOP=1
TEXT_ALIGN_CENTERMIDDLE=10
TEXT_ALIGN_RIGHTMIDDLE=20


DIALOGMESSAGE_ACTIONS_OK=0
DIALOGMESSAGE_ACTIONS_YESNO=10

DIALOGMESSAGE_LEVEL_INFO=0
DIALOGMESSAGE_LEVEL_WARN=1
DIALOGMESSAGE_LEVEL_ERROR=2

POPUP_POSITION_BOTTONRIGHT=0
POPUP_POSITION_BOTTONLEFT=1
POPUP_POSITION_TOPRIGHT=10
POPUP_POSITION_TOPLEFT=11

GRADIENT_DIRECTION_LEFTRIGHT=0;
GRADIENT_DIRECTION_RIGHTLEFT=1;
GRADIENT_DIRECTION_TOPBOTTOM=2;
GRADIENT_DIRECTION_BOTTONTOP=3;

_STYLE_WINDOW_BACKGROUND_COLOR="ffffff"
_STYLE_WINDOW_FOREGROUND_COLOR="000000"
_STYLE_COMPONENT_BACKGROUND_COLOR="d9d9d9"
_STYLE_COMPONENT_FOREGROUND_COLOR="000000"
_STYLE_COMPONENT_BORDER_COLOR="a0a0a0"
_STYLE_EDITOR_BACKGROUND_COLOR="ffffff"
_STYLE_EDITOR_FOREGROUND_COLOR="000000"
_STYLE_EDITOR_SELECTION_COLOR="c0c0c0"

_gdimap={}
_gdimap["init"]=False
_gdimap["lock"]=threading.Lock()
_gdimap["cntwin"]=0
_gdimap["cntnfi"]=0
_gdimap["cntfnt"]=0
_gdimap["cntimg"]=0
_gdimap["windows"]={}
_gdimap["notifyicon"]={}
_gdimap["fontmanager"]=None
_gdimap["imagemanager"]=None
_gdimap["sheduler"]=None
_gdimap["postaction"]=[]
_gdimap["screensize"]={"width":0, "height":0, "_lastcheck":0.0}


def is_windows():
    return (platform.system().lower().find("window") > -1)

def is_linux():
    return (platform.system().lower().find("linux") > -1)

def is_mac():
    return (platform.system().lower().find("darwin") > -1)

def is_os_32bit():
    return not sys.maxsize > 2**32

def is_os_64bit():
    return sys.maxsize > 2**32

def _get_logo_from_conf(jocfg, pth):
    if pth is None:
        pth=""
    ret=""
    if not is_linux():
        if "logo16x16" in jocfg:
            ret+=pth + jocfg["logo16x16"]
    else:
        if "logo16x16" in jocfg:
            ret+=pth + jocfg["logo16x16"]+"\n"
        if "logo32x32" in jocfg:
            ret+=pth + jocfg["logo32x32"]+"\n"
        if "logo48x48" in jocfg:
            ret+=pth + jocfg["logo48x48"]+"\n"
    return ret

def is_windows_user_in_admin_group():
    if is_windows():
        return gdw_lib().isUserInAdminGroup()==1
    else:
        raise Exception("invalid os.")

def is_windows_run_as_admin():
    if is_windows():
        return gdw_lib().isRunAsAdmin()==1
    else:
        raise Exception("invalid os.")

def is_windows_process_elevated():
    return gdw_lib().isProcessElevated()==1

def is_windows_task_running(pid):
    bret=gdw_lib().isTaskRunning(pid);
    return bret==1

def gdw_lib():
    if "gdwlib" in _gdimap:
        return _gdimap["gdwlib"]
    else:
        gdwlib=None
        namelib=None
        namelibinst=None
        pathlib=None
        if is_windows():
            namelib="dwaggdi.dll"
            pathlib="win"
            #Installer Mode
            if is_os_32bit():
                namelibinst="dwaggdi_x86_32.dll"
            elif is_os_64bit():
                namelibinst="dwaggdi_x86_64.dll"
        elif is_linux():
            namelib="dwaggdi.so"
            pathlib="linux"
            #Installer Mode
            if is_os_32bit():
                namelibinst="dwaggdi_x86_32.so"
            elif is_os_64bit():
                namelibinst="dwaggdi_x86_64.so"
        elif is_mac():
            namelib="dwaggdi.dylib"
            pathlib="mac"
            #Installer Mode
            if is_os_32bit():
                namelibinst="dwaggdi_x86_32.dylib"
            elif is_os_64bit():
                namelibinst="dwaggdi_x86_64.dylib"
        if not utils.path_exists(".srcmode"):
            if utils.path_exists(namelibinst): #Installer Mode
                gdwlib = ctypes.CDLL("." + utils.path_sep + namelibinst)
            elif utils.path_exists("native" + utils.path_sep + namelib):
                gdwlib = ctypes.CDLL("native" + utils.path_sep + namelib)
        else:
            gdwlib = ctypes.CDLL(".." + utils.path_sep + "make" + utils.path_sep + "native" + utils.path_sep + namelib)
        if gdwlib==None:
            raise Exception("Missing gdi library.")
        
        gdwlib.DWAGDIGetClipboardText.restype = ctypes.c_wchar_p
        _gdimap["gdwlib"]=gdwlib
        return gdwlib 


def getRGBColor(s):
    return struct.unpack('BBB', utils.str_hex_to_bytes(s))

def getHexColor(r, g, b):
    return utils.bytes_to_str_hex(struct.pack('BBB', r, g, b))

def _repaint(sid,x,y,w,h):
    _gdimap["postaction"].append({"name":"REPAINT","id":sid,"x":x,"y":y,"width":w,"height":h})

def _show_window(sid):
    _gdimap["postaction"].append({"name":"SHOW","id":sid})
    
def _update_pos_size(sid):
    _gdimap["postaction"].append({"name":"UPDATEPOSSIZE","id":sid})

def _hide_window(sid):
    _gdimap["postaction"].append({"name":"HIDE","id":sid})
    
def _to_front_window(sid):
    _gdimap["postaction"].append({"name":"TO_FRONT","id":sid})
        
def _init_window(sid,wnd):
    _gdimap["windows"][sid]=wnd;
    _gdimap["postaction"].append({"name":"INIT","id":sid})

def _term_window(sid):    
    _gdimap["postaction"].append({"name":"TERM","id":sid})

def _set_title(sid, title):
    _gdimap["postaction"].append({"name":"SET_TITLE","id":sid,"title":title})

def _create_notify_icon(sid, nfi, iconpath, tooltip):
    _gdimap["notifyicon"][sid]= nfi
    _gdimap["postaction"].append({"name":"CREATE_NOTIFY_ICON","id":sid,"iconpath":iconpath,"tooltip":tooltip})

def _update_notify_icon(sid, iconpath, tooltip):
    _gdimap["postaction"].append({"name":"UPDATE_NOTIFY_ICON","id":sid,"iconpath":iconpath,"tooltip":tooltip})

def _destroy_notify_icon(sid):
    _gdimap["postaction"].append({"name":"DESTROY_NOTIFY_ICON","id":sid})


CMPFUNCEVENTMESSAGE = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_wchar_p)

@CMPFUNCEVENTMESSAGE 
def cb_func_event_message(smsg):
    okscreensize=False
    if _gdimap["init"]==False:
        okscreensize=True
        _gdimap["init"]=True
        _gdimap["fontmanager"].load("default")
    else:
        elp = time.time() - _gdimap["screensize"]["_lastcheck"]
        if elp>3.0 or elp<0.0:
            okscreensize=True
    if okscreensize:
        sz_array = (ctypes.c_int * 2)()
        gdw_lib().DWAGDIGetScreenSize(sz_array)
        appsz={}
        appsz["width"] = int(sz_array[0])
        appsz["height"] = int(sz_array[1])
        appsz["_lastcheck"] = time.time()
        _gdimap["screensize"]=appsz
            
    gdwlib=gdw_lib()
    
    #SCHEDULER
    _gdimap["sheduler"].run()
    
    #POST ACTION
    while len(_gdimap["postaction"])>0: 
        jopa = _gdimap["postaction"].pop(0)
        if "id" in jopa:
            if jopa["name"]=="INIT":
                wnd=_gdimap["windows"][jopa["id"]]
                logo=wnd._logo_path
                if logo is None:
                    if is_linux():
                        logo=images.get_image(u"logo16x16.bmp") + "\n" + images.get_image(u"logo32x32.bmp") + "\n" + images.get_image(u"logo48x48.bmp")                        
                    else:
                        logo=images.get_image(u"logo16x16.bmp")
                if is_linux():
                    if not "\n" in logo:
                        logo+="\n"
                sx=wnd._x
                sy=wnd._y
                if wnd._show_position==WINDOW_POSITION_CENTER_SCREEN:
                    appsz=_gdimap["screensize"]                    
                    sx=int((appsz["width"]/2)-(wnd._w/2))
                    sy=int((appsz["height"]/2)-(wnd._h/2))
                gdwlib.DWAGDINewWindow(wnd._id, wnd._type, int(sx), int(sy), int(wnd._w), int(wnd._h), logo)
                gdwlib.DWAGDISetTitle(wnd._id,wnd._title)
            elif jopa["name"]=="TERM":
                gdwlib.DWAGDIDestroyWindow(jopa["id"])
                del _gdimap["windows"][jopa["id"]]
                if len(_gdimap["windows"])==0:
                    gdwlib.DWAGDIEndLoop()
                    return
            elif jopa["name"]=="SET_TITLE":
                gdwlib.DWAGDISetTitle(jopa["id"],jopa["title"])
            elif jopa["name"]=="REPAINT":
                gdwlib.DWAGDIRepaint(jopa["id"],int(jopa["x"]),int(jopa["y"]),int(jopa["width"]),int(jopa["height"]));
            elif jopa["name"]=="SHOW":
                wnd=_gdimap["windows"][jopa["id"]]
                sx=wnd._x
                sy=wnd._y
                if wnd._show_position==WINDOW_POSITION_CENTER_SCREEN:
                    appsz=_gdimap["screensize"]
                    sx=int((appsz["width"]/2)-(wnd._w/2))
                    sy=int((appsz["height"]/2)-(wnd._h/2))
                gdwlib.DWAGDIPosSizeWindow(wnd._id, int(sx), int(sy), int(wnd._w), int(wnd._h))
                gdwlib.DWAGDIShow(jopa["id"],0)
                gdwlib.DWAGDIToFront(jopa["id"])
                wnd.on_show()
            elif jopa["name"]=="UPDATEPOSSIZE":
                wnd=_gdimap["windows"][jopa["id"]]
                sx=wnd._x
                sy=wnd._y
                if wnd._show_position==WINDOW_POSITION_CENTER_SCREEN:
                    appsz=_gdimap["screensize"]
                    sx=int((appsz["width"]/2)-(wnd._w/2))
                    sy=int((appsz["height"]/2)-(wnd._h/2))
                gdwlib.DWAGDIPosSizeWindow(wnd._id, int(sx), int(sy), int(wnd._w), int(wnd._h))
            elif jopa["name"]=="HIDE":
                sappid=jopa["id"]
                gdwlib.DWAGDIHide(sappid)
                if sappid in _gdimap["windows"]:                                        
                    wnd=_gdimap["windows"][sappid]
                    wnd.on_hide()
            elif jopa["name"]=="TO_FRONT":
                gdwlib.DWAGDIToFront(jopa["id"])
            elif jopa["name"]=="CREATE_NOTIFY_ICON":
                gdwlib.DWAGDICreateNotifyIcon(jopa["id"],jopa["iconpath"],jopa["tooltip"])
            elif jopa["name"]=="UPDATE_NOTIFY_ICON":
                gdwlib.DWAGDIUpdateNotifyIcon(jopa["id"],jopa["iconpath"],jopa["tooltip"])
            elif jopa["name"]=="DESTROY_NOTIFY_ICON":
                gdwlib.DWAGDIDestroyNotifyIcon(jopa["id"])
                del _gdimap["notifyicon"][jopa["id"]]
    #EVENTS
    if smsg is not None:
        wnd = None
        #print(smsg)
        jo = json.loads(smsg)
        if jo is not None:
            if jo["name"]=="REPAINT":
                if jo["id"] in _gdimap["windows"]:
                    wnd=_gdimap["windows"][jo["id"]]
                    #print("REPAINT: " + str(jo["x"])+ " " + str(jo["y"]) + " " + str(jo["width"]) + " " + str(jo["height"]))                
                    wnd.on_paint(jo["x"],jo["y"],jo["width"],jo["height"]);
            elif jo["name"]=="MOUSE":
                if jo["id"] in _gdimap["windows"]:
                    wnd=_gdimap["windows"][jo["id"]]
                    wnd.on_mouse(jo["action"],jo["x"],jo["y"],jo["button"]);
            elif jo["name"]=="KEYBOARD":
                if jo["id"] in _gdimap["windows"]:
                    wnd=_gdimap["windows"][jo["id"]]
                    wnd.on_keyboard(jo["type"],jo["value"],jo["shift"],jo["ctrl"],jo["alt"],jo["command"]);
            elif jo["name"]=="WINDOW":
                if jo["id"] in _gdimap["windows"]:
                    wnd=_gdimap["windows"][jo["id"]]
                    bret = wnd.on_window(jo["action"]);
                    if jo["action"]=="ONCLOSE":
                        if bret==True:
                            wnd.destroy() 
            elif jo["name"]=="NOTIFY":
                if jo["id"] in _gdimap["notifyicon"]:
                    nfi=_gdimap["notifyicon"][jo["id"]]
                    bret = nfi.on_action(jo["action"]);
    #else:
    #    print("ON TICK: " + str(time.time()))
    
    

def loop():
    gdwlib=gdw_lib()
    _gdimap["fontmanager"]=FontManager()
    _gdimap["imagemanager"]=ImageManager()
    if _gdimap["sheduler"] is None:
        _gdimap["sheduler"]=Sheduler()
    gdwlib.DWAGDILoop(cb_func_event_message)
    _gdimap["sheduler"].destroy()
    _gdimap["imagemanager"].destroy()
    _gdimap["fontmanager"].destroy()
    _gdimap["sheduler"]=None
    _gdimap["imagemanager"]=None
    _gdimap["fontmanager"]=None
    _gdimap["init"]=False
    if is_windows():
        _ctypes.FreeLibrary(gdwlib._handle)
    else:
        _ctypes.dlclose(gdwlib._handle)        
    del _gdimap["gdwlib"]

def get_mouse_position():
    pos_array = (ctypes.c_int * 2)()
    gdw_lib().DWAGDIGetMousePosition(pos_array)
    return {"x":int(pos_array[0]), "y":int(pos_array[1])}        

def get_screen_size():
    return _gdimap["screensize"]

def add_scheduler(tm, func):
    if _gdimap["sheduler"] is None:
        _gdimap["sheduler"]=Sheduler()
    _gdimap["sheduler"].add(tm, func)

class Sheduler:
    def __init__(self):
        self._list=[]
        
    def add(self, tm, func):
        itm = {"intervall": tm, "time": time.time(), "func": func}
        self._list.append(itm)
        return itm 
    
    def cancel(self, itm):
        self._list.remove(itm)
         
    
    def destroy(self):
        self._list=[]
    
    def run(self):
        if len(self._list)>0:
            ar = self._list[:]
            for itm in ar:
                elps = time.time()-itm["time"]
                if elps<0:
                    itm["time"]=time.time()
                elif elps>itm["intervall"]:
                    self._list.remove(itm)
                    itm["func"]()
                    
            
            
class FontManager:
    
    def __init__(self):
        self._list={}
    
    def load(self, name):
        if name not in self._list:
            i = 0
            with _gdimap["lock"]:
                _gdimap["cntfnt"]+=1
                i=_gdimap["cntfnt"]
            gdw_lib().DWAGDILoadFont(i,name)
            self._list[name]=i
    
    def unload(self, name):
        if name in self._list:
            gdw_lib().DWAGDIUnloadFont(self._list[name])
            del self._list[name]
    
    def destroy(self):
        for name in self._list:
            gdw_lib().DWAGDIUnloadFont(self._list[name])
        self._list={}
    
    def get_id(self, name):
        return self._list[name]


def get_image_size(name):
    sz_array = (ctypes.c_int * 2)()
    gdw_lib().DWAGDIGetImageSize(name,sz_array)
    return {"width":sz_array[0], "height":sz_array[1]} 

class ImageManager:
    
    def __init__(self):
        self._list={}
    
    def load(self, name):
        with _gdimap["lock"]:
            _gdimap["cntimg"]+=1
            i=_gdimap["cntimg"]
        sz_array = (ctypes.c_int * 2)()
        gdw_lib().DWAGDILoadImage(i,name,sz_array)
        itm={"id" : i, "name" : name, "width":sz_array[0], "height":sz_array[1]}
        self._list["K" + str(i)]=itm 
        return itm
    
    def unload(self, itm):
        sid = "K" + str(itm[id]);
        if sid in self._list:
            gdw_lib().DWAGDIUnloadImage(self._list[sid]["id"])
            del self._list[sid]
    
    def destroy(self):
        for sid in self._list:
            gdw_lib().DWAGDIUnloadImage(self._list[sid]["id"])
        self._list={}
    

class Paint:
    def __init__(self,win,offx,offy,clipx,clipy,clipw,cliph):
        self._window=win
        self._offx=offx;
        self._offy=offy;
        self._clipx=clipx;
        self._clipy=clipy;
        self._clipw=clipw;
        self._cliph=cliph;
        self._fontid=_gdimap["fontmanager"].get_id("default")
    
    def pen_color(self, col):
        rgb=getRGBColor(col.upper());
        gdw_lib().DWAGDIPenColor(self._window._id,rgb[0],rgb[1],rgb[2])

    def fill_rectangle(self,x,y,w,h):
        gdw_lib().DWAGDIFillRectangle(self._window._id,int(self._offx+x),int(self._offy+y),int(w),int(h))
        
    def fill_ellipse(self,x,y,w,h):
        gdw_lib().DWAGDIFillEllipse(self._window._id,int(self._offx+x),int(self._offy+y),int(w),int(h))

    def draw_image(self,imgitm,x,y):
        gdw_lib().DWAGDIDrawImage(self._window._id,imgitm["id"],int(self._offx+x),int(self._offy+y))                  
        
    def draw_ellipse(self,x,y,w,h):
        gdw_lib().DWAGDIDrawEllipse(self._window._id,int(self._offx+x),int(self._offy+y),int(w),int(h))
        
    def draw_line(self,x1,y1,x2,y2):
        gdw_lib().DWAGDIDrawLine(self._window._id,int(self._offx+x1),int(self._offy+y1),int(self._offx+x2),int(self._offy+y2))
    
    def get_text_height(self):
        return gdw_lib().DWAGDIGetTextHeight(self._window._id,self._fontid)
    
    def get_text_width(self,s):
        return gdw_lib().DWAGDIGetTextWidth(self._window._id,self._fontid,s)
    
    def draw_text(self,s,x,y):
        gdw_lib().DWAGDIDrawText(self._window._id,self._fontid,s,int(self._offx+x),int(self._offy+y))
    
    def clip_rectangle(self,x,y,w,h):
        appx=self._offx+x
        appy=self._offy+y
        if appx<self._clipx:
            appx=self._clipx
        if appy<self._clipy:
            appy=self._clipy
        if appx+w>self._clipx+self._clipw:
            w=(self._clipx+self._clipw)-appx
        if appy+h>self._clipy+self._cliph:
            h=(self._clipy+self._cliph)-appy
        gdw_lib().DWAGDIClipRectangle(self._window._id,int(appx),int(appy),int(w),int(h))
    
    def clear_clip_rectangle(self):
        gdw_lib().DWAGDIClipRectangle(self._window._id,int(self._clipx),int(self._clipy),int(self._clipw),int(self._cliph))
    

class NotifyIcon:
    def __init__(self,imgpath,tooltip):
        with _gdimap["lock"]:
            _gdimap["cntnfi"]+=1
            self._id=_gdimap["cntnfi"]
        self._imgpath=imgpath
        self._tooltip=tooltip
        self._action=None
        self._object={}
        _create_notify_icon(self._id,self,imgpath,tooltip)
        
    def update(self,imgpath,tooltip):
        self._imgpath=imgpath
        self._tooltip=tooltip
        _update_notify_icon(self._id,imgpath,tooltip)
    
    def _fire_action(self,e):
        if self._action is not None:
            e["source"]=self
            self._action(e)
    
    def set_action(self,f):
        self._action=f
        
    def get_action(self):
        return self._action
    
    def set_object(self,k,v):
        self._object[k]=v
        
    def get_object(self,k):
        return self._object[k] 
    
    def on_action(self, tp):
        if tp=="ACTIVATE":
            self._fire_action({"action":"ACTIVATE"})
        elif tp=="CONTEXTMENU":
            self._fire_action({"action":"CONTEXTMENU"})
        
    def destroy(self):
        _destroy_notify_icon(self._id)
    
class EventMouseDetect:
    def __init__(self, s):
        self._source=s
        self._click_time=None
    
    def check(self,tp,x,y,b):
        if tp=="MOVE":
            self._source._fire_action({"action":"MOUSEMOVE", "x":x, "y":y, "button":b})
        if tp=="BUTTON_DOWN":
            self._source._fire_action({"action":"MOUSEBUTTONDOWN", "x":x, "y":y, "button":b})
            self._click_time=time.time()
        if tp=="BUTTON_UP":
            self._source._fire_action({"action":"MOUSEBUTTONUP", "x":x, "y":y, "button":b})
            if self._click_time is not None:
                self._source._fire_action({"action":"MOUSECLICK", "x":x, "y":y})
                self._click_time=None
        

class Window:
    def __init__(self,tp=WINDOW_TYPE_NORMAL_NOT_RESIZABLE,parentwin=None,logopath=None):
        with _gdimap["lock"]:
            _gdimap["cntwin"]+=1
            self._id=_gdimap["cntwin"]
        self._type=tp
        self._top_windows=[]
        self._title="";
        self._show_position=WINDOW_POSITION_XY
        self._x=0;
        self._y=0;
        self._w=300;
        self._h=200;
        self._logo_path=logopath;
        self._background=_STYLE_WINDOW_BACKGROUND_COLOR
        self._foreground=_STYLE_WINDOW_FOREGROUND_COLOR
        self._components=[]
        self._show=False
        self._activate=False
        self._disable=False
        self._focus_sequence_index_lost=None
        self._focus_sequence_index=None
        self._focus_sequence=[]
        self._mouse_enter_component=None
        self._action=None
        self._object={}
        self._parent_window=parentwin
        self._eventMouseDetect=EventMouseDetect(self)
        if self._parent_window is not None:
            self._parent_window._top_windows.append(self)
            self._title=parentwin.get_title()
        _init_window(self._id,self)
    
    
    def _fire_action(self,e):
        if self._action is not None:
            e["source"]=self
            if "window" not in e:
                e["window"]=self
            self._action(e)
            
    
    def set_action(self,f):
        self._action=f
    
    def get_action(self):
        return self._action
    
    def set_object(self,k,v):
        self._object[k]=v
        
    def get_object(self,k):
        return self._object[k]
    
    def get_x(self):
        return self._x;
    
    def get_y(self):
        return self._y;
    
    def get_width(self):
        return self._w;
    
    def get_height(self):
        return self._h;
    
    def get_logo_path(self):
        return self._logo_path;
    
    def set_foreground(self,c):
        self._foreground=c
    
    def get_foreground(self):
        return self._foreground
    
    def set_background(self,c):
        self._background=c
    
    def get_background(self):
        return self._background    
    
    def set_title(self,t):
        self._title=utils.str_new(t)
        _set_title(self._id,self._title)
    
    def get_title(self):
        return self._title

    def set_show_position(self,p):
        self._show_position=p

    def set_position(self,x,y):
        self._x=x;
        self._y=y;
        if self._show:
            _update_pos_size(self._id)
            #_repaint(self._id,0,0,self._w,self._h)
    
    def set_size(self,w,h):
        self._w=w
        self._h=h
        if self._show:            
            _update_pos_size(self._id)
            _repaint(self._id,0,0,self._w,self._h)
    
    def get_mouse_enter_component(self):
        return self._mouse_enter_component
    
    def get_focus_component(self):
        if self._focus_sequence_index is not None and self._focus_sequence_index<=len(self._focus_sequence)-1:
            return self._focus_sequence[self._focus_sequence_index]
        return  None
    
    def _add_focus_sequence(self, c):
        self._focus_sequence.append(c)
     
    def add_component(self, c):
        c._window=self;
        self._components.append(c)
        self._add_focus_sequence(c)
    
    def get_components(self):
        return self._components
    
    def remove_component(self, crem):
        for c in self._components:
            if c==crem:
                if c._container:
                    c.remove_all_components()
                c._destroy()
                bchangefocus=False
                if self.get_focus_component()==c:
                    self._set_focus_component_byindex(None)
                self._components.remove(c)
                self._focus_sequence.remove(c)
                if bchangefocus:
                    self.next_focus_component()
                _repaint(self._id,c._x,c._y,c._w,c._h)
                break
    
    def get_all_components(self):
        return self._focus_sequence
    
    def repaint(self):
        if self._id is not None:
            _repaint(self._id,0,0,self._w,self._h)
    
    def destroy(self):
        if self._id is not None:
            if self._parent_window is not None and self._parent_window._id is not None:
                self._parent_window._disable=False
                self._parent_window._top_windows.remove(self)
            for w in self._top_windows:
                w.hide()
            _term_window(self._id)
            if self._parent_window is not None and self._parent_window._id is not None:
                if self._parent_window.is_show():
                    self._parent_window.to_front()
    
    def is_show(self):
        return self._show
    
    def show(self):
        if not self._show:
            self._show=True
            if self._parent_window is not None:
                self._parent_window._disable=True
            _show_window(self._id)            
    
    def hide(self):
        if self._show:
            self._show=False
            _hide_window(self._id)            
    
    def to_front(self):        
        _to_front_window(self._id)
        
    def on_show(self):
        self._set_activate()
    
    def on_hide(self):
        self._set_inactivate()
    
    def _set_activate(self):
        if not self._activate:
            self._activate=True
            self.next_focus_component()
    
    def _set_inactivate(self):
        if self._activate:
            self._activate=False    
            self._focus_sequence_index_lost=self._focus_sequence_index
            self._set_focus_component_byindex(None,{"mode":"WINDOW"})
            self._set_mouse_enter_component(None, "", 0, 0, False)
    
    def _set_focus_component(self,c,e):
        if c is not None and c in self._focus_sequence:
            self._set_focus_component_byindex(self._focus_sequence.index(c),e)
        
    def _set_focus_component_byindex(self,idx,e):
        if self._focus_sequence_index==idx:
            return
        oldc=self.get_focus_component()
        self._focus_sequence_index=idx
        if oldc is not None:
            oldc.on_focus_lost(e)
        if self._focus_sequence_index is not None:
            if self._activate:
                self.get_focus_component().on_focus_get(e)
            else:
                self._focus_sequence_index_lost=self._focus_sequence_index
            
    def next_focus_component(self):
        if self._focus_sequence_index_lost is not None:
            self._focus_sequence_index=None            
            self._set_focus_component_byindex(self._focus_sequence_index_lost,{"mode":"WINDOW"})
            self._focus_sequence_index_lost=None
            return
        if self._focus_sequence_index is None:
            if len(self._components)>0:
                for c in self._focus_sequence:
                    if c.is_focusable() and c.is_enable():
                        self._set_focus_component(c,{"mode":"KEYBOARD"})
                        break 
        else:            
            #print("focus NEXT len: " + str(len(self._focus_sequence)) + "  idx: " + str(self._focus_sequence_index))            
            i=self._focus_sequence_index+1;
            while i!=self._focus_sequence_index:
                if i>(len(self._focus_sequence)-1):
                    i=0
                c=self._focus_sequence[i]
                if c.is_focusable() and c.is_enable():
                    self._set_focus_component_byindex(i,{"mode":"KEYBOARD"})
                    break
                i+=1

    def previous_focus_component(self):        
        if self._focus_sequence_index is None:
            if len(self._components)>0:
                for c in reversed(self._focus_sequence):
                    if c.is_focusable() and c.is_enable():
                        self._set_focus_component(c,{"mode":"KEYBOARD"})
                        break 
        else:
            #print("focus PREV len: " + str(len(self._focus_sequence)) + "  idx: " + str(self._focus_sequence_index))            
            i=self._focus_sequence_index-1;
            while i!=self._focus_sequence_index:
                if i<0:
                    i=len(self._focus_sequence)-1
                c=self._focus_sequence[i]
                if c.is_focusable() and c.is_enable():
                    self._set_focus_component_byindex(i,{"mode":"KEYBOARD"})
                    break
                i-=1
    
    def _set_mouse_enter_component(self,c,tp,x,y,b):
        if self._mouse_enter_component==c:
            return
        if self._mouse_enter_component is not None:
            self._mouse_enter_component.on_mouse_leave({})
        self._mouse_enter_component=c;
        if self._mouse_enter_component is not None:
            self._mouse_enter_component.on_mouse_enter({})
    
    def _is_intersect(self,r1,r2):
        if r1["x"] < r2["x"] + r2["w"] and r2["x"] < r1["x"] + r1["w"] and r1["y"] < r2["y"] + r2["h"]:
            return r2["y"] < r1["y"] + r1["h"]
        return False
        
    
    def on_paint(self,x,y,w,h):
        if self._id is not None:
            rgb=getRGBColor(self._background)
            gdw_lib().DWAGDIPenColor(self._id,rgb[0],rgb[1],rgb[2])
            gdw_lib().DWAGDIFillRectangle(self._id,x,y,w,h)
            #print(str("*******************************"))
            for c in self._components:
                self._on_paint_component(c,x,y,w,h,0,0)
                if c._container:
                    self._on_paint_container(c,x,y,w,h,0,0)
    
    def _on_paint_component(self,c,x,y,w,h,offx,offy):
        if c._visible:
            r1={"x":c._x+offx, "y":c._y+offy, "w":c._w, "h":c._h}
            r2={"x":x, "y":y, "w":w, "h":h}
            if self._is_intersect(r1,r2) :
                clipx=c._x+offx
                if x>c._x+offx:
                    clipx=x
                clipw=c._w-(clipx-(c._x+offx))
                if clipw>(x+w)-clipx:
                    clipw=(x+w)-clipx
                clipy=c._y+offy
                if y>c._y+offy:
                    clipy=y
                cliph=c._h-(clipy-(c._y+offy))
                if cliph>(y+h)-clipy:
                    cliph=(y+h)-clipy
                
                gdw_lib().DWAGDIClipRectangle(self._id,int(clipx),int(clipy),int(clipw),int(cliph))
                pobj=Paint(self,c._x+offx,c._y+offy,clipx,clipy,clipw,cliph)
                c.on_paint(pobj) #DA FARE GESTIRE INTERSEZIONE DARE CORDINATE CORRETTE
                gdw_lib().DWAGDIClearClipRectangle(self._id)
                #print(str(c) + " " + str(c._x+offx) + " " + str(c._y+offy) + " CLIP:" + str(clipx) + " " + str(clipy) + " " + str(clipw) + " " + str(cliph))            
        
    def _on_paint_container(self,cnt,x,y,w,h,offx,offy):
        for c in cnt._components:
            self._on_paint_component(c,x,y,w,h,offx+cnt._x,offy+cnt._y)
            if c._container:
                self._on_paint_container(c,x,y,w,h,offx+cnt._x,offy+cnt._y)
    
    
    def on_keyboard(self,tp,c,shift,ctrl,alt,meta):
        if self._disable:
            return
        if self.get_focus_component() is not None:
            self.get_focus_component().on_keyboard(tp,c,shift,ctrl,alt,meta)

    
    def _on_mouse_component(self,c,tp,x,y,b,offx,offy):
        if x>=c._x+offx and y>=c._y+offy and x<c._x+offx+c._w and y<c._y+offy+c._h:
            self._set_mouse_enter_component(c, tp, x, y, b)
            c.on_mouse(tp,x-(c._x+offx),y-(c._y+offy),b)
            return True
        return False
    
    def _on_mouse_container(self,cnt,tp,x,y,b,offx,offy):
        for c in reversed(cnt._components):
            if c._container:
                if self._on_mouse_container(c,tp,x,y,b,offx+cnt._x,offy+cnt._y):
                    return True
                else:
                    if self._on_mouse_component(c,tp,x,y,b,offx+cnt._x,offy+cnt._y):
                        return True
            else:
                if self._on_mouse_component(c,tp,x,y,b,offx+cnt._x,offy+cnt._y):
                    return True
        return False
        
    def on_mouse(self,tp,x,y,b):
        if self._disable:
            return
        self._eventMouseDetect.check(tp, x, y, b)
        #VERIFICA FOCUS
        if tp=="BUTTON_DOWN":
            for c in reversed(self._focus_sequence):
                if c.is_focusable() and c.is_enable():
                    xy = c._get_win_pos()
                    if x>=xy[0] and y>=xy[1] and x<xy[0]+c._w and y<xy[1]+c._h:
                        self._set_focus_component(c,{"mode":"MOUSE","x":x-xy[0],"y":y-xy[1]})
                        break
        benter=False
        for c in reversed(self._components):
            if c._container:
                if self._on_mouse_container(c,tp,x,y,b,0,0):
                    benter=True
                    break
                else:
                    if self._on_mouse_component(c,tp,x,y,b,0,0):
                        benter=True
                        break
            else:       
                if self._on_mouse_component(c,tp,x,y,b,0,0):
                    benter=True
                    break
        if not benter:
            self._set_mouse_enter_component(None, tp, x, y, b)
    
    def on_window(self,tp):
        if tp=="ACTIVE":
            if not self._disable:
                self._set_activate()
            for w in self._top_windows:
                if w.is_show():
                    w.to_front()
        elif tp=="INACTIVE":
            self._set_inactivate()
        elif tp=="ONCLOSE":
            if not self._disable:
                e={"window":self, "action":"ONCLOSE"};                
                self._fire_action(e)
                if "cancel" in e and e["cancel"] == True:
                    return False
            else:
                return False
        return True
 
class DialogMessage(Window):
    
    def __init__(self,act,lv,parentwin=None,logopath=None):
        if parentwin is None:
            Window.__init__(self,WINDOW_TYPE_DIALOG,parentwin=parentwin,logopath=logopath)
        else:
            if parentwin.is_show():
                Window.__init__(self,WINDOW_TYPE_TOOL,parentwin=parentwin,logopath=logopath)
            else:
                Window.__init__(self,WINDOW_TYPE_DIALOG,parentwin=parentwin,logopath=logopath)
        self._actions=act
        self._level=lv
        self._message=u""
        self._action=None        
        
        
        
    def get_message(self):
        return self._message

    def set_message(self, value):
        self._message = utils.str_new(value)

    def _ok_action(self,e):
        if e["action"]=="PERFORMED":
            self._fire_action({"action":"DIALOG_OK"})
            self.destroy()
    
    def _yes_action(self,e):
        if e["action"]=="PERFORMED":
            self._fire_action({"action":"DIALOG_YES"})
            self.destroy()
    
    def _no_action(self,e):
        if e["action"]=="PERFORMED":
            self._fire_action({"action":"DIALOG_NO"})
            self.destroy()
    
    def show(self):
        gapLabel=6
        pnlLeftW=50
        pnlBottomH=55   
        
        self.set_size(300, 180)
        self.set_show_position(WINDOW_POSITION_CENTER_SCREEN)
        
        pnlLeft = Panel()
        pnlLeft.set_position(0, 0)
        pnlLeft.set_size(pnlLeftW,self.get_height())
        col="064f7e"
        if self._level==DIALOGMESSAGE_LEVEL_ERROR:
            col="a61515"
        elif self._level==DIALOGMESSAGE_LEVEL_WARN:
            col="d2d90c"
        pnlLeft.set_background_gradient(col, "FFFFFF", GRADIENT_DIRECTION_LEFTRIGHT)
        self.add_component(pnlLeft)
        
             
        lb = Label()
        lb.set_position(gapLabel+pnlLeftW, gapLabel)
        lb.set_size(self.get_width()-pnlLeft.get_width()-(gapLabel*2), self.get_height()-55-(gapLabel*2))
        lb.set_wordwrap(True)
        lb.set_text(self._message)
        self.add_component(lb)
        
        pnl = Panel()
        pnl.set_position(0, self.get_height()-pnlBottomH)
        pnl.set_size(self.get_width(),pnlBottomH)
        self.add_component(pnl)
        
        if self._actions==DIALOGMESSAGE_ACTIONS_YESNO:
            bty = Button()
            bty.set_position(int((self._w/2)-((bty._w*2)/2))-5, 10)
            bty.set_text(messages.get_message('yes'))
            bty.set_action(self._yes_action)
            pnl.add_component(bty)
            
            btn = Button()
            btn.set_position(bty._x+bty._w+10, 10)
            btn.set_text(messages.get_message('no'))
            btn.set_action(self._no_action)
            pnl.add_component(btn)
        else:
            bt = Button()
            bt.set_position(int((self._w/2)-(bt._w/2)), 10)
            bt.set_text(messages.get_message('ok'))
            bt.set_action(self._ok_action)
            pnl.add_component(bt)
        
        Window.show(self)                 
                

    def on_window(self, tp):
        if tp=="ONCLOSE":
            return False
        return Window.on_window(self, tp)
        

class PopupMenu(Window):
    
    def __init__(self):
        Window.__init__(self,WINDOW_TYPE_POPUP)
        self._w=110;
        self._h=30;
        self._show_position=[POPUP_POSITION_BOTTONRIGHT, POPUP_POSITION_BOTTONLEFT, POPUP_POSITION_TOPRIGHT, POPUP_POSITION_TOPLEFT]
        #self._show_position=[POPUP_POSITION_TOPRIGHT]
        self._list=[]        
    
    def set_show_position(self,p):
        self._show_position=p
        
    def get_show_position(self,p):
        return self._show_position

    def _do_actions(self,e):
        if e["action"]=="MOUSECLICK":
            self.destroy()
            self._fire_action({"action":"PERFORMED", "name":e["source"].get_name()})
    
    def show(self):
        self._h=len(self._list)*30+4        
        pos_array = (ctypes.c_int * 2)()
        gdw_lib().DWAGDIGetMousePosition(pos_array)
        appsz=_gdimap["screensize"]
        self._x=int(pos_array[0])
        self._y=int(pos_array[1])
        for p in self._show_position:
            if p==POPUP_POSITION_BOTTONRIGHT:
                if (pos_array[1]+self._h<appsz["height"]) and (pos_array[0]+self._w<appsz["width"]):                    
                    self._x=int(pos_array[0])
                    self._y=int(pos_array[1])
                    break;
            elif p==POPUP_POSITION_BOTTONLEFT:
                if (pos_array[1]+self._h<appsz["height"]) and (pos_array[0]-self._w>=0):
                    self._x=int(pos_array[0])-self._w
                    self._y=int(pos_array[1])
                    break;
            elif p==POPUP_POSITION_TOPRIGHT:
                if (pos_array[1]-self._h>=0) and (pos_array[0]+self._w<appsz["width"]):
                    self._x=int(pos_array[0])
                    self._y=int(pos_array[1])-self._h
                    break;
            elif p==POPUP_POSITION_TOPLEFT:
                if (pos_array[1]-self._h>=0) and (pos_array[0]-self._w>=0):
                    self._x=int(pos_array[0])-self._w
                    self._y=int(pos_array[1])-self._h
                    break;            
        
        pnl = Panel()
        pnl.set_background("ffffff")
        pnl.set_border(BorderLine())
        pnl.set_position(0, 0)
        pnl.set_size(self._w, self._h)
        self.add_component(pnl)        
        y=2
        for itm in self._list:
            lbl = Label()
            lbl.set_name(itm["key"])
            lbl.set_text(itm["label"])
            lbl.set_highlight(True)
            lbl.set_position(2, y)
            lbl.set_width(self._w-4)
            lbl.set_action(self._do_actions)
            pnl.add_component(lbl)
            y+=30
        
        Window.show(self)
    
    def add_item(self,k,l):
        self._list.append({"key": k, "label": l})
        
    def on_window(self, tp):
        if tp=="INACTIVE":
            self.destroy()
            return True
        return Window.on_window(self, tp)
    
   
class BorderLine:
    
    def __init__(self):
        None
        self._color=_STYLE_COMPONENT_BORDER_COLOR
        self.size_l=1
        self.size_t=1
        self.size_b=1
        self.size_r=1
    
    def set_color(self,c):
        self._color=c
    
    def get_color(self):
        return self.color
            
    def on_paint(self,c,pobj):
        pobj.pen_color(self._color)
        pobj.draw_line(0,0,0,c._h-1) #LEFT
        pobj.draw_line(0,0,c._w-1,0) #TOP       
        pobj.draw_line(c._w-1,0,c._w-1,c._h) #RIGHT 
        pobj.draw_line(0,c._h-1,c._w,c._h-1) #BOTTOM
        

class Component:
    
    def __init__(self):
        self._window=None
        self._x=0;
        self._y=0;
        self._w=0;
        self._h=0;
        self._background=_STYLE_COMPONENT_BACKGROUND_COLOR
        self._foreground=_STYLE_COMPONENT_FOREGROUND_COLOR
        self._name=None
        self._border=None
        self._opaque=True
        self._visible=True
        self._focusable=False
        self._parent=None
        self._container=False
        self._enable=True
        self._components=[]
        self._gradient_background_start=None
        self._gradient_background_end=None
        self._gradient_direction=None
        self._action=None
        self._eventMouseDetect=EventMouseDetect(self)
    
    def _destroy(self):
        self._window=None
    
    def set_action(self,f):
        self._action=f
        
    def get_action(self):
        return self._action
    
    def _fire_action(self, e):
        if self._action is not None:
            e["source"]=self
            if "window" not in e:
                e["window"]=self._window
            self._action(e)
        
    def add_component(self, c):
        if self._container:
            c._window=self._window;
            c._parent=self;
            self._components.append(c)
            self._window._add_focus_sequence(c)
            c.repaint()
    
    def remove_component(self, crem):
        if self._container:
            for c in self._components:
                if c==crem:
                    if c._container:
                        c.remove_all_components()
                    c._destroy()
                    bchangefocus=False
                    if self._window.get_focus_component()==c:
                        self._window._set_focus_component_byindex(None)
                    self._components.remove(c)
                    self._window._focus_sequence.remove(c)
                    if bchangefocus:
                        self._window.next_focus_component()
                    xy=self._get_win_pos()
                    _repaint(self._window._id,c._x+xy[0],c._y+xy[1],c._w,c._h)
                    break
    
    def get_components(self):
        return self._components
    
    def remove_all_components(self):
        if self._container:
            while len(self._components)>0:
                c=self._components[0]
                if c._container:
                    c.remove_all_components()
                c._destroy()
                bchangefocus=False
                if self._window.get_focus_component()==c:
                        self._window._set_focus_component_byindex(None)
                self._components.remove(c)
                self._window._focus_sequence.remove(c)
                if bchangefocus:
                        self._window.next_focus_component()
                xy=self._get_win_pos()
                _repaint(self._window._id,c._x+xy[0],c._y+xy[1],c._w,c._h)
    
    def focus(self):
        if self._window:
            self._window._set_focus_component(self,{"mode":"CODE"})
    
    def get_name(self):
        return self._name
    
    def set_name(self,value):
        self._name=value
    
    def set_position(self,x,y):
        if self._x!=x or self._y!=y:
            self._x=x;
            self._y=y;
            self.repaint_parent()
    
    def set_size(self,w,h):
        if self._w!=w or self._h!=h:
            self._w=w;
            self._h=h;
            self.repaint_parent()
    
    def set_x(self,x):
        if self._x!=x:
            self._x=x;
            self.repaint_parent()
    
    def get_x(self):
        return self._x;
    
    def set_y(self,y):
        if self._y!=y:
            self._y=y;
            self.repaint_parent()
    
    def get_y(self):
        return self._y;
    
    def set_width(self,w):
        if self._w!=w:
            self._w=w;
            self.repaint_parent()
    
    def get_width(self):
        return self._w;
    
    def set_height(self,h):
        if self._h!=h:
            self._h=h;
            self.repaint_parent()
    
    def get_height(self):
        return self._h;
    
    
    def set_visible(self,b):
        if self._visible!=b:
            self._visible=b
            self.repaint_parent()
    
    def get_visible(self):
        return self._visible
        
    def set_foreground(self,c):
        self._foreground=c
    
    def get_foreground(self):
        return self._foreground
    
    def set_background(self,c):
        self._background=c
        self.clear_background_gradient()
    
    def get_background(self):
        return self._background
    
    def set_background_gradient(self,cstart,cend,direction): #DA GESTIRE direction al momento fisso sinistra verso destra
        self._gradient_background_start=cstart
        self._gradient_background_end=cend
        self._gradient_direction=direction
        self.repaint()
        
    def is_background_gradient(self):
        return (self._gradient_background_start is not None and self._gradient_background_end is not None and self._gradient_direction is not None)
        
    def clear_background_gradient(self):
        self._gradient_background_start=None
        self._gradient_background_end=None
        self._gradient_direction=None
    
    def set_border(self,b):
        self._border=b;
    
    def get_border(self):
        return self._border;
    
    def set_enable(self,b):
        self._enable=b;
        self.repaint()
    
    def is_enable(self):
        return self._enable
        
    def set_opaque(self,b):
        self._opaque=b;
    
    def is_opaque(self):
        return self._opaque;    
    
    def is_focusable(self):
        return self._focusable
    
    def has_focus(self):
        if self._window:            
            return self._window.get_focus_component()==self
        else:
            return False
    
    def on_focus_get(self,e):
        None
    
    def on_focus_lost(self,e):
        None
    
    def on_mouse_enter(self,e):
        None
    
    def on_mouse_leave(self,e):
        None
        
    def _get_win_pos(self):
        x=self._x;
        y=self._y;
        if self._parent is not None:
            xy=self._parent._get_win_pos()
            return (xy[0]+x,xy[1]+y)
        else:
            return (x,y)
        
        
    def repaint_parent(self):
        if self._parent is not None and self._window._id is not None:
            #print("repaint_parent")
            self._parent.repaint()
        elif self._window is not None and self._window._id is not None:
            #print("repaint_parent")
            self._window.repaint()
            
    def repaint(self):
        if self._window is not None and self._window._id is not None:
            #print("repaint")
            xy=self._get_win_pos()
            _repaint(self._window._id,xy[0],xy[1],self._w,self._h)            
    
    def repaint_area(self,x,y,w,h):
        if self._window is not None and self._window._id is not None:
            #print(repaint_area")
            xy=self._get_win_pos()
            _repaint(self._window._id,xy[0]+x,xy[1]+y,w,h)            
    
    def _draw_background_gradient(self,pobj,x,y,w,h):
        rgbstart = getRGBColor(self._gradient_background_start)
        rgbend = getRGBColor(self._gradient_background_end)
        rstart=rgbstart[0]
        gstart=rgbstart[1]
        bstart=rgbstart[2]
        rend=rgbend[0]
        gend=rgbend[1]
        bend=rgbend[2]        
        if rstart>rend:
            app=rend
            rend=rstart
            rstart=app
        
        if gstart>gend:
            app=gend
            gend=gstart
            gstart=app
            
        if bstart>bend:
            app=bend
            bend=bstart
            bstart=app        
        if self._gradient_direction==GRADIENT_DIRECTION_LEFTRIGHT:
            rstep = float(rend-rstart)/float(w)
            gstep = float(gend-gstart)/float(w)
            bstep = float(bend-bstart)/float(w)
            for i in range(w):
                hexc=getHexColor(int(rstart),int(gstart),int(bstart))
                pobj.pen_color(hexc)
                pobj.draw_line(i,0,i,h-1)
                rstart+=rstep
                gstart+=gstep
                bstart+=bstep
        elif self._gradient_direction==GRADIENT_DIRECTION_TOPBOTTOM:
            rstep = float(rend-rstart)/float(h)
            gstep = float(gend-gstart)/float(h)
            bstep = float(bend-bstart)/float(h)
            for i in range(h):
                hexc=getHexColor(int(rstart),int(gstart),int(bstart))
                pobj.pen_color(hexc)
                pobj.draw_line(0,i,w-1,i)
                rstart+=rstep
                gstart+=gstep
                bstart+=bstep
        elif self._gradient_direction==GRADIENT_DIRECTION_BOTTONTOP:
            rstep = float(rend-rstart)/float(h)
            gstep = float(gend-gstart)/float(h)
            bstep = float(bend-bstart)/float(h)
            for i in reversed(range(h)):
                hexc=getHexColor(int(rstart),int(gstart),int(bstart))
                pobj.pen_color(hexc)
                pobj.draw_line(0,i,w-1,i)
                rstart+=rstep
                gstart+=gstep
                bstart+=bstep
    
    def on_paint(self,pobj):
        if self._opaque:
            if self.is_background_gradient():
                self._draw_background_gradient(pobj,0,0,self._w,self._h)
            else:
                pobj.pen_color(self._background)
                pobj.fill_rectangle(0, 0,self._w,self._h)
        if self._border is not None:
            self._border.on_paint(self,pobj) 
        pobj.pen_color(self._foreground)
    
    def on_keyboard(self,tp,c,shift,ctrl,alt,meta):
        if tp=="KEY":
            if c=="TAB":
                if shift:
                    self._window.previous_focus_component()
                else:
                    self._window.next_focus_component()
    
    def on_mouse(self,tp,x,y,b):
        if self.is_enable():
            self._eventMouseDetect.check(tp, x, y, b)                
        #print("tp: " + tp + " - x: " + str(x) + " - y: " + str(y) + " - b: " + str(b) + "  " + str(self))

class Panel(Component):
    def __init__(self):
        Component.__init__(self)
        self._border=None;
        self._w=300;
        self._h=200;
        self._focusable=False
        self._opaque=True
        self._container=True
        
class Label(Component):
    
    def __init__(self):
        Component.__init__(self)
        self._background=_STYLE_EDITOR_BACKGROUND_COLOR
        self._foreground=_STYLE_EDITOR_FOREGROUND_COLOR
        self._border=None;
        self._w=150;
        self._h=30;
        self._focusable=False
        self._opaque=False
        self._text=u""
        self._wordwrap=False
        self._text_align=TEXT_ALIGN_LEFTMIDDLE
        self._highlight=False
        self._hyperlinks={}
    
    def _fire_action(self, e):
        Component._fire_action(self, e)
        if e["action"]=="MOUSECLICK":
            for k in self._hyperlinks:
                itm = self._hyperlinks[k]
                for a in itm["clickareas"]:
                    if e["x"]>=a["x1"] and e["x"]<=a["x2"] and e["y"]>=a["y1"] and e["y"]<=a["y2"]:
                        try:
                            import webbrowser
                            webbrowser.open(itm["url"])
                        except:
                            None
                        return
    
    def get_text(self):
        return self._text

    def set_text(self, value):
        self._text = utils.str_new(value)
        self._hyperlinks={}
        self.repaint()
    
    def add_hyperlink(self, key, ps, ln, url):
        self._hyperlinks[key]={"start":ps, "length":ln, "url": url , "clickareas":[]}
        self.repaint()
    
    def del_hyperlink(self, key):
        del self._hyperlinks[key]
        self.repaint()
    
    def get_text_align(self):
        return self._text_align

    def set_text_align(self, value):
        self._text_align = value
        self.repaint()    
        
    def set_wordwrap(self,b):
        self._wordwrap=b
        
    def is_wordwrap(self):
        return self._wordwrap 

    def set_highlight(self,b):
        self._highlight=b
    
    def is_highlight(self):
        return self._highlight

    def on_mouse_enter(self,e):
        if self._enable and self._highlight:
            self.repaint()
    
    def on_mouse_leave(self,e):
        if self._enable and self._highlight:
            self.repaint()
    
    def on_paint(self,pobj):
        if self._enable:
            if self._highlight and self._window.get_mouse_enter_component()==self:
                pobj.pen_color("e2e9ed")
                pobj.fill_rectangle(0,0,self._w,self._h)
                if self._border is not None:
                    self._border.on_paint(self,pobj)     
            else:
                Component.on_paint(self, pobj)
        else:
            Component.on_paint(self, pobj)
        pobj.clip_rectangle(2,2,self._w-4,self._h-4)
        gapw=2;
        s = self._text 
        if s!=u"":
            pobj.pen_color(self._foreground)
            ar=[]
            appar = s.split(u"\n")
            for appsr in appar:
                if not self._wordwrap:
                    ar.append(appsr)
                else:
                    if appsr=="":
                        ar.append("")
                    else:
                        wordar = appsr.split(" ")
                        curs=u""
                        bfirst=True
                        for wsr in wordar:
                            news=None
                            if bfirst:
                                bfirst=False
                                news=wsr
                            else:
                                news=curs + u" " + wsr
                            if pobj.get_text_width(news)>self._w-(gapw*2):
                                ar.append(curs)
                                curs=wsr
                            else:
                                curs=news
                        if curs!=u"":
                            ar.append(curs)                        
            
            
            for k in self._hyperlinks:
                itm = self._hyperlinks[k]
                itm["clickareas"]=[]
            th=pobj.get_text_height()*len(ar)
            ty=2;
            if self._text_align==TEXT_ALIGN_LEFTMIDDLE or self._text_align==TEXT_ALIGN_CENTERMIDDLE or self._text_align==TEXT_ALIGN_RIGHTMIDDLE:
                ty=(self._h/2)-(th/2)            
            cpos=0
            for sr in ar:
                tx=gapw
                srw=pobj.get_text_width(sr)
                srh=pobj.get_text_height()
                if self._text_align==TEXT_ALIGN_CENTERMIDDLE:
                    tx=((self._w-(gapw*2))/2)-(srw/2)
                    if tx<gapw:
                        tx=gapw
                elif self._text_align==TEXT_ALIGN_RIGHTMIDDLE:
                    tx=(self._w-(gapw*2))-srw
                pobj.draw_text(sr,tx,ty)
                
                for k in self._hyperlinks:
                    itm = self._hyperlinks[k]
                    lnpi = cpos
                    lnpe = cpos+len(sr)
                    klpi = itm["start"]
                    klpe = itm["start"]+itm["length"]
                    x1 = -1
                    x2 = -1
                    if klpi>=lnpi and klpi<=lnpe and klpe>=lnpi and klpe<=lnpe: #FULL INSIDE
                        x1 = pobj.get_text_width(sr[0:(klpi-lnpi)])
                        x2 = x1 + pobj.get_text_width(sr[(klpi-lnpi):(klpe-lnpi)])
                    elif klpi>=lnpi and klpi<=lnpe: #START INSIDE
                        x1 = pobj.get_text_width(sr[0:(klpi-lnpi)])
                        x2 = x1 + pobj.get_text_width(sr[(klpi-lnpi):])
                    elif klpe>=lnpi and klpe<=lnpe: #END INSIDE
                        x1 = 0
                        x2 = x1 + pobj.get_text_width(sr[0:(klpe-lnpi)])
                    if x1!=-1 and x2 !=-1:
                        y1 = ty
                        y2 = ty+srh
                        pobj.draw_line(x1+tx,y2,x2+tx,y2)
                        itm["clickareas"].append({"x1":x1+tx,"y1":y1,"x2":x2+tx,"y2":y2})

                cpos+=len(sr)+1                              
                ty+=srh
        pobj.clear_clip_rectangle()

                    

class Button(Component):
    def __init__(self):
        Component.__init__(self)
        self._w=100;
        self._h=36;
        self._focusable=True
        self._opaque=True
        self._text=u""
        self._border=BorderLine()        
        
    
    def get_text(self):
        return self._text

    def set_text(self, value):
        self._text = utils.str_new(value)
        self.repaint() 
    
    def on_mouse_enter(self,e):
        if self._enable:
            self.repaint()
    
    def on_mouse_leave(self,e):
        if self._enable:
            self.repaint()

    def on_paint(self,pobj):
        if self._enable:
            if self._window.get_mouse_enter_component()==self:
                pobj.pen_color("e2e9ed")
                pobj.fill_rectangle(0,0,self._w,self._h)
                if self._border is not None:
                    self._border.on_paint(self,pobj)     
            else:
                Component.on_paint(self, pobj)
        else:
            Component.on_paint(self, pobj)
        pobj.clip_rectangle(2,2,self._w-4,self._h-4)
        s = self._text 
        if s!=u"":
            if self._enable:
                pobj.pen_color(self._foreground)
            else:
                pobj.pen_color("a0a0a0")
            tx=(self._w/2)-(pobj.get_text_width(s)/2)
            ty=(self._h/2)-(pobj.get_text_height()/2)
            pobj.draw_text(s,tx,ty)
        pobj.clear_clip_rectangle()
    
    def on_mouse(self,tp,x,y,b):
        Component.on_mouse(self, tp, x, y, b)
        if self.is_enable():
            if tp=="BUTTON_DOWN":
                self.focus()
            elif tp=="BUTTON_UP":
                if self._enable:
                    self._fire_action({"action":"PERFORMED"})
            

class RadioButton(Component):
    def __init__(self):
        Component.__init__(self)
        self._w=150;
        self._h=30;
        self._focusable=True
        self._opaque=False
        self._text=""
        self._border=None;
        self._selected=False
        self._group=None
            
    def get_text(self):
        return self._text

    def set_text(self, value):
        self._text = utils.str_new(value)
        self.repaint() 
    
    def get_selected(self):
        return self._selected

    def set_selected(self, value):
        self._selected= value
        self.repaint_area(0,0,22,self._h)
    
    def get_group(self):
        return self._group

    def set_group(self, value):
        self._group= value

    def _repaint_check(self):
        self.repaint_area(0,0,22,self._h)
    
    '''def on_mouse_enter(self,e):
        if self._enable:
            self.repaint_area(0,0,22,self._h)
    
    def on_mouse_leave(self,e):
        if self._enable:
            self.repaint_area(0,0,22,self._h)'''

    def on_paint(self,pobj):
        Component.on_paint(self, pobj)
        pobj.clip_rectangle(2,2,self._w-4,self._h-4)
        #if self._window.get_mouse_enter_component()==self:
        #    pobj.pen_color("f8fbfd")
        #else:            
        pobj.pen_color(_STYLE_EDITOR_BACKGROUND_COLOR)
        rsz=18
        ty=int((self._h/2)-(rsz/2))
        pobj.fill_ellipse(2,ty,rsz,rsz)
        pobj.pen_color(_STYLE_COMPONENT_BORDER_COLOR)
        pobj.draw_ellipse(2,ty,rsz,rsz)
        
        if self._selected:
            gap=8
            pobj.pen_color(_STYLE_EDITOR_FOREGROUND_COLOR)
            ty=int((self._h/2)-((rsz-gap)/2))
            pobj.fill_ellipse(2+(gap/2),ty,rsz-gap,rsz-gap)
        
        s = self._text 
        if s!=u"":
            pobj.pen_color(self._foreground)
            ty=(self._h/2)-(pobj.get_text_height()/2)
            pobj.draw_text(s,rsz+10,ty)
        pobj.clear_clip_rectangle()
            
    def on_mouse(self,tp,x,y,b):
        Component.on_mouse(self, tp, x, y, b)
        if self.is_enable():
            if tp=="BUTTON_DOWN":
                self.focus()
                if not self._selected:
                    old_selected=None
                    if self._group is not None:
                        for c in self._window.get_all_components():
                            if isinstance(c, RadioButton):
                                if c._group is not None:
                                    if self._group==c._group:
                                        if c._selected:
                                            old_selected=c
                                            old_selected._selected=False
                                            old_selected._repaint_check()
                    self._selected=True
                    self._repaint_check()
                    if self._enable:
                        self._fire_action({"action":"SELECTED", "old_selected":old_selected})


class ProgressBar(Component):
    
    def __init__(self):
        Component.__init__(self)
        self._foreground="86a7d4"
        self._border=BorderLine()
        self._w=250;
        self._h=24;
        self._focusable=False
        self._opaque=True
        self._percent=0
    
    def get_percent(self):
        return self._percent

    def set_percent(self, value):
        self._percent = value
        self.repaint() 

    def on_paint(self,pobj):
        Component.on_paint(self, pobj)
        p=self._percent
        if p<0.0:
            p=0.0;
        elif p>1.0:
            p=1.0;
        if self._percent>0.0:
            pobj.pen_color(self._foreground)
            pw=int((self._w-4)*p)
            pobj.fill_rectangle(2,2,pw,self._h-4)

class ImagePanel(Component):
    
    def __init__(self):
        Component.__init__(self)
        self._imgreload=True
        self._imgitm=None
        self._filename=None
        self._w=250;
        self._h=100;
        self._focusable=False
        self._opaque=False
     
    def _destroy(self):
        if self._imgitm is not None:
            _gdimap["imagemanager"].unload(self._imgitm)
            self._imgitm=None
        Component._destroy(self)   
    
    def get_filename(self):
        return self._filename

    def set_filename(self, fn):
        if self._filename != fn:
            self._filename = fn
            self._imgreload = True
            self.repaint() 

    def on_paint(self,pobj):
        Component.on_paint(self, pobj)
        if self._imgreload:
            if self._imgitm is not None:
                _gdimap["imagemanager"].unload(self._imgitm)
                self._imgitm=None
            self._imgitm = _gdimap["imagemanager"].load(self._filename)
            self._imgreload=False
        
        if self._imgitm is not None:
            pobj.draw_image(self._imgitm,0,0)            
                
                
class TextBox(Component):
    
    def __init__(self):
        Component.__init__(self)
        self._background=_STYLE_EDITOR_BACKGROUND_COLOR
        self._foreground=_STYLE_EDITOR_FOREGROUND_COLOR
        self._border=BorderLine()
        self._focusable=True
        self._w=200;
        self._h=30;
        self._text=u""
        self._cursor_position=0
        self._selection_start=0
        self._selection_end=0
        self._blink=False
        self._blinkitm=None
        self._password_mask=False
        self._validate=None
        self._cursor_x=-1
        self._text_offx=0
    
        
    def set_password_mask(self,value):
        self._password_mask=value
    
    def is_password_mask(self):
        return self._password_mask
   
    def set_validate(self,value):
        self._validate=value
    
    def get_validate(self):
        return self._validate
   
    def get_text(self):
        return self._text

    def set_text(self, value):
        self._text = utils.str_new(value)
        self._cursor_position=len(self._text)
        self._selection_start=self._cursor_position
        self._selection_end=self._cursor_position
        self.repaint()        
              
    def _blinktimer(self):
        self._blink=not self._blink
        self._repaint_cursor()
        self._blinkitm=_gdimap["sheduler"].add(0.5,self._blinktimer)        
    
    def on_focus_get(self,e):
        if e["mode"]=="KEYBOARD":
            self._selection_start=len(self._text)
            self._selection_end=len(self._text)
            self._cursor_position=self._selection_end
        self._blink=True
        self._repaint_text_area()
        self._blinkitm=_gdimap["sheduler"].add(0.5,self._blinktimer)
    
    def on_focus_lost(self,e):
        if self._blinkitm is not None:
            _gdimap["sheduler"].cancel(self._blinkitm)
        self._blinkitm=None
        if self._validate is not None:
            self._validate({"window":self._window, "source": self})
        self._selection_start=0
        self._selection_end=0
        self._blink=False
        self._repaint_text_area()
    
    def _get_cursor_pos_by_x(self,x):
        fontid=_gdimap["fontmanager"].get_id("default")
        x=x
        xi=2
        xf=2
        for i in range(len(self._text)):
            s=self._text[0:i]
            if len(s)!=0:
                xf = gdw_lib().DWAGDIGetTextWidth(self._window._id,fontid,s)+2-self._text_offx
                if x>=xi and x<=xf:
                    return i-1
                xi=xf
        if len(self._text)!=0:
            xf = gdw_lib().DWAGDIGetTextWidth(self._window._id,fontid,self._text)+2-self._text_offx
            if x>=xi and x<=xf:
                return len(self._text)-1
        return len(self._text)
    
    def _repaint_text_area(self):
        self.repaint_area(2, 2, self._w-4, self._h-4)
    
    def _repaint_cursor(self):
        if self._cursor_x!=-1:
            self.repaint_area(self._cursor_x-self._text_offx, 0, 1, self._h)
    
    def on_paint(self,pobj):
        #if self._window.get_mouse_enter_component()==self:
        #    pobj.pen_color("f8fbfd")
        #    pobj.fill_rectangle(x,y,w,h)
        #    if self._border is not None:
        #        self._border.on_paint(self,pobj)     
        #else:
        Component.on_paint(self, pobj)
        pobj.clip_rectangle(2,2,self._w-4,self._h-4)
        s = self._text
        if self._password_mask:
            s=u"*" * len(s)
        self._cursor_x = 2
        if s!=u"":
            wtx=pobj.get_text_width(s)
            #CALCOLA CURSORE
            self._cursor_x += pobj.get_text_width(s[0:self._cursor_position])
            if wtx>self._w-4:
                if self._cursor_x-self._text_offx>self._w-4:
                    self._text_offx=self._cursor_x-(self._w-4)+int(self._w/3)
                elif self._cursor_x-self._text_offx<2:
                    self._text_offx=self._cursor_x-int(self._w/3)
                if self._text_offx>(wtx+2)-(self._w-4):
                    self._text_offx=(wtx+2)-(self._w-4)
                if self._text_offx<0:
                    self._text_offx=0            
            else:
                self._text_offx=0
            #SELECTION
            if self._selection_end>self._selection_start:
                xstart=pobj.get_text_width(s[0:self._selection_start])
                xend=pobj.get_text_width(s[0:self._selection_end])
                pobj.pen_color(_STYLE_EDITOR_SELECTION_COLOR)
                pobj.fill_rectangle(2+xstart-self._text_offx,3,(xend-xstart),self._h-(2*3))
            #TESTO
            pobj.pen_color(self._foreground)
            ty=(self._h/2)-(pobj.get_text_height()/2)
            pobj.draw_text(s,2-self._text_offx,ty)
        else:
            self._text_offx=0
        if self._blink:
            pobj.pen_color(self._foreground)
            pobj.draw_line(self._cursor_x-self._text_offx,3,self._cursor_x-self._text_offx,self._h-4)
        pobj.clear_clip_rectangle()        
    
    def _on_keyboard_char(self,c,shift,ctrl,alt,meta):
        if self._selection_start!=self._selection_end:
            self._text=self._text[0:self._selection_start] + self._text[self._selection_end:]
            self._cursor_position=self._selection_start
        self._text=self._text[0:self._cursor_position] + utils.str_new(c) + self._text[self._cursor_position:]
        self._cursor_position+=len(utils.str_new(c))
        self._selection_start=self._cursor_position
        self._selection_end=self._cursor_position
        self._blink=True
        self._repaint_text_area()
        
    def _on_keyboard_key(self,c,shift,ctrl,alt,meta):
        if c=="BACKSPACE":
            if self._selection_start==self._selection_end: 
                if self._cursor_position>0:
                    self._text=self._text[0:self._cursor_position-1] + self._text[self._cursor_position:]
                    self._cursor_position-=1
            else:
                self._text=self._text[0:self._selection_start] + self._text[self._selection_end:]
                self._cursor_position=self._selection_start
            self._selection_start=self._cursor_position
            self._selection_end=self._cursor_position
            self._blink=True
            self._repaint_text_area()
        elif c=="DELETE":
            if self._selection_start==self._selection_end:
                if self._cursor_position<len(self._text):
                    self._text=self._text[0:self._cursor_position] + self._text[self._cursor_position+1:]
            else:
                self._text=self._text[0:self._selection_start] + self._text[self._selection_end:]
                self._cursor_position=self._selection_start
            self._selection_start=self._cursor_position
            self._selection_end=self._cursor_position
            self._blink=True
            self._repaint_text_area()
        elif c=="LEFT":
            if self._cursor_position>0:
                if shift and self._cursor_position==self._selection_start:
                    self._cursor_position-=1
                    self._selection_start=self._cursor_position
                elif shift and self._cursor_position==self._selection_end:
                    self._cursor_position-=1
                    self._selection_end=self._cursor_position
                else:
                    self._cursor_position-=1
                    self._selection_start=self._cursor_position
                    self._selection_end=self._cursor_position
            elif not shift :
                self._selection_start=self._cursor_position
                self._selection_end=self._cursor_position
            self._blink=True
            self._repaint_text_area()
        elif c=="RIGHT":
            if self._cursor_position<len(self._text):
                if shift and self._cursor_position==self._selection_end:
                    self._cursor_position+=1
                    self._selection_end=self._cursor_position
                elif shift and self._cursor_position==self._selection_start:
                    self._cursor_position+=1
                    self._selection_start=self._cursor_position
                else:
                    self._cursor_position+=1
                    self._selection_start=self._cursor_position
                    self._selection_end=self._cursor_position
            elif not shift :
                self._selection_start=self._cursor_position
                self._selection_end=self._cursor_position
            self._blink=True
            self._repaint_text_area()
        elif c=="HOME":
            if self._cursor_position>0:
                if shift and self._cursor_position==self._selection_start:
                    self._cursor_position=0
                    self._selection_start=0
                elif shift and self._cursor_position==self._selection_end:
                    self._cursor_position=0
                    self._selection_end=self._selection_start
                    self._selection_start=0                        
                else:
                    self._cursor_position=0
                    self._selection_start=self._cursor_position
                    self._selection_end=self._cursor_position
            elif not shift :
                self._selection_start=self._cursor_position
                self._selection_end=self._cursor_position
            self._blink=True
            self._repaint_text_area()
        elif c=="END":
            if self._cursor_position<len(self._text):
                if shift and self._cursor_position==self._selection_end:
                    self._cursor_position=len(self._text)
                    self._selection_end=self._cursor_position
                elif shift and self._cursor_position==self._selection_start:
                    self._cursor_position=len(self._text)
                    self._selection_start=self._selection_end
                    self._selection_end=self._cursor_position
                else:
                    self._cursor_position=len(self._text)
                    self._selection_start=self._cursor_position
                    self._selection_end=self._cursor_position
            elif not shift :
                self._selection_start=self._cursor_position
                self._selection_end=self._cursor_position
            self._blink=True
            self._repaint_text_area()

    def _on_keyboard_command(self,c,shift,ctrl,alt,meta):
        if c=="COPY":
            s=self._text[self._selection_start:self._selection_end]
            if len(s)>0:
                gdw_lib().DWAGDISetClipboardText(s)  
        elif c=="CUT":
            s=self._text[self._selection_start:self._selection_end]
            if len(s)>0:
                gdw_lib().DWAGDISetClipboardText(s) 
            self._on_keyboard_key("DELETE",shift,ctrl,alt,meta)
        elif c=="PASTE":
            s=gdw_lib().DWAGDIGetClipboardText()
            if len(s)>0:
                self._on_keyboard_char(s,shift,ctrl,alt,meta) 

    def on_keyboard(self,tp,c,shift,ctrl,alt,meta):
        Component.on_keyboard(self,tp,c,shift,ctrl,alt,meta)
        if tp=="CHAR":
            self._on_keyboard_char(c,shift,ctrl,alt,meta)
        elif tp=="KEY":
            self._on_keyboard_key(c,shift,ctrl,alt,meta)
        elif tp=="COMMAND":
            self._on_keyboard_command(c,shift,ctrl,alt,meta)
            
               
    def on_mouse(self,tp,x,y,b):
        Component.on_mouse(self, tp, x, y, b)
        if tp=="BUTTON_DOWN":
            self._cursor_position=self._get_cursor_pos_by_x(x)
            self._selection_start=self._cursor_position
            self._selection_end=self._cursor_position
            self._repaint_text_area()


                                                                                  ui/__init__.py                                                                                      0000644 0001750 0001750 00000000342 13422307023 013065  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-

'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''
                                                                                                                                                                                                                                                                                              utils.py                                                                                            0000755 0001750 0001750 00000037142 14140273611 012067  0                                                                                                    ustar   webdel                          webdel                                                                                                                                                                                                                 # -*- coding: utf-8 -*-
'''
This Source Code Form is subject to the terms of the Mozilla
Public License, v. 2.0. If a copy of the MPL was not distributed
with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
'''

import sys
import os
import shutil
import codecs
import subprocess
import zipfile
import platform
import traceback
import time
import ctypes
import threading
import logging.handlers
import zlib
import base64

path_sep=os.sep
line_sep=os.linesep

_biswindows=(platform.system().lower().find("window") > -1)
_bislinux=(platform.system().lower().find("linux") > -1)
_bismac=(platform.system().lower().find("darwin") > -1)


def is_py2():
    return sys.version_info[0]==2

if is_py2():    
    import Queue
    import BaseHTTPServer
    import urllib
    import urlparse
    try:
        import cStringIO
        BytesIO = cStringIO.StringIO
    except ImportError:
        import StringIO
        BytesIO = StringIO.StringIO    
    try:
        import cPickle
        Pickler = cPickle.Pickler
        Unpickler = cPickle.Unpickler
    except ImportError:
        import pickle 
        Pickler = pickle.Pickler
        Unpickler = pickle.Unpickler    
    Queue = Queue.Queue
    HTTPServer = BaseHTTPServer.HTTPServer
    BaseHTTPRequestHandler = BaseHTTPServer.BaseHTTPRequestHandler
    nrange=xrange
    sys_maxsize=sys.maxint
    os_getcwd=os.getcwdu        
else:
    import queue
    import http.server
    import urllib
    import io
    import pickle 
    BytesIO = io.BytesIO    
    Pickler = pickle.Pickler
    Unpickler = pickle.Unpickler        
    Queue = queue.Queue
    HTTPServer = http.server.HTTPServer
    BaseHTTPRequestHandler = http.server.BaseHTTPRequestHandler    
    nrange=range
    sys_maxsize=sys.maxsize
    os_getcwd=os.getcwd



def is_windows():
    return _biswindows

def is_linux():
    return _bislinux

def is_mac():
    return _bismac

def exception_to_string(e):
    bamsg=False;
    try:
        if len(e.message)>0:
            bamsg=True;
    except:
        None
    try:
        appmsg=None
        if bamsg:
            appmsg=str_new(e.message)
        else:
            appmsg=str_new(e)
        return appmsg
    except:
        return u"Unexpected error."
    
def get_stacktrace_string():
    try:
        s = traceback.format_exc();
        if s is None:
            return u""
        else:
            return str_new(s)
    except:
        return u"Unexpected error (get_stacktrace_string)."

def get_exception_string(e, tx=u""):
    msg = str_new(tx)
    msg += exception_to_string(e)
    msg += u"\n" + get_stacktrace_string()
    #msg += e.__class__.__name__
    #if e.args is not None and len(e.args)>0 and e.args[0] != '':
    #        msg = e.args[0]
    return msg

def get_exception():
    try:
        ar = sys.exc_info()
        if len(ar)>1 and sys.exc_info()[1] is not None:
            return sys.exc_info()[1]
        else:
            return sys.exc_info()[0]
    except:
        return Exception("Unexpected error (get_exception).")


if is_windows():
    if is_py2():
        get_time=time.clock        
    else:
        get_time=time.perf_counter
else:
    get_time=time.time

def unload_package(pknm):
    mdtorem=[]
    for nm in sys.modules:
        if nm.startswith(pknm):
            mdtorem.append(nm)
    for nm in mdtorem:
        del sys.modules[nm]

def convert_bytes_to_structure(st, byte):
    ctypes.memmove(ctypes.addressof(st), byte, ctypes.sizeof(st))

def convert_struct_to_bytes(st):
    bf = ctypes.create_string_buffer(ctypes.sizeof(st))
    ctypes.memmove(bf, ctypes.addressof(st), ctypes.sizeof(st))
    return bf.raw

##########
# BUFFER #
##########
if is_py2():
    buffer_new=lambda o, p, l: buffer(o,p,l)        
else:
    buffer_new=lambda o, p, l: memoryview(o)[p:p+l]    


#########
# BYTES #
#########
if is_py2():    
    bytes_new=str
    bytes_join=lambda ar: "".join(ar)
    bytes_get=lambda b, i: ord(b[i])
    bytes_to_str_hex=lambda s: s.encode('hex')            
else:
    bytes_new=bytes
    bytes_join=lambda ar: b"".join(ar)
    bytes_get=lambda b, i: b[i]
    bytes_to_str_hex=bytes.hex
bytes_to_str=lambda b, enc="ascii": b.decode(enc, errors="replace")


#######
# STR #
#######
if is_py2():
    def _py2_str_new(o):
        if isinstance(o, unicode):
            return o 
        elif isinstance(o, str):
            return o.decode("utf8", errors="replace")
        else:
            return str(o).decode("utf8", errors="replace")
    str_new=_py2_str_new
    str_is_unicode=lambda s: isinstance(s, unicode) #TO REMOVE
    str_hex_to_bytes=lambda s: s.decode('hex')
else:
    str_new=str
    str_is_unicode=lambda s: isinstance(s, str) #TO REMOVE
    str_hex_to_bytes=bytes.fromhex
str_to_bytes=lambda s, enc="ascii": s.encode(enc, errors="replace")

#######
# URL #
#######
if is_py2():    
    url_parse=urlparse.urlparse
    url_parse_quote_plus=urllib.quote_plus
    url_parse_quote=urllib.quote
    url_parse_qs=urlparse.parse_qs        
else:    
    url_parse=urllib.parse.urlparse
    url_parse_quote_plus=urllib.parse.quote_plus
    url_parse_quote=urllib.parse.quote
    url_parse_qs=urllib.parse.parse_qs
    

##############
# FILESYSTEM #
##############
def _path_fix(pth):
    if not is_py2() or not is_linux() or isinstance(pth, str):
        return pth
    else:
        return pth.encode('utf-8')
            
def path_exists(pth):
    return os.path.exists(_path_fix(pth))

def path_isdir(pth):
    return os.path.isdir(_path_fix(pth))

def path_isfile(pth):
    return os.path.isfile(_path_fix(pth))

def path_makedirs(pth):
    os.makedirs(_path_fix(pth))

def path_makedir(pth):
    os.mkdir(_path_fix(pth))

def path_remove(pth):
    apppt=_path_fix(pth)
    if os.path.isdir(apppt):
        shutil.rmtree(apppt)
    else:
        os.remove(apppt)        

def path_list(pth):
    return os.listdir(_path_fix(pth))

def path_walk(pth):
    return os.walk(_path_fix(pth))

def path_islink(pth):    
    return os.path.islink(_path_fix(pth))
          
def path_readlink(pth):        
    return os.readlink(_path_fix(pth))

def path_symlink(pths,pthd):
    os.symlink(_path_fix(pths), _path_fix(pthd))

def path_copy(pths,pthd):
    shutil.copy2(_path_fix(pths), _path_fix(pthd))
    
def path_move(pths,pthd):
    shutil.move(_path_fix(pths), _path_fix(pthd))

def path_rename(pths,pthd):
    os.rename(_path_fix(pths), _path_fix(pthd))

def path_change_permissions(pth, prms):
    os.chmod(_path_fix(pth),  prms)

def path_change_owner(pth, uid, gid):
    os.chown(_path_fix(pth), uid, gid)

def path_dirname(pth):
    return os.path.dirname(pth)

def path_basename(pth):
    return os.path.basename(pth)

def path_absname(pth):
    return os.path.abspath(pth)

def path_realname(pth):
    return os.path.realpath(pth)

def path_expanduser(pth):
    return os.path.expanduser(pth)

def path_size(pth):
    return os.path.getsize(_path_fix(pth))

def path_time(pth):
    return os.path.getmtime(_path_fix(pth))

def path_stat(pth):
    return os.stat(_path_fix(pth))

########
# FILE #
########
if is_py2():
    def file_open(filename, mode='rb', encoding=None, errors='strict', buffering=1):
        return codecs.open(_path_fix(filename), mode, encoding, errors, buffering)
else:
    def file_open(filename, mode='r', encoding=None, errors='strict', buffering=-1):
        return codecs.open(_path_fix(filename), mode, encoding, errors, buffering)

##########
# SYSTEM #
##########
def system_changedir(pth):
    os.chdir(_path_fix(pth))

def system_call(*popenargs, **kwargs):
    lst = list(popenargs)
    for i in range(len(lst)):
        lst[i]=_path_fix(popenargs[i])
    return subprocess.call(*lst,**kwargs)


###########
# ENCODER #
###########
if is_py2():    
    enc_base64_encode=lambda b: base64.b64encode(buffer(b))
    enc_base64_decode=lambda b: base64.b64decode(buffer(b))    
else:
    enc_base64_encode=lambda b: base64.b64encode(b)
    enc_base64_decode=lambda b: base64.b64decode(b)
    

############
# COMPRESS #
############
def zipfile_open(filename, mode="r", compression=zipfile.ZIP_STORED, allowZip64=False):
    return zipfile.ZipFile(_path_fix(filename),mode, compression, allowZip64)

if is_py2():    
    zlib_decompress=lambda b: zlib.decompress(buffer(b))
    zlib_compress=lambda b: zlib.compress(buffer(b))
else:
    zlib_decompress=lambda b: zlib.decompress(b)
    zlib_compress=lambda b: zlib.compress(b)


##########
# SOCKET #
##########
def socket_sendall(sock, bts):
    count = 0
    amount = len(bts)
    v = sock.send(bts)
    count += v
    while (count < amount):
        v = sock.send(buffer_new(bts,count,amount-count))
        count += v


LOGGER_INFO=logging.INFO
LOGGER_WARN=logging.WARN
LOGGER_CRITICAL=logging.CRITICAL
LOGGER_FATAL=logging.FATAL
LOGGER_DEBUG=logging.DEBUG
LOGGER_ERROR=logging.ERROR

class LoggerStdRedirect(object):
    
    def __init__(self,lg,lv):
        self._logger = lg;
        self._level = lv;
        
    def write(self, data):
        for line in data.rstrip().splitlines():
            self._logger.log(self._level, line.rstrip())
    
    def flush(self):
        None


class Logger():
    
    def __init__(self, conf):
        self._logger = logging.getLogger()
        if "filename" in conf:
            hdlr = logging.handlers.RotatingFileHandler(conf["filename"], 'a', 1000000, 3)
        else:
            hdlr = logging.StreamHandler()
        formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
        hdlr.setFormatter(formatter)
        self._logger.addHandler(hdlr) 
        self._logger.setLevel(logging.INFO)
        #Reindirizza stdout e stderr
        sys.stdout=LoggerStdRedirect(self._logger,logging.DEBUG)
        sys.stderr=LoggerStdRedirect(self._logger,logging.ERROR)
        self._lock = threading.Lock()

    def set_level(self, lv):
        self._logger.setLevel(lv)
    
    def write(self, lv, msg):
        self._lock.acquire()
        try:
            ar = []
            ar.append(str_new(threading.current_thread().name))
            ar.append(str_new(u" "))
            ar.append(str_new(msg))
            self._logger.log(lv, u"".join(ar))
        except:
            e=get_exception()
            print(utils.exception_to_string(e))
        finally:
            self._lock.release()

class DebugProfile():

    def __init__(self, writeobj, conf):
        self._write_obj=writeobj
        self._debug_path = conf["debug_path"]
        self._debug_indentation_max=conf["debug_indentation_max"]
        self._debug_thread_filter=conf["debug_thread_filter"]
        self._debug_class_filter=conf["debug_class_filter"]
        self._debug_info = {}
    
    def _trunc_msg(self, msg, sz):
        smsg="None"
        if msg is not None:
            smsg=u""
            try:
                smsg = str_new(msg)
            except:
                e = get_exception()
                smsg = u"EXCEPTION:" + exception_to_string(e)
            if len(smsg)>sz:
                smsg=smsg[0:sz] + u" ..."
            smsg = smsg.replace("\n", " ").replace("\r", " ").replace("\t", "   ")
        return smsg
    
    def _filter_check(self,nm,flt):
        if flt is not None:
            ar = flt.split(";")
            for f in ar:
                if f.startswith("*") and nm.endswith(f[1:]):
                    return True
                elif f.endswith("*") and nm.startswith(f[0:len(f)-1]):
                    return True
                elif nm==f:
                    return True
            return False
        return False
    
    def get_function(self, frame, event, arg): 
        #sys._getframe(0)
        if event == "call" or event == "return":
            try:
                bshow = True
                fcode = frame.f_code
                flocs = frame.f_locals
                fn = path_absname(str_new(fcode.co_filename))
                if not fcode.co_name.startswith("<") and fn.startswith(self._debug_path):
                    fn = fn[len(self._debug_path):]
                    fn = fn.split(".")[0]
                    fn = fn.replace(path_sep,".")
                    nm = fcode.co_name
                    if flocs is not None and "self" in flocs:
                        flocssf=flocs["self"]
                        nm = flocssf.__class__.__name__ + "." +nm
                    nm=fn + u"." + nm
                    thdn = threading.current_thread().name
                    if thdn not in self._debug_info:
                        self._debug_info[thdn]={}
                        self._debug_info[thdn]["time"]=[]
                        self._debug_info[thdn]["indent"]=0
                    debug_time=self._debug_info[thdn]["time"]
                    debug_indent=self._debug_info[thdn]["indent"]
                    bshow=self._debug_indentation_max==-1 or debug_indent<=self._debug_indentation_max
                    #THREAD NAME
                    if bshow:
                        bshow=self._filter_check(thdn, self._debug_thread_filter)
                    #CLASS NAME
                    if bshow:
                        bshow=self._filter_check(nm, self._debug_class_filter)
                    #VISUALIZZA
                    if bshow:
                        if event == "return":
                            debug_indent -= 1
                        soper=""
                        arpp = []
                        if event == "call":
                            soper="INIT"
                            debug_time.append(int(time.time() * 1000))
                            if flocs is not None:
                                sarg=[]
                                for k in flocs:
                                    if not k == "self":
                                        sarg.append(str_new(k) + u"=" + self._trunc_msg(flocs[k], 20))
                                if len(sarg)>0:
                                    arpp.append(u"args: " + u",".join(sarg))
                            
                        elif event == "return":
                            soper="TERM"
                            tm = debug_time.pop()
                            arpp.append(u"time: " + str(int(time.time() * 1000) - tm) + u" ms")
                            arpp.append(u"return: " + self._trunc_msg(arg, 80))
                                
                        armsg=[]
                        armsg.append(u"   "*debug_indent + nm + u" > " + soper)
                        if len(arpp)>0:
                            armsg.append(u" ")
                            armsg.append(u"; ".join(arpp))
                        self._write_obj.write_debug(u"".join(armsg))
                        if event == "call":
                            debug_indent += 1
                        self._debug_info[thdn]["indent"]=debug_indent
            except:
                e = get_exception()
                self._write_obj.write_except(e)


class Counter:
    
    def __init__(self, v=None):
        self._current_elapsed = 0
        self._current_time = get_time()
        self._time_to_elapsed=v
        self._stopped=False

    def start(self):
        if self._stopped:
            self._current_time = get_time()
            self._stopped=False
    
    def stop(self):
        if not self._stopped:
            self._stopped=True

    def reset(self):
        self._current_elapsed = 0
        self._current_time = get_time()
    
    def is_elapsed(self, v=None):
        if v is None:
            v=self._time_to_elapsed
        return self.get_value()>=v
   
    def get_value(self):
        if self._stopped:
            return self._current_elapsed
        apptm=get_time()
        elp=apptm-self._current_time
        if elp>=0:
            self._current_elapsed+=elp
            self._current_time=apptm
        else:
            self._current_time=get_time()
        #print("self._current_elapsed(" + str(self) + "): " +  str(self._current_elapsed))
        return self._current_elapsed




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              