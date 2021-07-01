Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 82CCA3B98DF
	for <lists+openrisc@lfdr.de>; Fri,  2 Jul 2021 01:17:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 11D5123E88;
	Fri,  2 Jul 2021 01:17:57 +0200 (CEST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id B9214210E3
 for <openrisc@lists.librecores.org>; Fri,  2 Jul 2021 01:17:54 +0200 (CEST)
Received: by mail-pj1-f47.google.com with SMTP id g24so5286016pji.4
 for <openrisc@lists.librecores.org>; Thu, 01 Jul 2021 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPoXi+XXRRxDBgzWPSUep7fmZRtnonAVtw36zi2JpNQ=;
 b=m4hFMFAPnj0ju5wXr5GSEPvAqN1glyWJyztW4G7AH/7XLZfpPqRfkQYbzs3DvdGfdX
 nlG659jnEi9V/3gkGz/sLEAb+YoveEEfMq9ngLxMqgyFrGn4ucppKN8qJxj6Rf8RRrmA
 dsXfR3UtfwZhX6rdmBTLcQTrZTcvfMGifBFG7LETMMA1AEXY1iQ+lawoZQEQfmebSlCC
 eEjwutFh8/ipMGX10cIkuVBgRhiJtJDYPBV08U0OyiZMGphqeDumGZwClIqV1EQWLgEf
 krYEPcIeZOCIqlwbQl4fGpksui0AaoanotcQ8hoLap4JW8FwsrOO3hTbSEWrMRhDkPyM
 jcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPoXi+XXRRxDBgzWPSUep7fmZRtnonAVtw36zi2JpNQ=;
 b=gfZdUSWt1SnY9YvE4od3BpPIpGPj+BpXlX0ADRAq5MAVbCVVd2gJXlkjwUNktpN7ef
 XE7P/YGqr0hIKBnboqBBwCKBrPpqWuWgPMK3ANKy31KO71OnZDzlWDNrtF1WMjPT7t4x
 JIbxDRtfMR1UPCSNiJakfSw06gl8iSG1mK0sv2AHMORdOIHYBr2QB4slCgvyIE0rfsKE
 Rd5KsXQ/2tOkLB1um8brZP16X8F03g60negdvtNMa6UBOJ85MUhmpfCejUAPLCa1ce5b
 0nDlsXuUHoPNbX8zKo/zT+A8rPU4y2l74Gmc8z85cdGUAJFE+dVXMZ8Zi70yGFURtbAg
 EcMA==
X-Gm-Message-State: AOAM530uKI0ILD8AetlhekgHcHkyYriuDppeEfv+ACplze3Fs9MnrL7x
 Sxet62s9/6UVoXVOIBESbV0=
X-Google-Smtp-Source: ABdhPJxp9/bh+LbfBaosh8XpPeTG0n1KcwvH2uWJRHT0F3RIk93wHEpI5GuUFkzdnJ3/+rgxDQaAqg==
X-Received: by 2002:a17:902:e5ce:b029:129:3d74:d873 with SMTP id
 u14-20020a170902e5ceb02901293d74d873mr1747325plf.19.1625181473083; 
 Thu, 01 Jul 2021 16:17:53 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 136sm1157495pfa.158.2021.07.01.16.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 16:17:52 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: Newlib <newlib@sourceware.org>
Date: Fri,  2 Jul 2021 08:17:48 +0900
Message-Id: <20210701231748.1098623-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] libgloss/or1k: Correct the IMMU SXE and UXE flags
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

