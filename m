Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C903844F0FD
	for <lists+openrisc@lfdr.de>; Sat, 13 Nov 2021 04:17:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A7BD2242C5;
	Sat, 13 Nov 2021 04:17:18 +0100 (CET)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id BCD2E242B2
 for <openrisc@lists.librecores.org>; Sat, 13 Nov 2021 04:17:16 +0100 (CET)
Received: by mail-pl1-f182.google.com with SMTP id t21so9917289plr.6
 for <openrisc@lists.librecores.org>; Fri, 12 Nov 2021 19:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lp/cyDN4SicCkpOFPMMKmTyfm8hXuGkuPIKhwy32S4c=;
 b=NKS4pLCxhVSAFTuemxa42jSxmaQwQTzcbNfxPzbXZIKWRg4+MnVBbGn0Rt2HOXYi8/
 02AWZCFTUO3lPv81Z8qiLr+9Cg8d6ZMpX0iGACoTF4hfiygNdMbA+LXy4Znuf7PAK1PX
 QOEJVFpDEvmMzJhcMNPg0i4cRjZT+yxFC7FGTcBBn6TdqpmSoRLQzy44QnR5yJv4kE8X
 ZWzQAudMO/SNMUw9vj/lL1Ob9KtIfS//oz6XDSNmwjIfXES4pVpdQ3HEQ0IkNp9n7d1L
 EvbsSmjndmddVW6QwihhFYNb+fcJam0UfOGdQfsGpPvHkN+bXXCMzs+jzdtX4MapmGed
 oFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lp/cyDN4SicCkpOFPMMKmTyfm8hXuGkuPIKhwy32S4c=;
 b=J8xYsCYzLsVTo8swPF3K96bZO5fEege0Edqwbfbw64yy9FLoHM6YwpMxAFQsI4z1wi
 KWomnUQ8o/O7rca89BI1Xy2jBRnPRZVWXax+QbfY1XgrtYUWF66vzijkmOR2uqqYfVBt
 ytSM2z3VoL2F+jBGSuqEdI+EuWa5aoCI9I+9/+N9xQojfmkRy8mKfN4Y8EtNNu9aqpA1
 LNIJq3HOV972ujIuPtqggTbsxA4fIua2MdB3kZTY3LpVQMnrkNK32qpOORMuCjQu+i4m
 6Bd0PgL3pC4hjiwYcDw2hS7aFH+u+3Jt6G7IV5p1JZlIqj4HMRVk7Sz0J5iNyHvlU4w1
 bITg==
X-Gm-Message-State: AOAM530Cj5FnW7hb1HubLa+R6WYr8mlsOnIANPlNlJbVuxY9vJkpZpRp
 69Twp2fSdoAAlgOhfw8ky4Y=
X-Google-Smtp-Source: ABdhPJyNf7QrIlwEwVUDPsz0q8jBV730gxRpI734/NalfdQ+qgWjU+LtDn7vdzeM3miyQK01pLf99Q==
X-Received: by 2002:a17:90a:3e09:: with SMTP id
 j9mr23972772pjc.24.1636773435386; 
 Fri, 12 Nov 2021 19:17:15 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id m19sm5937421pgh.75.2021.11.12.19.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 19:17:14 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 13 Nov 2021 12:16:37 +0900
Message-Id: <20211113031639.2402161-12-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113031639.2402161-1-shorne@gmail.com>
References: <20211113031639.2402161-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 11/13] or1k: Build Infrastructure
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

