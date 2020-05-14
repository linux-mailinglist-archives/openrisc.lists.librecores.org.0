Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 217751D3F7A
	for <lists+openrisc@lfdr.de>; Thu, 14 May 2020 23:00:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0C0DE20B0E;
	Thu, 14 May 2020 23:00:50 +0200 (CEST)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id EA8A120AF4
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 23:00:48 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id f4so1783552pgi.10
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klSQtUtwmC9VOGHvb6s+fbswbin36b9+rvj7+8qM56M=;
 b=XLoOGO3l9e+KwsHZPF+I6N3+5iuN+CpapDJwPWYTnwE6qyacz76vnaWkZssU++rT+/
 Vq4+2RidPJUqUJaFjJnROrY8aKXlSS3E52sftk1yUc03AT8KRlfVOhG7ucpZP8d6b272
 /1Fr1RXu11XP9tTbhNWkJQbXm7V8bv60XXqS+Sex30I6TabllfaYDdE11GzSjnWSyj+4
 veJ2uOn8WFlhuFc27toiOI0J0N+WKMuLdTHdAe0F7/KM0ot/gT0zMd2iZQbAxef3JFHR
 YykxTB7wA5a5kl/8Z8EuOkL6mf+GfqOPSZAckQLt6Rcg3orur0xIW1KvmsTSat7V7l1D
 ztBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klSQtUtwmC9VOGHvb6s+fbswbin36b9+rvj7+8qM56M=;
 b=cB7tITIiq+S1ujcwPonjXqEEcgtopNwZMCflSQixOlZvtkqZ3mqtdxs6WlnB+vMxW/
 UU88BXHY7FD3Bhznvvy93hzpIJlMlJyZcwmECbG8/SsvhqqkPkNVQC6mrGVlmHZE//8j
 yK/b5e1ArEIi6Liz4/juIya8ysMJXvGbN6r452vDkqftsdOUxI8ILrjExbGNGzAzZrrD
 4QF9W1URHiTHV80vK3JHT7WpKNzIovZApZpvlJqgriZbEnqHX9IPhXailtSu0oC+ciUM
 3eqeXqyjnqvspxzIcO/UdOx/2wtI1NYfCISidJojtO8I+O+vu6sTPq0psJwynVPfkrsV
 eN2g==
X-Gm-Message-State: AOAM533GGQznIjSzVQ5j8t2LNBCQTsf4qsjJCPeV4Gz2yUIWWNfryxVT
 TvULOHUIZlpHufywMTTylyDoKqfr
X-Google-Smtp-Source: ABdhPJzU8gbXz/N3mDcUENVGt1XMASXnSwpx4d+Eg5N7N1480w3q+PHYZWjxfJrDIxtfmmHi9jSEsw==
X-Received: by 2002:a63:f856:: with SMTP id v22mr24313pgj.64.1589490047503;
 Thu, 14 May 2020 14:00:47 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id 62sm87329pfu.181.2020.05.14.14.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:00:46 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Fri, 15 May 2020 06:00:15 +0900
Message-Id: <20200514210018.2749462-6-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514210018.2749462-1-shorne@gmail.com>
References: <20200514210018.2749462-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 5/8] or1k: TLS offset to use tcb size and section
 alignment
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

