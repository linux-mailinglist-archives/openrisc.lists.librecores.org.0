Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5298C1FECC0
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E2C8220B76;
	Thu, 18 Jun 2020 09:47:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id 19C6C20CB9
 for <openrisc@lists.librecores.org>; Tue, 16 Jun 2020 23:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592341398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrv6u/IyjeoGyX7Yz14HGrcrd86qr4fiQrLVf2Tt4MM=;
 b=RO2ejTt8EL6Sp6wQwtQ6NSI4gYPDYTK7xHNi8UfCeXCPFRF+zJFEEOG8nUTl1Mk+QEtO6p
 ynSunFbGZn+EWwJYC+MUmefDTJ/AoVbDvIiwXPZ59wBgWPyRb2Th+NXZzfEZeScWrid6mO
 gUJy8X5SyVX4RhdubudP6l7m2YyZ3qQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177--dX3CFpoMAqZcxykzCwUSg-1; Tue, 16 Jun 2020 17:03:16 -0400
X-MC-Unique: -dX3CFpoMAqZcxykzCwUSg-1
Received: by mail-qv1-f70.google.com with SMTP id r15so47969qvv.5
 for <openrisc@lists.librecores.org>; Tue, 16 Jun 2020 14:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jrv6u/IyjeoGyX7Yz14HGrcrd86qr4fiQrLVf2Tt4MM=;
 b=JF1gcPA/Da/qE0QsqblQfL+aGEjcRFDsnTh8U3CJ9ChdgprmQGs9/w3wrCPoyjmnml
 NJyAbLZPwMddfvKQSw844zXYHj5Wch9xF/hbt0GDDVbvXmSqdH2ebJWNJHXp2vei9zK0
 eLcto8RYASeE279rByk0bn8xbG2Kz+9QmbHLoOV33Nz1zqt6cpT2lSrGmLC6M3c8PAGG
 vJLHimN4gV9uAF0BjGZj6V4W/3zYIKCiWZhgk4HJAiLHDkWrri0zsncUsU4tkMhNICe4
 83LPTr9YBYZsM5xBSmorpiqnZiJEXli6K5blE54LvJKE1PQ1VswRPdTA5E8gkw9cGcCY
 QTnw==
X-Gm-Message-State: AOAM53139a9dhDs38SLLUrMs6Au4wMMgp687OJhhkFXNRdLF4WCeFovd
 eZbq+jLFFh8dh5tiaC44lhE9Qbljfi6zGS/cWObJvwU0a/5lvolTxGh5fr+ypj0DCLar2kcLw9k
 nZAhPNXuMJbMZIJkrfglmqcMpaA==
X-Received: by 2002:ac8:6ec5:: with SMTP id f5mr23634397qtv.163.1592341395538; 
 Tue, 16 Jun 2020 14:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF61Dh2xefzBMPBEm2C7AoRpqAxg6bYegNDhmpzkQWpsDpqFwc6dGag1E30rH+tRg9dP4ZMQ==
X-Received: by 2002:ac8:6ec5:: with SMTP id f5mr23634348qtv.163.1592341395148; 
 Tue, 16 Jun 2020 14:03:15 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id 6sm13935183qkl.26.2020.06.16.14.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 14:03:14 -0700 (PDT)
