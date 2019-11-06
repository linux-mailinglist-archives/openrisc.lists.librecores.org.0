Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D7B71F7400
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5803E207B6;
	Mon, 11 Nov 2019 13:37:32 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id 73E0720629
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 04:07:42 +0100 (CET)
Received: by mail-pg1-f193.google.com with SMTP id l3so16113192pgr.8
 for <openrisc@lists.librecores.org>; Tue, 05 Nov 2019 19:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZkTObIsF61Z45Fw03drbWYyon2r40d8DXxhztGRtNkQ=;
 b=iReoUOAfBSC2lgcmJ99cOUC/KPegZvtwylc18oc4U5ole2l6I079nnCxDbzwKQiDlb
 I25rB42ARn0898alSF75+Zq9Gy8JIPLgVJfb08lQw1dZplx+sMUCSQEs6MvQfaFCssFc
 NejOZ3U7N5LvtC9gAIqW+LA4LYkei1D/E0+8dn2Ryz4IuHMSgilonPtueqSXn6LwuIFe
 iwIMe82LFLFL0uLPcNg2POGoyJg+FLZRUv3Ayen6ciKnIwERzQ3uSjX+LhTKP17iz+4s
 p0SRN1X7twG9WgVFI4IdYs4A5rOz1sZ7sViv7E3/fPBHwBGYD0pXm0vPMgGWZehpjb0r
 l7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZkTObIsF61Z45Fw03drbWYyon2r40d8DXxhztGRtNkQ=;
 b=IyR/T1Olmdm1DNNRk42EiPq4q1lhVqOaYLeffQwdKgur6up32h0pN3fKv3xO/O6dv1
 XfEKtjVIWTNPswiR400pCGq1wCeg7adxHBrTq/7znZsWJVb6OF5z7g1+2aXJcU7tdpdy
 9yCi7QLJimwnuOK167DdBFaNpXSsMa09gvL2HStn0ocnFG59Hf8jOdXB+bWjSl6S9XcT
 ku2C998MOjkUd6S+5qOACcEv4JpIKtBoPRtLLW1ZoSyyyPtGj4C7AstLMJojquzEtCKz
 YgyhcrTAJ30U1QhCBvgqOH8aWfdBdX+rk4GkydVt8Y8VAZKsB4y4dWTNHbmEYSCJMRI0
 g8cQ==
X-Gm-Message-State: APjAAAW3+S1aOcdA8hUiyCvr3pOJysrHYqoAaSLIP7QyNHjFVeRjJuuB
 Ig5y3TwD9vGAxvdfSEGd046ncg==
X-Google-Smtp-Source: APXvYqy0KbKuP6VArvuqXZXCebMSGwIVmT/hisdmPtRqIvTKjarofAjqgV7zTiu4mCb/OV/NRGXpFw==
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr473262pfn.24.1573009661131;
 Tue, 05 Nov 2019 19:07:41 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 19:07:40 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  6 Nov 2019 03:05:15 +0000
