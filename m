Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 79648191535
	for <lists+openrisc@lfdr.de>; Tue, 24 Mar 2020 16:43:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B3E61208A7;
	Tue, 24 Mar 2020 16:43:55 +0100 (CET)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id CD52820708
 for <openrisc@lists.librecores.org>; Mon, 16 Mar 2020 15:41:31 +0100 (CET)
Received: by mail-pf1-f196.google.com with SMTP id l184so10042540pfl.7
 for <openrisc@lists.librecores.org>; Mon, 16 Mar 2020 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/bTQwUOG90VtsKBum9U3zSzv22t01bBu17KQ/JgogQ=;
 b=haZpj3nnoWxVdaIMwgxvAU/F9PiYgNTuq9GFb/vmABTSB/oW+Nv84m1y9m3v3wFMNd
 IaUpEpyt6JjOtYyCFsY9j/PEILRmIYnNftnYmkvg8etpW7IGeq0pq0688soKfHcZsDoX
 U6JGluL86DyqSoUEALlnxnW4+6s2PDXUR/kr/U0GY3gHwBZIuTfzRmGGBYnPRi8Q7Bko
 4XD6b7IBsEVYnfm3CVbe4Ciz0puLjxcIwSBs9Gi6YAwq047j6sk+quEn2cly/mePR2ga
 W5zpSSf1aiWI6O5W14zKS+cGvKlyoEiYFJPtPJwS+nP8KvVYk2tGmSDGIOpEgbLJzyNF
 XgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/bTQwUOG90VtsKBum9U3zSzv22t01bBu17KQ/JgogQ=;
 b=gkU1Onj1yTvmKoy3ERBpNg7AtBTjA5qBvhlWFyNK4/w5MQnXwecMqroA7co+dnNE00
 mibqtGmBG6oaZcqwC4sMdn0dgokHWm5M4TSAk/eRDvUZ2QJ0P2dhIbJq4EG2djzAGLdn
 2qRvUJmThglVaYaB8G26Uxvls0zKMGVtkpIzyDoQ5vFbiw4bsxfJKNipJphLNFsjguJM
 6eB8u4qR2dt4CUVEZGKriGPTYFVW3+jZ3HtrSIgao/NzJPevJrnJo2hHvvHu5FmRqoTv
 LIyLze0yWn9aWECvZZ8VUxyWzqSjJb4YfL1w6LgAgc2202iHC2mGQj/iZa7hytOYyaxj
 Z+CA==
X-Gm-Message-State: ANhLgQ00q7boJOXeYxeqo0wXtluoaN/fW//L9uhBZ0E86RcsEPjKsNJe
 t1HsGFL9rUqNwbeNIpHCA7I2mg==
X-Google-Smtp-Source: ADFU+vuWJWA+c9SLF4PD/7/QFixZseHXoKiv9UQWtqYHjIhMQGDH+dGnGy1niZWdTPUnbe1yDynYmQ==
X-Received: by 2002:a63:f752:: with SMTP id f18mr208054pgk.196.1584369690090; 
 Mon, 16 Mar 2020 07:41:30 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 07:41:29 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 16 Mar 2020 14:38:50 +0000
Message-Id: <20200316143916.195608-25-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 16:43:54 +0100
Subject: [OpenRISC] [PATCHv2 24/50] openrisc: Add show_stack_loglvl()
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
IHRhc2tfc3RydWN0ICp0c2spCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
