Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0889E30A6D0
	for <lists+openrisc@lfdr.de>; Mon,  1 Feb 2021 12:49:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8E0542110A;
	Mon,  1 Feb 2021 12:49:34 +0100 (CET)
Received: from mail-out-3.itc.rwth-aachen.de (mail-out-3.itc.rwth-aachen.de
 [134.130.5.48])
 by mail.librecores.org (Postfix) with ESMTPS id 23B55210DB
 for <openrisc@lists.librecores.org>; Mon,  1 Feb 2021 12:49:32 +0100 (CET)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BOBgCJ6Rdg/5oagoZiHAEBAQEBAQcBA?=
 =?us-ascii?q?RIBAQQEAQGCD4FTgXosZYRAkSkInGsLAQEBAQEBAQEBBAQBLQIEAQGESgKBeAI?=
 =?us-ascii?q?lOBMCEAEBBgEBAQEBBgSGX4V0BiMEUhAZNAICAlUGAQwBBQIBAYMiAYJ3DwGwN?=
 =?us-ascii?q?H8zhVmDOYE0EAkBgS6BU4trJoFcP4E4DIMkh1eCYASCRy1hknKoaweBaIERhGK?=
 =?us-ascii?q?CapQlBSmTJY9uhiuNf5U8h2aERQICAgIJAhaBbYF6TSRcCYJTUBcCDY4tF44nQ?=
 =?us-ascii?q?TI3AgYKAQEDCXyLGQEB?=
X-IPAS-Result: =?us-ascii?q?A2BOBgCJ6Rdg/5oagoZiHAEBAQEBAQcBARIBAQQEAQGCD4F?=
 =?us-ascii?q?TgXosZYRAkSkInGsLAQEBAQEBAQEBBAQBLQIEAQGESgKBeAIlOBMCEAEBBgEBA?=
 =?us-ascii?q?QEBBgSGX4V0BiMEUhAZNAICAlUGAQwBBQIBAYMiAYJ3DwGwNH8zhVmDOYE0EAk?=
 =?us-ascii?q?BgS6BU4trJoFcP4E4DIMkh1eCYASCRy1hknKoaweBaIERhGKCapQlBSmTJY9uh?=
 =?us-ascii?q?iuNf5U8h2aERQICAgIJAhaBbYF6TSRcCYJTUBcCDY4tF44nQTI3AgYKAQEDCXy?=
 =?us-ascii?q?LGQEB?=
X-IronPort-AV: E=Sophos;i="5.79,392,1602540000"; 
 d="p7s'?scan'208";a="112497872"
Received: from rwthex-s2-a.rwth-ad.de ([134.130.26.154])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 01 Feb 2021 12:49:32 +0100
Received: from [IPv6:2a02:908:1089:e060:bd31:5e5a:6687:b1da]
 (2a02:908:1089:e060:bd31:5e5a:6687:b1da) by rwthex-s2-a.rwth-ad.de
 (2a00:8a60:1:e500::26:154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2044.4; Mon, 1 Feb
 2021 12:49:30 +0100
To: Stafford Horne <shorne@gmail.com>, <geert@linux-m68k.org>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
 <20210131212752.GG2002709@lianli.shorne-pla.net>
From: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
Date: Mon, 1 Feb 2021 12:49:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131212752.GG2002709@lianli.shorne-pla.net>
X-Originating-IP: [2a02:908:1089:e060:bd31:5e5a:6687:b1da]
X-ClientProxiedBy: rwthex-s3-a.rwth-ad.de (2a00:8a60:1:e500::26:160) To
 rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154)
Subject: [OpenRISC] [PATCH v2] openrisc: use device tree to determine
 present cpus
X-BeenThere: openrisc@lists.librecores.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Discussion around the OpenRISC processor
 <openrisc.lists.librecores.org>
List-Unsubscribe: <https://lists.librecores.org/options/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=unsubscribe>
List-Archive: <http://lists.librecores.org/pipermail/openrisc/>
List-Post: <mailto:openrisc@lists.librecores.org>
List-Help: <mailto:openrisc-request@lists.librecores.org?subject=help>
List-Subscribe: <https://lists.librecores.org/listinfo/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=subscribe>
Cc: jonas@southpole.se, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4482087065847853664=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============4482087065847853664==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms030704010500020205010403"

--------------ms030704010500020205010403
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Use the device tree to determine the present cpus instead of assuming=20
all CONFIG_NRCPUS are actually present in the system.

Signed-off-by: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
---
Changes since v1:
  1. use for_each_of_cpu_node
  2. possible_cpus is now what is in the devicetree, up to NR_CPUS
  3. present_cpus is now all possible cpus, up to max_cpus

  arch/openrisc/kernel/smp.c | 31 +++++++++++++++----------------
  1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index 75be7e34f..83cbf43d4 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -61,32 +61,31 @@ void __init smp_prepare_boot_cpu(void)

  void __init smp_init_cpus(void)
  {
-	int i;
+	struct device_node* cpu;
+	u32 cpu_id;
+
+	for_each_of_cpu_node(cpu) {
+		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
+			pr_warn("%s missing reg property", cpu->full_name);
+			continue;
+		}

-	for (i =3D 0; i < NR_CPUS; i++)
-		set_cpu_possible(i, true);
+		if (cpu_id < NR_CPUS)
+			set_cpu_possible(cpu_id, true);
+	}
  }

  void __init smp_prepare_cpus(unsigned int max_cpus)
  {
-	u32 cpu_id;
-	struct device_node *cpu, *cpus;
+	unsigned int cpu;

  	/*
  	 * Initialise the present map, which describes the set of CPUs
  	 * actually populated at the present time.
  	 */
-	cpus =3D of_find_node_by_path("/cpus");
-	for_each_child_of_node(cpus, cpu) {
-		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
-			pr_warn("%s missing reg property", cpu->full_name);
-			continue;
-		}
-
-		if (cpu_id >=3D max_cpus)
-			continue;
-
-		set_cpu_present(cpu_id, true);
+	for_each_possible_cpu(cpu) {
+		if (cpu < max_cpus)
+			set_cpu_present(cpu, true);
  	}
  }

