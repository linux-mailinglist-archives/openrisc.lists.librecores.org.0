Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3464DE7B9
	for <lists+openrisc@lfdr.de>; Sat, 19 Mar 2022 12:52:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B91D924802;
	Sat, 19 Mar 2022 12:52:27 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by mail.librecores.org (Postfix) with ESMTPS id 1A2572406B
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 12:52:26 +0100 (CET)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mr8SG-1nquCt2uj0-00oCql for <openrisc@lists.librecores.org>; Sat, 19 Mar
 2022 12:52:25 +0100
Received: by mail-wr1-f46.google.com with SMTP id j10so1817772wrb.13
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 04:52:25 -0700 (PDT)
X-Gm-Message-State: AOAM531ZrrtsAPl/e13x3DPKtK2bJq/ecOarjl35HQnclf4EG30/b+IA
 IxTwu63LcE6ETfFhopfzDPhlVuWwEEA5D8vE9u4=
X-Google-Smtp-Source: ABdhPJzOqE/Bj2845oGYA9I/vUafx6lRNFhtD7eJ9j8Ek6fjOIipAB1M/2KUUME6tL7BmWOlQ180nTuXODQbbfNP21U=
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr4299612wrw.12.1647690745320; Sat, 19
 Mar 2022 04:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
In-Reply-To: <20220319035457.2214979-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 19 Mar 2022 12:52:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
Message-ID: <CAK8P3a3wMJv6-fGo_i4DnFMigj=ko4DN1XTe8oa1HzWLiX50yw@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
X-Provags-ID: V03:K1:TmfA3IrRW6m6NGMPfZbFwDSRFUIKiu/9ckvM6YV0nChJeLsCEN5
 /g5Evo+uU+xJ0voE1Fcq5EGQy4zmrcRYWYgrBBzWOZupBigMtkQkTaqs87i75oErRs+J8pC
 1A6MPzctFc4hetfnPU+xjEYhxt8wosZ67FgZeWayy0LQZIKUPWs6Jdkntwrvtm7u44DhfuJ
 HpuEflFLck0bfrjsdr0Sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UemhY5LmyHM=:mKZDHfoE20WLgkXXaY0eDs
 d9/ee+99+ISZtiy976d2e5oX7HhU1uhC/y0ySeZAAdEVb9aes5R0FZlP9LFcr6YaB71DyPl5x
 6mLHsl4VsOQb3pj+fU8L+6Gpu2Jj2CaAMZF91Ea5ZbNyYazs1GmOufuT32+JuJCtM091Wus7Q
 69tS9N0BOXvDdfFzv3HC2/iwWd3rjbhcRZafZX5SMxv0d5fylLIUGThCNUu2IvZYeSa8Ytn4z
 Zi/sIy1UdEO5QrW9/bws3c61r6gfKiB77IzJaPt2xrvzRFoFLOG0E1hREh/n6gmNAwqesfLCK
 tnua9XzuLp4yv/SQgbd6fOyeVajQG8vULGk7HTtl0NHeIL36rLmPFLaXnaR7LRNUzQRArwzJ3
 qwoQqEBhvjJ8/S1xnR5ZNgnRXCQteuBIowWwqopKblL1Daci5Kr+kFFVltPM4M1p6q15rxjLk
 tmd9oABmlD3KA8xQxx1QeTM+at7jqQC7L0DZNsQbMzi0wnfTqbc/A23iPprat9TtZEOPlvBWU
 PhQgoHjO/YRxkFlEmudNWNeI4X/nuHA+USpYfNxyVbD8JBAElvY1NcjVrJ/1Fb9Ai6bkXjeC+
 a2E7pCDmUu5u6N21oVfSuguKBe6nn57WGFRsu41ix2l+YaMo3bzz4ZRNljRaP/Wmz3hpQ+RS9
 CC5XX1QWefrg31EimSO1AjX01usGInGYyMYWouRU1jWhphQpR706rEhWD2f7PmEioKgztlxLd
 WhQ5DyWKbSHHY2wWM51we9aOpY6BHhDtmQv8rZtwxDgc+imtr248RA9vhU/UERvRFkyHnrdRr
 nN2u0Molr2JfAoOD+WLQPbNgqe+q7b/G2VoXLO/ie9bksbClPI=
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBNYXIgMTksIDIwMjIgYXQgNDo1NCBBTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ICAvKgo+IC0gKiBZb3UgbmVlZCB0byBpbXBsZW1lbnQgYXNtL3NwaW5sb2NrLmggZm9yIFNN
UCBzdXBwb3J0LiBUaGUgZ2VuZXJpYwo+IC0gKiB2ZXJzaW9uIGRvZXMgbm90IGhhbmRsZSBTTVAu
Cj4gKyAqIFVzaW5nIHRpY2tldC1zcGlubG9jay5oIGFzIGdlbmVyaWMgZm9yIFNNUCBzdXBwb3J0
Lgo+ICAgKi8KPiAgI2lmZGVmIENPTkZJR19TTVAKPiAtI2Vycm9yIG5lZWQgYW4gYXJjaGl0ZWN0
dXJlIHNwZWNpZmljIGFzbS9zcGlubG9jay5oCj4gKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy90aWNr
ZXQtbG9jay5oPgo+ICsjaWZkZWYgQ09ORklHX1FVRVVFRF9SV0xPQ0tTCj4gKyNpbmNsdWRlIDxh
c20tZ2VuZXJpYy9xcndsb2NrLmg+Cj4gKyNlbHNlCj4gKyNlcnJvciBQbGVhc2Ugc2VsZWN0IEFS
Q0hfVVNFX1FVRVVFRF9SV0xPQ0tTIGluIGFyY2hpdGVjdHVyZSBLY29uZmlnCj4gKyNlbmRpZgo+
ICAjZW5kaWYKClRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSAhQ09ORklHX1NNUCBjYXNlLCBhcyBh
c20vc3BpbmxvY2suaCBvbmx5IGV2ZXIKZ2V0cyBpbmNsdWRlZCBmb3IgU01QIGJ1aWxkcyBpbiB0
aGUgZmlyc3QgcGxhY2UuIFRoaXMgd2FzIGFscmVhZHkgYSBtaXN0YWtlCmluIHRoZSBleGlzdGlu
ZyBjb2RlLCBidXQgeW91ciBjaGFuZ2Ugd291bGQgYmUgdGhlIHRpbWUgdG8gZml4IGl0LgoKSSB3
b3VsZCBhbHNvIGRyb3AgdGhlICFDT05GSUdfUVVFVUVEX1JXTE9DS1MgY2FzZSwganVzdCBpbmNs
dWRlCml0IHVuY29uZGl0aW9uYWxseS4gSWYgYW55IGFyY2hpdGVjdHVyZSB3YW50cyB0aGUgdGlj
a2V0IHNwaW5sb2NrIGluCmNvbWJpbmF0aW9uIHdpdGggYSBjdXN0b20gcndsb2NrLCB0aGV5IGNh
biBzaW1wbHkgaW5jbHVkZSB0aGUKYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaCBmcm9tIHRoZWly
IGFzbS9zcGlubG9jay5oLCBidXQgbW9yZQpsaWtlbHkgYW55IGFyY2hpdGVjdHVyZSB0aGF0IGNh
biB1c2UgdGhlIHRpY2tldCBzcGlubG9jayB3aWxsIGFsc28Kd2FudCB0aGUgcXJ3bG9jayBhbnl3
YXkuCgogICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
