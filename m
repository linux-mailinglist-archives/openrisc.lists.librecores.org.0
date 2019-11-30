Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4662110DD5F
	for <lists+openrisc@lfdr.de>; Sat, 30 Nov 2019 11:26:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BC2752077E;
	Sat, 30 Nov 2019 11:26:19 +0100 (CET)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mail.librecores.org (Postfix) with ESMTPS id 380082074C
 for <openrisc@lists.librecores.org>; Sat, 30 Nov 2019 11:26:18 +0100 (CET)
Received: by mail-pl1-f181.google.com with SMTP id s10so13973876plp.2
 for <openrisc@lists.librecores.org>; Sat, 30 Nov 2019 02:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=kDfUuY1cuioz694dW7rkbyarYLnDry3QiiLldoLB0tU=;
 b=vBhfQwOyoPlu3qDWjFddu2s/+9qy1HE40vORnl85eybZ2pekup3vRxYVhVE2XfwvNh
 9UcSdi4LvjNYMNJxgJB8h1Lse/5eGiogdcFBJI6h6kIkqfwxunIHA9XTVhvR+QgTx5Vb
 pQZcMyLrofpx4ST9/qxyU6plRyTiwwoYpN5cVrSeQ1lvXv8Ob3TcE74H37b4Ji14OaDS
 nAGxUgp44ClpNDSvwbUjt9/Avo9Uv6QqkEyFqSPT2vl2miDm4zLAqyVPuCvMiZJ1FGLt
 y8AdqWvlFP63DsaetOx5gPRiqwKs+632Pfzzy+ObW+DPQT0xi3p7PxvhdOvbN2l/5EBn
 fWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=kDfUuY1cuioz694dW7rkbyarYLnDry3QiiLldoLB0tU=;
 b=WFMhmzB4mtaUt0vK4m+yxtQl9UG6e36R6JgCscAf0Rl2LoleoXb+WNrLPf//2w8EfJ
 wWQuAz6suDW0gaVlxdZYotpClNCsouCMQI5Ej01frzwWeHvPEkA1WapTpCvHIENujpRG
 wbXAdJpaUoDrAmeFk8oMFVHVI78QobUyX7tHhBifHvfaaQu8HGLUBlB4gk+oqlXnJOXJ
 4qAyCai4+84CUn5JEpUDUx0b8QoTbQhsZrCnXzWV+F6mPwBtRBi8ZOaBo1Bo7hiL9fVp
 zKz5sPrNCIjlLikvguRH8uOqfb7RevTR4F/MEDZJoWnyP7TRjgY1/aX3bKTBMdy6M0Mz
 5Viw==
X-Gm-Message-State: APjAAAVhbJx9tZWRxSjy2tKbzIgcxcoQA6CwJ9Q2EC7lmH/tkDzL0E3Y
 wm2IPlVZbpN9vPndXBWHDQo=
X-Google-Smtp-Source: APXvYqztTbaQsQo/efAR1zQ9z8rvZtDF0mtY3khlEx7lppPrl/HJ4IbseSMGpbOupT5/dh+KPLBWqg==
X-Received: by 2002:a17:902:b101:: with SMTP id
 q1mr18894046plr.154.1575109576340; 
 Sat, 30 Nov 2019 02:26:16 -0800 (PST)
Received: from localhost (g143.222-224-150.ppp.wakwak.ne.jp. [222.224.150.143])
 by smtp.gmail.com with ESMTPSA id w6sm6598774pfq.99.2019.11.30.02.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 02:26:15 -0800 (PST)
Date: Sat, 30 Nov 2019 19:26:13 +0900
From: Stafford Horne <shorne@gmail.com>
To: dalias@libc.org
Message-ID: <20191130102613.GM24874@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: [OpenRISC] OpenRISC gas bug
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgUmljaCwKCkkganVzdCBub3RpY2VkIHlvdXIgbWVzc2FnZSBhYm91dDoKCiAgaHR0cHM6Ly9z
b3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MjUxODQKCkkgYW0gYWJsZSB0
byByZXByb2R1Y2UgaXQgdGhlcmUgc2hvdWxkIGJlIGEgZml4IHNvb24uICBTb3JyeSwgZm9yIHNv
bWUgcmVhc29uIG15CnNvdXJjZXdhcmUgYWNjb3VudCBpdCBub3QgYWNjZXNzaWJsZSBhbmQgcGFz
c3dvcmQgcmVzZXRzIGFyZSBub3QgYmVpbmcgc2VudCB0bwptZS4gIEkgd2lsbCBzb3J0IHRoYXQg
b3V0IHRvLCBidXQgZm9yIHRoZSBtb21lbnQgSSBqdXN0IHdhbnRlZCB0byBzZW5kIHlvdSBhCm1h
aWwgbGV0dGluZyB5b3Uga25vdyB0aGF0IEkgd2FzIG9uIGl0LgoKLVN0YWZmb3JkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
