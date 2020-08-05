Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BE36323D364
	for <lists+openrisc@lfdr.de>; Wed,  5 Aug 2020 23:07:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 51E8B20D9F;
	Wed,  5 Aug 2020 23:07:47 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 06DB920B19
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 23:07:45 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id f10so1276118plj.8
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XjPMge3KfxxLUFGF6krRbz5lxz5gIyPgeCzTjsMTkRY=;
 b=LMExMwmkOQ+yWr/ZnrykNf+jrL5XbVkPC8tXC7ob1BiPacIs5t8FHZEB6NrHZGsbsZ
 IReHdgOJGQILHeiU6iybOKhILw7PJcSwtKFTV0KjL2QmwfhI9jSTeFVr+XAG2c67Iw9Z
 lFdOskP9jQ31Z00i8iRgG1wCepszYnE6VZMFCkBEsuWsCUihDLCthJPFQCJqIukXRaQt
 gg0IS6HjPdpy6Aj0r+/5/Q1sFdw3Xlww5Lbq4/eLoCultdQIjYgFRwEJYdD35v1SQ2Qi
 C3Imwh9vscQZ/SgBvKunR9hVJ57rcqe5gj1O3NFtM2GgNWgFLRHcuB0VWcFSWcs0EVUI
 fTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XjPMge3KfxxLUFGF6krRbz5lxz5gIyPgeCzTjsMTkRY=;
 b=DqyCeT1PxMhxbw4hJBxIDy87Q1HEHexCddRbGD7sV96bKOFqgLQxzeEUpUZxe2pOfU
 qAIUIiKeBRbm8jQTLoGVylBk7N4CmacuDycwWrW6AzNRpFiiTnxXVVhtI0fa8gLh5Xum
 ATjCtJa8DDnLMayQyJA7unSoBu+rx3Mu56Buf3iVMKkZJ4o5RkphjkhyMz8CORfrxZ0Y
 gcWddtMbmS+/tcCWa9MBgJoNn4Gy0XOV+34qmMOUo+Hls+TmR0hDxn+2uV69KenB3krS
 GuBWdVvM7zzSRBLl7+gajldAmq9nvwdi7FUn4wGKTnwwJXjmMU55IIX5ml1+Kbiaol0r
 pT2w==
X-Gm-Message-State: AOAM532wfRIJv1ucxY42/tpUSQm6I+S6VrMXYRh11VOXYC1udBMMmOQ0
 Ub2cZ53Jnw97VeAvbsQpKF8=
X-Google-Smtp-Source: ABdhPJxPzy+bLTldQVIy9ICqiTeYseZwe652Giet/dPObxGS/yKMb8Kfupsdc1XoNt6kI2YuObUsVQ==
X-Received: by 2002:a17:90a:4e8f:: with SMTP id
 o15mr4745779pjh.220.1596661662968; 
 Wed, 05 Aug 2020 14:07:42 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id r15sm5064463pfq.189.2020.08.05.14.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 14:07:42 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  6 Aug 2020 06:07:20 +0900
Message-Id: <20200805210725.310301-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805210725.310301-1-shorne@gmail.com>
References: <20200805210725.310301-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 1/6] openrisc: io: Fixup defines and move
 include to the end
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBkaWRuJ3Qgc2VlbSB0byBjYXVzZSBhbnkgaXNzdWVzLCBidXQgd2hpbGUgd29ya2luZyBv
biBmaXhpbmcgdXAKc3BhcnNlIGFubm90YXRpb25zIGZvciBPcGVuUklTQyBJIG5vdGljZWQgdGhp
cy4gIFRoaXMgcGF0Y2ggbW92ZXMgdGhlCmluY2x1ZGUgb2YgYXNtLWdlbmVyaWMvaW8uaCB0byB0
aGUgZW5kIG9mIHRoZSBmaWxlLiAgQWxzbywgd2UgYWRkCmRlZmluZXMgb2YgaW9yZW1hcCBhbmQg
aW91bm1hcCwgdGhhdCB3YXkgd2UgZG9uJ3QgZ2V0IGR1cGxpY2F0ZQpkZWZpbml0aW9ucyBmcm9t
IGFzbS1nZW5lcmljL2lvLmguCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5l
QGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIEFkZCBsaW51eC90eXBlcy5oIGlu
Y2x1ZGUgZm9sbG93aW5nIHJlcG9ydCBmcm9tIGtidWlsZAoKIGFyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vaW8uaCB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
aW8uaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8uaAppbmRleCBkYjAyZmIyMDc3ZDku
LjdkNmI0YTc3YjM3OSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5o
CisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8uaApAQCAtMTQsNiArMTQsOCBAQAog
I2lmbmRlZiBfX0FTTV9PUEVOUklTQ19JT19ICiAjZGVmaW5lIF9fQVNNX09QRU5SSVNDX0lPX0gK
IAorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisKIC8qCiAgKiBQQ0k6IGNhbiB3ZSByZWFsbHkg
ZG8gMCBoZXJlIGlmIHdlIGhhdmUgbm8gcG9ydCBJTz8KICAqLwpAQCAtMjUsOSArMjcsMTIgQEAK
ICNkZWZpbmUgUElPX09GRlNFVAkJMAogI2RlZmluZSBQSU9fTUFTSwkJMAogCi0jaW5jbHVkZSA8
YXNtLWdlbmVyaWMvaW8uaD4KLQorI2RlZmluZSBpb3JlbWFwIGlvcmVtYXAKIHZvaWQgX19pb21l
bSAqaW9yZW1hcChwaHlzX2FkZHJfdCBvZmZzZXQsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7CisKKyNk
ZWZpbmUgaW91bm1hcCBpb3VubWFwCiBleHRlcm4gdm9pZCBpb3VubWFwKHZvaWQgKmFkZHIpOwog
CisjaW5jbHVkZSA8YXNtLWdlbmVyaWMvaW8uaD4KKwogI2VuZGlmCi0tIAoyLjI2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