Message-Id: <20191106030542.868541-25-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: [OpenRISC] [PATCH 24/50] openrisc: Add show_stack_loglvl()
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 openrisc@lists.librecores.org, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q3VycmVudGx5LCB0aGUgbG9nLWxldmVsIG9mIHNob3dfc3RhY2soKSBkZXBlbmRzIG9uIGEgcGxh
dGZvcm0KcmVhbGl6YXRpb24uIEl0IGNyZWF0ZXMgc2l0dWF0aW9ucyB3aGVyZSB0aGUgaGVhZGVy
cyBhcmUgcHJpbnRlZCB3aXRoCmxvd2VyIGxvZyBsZXZlbCBvciBoaWdoZXIgdGhhbiB0aGUgc3Rh
Y2t0cmFjZSAoZGVwZW5kaW5nIG9uCmEgcGxhdGZvcm0gb3IgdXNlcikuCgpGdXJ0aGVybW9yZSwg
aXQgZm9yY2VzIHRoZSBsb2dpYyBkZWNpc2lvbiBmcm9tIHVzZXIgdG8gYW4gYXJjaGl0ZWN0dXJl
CnNpZGUuIEluIHJlc3VsdCwgc29tZSB1c2VycyBhcyBzeXNycS9rZGIvZXRjIGFyZSBkb2luZyB0
cmlja3Mgd2l0aAp0ZW1wb3JhcnkgcmlzaW5nIGNvbnNvbGVfbG9nbGV2ZWwgd2hpbGUgcHJpbnRp
bmcgdGhlaXIgbWVzc2FnZXMuCkFuZCBpbiByZXN1bHQgaXQgbm90IG9ubHkgbWF5IHByaW50IHVu
d2FudGVkIG1lc3NhZ2VzIGZyb20gb3RoZXIgQ1BVcywKYnV0IGFsc28gb21pdCBwcmludGluZyBh
dCBhbGwgaW4gdGhlIHVubHVja3kgY2FzZSB3aGVyZSB0aGUgcHJpbnRrKCkKd2FzIGRlZmVycmVk
LgoKSW50cm9kdWNpbmcgbG9nLWxldmVsIHBhcmFtZXRlciBhbmQgS0VSTl9VTlNVUFBSRVNTRUQg
WzFdIHNlZW1zCmFuIGVhc2llciBhcHByb2FjaCB0aGFuIGludHJvZHVjaW5nIG1vcmUgcHJpbnRr
IGJ1ZmZlcnMuCkFsc28sIGl0IHdpbGwgY29uc29saWRhdGUgcHJpbnRpbmdzIHdpdGggaGVhZGVy
cy4KCkludHJvZHVjZSBzaG93X3N0YWNrX2xvZ2x2bCgpLCB0aGF0IGV2ZW50dWFsbHkgd2lsbCBz
dWJzdGl0dXRlCnNob3dfc3RhY2soKS4KCkNjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUu
c2U+CkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KQ2M6IFN0ZWZhbiBLcmlz
dGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KQ2M6IG9wZW5yaXNj
QGxpc3RzLmxpYnJlY29yZXMub3JnClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDE5MDUyODAwMjQxMi4xNjI1LTEtZGltYUBhcmlzdGEuY29tL1QvI3UKU2lnbmVkLW9mZi1ieTog
RG1pdHJ5IFNhZm9ub3YgPGRpbWFAYXJpc3RhLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5l
bC90cmFwcy5jIHwgMTYgKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvdHJhcHMuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBzLmMKaW5kZXggOTMyYThlYzJi
NTIwLi45ZDVhODVkZDE5OTIgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBz
LmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvdHJhcHMuYwpAQCAtNDEsMTggKzQxLDI2IEBA
IHVuc2lnbmVkIGxvbmcgX191c2VyICpsd2FfYWRkcjsKIAogdm9pZCBwcmludF90cmFjZSh2b2lk
ICpkYXRhLCB1bnNpZ25lZCBsb25nIGFkZHIsIGludCByZWxpYWJsZSkKIHsKLQlwcl9lbWVyZygi
WzwlcD5dICVzJXBTXG4iLCAodm9pZCAqKSBhZGRyLCByZWxpYWJsZSA/ICIiIDogIj8gIiwKKwlj
b25zdCBjaGFyICpsb2dsdmwgPSBkYXRhOworCisJcHJpbnRrKCIlc1s8JXA+XSAlcyVwU1xuIiwg
bG9nbHZsLCAodm9pZCAqKSBhZGRyLCByZWxpYWJsZSA/ICIiIDogIj8gIiwKIAkgICAgICAgKHZv
aWQgKikgYWRkcik7CiB9CiAKIC8qIGRpc3BsYXlzIGEgc2hvcnQgc3RhY2sgdHJhY2UgKi8KLXZv
aWQgc2hvd19zdGFjayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgKmVz
cCkKK3ZvaWQgc2hvd19zdGFja19sb2dsdmwoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCB1bnNp
Z25lZCBsb25nICplc3AsCisJCWNvbnN0IGNoYXIgKmxvZ2x2bCkKIHsKIAlpZiAoZXNwID09IE5V
TEwpCiAJCWVzcCA9ICh1bnNpZ25lZCBsb25nICopJmVzcDsKIAotCXByX2VtZXJnKCJDYWxsIHRy
YWNlOlxuIik7Ci0JdW53aW5kX3N0YWNrKE5VTEwsIGVzcCwgcHJpbnRfdHJhY2UpOworCXByaW50
aygiJXNDYWxsIHRyYWNlOlxuIiwgbG9nbHZsKTsKKwl1bndpbmRfc3RhY2soKHZvaWQgKilsb2ds
dmwsIGVzcCwgcHJpbnRfdHJhY2UpOworfQorCit2b2lkIHNob3dfc3RhY2soc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrLCB1bnNpZ25lZCBsb25nICplc3ApCit7CisJc2hvd19zdGFja19sb2dsdmwo
dGFzaywgZXNwLCBLRVJOX0VNRVJHKTsKIH0KIAogdm9pZCBzaG93X3RyYWNlX3Rhc2soc3RydWN0
IHRhc2tfc3RydWN0ICp0c2spCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