VGhlIG9mZnNldCB3YXMgd3JvbmcgYW5kIGNhdXNpbmcgaXNzdWVzIHdoZW4gdGhlIFRMUyBzZWN0
aW9uIGFsaWdubWVudAppcyBsYXJnZXIgdGhhbiBUQ0JfU0laRS4KCkluIG9yMWsgd2UgaGF2ZToK
CiAgICAgICAgICAgICAgICAgLy0gVFAKICAgICAgICAgICAgICAgIFYKWyBQdGhyZWFkIHwgVENC
IDB4MCAweDAgMHgwIHwgVERBVEEgLCBUQlNTIF0KCkhlcmUgVERBVEEgaXMgbm90IGF0IFRQLCBi
dXQgVERBVEEgaXMgb2Zmc2V0IGJ5IHRoZSBhbGlnbm1lbnQuICBUUCBwb2ludHMKdG8ganVzdCBh
ZnRlciB0aGUgVENCLiAgV2l0aCB0aGlzIHBhdGNoIEkgYWRqdXN0IGZvciB0aGF0IFRDQiBwYWRk
aW5nCmR1ZSB0byBhbGlnbm1lbnQgd2hpY2ggd2FzIG5vdCBiZWluZyBwcm9wZXJseSBhY2NvdW50
ZWQgZm9yIGJlZm9yZS4KClRoaXMgYWxsb3dzIGdsaWJjIG5wdGwgYW5kIGVsZiB0ZXN0cyB0byBw
YXNzLgoKYmZkL0NoYW5nZUxvZzoKCnl5eXktbW0tZGQgIFN0YWZmb3JkIEhvcm5lICA8c2hvcm5l
QGdtYWlsLmNvbT4KCgkqIGVsZjMyLW9yMWsuYyAoVENCX1NJWkUpOiBOZXcgbWFjcm8uCgkodHBv
ZmYpOiBVc2UgVENCX1NJWkUgYW5kIGFsaWdubWVudCB0byBjYWxjdWxhdGUgb2Zmc2V0LgotLS0K
IGJmZC9lbGYzMi1vcjFrLmMgfCAxNSArKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JmZC9lbGYzMi1v
cjFrLmMgYi9iZmQvZWxmMzItb3Ixay5jCmluZGV4IGVlZTQxOGM1NTguLmNhMWI2MWZlMWMgMTAw
NjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIvYmZkL2VsZjMyLW9yMWsuYwpAQCAtODg0
LDYgKzg4NCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3Ixa19yZWxvY19tYXAgb3Ixa19yZWxv
Y19tYXBbXSA9CiAjZGVmaW5lIFRMU19JRQkgICAgICAgOAogI2RlZmluZSBUTFNfTEUJICAgICAg
MTYKIAorLyogVGhlIHNpemUgb2YgdGhlIFRMUyB0aHJlYWQgY29udHJvbCBibG9jaywgdXNlZCB0
byBvZmZzZXQgTEUgYWNjZXNzLiAgKi8KKyNkZWZpbmUgVENCX1NJWkUgICAgICAxNgorCiAvKiBF
TEYgbGlua2VyIGhhc2ggZW50cnkuICAqLwogc3RydWN0IGVsZl9vcjFrX2xpbmtfaGFzaF9lbnRy
eQogewpAQCAtMTA1MiwxNCArMTA1NSwyMiBAQCBvcjFrX2luZm9fdG9faG93dG9fcmVsYSAoYmZk
ICogYWJmZCwKIHN0YXRpYyBiZmRfdm1hCiB0cG9mZiAoc3RydWN0IGJmZF9saW5rX2luZm8gKmlu
Zm8sIGJmZF92bWEgYWRkcmVzcykKIHsKKyAgc3RydWN0IGVsZl9saW5rX2hhc2hfdGFibGUgKmh0
YWIgPSBlbGZfaGFzaF90YWJsZSAoaW5mbyk7CisgIGJmZF92bWEgYmFzZTsKKwogICAvKiBJZiB0
bHNfc2VjIGlzIE5VTEwsIHdlIHNob3VsZCBoYXZlIHNpZ25hbGxlZCBhbiBlcnJvciBhbHJlYWR5
LiAgKi8KLSAgaWYgKGVsZl9oYXNoX3RhYmxlIChpbmZvKS0+dGxzX3NlYyA9PSBOVUxMKQorICBp
ZiAoaHRhYi0+dGxzX3NlYyA9PSBOVUxMKQogICAgIHJldHVybiAwOwogCisgIC8qIE9uIG9yMWss
IHRoZSB0cCBwb2ludHMgdG8ganVzdCBhZnRlciB0aGUgdGNiLCBpZiB3ZSBoYXZlIGFuIGFsaWdu
bWVudAorICAgICBncmVhdGVyIHRoYW4gdGhlIHRjYiBzaXplIHdlIG5lZWQgdG8gb2Zmc2V0IGJ5
IHRoZSBhbGlnbm1lbnQgZGlmZmVyZW5jZS4gICovCisgIGJhc2UgPSBhbGlnbl9wb3dlciAoKGJm
ZF92bWEpIFRDQl9TSVpFLCBodGFiLT50bHNfc2VjLT5hbGlnbm1lbnRfcG93ZXIpCisJIC0gVENC
X1NJWkU7CisKICAgLyogVGhlIHRocmVhZCBwb2ludGVyIG9uIG9yMWsgc3RvcmVzIHRoZSBhZGRy
ZXNzIGFmdGVyIHRoZSBUQ0Igd2hlcmUKICAgICAgdGhlIGRhdGEgaXMsIGp1c3QgY29tcHV0ZSB0
aGUgZGlmZmVyZW5jZS4gTm8gbmVlZCB0byBjb21wZW5zYXRlCiAgICAgIGZvciB0aGUgc2l6ZSBv
ZiBUQ0IuICAqLwotICByZXR1cm4gKGFkZHJlc3MgLSBlbGZfaGFzaF90YWJsZSAoaW5mbyktPnRs
c19zZWMtPnZtYSk7CisgIHJldHVybiBhZGRyZXNzIC0gaHRhYi0+dGxzX3NlYy0+dm1hICsgYmFz
ZTsKIH0KIAogLyogSWYgd2UgaGF2ZSBib3RoIElFIGFuZCBHRCBhY2Nlc3NlcyB0byBhIHN5bWJv
bCB0aGUgSUUgcmVsb2NhdGlvbnMgc2hvdWxkIGJlCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