VGhlc2UgaGF2ZSBiZWVuIGRlZmluZWQgaW5jb3JyZWN0bHksIGFzIHBlciBzcGVjaWZpY2F0aW9u
IGFuZCBDUFUKaW1wbGVtZW50YXRpb25zIFNYRSBpcyBiaXQgNiBhbmQgVVhFIGlzIGJpdCA3LiAg
VGhpcyB3YXMgbm90aWNlZCB3aGVuCnRyYWNraW5nIGRvd24gb3VyIHRlc3Qgc3VpdGUgbW11IHRl
c3QgZmFpbHVyZXMuCgogVGVzdCBTdWl0ZTogaHR0cHM6Ly9naXRodWIuY29tL29wZW5yaXNjL29y
MWstdGVzdHMvYmxvYi9tYXN0ZXIvbmF0aXZlL29yMWsvb3Ixay1tbXUuYyNMNjgtTDcyCiBTcGVj
OiBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vb3BlbnJpc2MvZG9jL21hc3Rlci9v
cGVucmlzYy1hcmNoLTEuMy1yZXYxLnBkZgoKU2VlIHNlY3Rpb24gOC40LjggSW5zdHJ1Y3Rpb24g
VHJhbnNsYXRpb24gTG9va2FzaWRlIEJ1ZmZlciBXYXkgeSBUcmFuc2xhdGUKUmVnaXN0ZXJzIHdo
ZXJlIHRoZXNlIGFyZSBkZWZpbmVkLgoKU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+Ci0tLQogbGliZ2xvc3Mvb3Ixay9pbmNsdWRlL29yMWstc3Bycy5oIHwg
MjAgKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWJnbG9zcy9vcjFrL2luY2x1ZGUvb3Ix
ay1zcHJzLmggYi9saWJnbG9zcy9vcjFrL2luY2x1ZGUvb3Ixay1zcHJzLmgKaW5kZXggOGQxZmU1
ZWQ5Li5kNTQ1ZmIxZDMgMTAwNjQ0Ci0tLSBhL2xpYmdsb3NzL29yMWsvaW5jbHVkZS9vcjFrLXNw
cnMuaAorKysgYi9saWJnbG9zcy9vcjFrL2luY2x1ZGUvb3Ixay1zcHJzLmgKQEAgLTE3OTcsMTcg
KzE3OTcsMTcgQEAKICNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9EX0dFVChYKSAoKChY
KSA+PiA1KSAmIDB4MSkKICNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9EX1NFVChYLCBZ
KSAoKChYKSAmIE9SMUtfVU5TSUdORUQoMHhmZmZmZmZkZikpIHwgKCghIShZKSkgPDwgNSkpCiAK
LS8qIFVzZXIgRXhlY3V0ZSBFbmFibGUgKi8KLSNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19U
Ul9VWEVfT0ZGU0VUIDYKLSNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9VWEVfTUFTSyAg
IDB4MDAwMDAwNDAKLSNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9VWEVfR0VUKFgpICgo
KFgpID4+IDYpICYgMHgxKQotI2RlZmluZSBPUjFLX1NQUl9JTU1VX0lUTEJXX1RSX1VYRV9TRVQo
WCwgWSkgKCgoWCkgJiBPUjFLX1VOU0lHTkVEKDB4ZmZmZmZmYmYpKSB8ICgoISEoWSkpIDw8IDYp
KQotCiAvKiBTdXBlcnZpc29yIEV4ZWN1dGUgRW5hYmxlICovCi0jZGVmaW5lIE9SMUtfU1BSX0lN
TVVfSVRMQldfVFJfU1hFX09GRlNFVCA3Ci0jZGVmaW5lIE9SMUtfU1BSX0lNTVVfSVRMQldfVFJf
U1hFX01BU0sgICAweDAwMDAwMDgwCi0jZGVmaW5lIE9SMUtfU1BSX0lNTVVfSVRMQldfVFJfU1hF
X0dFVChYKSAoKChYKSA+PiA3KSAmIDB4MSkKLSNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19U
Ul9TWEVfU0VUKFgsIFkpICgoKFgpICYgT1IxS19VTlNJR05FRCgweGZmZmZmZjdmKSkgfCAoKCEh
KFkpKSA8PCA3KSkKKyNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9TWEVfT0ZGU0VUIDYK
KyNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9TWEVfTUFTSyAgIDB4MDAwMDAwNDAKKyNk
ZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9TWEVfR0VUKFgpICgoKFgpID4+IDYpICYgMHgx
KQorI2RlZmluZSBPUjFLX1NQUl9JTU1VX0lUTEJXX1RSX1NYRV9TRVQoWCwgWSkgKCgoWCkgJiBP
UjFLX1VOU0lHTkVEKDB4ZmZmZmZmYmYpKSB8ICgoISEoWSkpIDw8IDYpKQorCisvKiBVc2VyIEV4
ZWN1dGUgRW5hYmxlICovCisjZGVmaW5lIE9SMUtfU1BSX0lNTVVfSVRMQldfVFJfVVhFX09GRlNF
VCA3CisjZGVmaW5lIE9SMUtfU1BSX0lNTVVfSVRMQldfVFJfVVhFX01BU0sgICAweDAwMDAwMDgw
CisjZGVmaW5lIE9SMUtfU1BSX0lNTVVfSVRMQldfVFJfVVhFX0dFVChYKSAoKChYKSA+PiA3KSAm
IDB4MSkKKyNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9VWEVfU0VUKFgsIFkpICgoKFgp
ICYgT1IxS19VTlNJR05FRCgweGZmZmZmZjdmKSkgfCAoKCEhKFkpKSA8PCA3KSkKIAogLyogUGh5
c2ljYWwgUGFnZSBOdW1iZXIgKi8KICNkZWZpbmUgT1IxS19TUFJfSU1NVV9JVExCV19UUl9QUE5f
TFNCICAgIDEzCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
