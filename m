Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 760AF44F0F3
	for <lists+openrisc@lfdr.de>; Sat, 13 Nov 2021 04:16:53 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5EA1924296;
	Sat, 13 Nov 2021 04:16:53 +0100 (CET)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mail.librecores.org (Postfix) with ESMTPS id 5880224189
 for <openrisc@lists.librecores.org>; Sat, 13 Nov 2021 04:16:51 +0100 (CET)
Received: by mail-pg1-f171.google.com with SMTP id b4so9550901pgh.10
 for <openrisc@lists.librecores.org>; Fri, 12 Nov 2021 19:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8GsNqbjvYHQu72z/T07/fwt7FqlbtOKQz+GJxUDBeQ=;
 b=TcZ8sPTK8jPSbl1tTlUFGEqByXHnZWi7n9lPnqiJRs1WIU6nfNNuHzSGwp19wXMqbK
 qXXwmNQvXHcSXFWQ4BA1sjaVqTd1gdepClExNjMP5rSWjWftwO357IGCgT2CQw2jog5Z
 5/+06mCXFUmrhh2MU37846JiOncWvtTsGloRJO2MvQ4V6iJI3T689jAhWp0NTQ/3NVuF
 pyW79Ebp+lVeRzhuqwY3gNBrAqEHTp4A+p4b17r//PRV2ffBqByojN6CV6nMfGa9IUby
 bXTGbcea8wLFlaa6eYGMppO0NgkdcKzWE+alDYYoKerlMT9NRqpD1hgNgfbu+z1kgEF6
 Fc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8GsNqbjvYHQu72z/T07/fwt7FqlbtOKQz+GJxUDBeQ=;
 b=P/JMWp3X6CXX0XhZikbtT17HZsFGSBxB2uIamAk50MyNjIvKuWGmzQFggRGfB8kIz3
 aoV32dimrAyFR3ZLrFjLj535lPrin5uB/ORc0OzkzZxkKXW4nfDM78zWcuEQN5dYfj4Y
 4qULJH/BzC9OxLGi0P0hgro0bOMvSSc+otqzekmfQTMbLovmNm6j7l83Xa5jDDKiJtD6
 baQtmwdfpopTheSZBpoF8hwzmkTW1GvszVKLDzgGD1RVVM/xYb6vIq6u8qcyKltECspd
 JbrLzKgF+PLhkYa547MEx8wFE3mrUgz2URe+FqiCugjQvgY00oXJ3dXnk94Z7rPpHkp1
 ItMA==
X-Gm-Message-State: AOAM530HU+J6/XqOs4cJatn5bshTzlFc30UQy4n+EcLiC94hrTqgy7C8
 M9GjmKc+qgrh61IVM4Y0nkBPArPDleY=
X-Google-Smtp-Source: ABdhPJzAH4PWT8vKXMQXZKKZ7P+9RtEAb1Xi/BQ/fHbBc7T6I0oOXTokr5i8rSoVmAN8NsGCar/tHg==
X-Received: by 2002:a63:584a:: with SMTP id i10mr13099273pgm.0.1636773409820; 
 Fri, 12 Nov 2021 19:16:49 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id m18sm8113464pfk.68.2021.11.12.19.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 19:16:49 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 13 Nov 2021 12:16:28 +0900
Message-Id: <20211113031639.2402161-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113031639.2402161-1-shorne@gmail.com>
References: <20211113031639.2402161-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 02/13] linux/syscalls: Add or1k_atomic syscall
 for OpenRISC
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

LS0tCiBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9z
eXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdCBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3N5
c2NhbGwtbmFtZXMubGlzdAppbmRleCAxYTc0ZDA5MGI3Li5hNzJkZWU2Mjc1IDEwMDY0NAotLS0g
YS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QKKysrIGIvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvc3lzY2FsbC1uYW1lcy5saXN0CkBAIC0zMDQsNiArMzA0LDcgQEAg
b3Blbl9ieV9oYW5kbGVfYXQKIG9wZW5fdHJlZQogb3BlbmF0CiBvcGVuYXQyCitvcjFrX2F0b21p
Ywogb3NmX2FkanRpbWUKIG9zZl9hZnNfc3lzY2FsbAogb3NmX2FsdF9wbG9jawotLSAKMi4zMS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
