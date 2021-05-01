Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ECBFC370908
	for <lists+openrisc@lfdr.de>; Sat,  1 May 2021 23:11:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A955321332;
	Sat,  1 May 2021 23:11:58 +0200 (CEST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mail.librecores.org (Postfix) with ESMTPS id 372A82137B
 for <openrisc@lists.librecores.org>; Sat,  1 May 2021 23:11:57 +0200 (CEST)
Received: by mail-pj1-f49.google.com with SMTP id gj14so888500pjb.5
 for <openrisc@lists.librecores.org>; Sat, 01 May 2021 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kESRpwz0v8Ly1W3o9o2+v7LsdD4s3RqngKn+qoO4bCA=;
 b=g4AI4/Ej960RaLlPJ1mqCUPyaicwXLF8+CwaVWlG6iQZmfHUg5EJ+8GTYrbWoatbo6
 jBghuCasEoczy3qTwavXgX91emoJ4+O5j66jFkDAufM54YAm+/tnF7jfwLeVCL6V8Rvc
 w3/Fc6wIEHP6ZGHTuGqrKPHq+R4DtDtK09MUM0OhMZyyGrxabZ8TNOphS0FjO7qjdbrR
 A3v98gOd/Eis1F+rSBFhksxC8H2rHnezhKwJEa7zAngYftuZOAvCp2EJc7upQyTuxnmG
 RoGkey9w4WXrM0r2NHz4Oo0ddVDKO8dSSCFszqM3uVvlhNkPKuYRwQHZQtVVSXJrpuZp
 30yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kESRpwz0v8Ly1W3o9o2+v7LsdD4s3RqngKn+qoO4bCA=;
 b=YqspVJ9fumwenhCwb0SVtjTKZKAYtqq73TneZ7TTHx3jMnGEWmIRGeWvg1XvGAQL9J
 k7NxsIggysjea4F8g9Pvdov7YxXewz8b6ssoe/RybHLLyIN1fkWl7Y05pc3+hZU6LF+w
 YUjffeZLb1jVeRW8sVTrl4CxlcoZvlf/sZ39aWXjJ7KBtXpZLoVel09X26it6lCxe/ud
 V7CISaJyOEawZNUyC0AmwziJnXdTLuxsKcdayQ5/dEQ3nf7oiOhSVTDv3qHboJydWtEA
 3O2OKC6xHHtSPKXG2GAnpcOW551fY1xutCO637Xa9lywZElEXCqzcr2pRUwJCvRuh1jm
 mtnw==
X-Gm-Message-State: AOAM531j8OucWP+MEZA9725ZrQFG/yTYYRLB50bfLZxhl0dXUdBZPqvz
 StvS/iUZr5tfxSnebIuyAG4=
X-Google-Smtp-Source: ABdhPJzSIJW4KkMf72/5yyOPikdY5/fw4wnaEw+RIB5PcaKanxKolB5rXfopvhj2EvSNFZyZSX+4ew==
X-Received: by 2002:a17:902:c943:b029:ee:8f40:6225 with SMTP id
 i3-20020a170902c943b02900ee8f406225mr12003295pla.52.1619903515922; 
 Sat, 01 May 2021 14:11:55 -0700 (PDT)
Received: from localhost (g17.222-224-135.ppp.wakwak.ne.jp. [222.224.135.17])
 by smtp.gmail.com with ESMTPSA id
 l6sm5950241pgc.68.2021.05.01.14.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 14:11:55 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Sun,  2 May 2021 06:11:45 +0900
Message-Id: <20210501211145.2980164-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210501211145.2980164-1-shorne@gmail.com>
References: <20210501211145.2980164-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 2/2] or1k: Use cmodel=large when building
 crtstuff
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