Date: Tue, 16 Jun 2020 17:03:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200616210312.GF11838@xz-x1>
References: <20200615221607.7764-1-peterx@redhat.com>
 <CAHk-=wiTjaXHu+uxMi0xCZQOm4KVr0MucECAK=Zm4p4YZZ1XEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiTjaXHu+uxMi0xCZQOm4KVr0MucECAK=Zm4p4YZZ1XEg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] [PATCH 00/25] mm: Page fault accounting cleanups
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMTYsIDIwMjAgYXQgMTE6NTU6MTdBTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMzoxNiBQTSBQZXRlciBYdSA8cGV0ZXJ4
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoaXMgc2VyaWVzIHRyaWVzIHRvIGFkZHJlc3Mg
YWxsIG9mIHRoZW0gYnkgaW50cm9kdWNpbmcgbW1fZmF1bHRfYWNjb3VudGluZygpCj4gPiBmaXJz
dCwgc28gdGhhdCB3ZSBtb3ZlIGFsbCB0aGUgcGFnZSBmYXVsdCBhY2NvdW50aW5nIGludG8gdGhl
IGNvbW1vbiBjb2RlIGJhc2UsCj4gPiB0aGVuIGNhbGwgaXQgcHJvcGVybHkgZnJvbSBhcmNoIHBm
IGhhbmRsZXJzIGp1c3QgbGlrZSBoYW5kbGVfbW1fZmF1bHQoKS4KPiAKPiBIbW0uCj4gCj4gU28g
aGF2aW5nIGxvb2tlZCBhdCB0aGlzIGEgYml0IG1vcmUsIEknZCBhY3R1YWxseSBsaWtlIHRvIGdv
IGV2ZW4KPiBmdXJ0aGVyLCBhbmQganVzdCBnZXQgcmlkIG9mIHRoZSBwZXItYXJjaGl0ZWN0dXJl
IGNvZGUgX2VudGlyZWx5Xy4KPiAKPiBIZXJlJ3MgYSBzdHJhdy1tYW4gcGF0Y2ggdG8gdGhlIGdl
bmVyaWMgY29kZSAtIHRoZSBpZGVhIGlzIG1vc3RseSBsYWlkCj4gb3V0IGluIHRoZSBjb21tZW50
IHRoYXQgSSdtIGp1c3QgcXVvdGluZyBoZXJlIGRpcmVjdGx5IHRvbzoKPiAKPiAgICAgICAgIC8q
Cj4gICAgICAgICAgKiBEbyBhY2NvdW50aW5nIGluIHRoZSBjb21tb24gY29kZSwgdG8gYXZvaWQg
dW5uZWNlc3NhcnkKPiAgICAgICAgICAqIGFyY2hpdGVjdHVyZSBkaWZmZXJlbmNlcyBvciBkdXBs
aWNhdGVkIGNvZGUuCj4gICAgICAgICAgKgo+ICAgICAgICAgICogV2UgYXJiaXRyYXJpbHkgbWFr
ZSB0aGUgcnVsZXMgYmU6Cj4gICAgICAgICAgKgo+ICAgICAgICAgICogIC0gZmF1bHRzIHRoYXQg
bmV2ZXIgZXZlbiBnb3QgaGVyZSAoYmVjYXVzZSB0aGUgYWRkcmVzcwo+ICAgICAgICAgICogICAg
d2Fzbid0IHZhbGlkKS4gVGhhdCBpbmNsdWRlcyBhcmNoX3ZtYV9hY2Nlc3NfcGVybWl0dGVkKCkK
PiAgICAgICAgICAqICAgIGZhaWxpbmcgYWJvdmUuCj4gICAgICAgICAgKgo+ICAgICAgICAgICog
ICAgU28gdGhpcyBpcyBleHByZXNzbHkgbm90IGEgInRoaXMgbWFueSBoYXJkd2FyZSBwYWdlCj4g
ICAgICAgICAgKiAgICBmYXVsdHMiIGNvdW50ZXIuIFVzZSB0aGUgaHcgcHJvZmlsaW5nIGZvciB0
aGF0Lgo+ICAgICAgICAgICoKPiAgICAgICAgICAqICAtIGluY29tcGxldGUgZmF1bHRzIChpZSBS
RVRSWSkgZG8gbm90IGNvdW50IChzZWUgYWJvdmUpLgo+ICAgICAgICAgICogICAgVGhleSB3aWxs
IG9ubHkgY291bnQgb25jZSBjb21wbGV0ZWQuCj4gICAgICAgICAgKgo+ICAgICAgICAgICogIC0g
dGhlIGZhdWx0IGNvdW50cyBhcyBhICJtYWpvciIgZmF1bHQgd2hlbiB0aGUgZmluYWwKPiAgICAg
ICAgICAqICAgIHN1Y2Nlc3NmdWwgZmF1bHQgaXMgVk1fRkFVTFRfTUFKT1IsIG9yIGlmIGl0IHdh
cyBhCj4gICAgICAgICAgKiAgICByZXRyeSAod2hpY2ggaW1wbGllcyB0aGF0IHdlIGNvdWxkbid0
IGhhbmRsZSBpdAo+ICAgICAgICAgICogICAgaW1tZWRpYXRlbHkgcHJldmlvdXNseSkuCj4gICAg
ICAgICAgKgo+ICAgICAgICAgICogIC0gaWYgdGhlIGZhdWx0IGlzIGRvbmUgZm9yIEdVUCwgcmVn
cyB3aWwgYmUgTlVMTCBhbmQKPiAgICAgICAgICAqICAgIG5vIGFjY291bnRpbmcgd2lsbCBiZSBk
b25lIChidXQgeW91IF9jb3VsZF8gcGFzcyBpbgo+ICAgICAgICAgICogICAgeW91ciBvd24gcmVn
cyBhbmQgaXQgd291bGQgYmUgYWNjb3VudGVkIHRvIHRoZSB0aHJlYWQKPiAgICAgICAgICAqICAg
IGRvaW5nIHRoZSBmYXVsdCwgbm90IHRvIHRoZSB0YXJnZXQhKQo+ICAgICAgICAgICovCj4gCj4g
dGhlIGNvZGUgaXRzZWxmIGluIHRoZSBwYXRjaCBpcwo+IAo+ICAoYSkgcHJldHR5IHRyaXZpYWwg
YW5kIHNlbGYtZXZpZGVudAo+IAo+ICAoYikgSU5DT01QTEVURQo+IAo+IHRoYXQgKGIpIGlzIHdv
cnRoIG5vdGluZzogdGhpcyBwYXRjaCB3b24ndCBjb21waWxlIG9uIGl0cyBvd24uIEl0Cj4gaW50
ZW50aW9uYWxseSBsZWF2ZXMgYWxsIHRoZSB1c2VycyB3aXRob3V0IHRoZSBuZXcgJ3JlZ3MnIGFy
Z3VtZW50LAo+IGJlY2F1c2UgeW91IG9idmlvdXNseSBzaW1wbHkgbmVlZCB0byByZW1vdmUgYWxs
IHRoZSBjb2RlIHRoYXQKPiBjdXJyZW50bHkgdHJpZXMgdG8gZG8gYW55IGFjY291bnRpbmcuCj4g
Cj4gQ29tbWVudHM/CgpMb29rcyBjbGVhbiB0byBtZS4gIFRoZSBkZWZpbml0aW9uIG9mICJtYWpv
ciBmYXVsdHMiIHdpbGwgc2xpZ2h0bHkgY2hhbmdlIGV2ZW4KZm9yIHRob3NlIHdobyBoYXMgZG9u
ZSB0aGUgIm1ham9yIHw9IGZhdWx0ICYgTUFKT1IiIG9wZXJhdGlvbnMgYmVmb3JlLCBidXQgYXQK
bGVhc3QgSSBjYW4ndCBzZWUgYW55dGhpbmcgYmFkIGFib3V0IHRoYXQgZWl0aGVyLi4uCgpUbyBt
YWtlIHRoaW5ncyBlYXNpZXIsIHdlIGNhbiB1c2UgdGhlIDFzdCBwYXRjaCB0byBpbnRyb2R1Y2Ug
dGhpcyBjaGFuZ2UsCmhvd2V2ZXIgcGFzcyByZWdzPT1OVUxMIGF0IHRoZSBjYWxsZXJzIHRvIG5l
dmVyIHRyaWdnZXIgdGhpcyBhY2NvdW50aW5nLiAgVGhlbgp3ZSBjYW4gc3RpbGwgdXNlIG9uZSBw
YXRjaCBmb3IgZWFjaCBhcmNoIHRvIGRvIHRoZSBmaW5hbCBjb252ZXJ0aW9ucy4KCj4gCj4gVGhp
cyBpcyBhIGJpZ2dlciBjaGFuZ2UsIGJ1dCBJIHRoaW5rIGl0IG1pZ2h0IGJlIHdvcnRoIGl0IHRv
IF9yZWFsbHlfCj4gY29uc29saWRhdGUgdGhlIG1ham9yL21pbm9yIGxvZ2ljLgo+IAo+IE9uZSBk
ZXRhaWwgd29ydGggbm90aW5nOiBJIGRvIHdvbmRlciBpZiB3ZSBzaG91bGQgcHV0IHRoZQo+IAo+
ICAgICBwZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfUEFHRV9GQVVMVFMsIDEsIHJlZ3MsIGFk
ZHIpOwo+IAo+IGp1c3QgaW4gdGhlIGFyY2ggY29kZSBhdCB0aGUgdG9wIG9mIHRoZSBmYXVsdCBo
YW5kbGluZywgYW5kIGNvbnNpZGVyCj4gaXQgZW50aXJlbHkgdW5yZWxhdGVkIHRvIHRoZSBtYWpv
ci9taW5vciBmYXVsdCBoYW5kbGluZy4gVGhlCj4gbWFqb3IvbWlub3IgZmF1bHRzIGZ1bmRhbW5l
dGFsbHkgYXJlIGFib3V0IHN1Y2Nlc3Nlcy4gQnV0IHRoZSBwbGFpbgo+IFBFUkZfQ09VTlRfU1df
UEFHRV9GQVVMVFMgY291bGQgYmUgYWJvdXQgdGhpbmdzIHRoYXQgZmFpbCwgaW5jbHVkaW5nCj4g
dGhpbmdzIHRoYXQgbmV2ZXIgZXZlbiBnZXQgdG8gdGhpcyBwb2ludCBhdCBhbGwuCj4gCj4gSSdt
IG5vdCBjb252aW5jZWQgaXQncyB1c2VmdWwgdG8gaGF2ZSB0aHJlZSBTVyBldmVudHMgdGhhdCBh
cmUgZGVmaW5lZAo+IHRvIGJlIEE9QitDLgoKSU1ITyBpdCdzIHN0aWxsIGNvbW1vbiB0byBoYXZl
IGEgInRvdGFsIiBzdGF0aXN0aWNzIGluIHNvZnR3YXJlcyBldmVuIGlmIGVhY2gKb2YgdGhlIHN1
YnNldHMgYXJlIGFjY291bnRlZCBzZXBhcmF0ZWx5LiAgSGVyZSBpdCdzIGp1c3QgYSBiaXQgc3Bl
Y2lhbCBiZWNhdXNlCnRoZXJlJ3JlIG9ubHkgdHdvIGVsZW1lbnRzIHNvIHRoZSBhZGRpdGlvbiBp
cyBzbyBzdHJhaWdodGZvcndhcmQuICBJdCBzZWVtcyBhCnRyYWRlLW9mZiBvbiB3aGV0aGVyIHdl
J2QgbGlrZSB0byBkbyB0aGUgYWNjb3VudGluZyBvZiBlcnJvcm5vdXMgZmF1bHRzLCBvciB3ZQp3
YW50IHRvIG1ha2UgaXQgY2xlYW5lciBieSBwdXQgdGhlbSBhbHRvZ2V0aGVyIGJ1dCBvbmx5IHN1
Y2Nlc3NmdWwgcGFnZSBmYXVsdHMuCkkgc2xpZ2h0bHkgcHJlZmVycmVkIHRoZSBsYXR0ZXIgZHVl
IHRvIHRoZSBmYWN0IHRoYXQgSSBmYWlsZWQgdG8gZmluZCBncmVhdAp1c2VmdWxuZXNzIG91dCBv
ZiBrZWVwaW5nIGVycm9yIGZhdWx0IGFjY291bnRpbmdzLCBidXQgbm8gc3Ryb25nIG9waW5pb25z
Li4KClRoYW5rcywKCi0tIApQZXRlciBYdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
