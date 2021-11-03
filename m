Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 824D3443DF3
	for <lists+openrisc@lfdr.de>; Wed,  3 Nov 2021 09:02:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2320324253;
	Wed,  3 Nov 2021 09:02:57 +0100 (CET)
Received: from mail-out-4.itc.rwth-aachen.de (mail-out-4.itc.rwth-aachen.de
 [134.130.5.49])
 by mail.librecores.org (Postfix) with ESMTPS id E1F862423E
 for <openrisc@lists.librecores.org>; Wed,  3 Nov 2021 09:02:55 +0100 (CET)
X-IPAS-Result: =?us-ascii?q?A2BDAABhQYJh/50agoZaHAEBAQEBAQcBARIBAQQEAQGCB?=
 =?us-ascii?q?gYBAQsBgVGBTywsaoRHjmyCJQOcJIF8CwEBAQEBAQEBAQQEATcIAgQBAYUCA?=
 =?us-ascii?q?oJTAiU1CA4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQUEgSSFLzkNhkMBB?=
 =?us-ascii?q?SMEUhALDgoqAgICVQYNAQcBAYJtAYJ3EAEOrWN/MoEBiBWBUwoGCQGBMAGBE?=
 =?us-ascii?q?kGMQyeBZUSBFScMgnc+gkwXBBiBXYMBgmUEkCcgAl4gYkYvoB+cd4EkB4ILg?=
 =?us-ascii?q?SyFSIMNgXaUGQZBg2ySBpE2lg6CQIo0iyGNbAIEAgQFAhaBYwGCEU0kgzlQF?=
 =?us-ascii?q?wIPjiwWg1CFFIVLQTICAQE0AgYLAQEDCYVqi0EBAQ?=
IronPort-Data: A9a23:OWQ8maLnr79TPVtyFE+RY5clxSXFcZb7ZxGr2PjKsXjdYENShjEPz
 WRNCm2EPv+DYjTyL49ybI/i/RtS7ZOEytQyTwUd+CA2RRqmiyZk6fexcx2sZXPCdqUvaGo9s
 q3yv/GZdJhcokf0/0vrav64xZVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Yz2YLR7z6l4
 LseneWOYDdJ5BYpagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9DrkevlpDOJp3/BPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XOdJEAXq7hQllkPho4
 c1N7J+cFzsTI/3ghtQYWBhWCTpXaPguFL/veRBTsOSJ0FHGfmup3KwrBgcsIpEYv+97R21Dn
 RAaAGlWMlba3Lrwmuz9E7Qz7iggBJCD0Ic3mHhmiw7UDPA9XZfIQI3Q+sNYmT45jcBDG7DSa
 qL1bBI2NkqfP00Vagl/5JQWm86OgWnuNA1itWmIiocNwGvq4Vc26e24WDbSUpnQLSlPpW6Dp
 mXc+WnRDRQTNdjZwj2AmlqrnuLJhyLgU6oWFaak7bhugVeJy2cUEhANE1yhrpGEZlWWQc1DK
 0EEvzV36KJ07lO3Tpz0U1u0rRZooyIhZjaZKMVigCnl90Yey1zx6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:D7239KDAw3j6d/blHekz55DYdb4zR+YMi2TDgXoBMiC9E/bo5v
 xG88506faZslcssF9Jo6HlBECrewK4yXcN2/hqAV7AZniZhILLFvAA0WK4+UyYJ8SWzIc0vp
 uIFZIfNDSaNzRHZLPBkXWF+qEbsaS6Gc6T6Ns3/x1WJz2CQpsQlztRO0KwFFFsXgUDJZdRLu
 v62uN34xCnZW8MYoCdDn0INtKzweEj7KiWAyIuNloC7g+CiD/tzqX7HRie1gofVD0K+7048X
 HZ+jaJmZlKZZmApSPh6w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.87,205,1631570400"; 
 d="p7s'?scan'208";a="126748286"
Received: from rwthex-w1-b.rwth-ad.de ([134.130.26.157])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 03 Nov 2021 09:02:56 +0100
Received: from [IPV6:2a02:908:1083:25c0:9518:4445:d8a:38c6]
 (2a02:908:1083:25c0:9518:4445:d8a:38c6) by rwthex-w1-b.rwth-ad.de
 (2a00:8a60:1:e500::26:157) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.14; Wed, 3 Nov 2021
 09:02:55 +0100
Message-ID: <a29b15d7-3e8a-4851-8175-66fa805f4dff@rwth-aachen.de>
Date: Wed, 3 Nov 2021 09:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <e35018e8-a15b-550d-cc3e-6b6d045f1b52@rwth-aachen.de>
 <YX8O0ix3MyOGQnqq@antec>
From: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
In-Reply-To: <YX8O0ix3MyOGQnqq@antec>
X-Originating-IP: [2a02:908:1083:25c0:9518:4445:d8a:38c6]
X-ClientProxiedBy: rwthex-w2-b.rwth-ad.de (2a00:8a60:1:e500::26:159) To
 rwthex-w1-b.rwth-ad.de (2a00:8a60:1:e500::26:157)