LS0tCiBzeXNkZXBzL29yMWsvSW1wbGllcyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysK
IHN5c2RlcHMvb3Ixay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKwog
c3lzZGVwcy9vcjFrL25vZnB1L0ltcGxpZXMgICAgICAgICAgICAgICAgICB8ICAxICsKIHN5c2Rl
cHMvb3Ixay9ucHRsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrKysrKysr
CiBzeXNkZXBzL29yMWsvcHJlY29uZmlndXJlICAgICAgICAgICAgICAgICAgIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrCiBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL0ltcGxpZXMgICAg
ICAgIHwgIDMgKysKIHN5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvTWFrZWZpbGUgICAgICAg
fCAxMiArKysrKysrKwogc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9jb25maWd1cmUgICAg
ICB8ICA0ICsrKwogc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9jb25maWd1cmUuYWMgICB8
ICA0ICsrKwogc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9zaGxpYi12ZXJzaW9ucyB8ICAy
ICsrCiAxMCBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgc3lzZGVwcy9vcjFrL0ltcGxpZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsv
TWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvbm9mcHUvSW1wbGllcwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ixay9ucHRsL01ha2VmaWxlCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgc3lzZGVwcy9vcjFrL3ByZWNvbmZpZ3VyZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN5
c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvSW1wbGllcwogY3JlYXRlIG1vZGUgMTAwNjQ0IHN5
c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
eXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2NvbmZpZ3VyZQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHN5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvY29uZmlndXJlLmFjCiBjcmVhdGUgbW9kZSAx
MDA2NDQgc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9zaGxpYi12ZXJzaW9ucwoKZGlmZiAt
LWdpdCBhL3N5c2RlcHMvb3Ixay9JbXBsaWVzIGIvc3lzZGVwcy9vcjFrL0ltcGxpZXMKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzg3YTBjYTA1MgotLS0gL2Rldi9udWxs
CisrKyBiL3N5c2RlcHMvb3Ixay9JbXBsaWVzCkBAIC0wLDAgKzEsMyBAQAord29yZHNpemUtMzIK
K2llZWU3NTQvZGJsLTY0CitpZWVlNzU0L2ZsdC0zMgpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFr
L01ha2VmaWxlIGIvc3lzZGVwcy9vcjFrL01ha2VmaWxlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjAyNDFhMDU4N2UKLS0tIC9kZXYvbnVsbAorKysgYi9zeXNkZXBzL29y
MWsvTWFrZWZpbGUKQEAgLTAsMCArMSw3IEBACitBU0ZMQUdTLS5vcyArPSAtZlBJQworCitpZmVx
ICgkKHN1YmRpciksZWxmKQorIyBFeHRyYSBzaGFyZWQgbGlua2VyIGZpbGVzIHRvIGxpbmsgb25s
eSBpbnRvIGRsLWFsbG9ianMuc28uCitzeXNkZXAtcnRsZC1yb3V0aW5lcyArPSBkbC1zdGFydAor
ZW5kaWYKKwpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL25vZnB1L0ltcGxpZXMgYi9zeXNkZXBz
L29yMWsvbm9mcHUvSW1wbGllcwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5hYmNiYWRiMjVmCi0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFrL25vZnB1L0ltcGxp
ZXMKQEAgLTAsMCArMSBAQAoraWVlZTc1NC9zb2Z0LWZwCmRpZmYgLS1naXQgYS9zeXNkZXBzL29y
MWsvbnB0bC9NYWtlZmlsZSBiL3N5c2RlcHMvb3Ixay9ucHRsL01ha2VmaWxlCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjBlMDg4MjE5MzMKLS0tIC9kZXYvbnVsbAorKysg
Yi9zeXNkZXBzL29yMWsvbnB0bC9NYWtlZmlsZQpAQCAtMCwwICsxLDIxIEBACisjIENvcHlyaWdo
dCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMKKyMgVGhpcyBmaWxl
IGlzIHBhcnQgb2YgdGhlIEdOVSBDIExpYnJhcnkuCisjCisjIFRoZSBHTlUgQyBMaWJyYXJ5IGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorIyBtb2RpZnkg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisjIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhl
cgorIyB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkg
bGF0ZXIgdmVyc2lvbi4KKyMKKyMgVGhlIEdOVSBDIExpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJB
TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyMg
TGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMKKyMgWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1
YmxpYworIyBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJhcnkuICBJZiBub3QsIHNl
ZQorIyA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorCitpZmVxICgkKHN1YmRpciks
Y3N1KQorZ2VuLWFzLWNvbnN0LWhlYWRlcnMgKz0gdGNiLW9mZnNldHMuc3ltCitlbmRpZgpkaWZm
IC0tZ2l0IGEvc3lzZGVwcy9vcjFrL3ByZWNvbmZpZ3VyZSBiL3N5c2RlcHMvb3Ixay9wcmVjb25m
aWd1cmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDFiMWZiMTg0Mwot
LS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvb3Ixay9wcmVjb25maWd1cmUKQEAgLTAsMCArMSwz
NCBAQAorIworIyBUaGlzIGlzIGZyZWUgYW5kIHVuZW5jdW1iZXJlZCBzb2Z0d2FyZSByZWxlYXNl
ZCBpbnRvIHRoZSBwdWJsaWMgZG9tYWluLgorIworIyBBbnlvbmUgaXMgZnJlZSB0byBjb3B5LCBt
b2RpZnksIHB1Ymxpc2gsIHVzZSwgY29tcGlsZSwgc2VsbCwgb3IKKyMgZGlzdHJpYnV0ZSB0aGlz
IHNvZnR3YXJlLCBlaXRoZXIgaW4gc291cmNlIGNvZGUgZm9ybSBvciBhcyBhIGNvbXBpbGVkCisj
IGJpbmFyeSwgZm9yIGFueSBwdXJwb3NlLCBjb21tZXJjaWFsIG9yIG5vbi1jb21tZXJjaWFsLCBh
bmQgYnkgYW55CisjIG1lYW5zLgorIworIyBJbiBqdXJpc2RpY3Rpb25zIHRoYXQgcmVjb2duaXpl
IGNvcHlyaWdodCBsYXdzLCB0aGUgYXV0aG9yIG9yIGF1dGhvcnMKKyMgb2YgdGhpcyBzb2Z0d2Fy
ZSBkZWRpY2F0ZSBhbnkgYW5kIGFsbCBjb3B5cmlnaHQgaW50ZXJlc3QgaW4gdGhlCisjIHNvZnR3
YXJlIHRvIHRoZSBwdWJsaWMgZG9tYWluLiBXZSBtYWtlIHRoaXMgZGVkaWNhdGlvbiBmb3IgdGhl
IGJlbmVmaXQKKyMgb2YgdGhlIHB1YmxpYyBhdCBsYXJnZSBhbmQgdG8gdGhlIGRldHJpbWVudCBv
ZiBvdXIgaGVpcnMgYW5kCisjIHN1Y2Nlc3NvcnMuIFdlIGludGVuZCB0aGlzIGRlZGljYXRpb24g
dG8gYmUgYW4gb3ZlcnQgYWN0IG9mCisjIHJlbGlucXVpc2htZW50IGluIHBlcnBldHVpdHkgb2Yg
YWxsIHByZXNlbnQgYW5kIGZ1dHVyZSByaWdodHMgdG8gdGhpcworIyBzb2Z0d2FyZSB1bmRlciBj
b3B5cmlnaHQgbGF3LgorIworIyBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lU
SE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwKKyMgRVhQUkVTUyBPUiBJTVBMSUVELCBJTkNMVURJ
TkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GCisjIE1FUkNIQU5UQUJJTElU
WSwgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4K
KyMgSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFVVEhPUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0s
IERBTUFHRVMgT1IKKyMgT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBD
T05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCisjIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgorIyBPVEhFUiBERUFM
SU5HUyBJTiBUSEUgU09GVFdBUkUuCisjCisKK2Nhc2UgIiRtYWNoaW5lIiBpbgorb3IxayopCisg
IGJhc2VfbWFjaGluZT1vcjFrCisgIG1hY2hpbmU9b3IxaworCisgIHdpdGhfZnBfY29uZD0iZGVm
aW5lZCBfX29yMWtfaGFyZF9mbG9hdF9fIgorICA7OworZXNhYworCmRpZmYgLS1naXQgYS9zeXNk
ZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL0ltcGxpZXMgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51
eC9vcjFrL0ltcGxpZXMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZjM5
ZjE2YzA0YQotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsv
SW1wbGllcwpAQCAtMCwwICsxLDMgQEAKK29yMWsvbnB0bAordW5peC9zeXN2L2xpbnV4L2dlbmVy
aWMvd29yZHNpemUtMzIKK3VuaXgvc3lzdi9saW51eC9nZW5lcmljCmRpZmYgLS1naXQgYS9zeXNk
ZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL01ha2VmaWxlIGIvc3lzZGVwcy91bml4L3N5c3YvbGlu
dXgvb3Ixay9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5i
ZTIwMzIwYjJmCi0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ix
ay9NYWtlZmlsZQpAQCAtMCwwICsxLDEyIEBACitpZmVxICgkKHN1YmRpciksbWlzYykKKyAgc3lz
ZGVwX3JvdXRpbmVzICs9IHByY3RsIG9yMWtfY2xvbmUKK2VuZGlmCisKK2lmZXEgKCQoc3ViZGly
KSxzdGRsaWIpCitnZW4tYXMtY29uc3QtaGVhZGVycyArPSB1Y29udGV4dF9pLnN5bQorZW5kaWYK
KworIyBwdWxsIGluIF9fc3lzY2FsbF9lcnJvciByb3V0aW5lCitsaWJwdGhyZWFkLXJvdXRpbmVz
ICs9IHN5c2RlcAorbGlicnQtcm91dGluZXMgKz0gc3lzZGVwCisKZGlmZiAtLWdpdCBhL3N5c2Rl
cHMvdW5peC9zeXN2L2xpbnV4L29yMWsvY29uZmlndXJlIGIvc3lzZGVwcy91bml4L3N5c3YvbGlu
dXgvb3Ixay9jb25maWd1cmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
Mjg2ZjVhYzI1YQotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29y
MWsvY29uZmlndXJlCkBAIC0wLDAgKzEsNCBAQAorIyBUaGlzIGZpbGUgaXMgZ2VuZXJhdGVkIGZy
b20gY29uZmlndXJlLmFjIGJ5IEF1dG9jb25mLiAgRE8gTk9UIEVESVQhCisgIyBMb2NhbCBjb25m
aWd1cmUgZnJhZ21lbnQgZm9yIHN5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsuCisKK2FyY2hf
bWluaW11bV9rZXJuZWw9NS4xMC4wCmRpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51
eC9vcjFrL2NvbmZpZ3VyZS5hYyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvY29uZmln
dXJlLmFjCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQ0MzllN2ZkNTMK
LS0tIC9kZXYvbnVsbAorKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2NvbmZpZ3Vy
ZS5hYwpAQCAtMCwwICsxLDQgQEAKK0dMSUJDX1BST1ZJREVTIGRubCBTZWUgYWNsb2NhbC5tNCBp
biB0aGUgdG9wIGxldmVsIHNvdXJjZSBkaXJlY3RvcnkuCisjIExvY2FsIGNvbmZpZ3VyZSBmcmFn
bWVudCBmb3Igc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay4KKworYXJjaF9taW5pbXVtX2tl
cm5lbD01LjEwLjAKZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvc2hs
aWItdmVyc2lvbnMgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL3NobGliLXZlcnNpb25z
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjE1OTY1M2I1YzQKLS0tIC9k
ZXYvbnVsbAorKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL3NobGliLXZlcnNpb25z
CkBAIC0wLDAgKzEsMiBAQAorREVGQVVMVCAgICAgICAgICAgICAgICAgR0xJQkNfMi4zNQorbGQ9
bGQtbGludXgtb3Ixay5zby4xCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
