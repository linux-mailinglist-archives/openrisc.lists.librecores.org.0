Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C5084470EBE
	for <lists+openrisc@lfdr.de>; Sat, 11 Dec 2021 00:35:10 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A322F242A1;
	Sat, 11 Dec 2021 00:35:10 +0100 (CET)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id 97CD1242A1
 for <openrisc@lists.librecores.org>; Sat, 11 Dec 2021 00:35:08 +0100 (CET)
Received: by mail-pf1-f173.google.com with SMTP id g19so9786557pfb.8
 for <openrisc@lists.librecores.org>; Fri, 10 Dec 2021 15:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1UqO0prb7wO6SCP2V1tDw+iVCN73ZgBpaPz3KmcV6k=;
 b=amxeDqO2KnLxtkYluSP7XaCTLmk7o2i1fivBf+1+Dxbn/pRUMaVl30x9pr1I8Z/MsN
 OY9daWyX2eX2tXtDHLwRls4yBExICxwv1eiPjCOLCGobR2wI92/pr9o9VXZU3AjYeKsk
 7pPKD0P7K1f2g0pgNveGhVGm6PUndkUfo+IGNq5J0h4sN2K8RJ1InoWl6HgepyIEwl2M
 ELYKwvcT7dwncPQ/SE60Kp3hyJah1ee3g1AR/DY/fQQzKkEobv/lnYxlfLXY+HS4E33N
 /YueXMKvpMsA7APyjO3m9ZahI/ZQG+qrsc7otM8WFB/7M/FTiUgbafajxBJZD3imqL8y
 Zc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1UqO0prb7wO6SCP2V1tDw+iVCN73ZgBpaPz3KmcV6k=;
 b=dAw1Kx45QMm2UmhGiNkQuLNzvogMYafQl3p7Bz3lHCa+Av6OaK/YA0Q9696bT2fPFe
 32InpMu62+yiwZF7B+pvF5osz0IWBu8ChtAG6neFWgz3oZx2OqwuG0qM3AwcdCiM4KA2
 uR5kEVaEwwT8g73UteN39AEbnGlInDF4boYPQOqbwmktgbNfmsHI34Bda8bebMu+4MFn
 QOSZhQrhV1u42sKGfR+D65JVJHKzXNp6zUVbXIu3HycrOsKSONAe3UgIoAZfoFWWRQAb
 G8AtEBlx4Bpajs6KASho6cJXW3xUzzF152daJVNI7Yo6Hdt0ydWhdtuOc/jWjeXIR8Hf
 QXNA==
X-Gm-Message-State: AOAM533D/QlQTbluSDRgmIjfNsTzh1tuXG9W41SLGq/NPIjfCEsyLh1H
 1cFG6YHefB3dPddlGyhRvw0=
X-Google-Smtp-Source: ABdhPJzlaR5ShFcHd2dPy9HEk6hSA05LoKjr5Jx27swBV9kStnQQp5UXBusn4A7REuH0CB9tooae0Q==
X-Received: by 2002:a63:be4f:: with SMTP id g15mr40980943pgo.417.1639179307175; 
 Fri, 10 Dec 2021 15:35:07 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id p14sm89012pjl.32.2021.12.10.15.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 15:35:06 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 11 Dec 2021 08:34:44 +0900
Message-Id: <20211210233456.4146479-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210233456.4146479-1-shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 01/13] elf: Add reloc for OpenRISC
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

LS0tCiBlbGYvZWxmLmggfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2VsZi9lbGYu
aCBiL2VsZi9lbGYuaAppbmRleCBiYWE2YzY2OTNlLi4xODQ1OGU0ZDA0IDEwMDY0NAotLS0gYS9l
bGYvZWxmLmgKKysrIGIvZWxmL2VsZi5oCkBAIC00MTI1LDQgKzQxMjUsNDEgQEAgZW51bQogI2Rl
ZmluZSBSX0FSQ19UTFNfTEVfUzkJCTB4NGEKICNkZWZpbmUgUl9BUkNfVExTX0xFXzMyCQkweDRi
CiAKKy8qIE9wZW5SSVNDIDEwMDAgc3BlY2lmaWMgcmVsb2NzLiAgKi8KKyNkZWZpbmUgUl9PUjFL
X05PTkUJCTAKKyNkZWZpbmUgUl9PUjFLXzMyCQkxCisjZGVmaW5lIFJfT1IxS18xNgkJMgorI2Rl
ZmluZSBSX09SMUtfOAkJMworI2RlZmluZSBSX09SMUtfTE9fMTZfSU5fSU5TTgk0CisjZGVmaW5l
IFJfT1IxS19ISV8xNl9JTl9JTlNOCTUKKyNkZWZpbmUgUl9PUjFLX0lOU05fUkVMXzI2CTYKKyNk
ZWZpbmUgUl9PUjFLX0dOVV9WVEVOVFJZCTcKKyNkZWZpbmUgUl9PUjFLX0dOVV9WVElOSEVSSVQJ
OAorI2RlZmluZSBSX09SMUtfMzJfUENSRUwJCTkKKyNkZWZpbmUgUl9PUjFLXzE2X1BDUkVMCQkx
MAorI2RlZmluZSBSX09SMUtfOF9QQ1JFTAkJMTEKKyNkZWZpbmUgUl9PUjFLX0dPVFBDX0hJMTYJ
MTIKKyNkZWZpbmUgUl9PUjFLX0dPVFBDX0xPMTYJMTMKKyNkZWZpbmUgUl9PUjFLX0dPVDE2CQkx
NAorI2RlZmluZSBSX09SMUtfUExUMjYJCTE1CisjZGVmaW5lIFJfT1IxS19HT1RPRkZfSEkxNgkx
NgorI2RlZmluZSBSX09SMUtfR09UT0ZGX0xPMTYJMTcKKyNkZWZpbmUgUl9PUjFLX0NPUFkJCTE4
CisjZGVmaW5lIFJfT1IxS19HTE9CX0RBVAkJMTkKKyNkZWZpbmUgUl9PUjFLX0pNUF9TTE9UCQky
MAorI2RlZmluZSBSX09SMUtfUkVMQVRJVkUJCTIxCisjZGVmaW5lIFJfT1IxS19UTFNfR0RfSEkx
NgkyMgorI2RlZmluZSBSX09SMUtfVExTX0dEX0xPMTYJMjMKKyNkZWZpbmUgUl9PUjFLX1RMU19M
RE1fSEkxNgkyNAorI2RlZmluZSBSX09SMUtfVExTX0xETV9MTzE2CTI1CisjZGVmaW5lIFJfT1Ix
S19UTFNfTERPX0hJMTYJMjYKKyNkZWZpbmUgUl9PUjFLX1RMU19MRE9fTE8xNgkyNworI2RlZmlu
ZSBSX09SMUtfVExTX0lFX0hJMTYJMjgKKyNkZWZpbmUgUl9PUjFLX1RMU19JRV9MTzE2CTI5Cisj
ZGVmaW5lIFJfT1IxS19UTFNfTEVfSEkxNgkzMAorI2RlZmluZSBSX09SMUtfVExTX0xFX0xPMTYJ
MzEKKyNkZWZpbmUgUl9PUjFLX1RMU19UUE9GRgkzMgorI2RlZmluZSBSX09SMUtfVExTX0RUUE9G
RgkzMworI2RlZmluZSBSX09SMUtfVExTX0RUUE1PRAkzNAorCiAjZW5kaWYJLyogZWxmLmggKi8K
LS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