V2hlbiBsaW5raW5nIGdjYyBydW50aW1lIG9iamVjdHMgaW50byBsYXJnZSBiaW5hcmllcyB0aGUg
bGluayBtYXkgZmFpbAp3aXRoIHRoZSBiZWxvdyBlcnJvcnMuICBUaGlzIHdpbGwgaGFwcGVuIGV2
ZW4gaWYgd2UgYXJlIGJ1aWxkaW5nIHdpdGgKLW1jbW9kZWw9bGFyZ2UuCgogICAgL2hvbWUvc2hv
cm5lL3dvcmsvb3BlbnJpc2Mvb3V0cHV0L2hvc3QvbGliL2djYy9vcjFrLWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMvMTAuMy4wL2NydGJlZ2luUy5vOiBpbiBmdW5jdGlvbiBgZGVyZWdpc3Rlcl90bV9j
bG9uZXMnOgogICAgY3J0c3R1ZmYuYzooLnRleHQrMHgzYyk6IHJlbG9jYXRpb24gdHJ1bmNhdGVk
IHRvIGZpdDogUl9PUjFLX0dPVDE2IGFnYWluc3QgdW5kZWZpbmVkIHN5bWJvbCBgX0lUTV9kZXJl
Z2lzdGVyVE1DbG9uZVRhYmxlJwogICAgL2hvbWUvc2hvcm5lL3dvcmsvb3BlbnJpc2Mvb3V0cHV0
L2hvc3QvbGliL2djYy9vcjFrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvMTAuMy4wL2NydGJlZ2lu
Uy5vOiBpbiBmdW5jdGlvbiBgcmVnaXN0ZXJfdG1fY2xvbmVzJzoKICAgIGNydHN0dWZmLmM6KC50
ZXh0KzB4YzApOiByZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfT1IxS19HT1QxNiBhZ2Fp
bnN0IHVuZGVmaW5lZCBzeW1ib2wgYF9JVE1fcmVnaXN0ZXJUTUNsb25lVGFibGUnCgpUaGlzIHBh
dGNoIGJ1aWxkcyB0aGUgZ2NjIGNydHN0dWZmIGJpbmFyaWVzIGFsd2F5cyB3aXRoIHRoZQotbWNt
b2RlbD1sYXJnZSBvcHRpb24gdG8gZW5zdXJlIHRoZXkgY2FuIGJlIGxpbmtlZCBpbnRvIGxhcmdl
IGJpbmFyaWVzLgoKbGliZ2NjL0NoYW5nZUxvZzoKCglQUiA5OTc4MwoJKiBjb25maWcuaG9zdCAo
b3Ixay0qLCB0bWFrZV9maWxlKTogQWRkIG9yMWsvdC1jcnRzdHVmZi4KCSogY29uZmlnL29yMWsv
dC1jcnRzdHVmZjogTmV3IGZpbGUuCi0tLQogbGliZ2NjL2NvbmZpZy5ob3N0ICAgICAgICAgICAg
fCA0ICsrLS0KIGxpYmdjYy9jb25maWcvb3Ixay90LWNydHN0dWZmIHwgMiArKwogMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgbGliZ2NjL2NvbmZpZy9vcjFrL3QtY3J0c3R1ZmYKCmRpZmYgLS1naXQgYS9saWJnY2MvY29u
ZmlnLmhvc3QgYi9saWJnY2MvY29uZmlnLmhvc3QKaW5kZXggZjgwOGI2MWJlNzAuLjllNDBkNDU2
MGEzIDEwMDY0NAotLS0gYS9saWJnY2MvY29uZmlnLmhvc3QKKysrIGIvbGliZ2NjL2NvbmZpZy5o
b3N0CkBAIC0xMTE5LDEyICsxMTE5LDEyIEBAIG5pb3MyLSotKikKIAlleHRyYV9wYXJ0cz0iJGV4
dHJhX3BhcnRzIGNydGkubyBjcnRuLm8iCiAJOzsKIG9yMWstKi1saW51eCopCi0JdG1ha2VfZmls
ZT0iJHRtYWtlX2ZpbGUgb3Ixay90LW9yMWsiCisJdG1ha2VfZmlsZT0iJHRtYWtlX2ZpbGUgb3Ix
ay90LW9yMWsgb3Ixay90LWNydHN0dWZmIgogCXRtYWtlX2ZpbGU9IiR0bWFrZV9maWxlIHQtc29m
dGZwLXNmZGYgdC1zb2Z0ZnAiCiAJbWRfdW53aW5kX2hlYWRlcj1vcjFrL2xpbnV4LXVud2luZC5o
CiAJOzsKIG9yMWstKi0qKQotCXRtYWtlX2ZpbGU9IiR0bWFrZV9maWxlIG9yMWsvdC1vcjFrIgor
CXRtYWtlX2ZpbGU9IiR0bWFrZV9maWxlIG9yMWsvdC1vcjFrIG9yMWsvdC1jcnRzdHVmZiIKIAl0
bWFrZV9maWxlPSIkdG1ha2VfZmlsZSB0LXNvZnRmcC1zZmRmIHQtc29mdGZwIgogCTs7CiBwZHAx
MS0qLSopCmRpZmYgLS1naXQgYS9saWJnY2MvY29uZmlnL29yMWsvdC1jcnRzdHVmZiBiL2xpYmdj
Yy9jb25maWcvb3Ixay90LWNydHN0dWZmCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwLi5kY2FlN2YzNDk4ZQotLS0gL2Rldi9udWxsCisrKyBiL2xpYmdjYy9jb25maWcvb3Ix
ay90LWNydHN0dWZmCkBAIC0wLDAgKzEsMiBAQAorIyBDb21waWxlIGNydGJlZ2luUy5vIGFuZCBj
cnRlbmRTLm8gd2l0aCAtbWNtb2RlbD1sYXJnZQorQ1JUU1RVRkZfVF9DRkxBR1NfUyArPSAtbWNt
b2RlbD1sYXJnZQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