Subject: Re: [OpenRISC] OpenRISC SMP kernels broken after 5.8?
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
Cc: openrisc@lists.librecores.org
Content-Type: multipart/mixed; boundary="===============8000650124204016240=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============8000650124204016240==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms060502010401050204070807"

--------------ms060502010401050204070807
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stafford,

your patch has fixed the issue for me. I tested this with a 5.10 kernel 
on single-, dual- and quad- Openriscs in my simulator and it ran stable.

However, are we sure we caught everything? For example, I see the same 
issue in flush_tlb_page [1], which can also have vma == NULL in the 
page_[set|clear]_nocache functions [2]. It does not trigger a panic for 
me though (probably because I do not have any DMA devices in the 
simulator at the moment)...

Jan

[1] 
https://elixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/kernel/smp.c#L304
[2] 
https://elixir.bootlin.com/linux/v5.10.76/source/arch/openrisc/kernel/dma.c#L36

On 31/10/2021 22:46, Stafford Horne wrote:
> On Tue, Oct 26, 2021 at 10:43:45PM +0200, Jan Henrik Weinstock wrote:
>> Hi all,
>>
>> I recently tried to update the kernel my simulator[1] is running to 5.10,
>> but I noticed the newer kernels (>5.8) all panic in flush_tlb_page[2],
>> because it is called with vma == NULL from flush_tlb_kernel_range[3].
>> Looking at the code, I do not see how this could work for any SMP kernel
>> (however, for non-SMP, we call local_tlb_flush_page[4], where we do not use
>> vma, so I guess its fine there). Any ideas?
> 
> Hi Jan,
> 
> (sorry for late reply, I need to fix my filters)
> 
> Are you running on a SMP machine or are you running SMP kernel on a single CPU
> with no ompic device?
> 
> I haven't had issues when running the SMP kernels on single CPU devices,
> however, I can't recall how recent that is.
> 
> I did make a patch to this around 5.10, so I am pretty user it was working at
> this point.  The reason added this patch was because I noticed simulators were
> spending a lot of time, ~90%+, in TLB flushes I figured that reducing the work
> done for TLB flushes would improve performance, and it did.
> 
> The patch:
> 
>   - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=c28b27416da9
> 
> But it looks like this is what introduced the issue.  Somehow this slipped
> through.  I think a patch like the following would help for now, I cannot easily
> test now due to my environment being occupied by some long running tests.  Any
> suggestions?
> 
> Basically the idea is, we only need the VMA to figure out which CPU's to flush
> the range on.  When we pass in NULL it means its a kernel flush and we should
> flush on all CPU's.  There may be something more efficient (maybe using
> init_mm), but this is all I can think of that is safe.
> 
> -Stafford
> 
> diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> index 415e209732a3..cf5079bd8f43 100644
> --- a/arch/openrisc/kernel/smp.c
> +++ b/arch/openrisc/kernel/smp.c
> @@ -320,7 +320,9 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned
> long uaddr)
>   void flush_tlb_range(struct vm_area_struct *vma,
>                       unsigned long start, unsigned long end)
>   {
> -       smp_flush_tlb_range(mm_cpumask(vma->vm_mm), start, end);
> +       struct cpumask *cmask = (vma == NULL) ? cpu_online_mask
> +                                             : mm_cpumask(vma->vm_mm);
> +       smp_flush_tlb_range(cmask, start, end);
>   }
>   
>   /* Instruction cache invalidate - performed on each cpu */
> 

--------------ms060502010401050204070807
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
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTExMDMwODAyNTJaMC8GCSqGSIb3DQEJBDEiBCAz
jbYU/xuqKpcf8kjxbLcfo4+dCiG4U1hIWZqaSCi2wTBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCG
SAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGvBgkrBgEEAYI3EAQxgaEwgZ4w
gY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMg
RGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAj
BgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0ECDCEoTgORemtLz5CRZTCBsQYL
KoZIhvcNAQkQAgsxgaGggZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVy
IEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAO
BgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0EC
DCEoTgORemtLz5CRZTANBgkqhkiG9w0BAQEFAASCAQCQgX+dXfrhAXNRfkknRwcTBunJPSGS
26x7XFp1Fs17SpQk/SZVv2UZA3q2QygoxmdqSfPNeLBWqvEHJ8MG59H7P5PB9iGPEVmNljwH
wE7SyLvCRcroFo8nsz41lQDkzXxWEktQMTh+zvcrblKAADVSwqgU3iEkHMNhvR/kiVgfNqSP
c2saw7TA3Reda+ujjFUYjDy77s1Gj1qhPH9duiRY/K9lSUF1wJA6/sPOutTLmQE/5GghM/fo
7TxYGmTZDdbk2xIkqjt/ReZJrSTJchGV5xeoTjiv+Lb/2z/l5vNAGV3TxAF3O/Ngbof2MYE1
FbZBO/D3MMJuJkNg464O7STSAAAAAAAA
--------------ms060502010401050204070807--

--===============8000650124204016240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============8000650124204016240==--
