Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CB97720B68E
	for <lists+openrisc@lfdr.de>; Fri, 26 Jun 2020 19:07:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3D97320C8A;
	Fri, 26 Jun 2020 19:07:29 +0200 (CEST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mail.librecores.org (Postfix) with ESMTPS id 5FFE920B6B
 for <openrisc@lists.librecores.org>; Fri, 26 Jun 2020 19:07:27 +0200 (CEST)
Received: by mail-wm1-f42.google.com with SMTP id o8so9478817wmh.4
 for <openrisc@lists.librecores.org>; Fri, 26 Jun 2020 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=10xSf74848Xm/8TBSU5guhPMw0q63uP9+l0B1/O7ECw=;
 b=ZUhhafDSYSxjd9awq6HjhqajvRnmlozTQNr+DWBahTFfZWnqZ/DhOgsrBX6i6DlYyj
 mV4XE4ZYST4YYJR9mehUtWlhevUqU1craexepzjUaUfV2QKXOiqCY8BlK2Oc12Xgb7rn
 yoQYoP8r7uj3catqp9y/jmpCpAgqyHABW8B/Gz0IUF5KXdHcVyV4yXswwzkt+q1xwJEH
 L8w8PoT9TlCcgnqxpEuUvCkYPJAAvfImdisRtV8zMIptnUEmdCXnETdCZsN8fx/7HVCX
 6PNcyht1ZYgM2VGwe8JHVbUXF2TNMKdNaTFsdhIZE/dAJTClT/gbx/zxWEc3pp0X/YEm
 I75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=10xSf74848Xm/8TBSU5guhPMw0q63uP9+l0B1/O7ECw=;
 b=UezjXRBwP4oyocKUNTrev2gEqgfdaERbj2L7dcmfK4372tGoAJYCiqLcKiHe+ucs+d
 4gwFHVZ4xJULPaJxKNGZQ6oSd3MyLIVw4eWOoQC+o01b+fs8UZiLe/svbApDef42F7An
 Fob476rggt3GYafEwWoZ1HdRqgOEQWdGID7dMgQotRzfkac2jEtQc2A2Uto+aT9P4rE4
 JapBVUFZmwxApvJffQaAOuESFrLtcdiL2NWeIgiZiWSArtpGQh5wDlz+ElZcQTgUpdoh
 /GlVDZOSiYeYN+bnjm2TJOjfb4GkMe9e0CvWkX4xbyggQ+N93wf6K4wWUKHPClsc+WCZ
 V5aQ==
X-Gm-Message-State: AOAM531i9jHuMhtsAmhYySYZFw+S716anitvtCqxT3h5Jm4BYClXiT5w
 oetCEgG5g7XfDqXrXy0iWKrBbQ==
X-Google-Smtp-Source: ABdhPJyWe906EkWcmZUM3rqQbYMSObruu3ljAMCfj0axVKRm2Zr/HV50iK4mANwds2XxKAH8mtxF4w==
X-Received: by 2002:a7b:cb0f:: with SMTP id u15mr4504726wmj.34.1593191246805; 
 Fri, 26 Jun 2020 10:07:26 -0700 (PDT)
Received: from [192.168.0.136] ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id a12sm27525187wrv.41.2020.06.26.10.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 10:07:26 -0700 (PDT)
To: openrisc@lists.librecores.org
References: <c780c80d-18a8-9ba1-1bf2-5c10ea7c6b34@philipp-wagner.com>
From: Simon Cook <simon.cook@embecosm.com>
Autocrypt: addr=simon.cook@embecosm.com; keydata=
 mQENBFAPuJ8BCADhASqiUlALs4qQR4LfP20I7tMM61UaH97U+Wc+476rj++2mBSivQcLjpVm
 WC2b0d/9BV9voQUcE3doK8IUUNYHtH7rKUh5adTNVoAa57aCQ4AhRXsqsuGT4Y9FIvp3xh7X
 jLd/vRd8LDfvyu9e/VhREYXj7fTtORERjkSLCpNxPjWV0Sf2AuxrglenEyVL8YG5IOo0H0Zx
 +QSRm7ce4ys6RRVunBbc0grUibrQrRUWTolBOlnTCAh4yqRCp8gdbhucwoHKOOQdGbL0cNYP
 3/Y5qZpQYUGE14P51tPG2eu2s1Of80EpxvEA83/cn2khq8CiFd1OybIGOI9mbPe9/LydABEB
 AAG0L1NpbW9uIENvb2sgKEVtYmVjb3NtKSA8c2ltb24uY29va0BlbWJlY29zbS5jb20+iQE4
 BBMBAgAiBQJQD7ifAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCvHwiN3n4eAp/u
 CACbju8sXoe+eSyGkNkV6tI5b5pBbBkNInk4thHmTQHP35QA5pgRJCcy0LEsSH3qJDdoY777
 uy+5V6D9wJYpYjD4aRMg1q09TDBXVIxGlVczIE6YA2dkqWQdWSdYVsSlQrsb0gB5tOgtqvqT
 FsBFilak0Rk12LcjQQmctHuLrfTPn9KStoC6oUaYrgwbdNdyGcC55ocn9pMnU1XXR6Lm1mxO
 2040kVzzRL8GSsq/ntudMVugNQnDHTALwbBgW8d/MWZYsBhsBrlIvVmxMo4sXd1HxKw6lyNN
 OdHNmOcvSYB0mojrieIqkcc7HyP2CttHVB9Y7jgYnX7nk+rQzvwPpZTwuQENBFAPuJ8BCADF
 lin0UFXF0pLv//eBtGwy5JQsIl7aXo8cFkCXRAgqfSPyTiVnjcj9DnohDZ3gopg7Xsc/SqhD
 wAUrqOnrni4dz0Xe0gXdwXebzJVTIoV6xDvdrHwsJBKR5Y9NEut84josnlCObbtMbuf5QuX6
 okAyRwoqT4uAC3aYWIHq7bvyyihnajJ0q+nfTJA0zFI2N4mHeXSdQdc5NUvPpyhkUVA2SqK6
 wtifB3lsOoK+oiA8UVnnKytCPg3l/9CI2mlAi+VvW2o8ToYZfm9ozOFWuwm0qQ/8l0O0US+2
 NpVWkI9DxJn7841xT2/LmUJ36H1gtjQPAA6hOJU4JdQecFsyscVPABEBAAGJAR8EGAECAAkF
 AlAPuJ8CGwwACgkQrx8Ijd5+HgLQ9QgAxDraEYjZkqj6v6VYgQPzh4q5yKJDsH+5PMbzyzzP
 5qQhJ1yBhZ7DStxtwgTlm0wAUFzUn53cn0C6yuzBTP+bvwqiYDO/Lhc0ri2Nelp8L5fVnZTW
 IV5jM1zYq3663hM3t4W8b4tSEUflk9bf06oLhTyLaGm6ikP6pOsNYDv+ywnOulUyg7Z5UFMW
 FiG+wDyVaslpYFiezX+poi4c/8dj1cWm7GFzsK3Atp8HC00DNIQVT+51uzmKRgYPdbBnElYb
 jcs/IWouPZtCuvyj8aPBrwgIMT/y+kb80aWkv3bba9kDMQJ6jLsKOOMHHdSWt5MfvLJwPxWk
 mdgGk/hXlwF0yQ==
Message-ID: <4fabc84a-ee0e-d36b-52e6-555ccccf0045@embecosm.com>
Date: Fri, 26 Jun 2020 18:07:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c780c80d-18a8-9ba1-1bf2-5c10ea7c6b34@philipp-wagner.com>
Content-Language: en-GB
Subject: Re: [OpenRISC] Binary builds of or1k newlib toolchain?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgUGhpbGlwcCwKCkknbSBub3Qgc3VyZSBpZiBzb21ld2hlcmUgaGFzIHByZS1idWlsdCB0b29s
Y2hhaW5zIGFscmVhZHkgZm9yIHRoZQpsYXRlc3Qgc3RhYmxlIHJlbGVhc2VzLCBidXQgSSd2ZSBu
b3cgc3RhcnRlZCB0byBkbyB3ZWVrbHkgYnVpbGRzIG9mCk9wZW5SSVNDIGJhcmUgbWV0YWwgdG9v
bGNoYWlucyBiYXNlZCBvbiB0b3Agb2YgdHJlZToKCmh0dHBzOi8vd3d3LmVtYmVjb3NtLmNvbS9y
ZXNvdXJjZXMvdG9vbC1jaGFpbi1kb3dubG9hZHMvI29wZW5yaXNjCgpPdXIgYnVpbGQgbWFjaGlu
ZXMgZ2VuZXJhdGUgYSBuZXcgc2V0IG9mIHRvb2xjaGFpbnMgZXZlcnkgU3VuZGF5Cm1vcm5pbmcs
IGFuZCB0aGVuIEkgdXBkYXRlIHRoYXQgd2VicGFnZSBvbiBNb25kYXkgbW9ybmluZyBpZiB0aGUg
dG9vbHMKbG9vayBnb29kLCBzbyB0aGF0IHBhZ2Ugc2hvdWxkIGJlIHByZXR0eSB1cCB0byBkYXRl
LgoKSSdsbCBwcm9iYWJseSBidWlsZCBhbmQgcHVibGlzaCBzb21lIHRvb2xjaGFpbnMgYmFzZWQg
b24gdGhlIDEwLjEgc3RhYmxlCnJlbGVhc2UgZWFybHkgbmV4dCB3ZWVrLCBidXQgaWYgYmxlZWRp
bmcgZWRnZSBpcyBnb29kIHRoZXJlIGFyZSBzb21lCnRoZXJlIG5vdy4gVG9vbGNoYWlucyBmb3Ig
dGhvc2UgcnVubmluZyBtYWNPUyBvciBXaW5kb3dzIHdpbGwgYXBwZWFyIGF0CnRoZSBzYW1lIHRp
bWUuCgpJJ3ZlIHRlc3RlZCB0aGVzZSB3aXRoIHRoZSBHQ0MgcmVncmVzc2lvbiBhbmQgdGhleSBs
b29rIG9rLCBidXQgaWYKYW55dGhpbmcgbG9va3MgaG9ycmlibHkgd3JvbmcgbGV0IG1lIGtub3cg
YW5kIEkgY2FuIHVwZGF0ZSBidWlsZCBzdGVwcwpmb3IgdGhlIG5leHQgd2Vla3MgYnVpbGQuCgpU
aGFua3MsClNpbW9uCgpPbiAyMi8wNi8yMDIwIDEwOjA2LCBQaGlsaXBwIFdhZ25lciB3cm90ZToK
PiBIaSwKPiAKPiBXaXRoIE9wVGlNU29DLCB3ZSBwcmV2aW91c2x5IHVzZWQgcHJlYnVpbHQgR0ND
L25ld2xpYiB0b29sY2hhaW5zIGZyb20KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbmV3
bGliL3JlbGVhc2VzLgo+IAo+IE5vdyB0aGF0IGV2ZXJ5dGhpbmcgaXMgdXBzdHJlYW0sIGlzIHRo
ZXJlIGFub3RoZXIgcGxhY2UgZm9yIHByZS1idWlsdAo+IHRvb2xjaGFpbnM/Cj4gCj4gCj4gVGhh
bmtzIQo+IAo+IFBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