--=20
2.17.1


--------------ms030704010500020205010403
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EHcwggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIFrTCCBJWgAwIBAgIMIShOA5F6a0vPkJFlMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE5MDYxODExNTIyNVoXDTIyMDYx
NzExNTIyNVowQjELMAkGA1UEBhMCREUxFDASBgNVBAoMC1JXVEggQWFjaGVuMR0wGwYDVQQD
DBRKYW4gSGVucmlrIFdlaW5zdG9jazCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ALqTMZkiwS7HcKorhnCtWkSdYBssMOoeRrqS/U72ixGRWRduFz9hySdkSdM4tQs5b0ZHWZPR
x4Ts/URAtPrJtcYhdGG2zsknDxlweFxKg2tJW3tVLnZw3Y3517ruQG3f09/uzJ8lobaQp9N5
exa1l1vYZbD6cricWaX4k4J8pyPERZ6Ntt70Mse2g2+fb6y2nvEGVqt088dRRgacmd7zrpug
fWgnPYxM3jGU4pJPQzXzPwNrm5i831dCo1HZNNy+iVNjgpZWd3mPKS6eeaPMKbStXTlvvGuu
8u7FpRSHnAB6NwejMIVl26eqdMyYI6F98jPpH1mOHuxxopnspYor3FkCAwEAAaOCAlUwggJR
MD4GA1UdIAQ3MDUwDwYNKwYBBAGBrSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEEBDAQBg4rBgEE
AYGtIYIsAgEEBDAJBgNVHRMEAjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEF
BQcDAgYIKwYBBQUHAwQwHQYDVR0OBBYEFB/z05wtpKDoxT7kc83Swux9Ked/MB8GA1UdIwQY
MBaAFGs6mIv58lOJ2uCtsjIeCR/oqjt0MCcGA1UdEQQgMB6BHGphbi53ZWluc3RvY2tAcnd0
aC1hYWNoZW4uZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0cDovL2NkcDEucGNhLmRmbi5k
ZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3JsMD+gPaA7hjlodHRwOi8vY2Rw
Mi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwgdsGCCsG
AQUFBwEBBIHOMIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1At
U2VydmVyL09DU1AwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNh
LWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUHMAKGPWh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQw
DQYJKoZIhvcNAQELBQADggEBAGGcNvUO+7oXmyLDG8sYt3zyJTC9xvPyVwvCgEnHjwIvnPB2
hqRMpzRqQ3O8vquhuCLcBD20k8EoPEF1fagZQGzrzMJxgCSUnoJpJtv6M0azpPubHh9I9Geb
h8HBM+8IgDCJjMvWQcl3TLfvzXS9e7W3+lx7+L8sNOlxu+cF/IS7IYrEcMNr/4VOVNemX5E2
12rDntadEl+tVqlh42CEM6bMnaWYV0sjj+e3XLvXajaDSohHUwOFX3KtaRfgMbDY0LkergyG
uVPtU5NAzknRB4fh8/Yo6qNsmyEmZ8DpLFBgUwgEbK3NteTTNWvCnPPIMOoHjDNfDaQ+9rMI
CXtOvVkxggQLMIIEBwIBATCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6
dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQ
MA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBD
QQIMIShOA5F6a0vPkJFlMA0GCWCGSAFlAwQCAQUAoIICPTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMDExMTQ5MzFaMC8GCSqGSIb3DQEJBDEiBCCj
dWPuD7wZrKCY0FGu2lCrbLdm1M98JMF9DgH5n7yUXTBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCG
SAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGvBgkrBgEEAYI3EAQxgaEwgZ4w
gY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMg
RGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAj
BgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0ECDCEoTgORemtLz5CRZTCBsQYL
KoZIhvcNAQkQAgsxgaGggZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVy
IEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAO
BgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0EC
DCEoTgORemtLz5CRZTANBgkqhkiG9w0BAQEFAASCAQCw8D/OQbK99tVcmCeazPLX6jRH9a62
krhwJ+ODXXQkC4hdL5PsTVCaF3z6TcRzXp9479ipvOLhLuG9NCOZsX+1fXnmFdsFPeXsHgAW
B+dhtJiYtSPFzFss5759peBfr12DjtQujXcyoeLS8e6x7FRBnZmz49+s34NT6l8QS9Px2GQT
AStEdUZnK46N/vbLLRbYrxpa+enMZvnrsBYb0DnhyOSQsNF/YsEVhX9ui4+yDJrhYdfPBj18
TJvDhc1TDeJh5+dI+JguDwZOWPmvwH1SDZzS5aY/UTJIWD0ByCO8xPP3q8GYpNBQBe/vUxsG
8Q/3mEfri/GfIZJPpvhJpkyBAAAAAAAA
--------------ms030704010500020205010403--

--===============4482087065847853664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4482087065847853664==--
