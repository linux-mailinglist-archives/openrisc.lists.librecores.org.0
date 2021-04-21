Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 764283662ED
	for <lists+openrisc@lfdr.de>; Wed, 21 Apr 2021 02:12:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 181A921357;
	Wed, 21 Apr 2021 02:12:16 +0200 (CEST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mail.librecores.org (Postfix) with ESMTPS id 78E2420E32
 for <openrisc@lists.librecores.org>; Wed, 21 Apr 2021 02:12:13 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id h20so20615998plr.4
 for <openrisc@lists.librecores.org>; Tue, 20 Apr 2021 17:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WIUTJVKRfpcr3NBu7V351FtV/vJIY9v6DnB3ka9Khe0=;
 b=nNmUmvDrrKv8W/tLRBR0/o9nCYnHnwqzbYN8GV17SaCkoSG3xx5QsQquUjC+MBtlnU
 HXMqCmzmU325Y3n8CaN6rAI4gh0egmbSffGf65ICvxHg3WDZxtxNBHuEtziBnUCbZVl8
 PljYaYD/lZmxhxxPrb+9HETmCwa9v0iqU10L6DAQF+kni4LgZ/a0BbtyotXimZaOw1gv
 XDAbCq6YOf3FDUgksx2BZyjf7w9ghxl1BrUrkp/lcUQFwc4f+sglAofNCEmQuONteS3x
 V8W8ORF2RJWlg14m88bFoNaNZzgj6JhxbBhS2g23aWvhwHTJ2I6ronHSZ0LBUqpjIHzV
 JVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WIUTJVKRfpcr3NBu7V351FtV/vJIY9v6DnB3ka9Khe0=;
 b=V3AwL+/n+I2/niWDjtb7fy33ZwFPaR6mHnzfC2G6NbJbGGSmrKuC+PPCpV7jbi3T2w
 UFUwvag9iC6sV+PRRwCv1IHbK0Qp9X+nbEzoo5Z8q7/XY274uZHK6+i3Z9YnVOG9bAdz
 fHfMh6dMU9+ZfNNqc3f5v56L67o2sJUIb0GXj6xnuHdLCawWVs2JgObIzPSQIiKNZLtr
 e/bSdg1twxg6haDN62QmRpkyCnxAWCz9/mrd1ZJ2HuYeFrGQ2/5O32h+Z84SmspWO+kA
 sM7RT0YFh2ZwolZkKXbWOj3dS8MFeKpl/BsvuPk/ohyzEVNqVSLvuvrAXq9DzJP43z4M
 iH2Q==
X-Gm-Message-State: AOAM531QTHCi1pW9HZHExPY8d8SklJ38T3dt9W5RClRVi1VFfmQeKoTq
 eULLbGrD3MPuxQlvVtdFNUY=
X-Google-Smtp-Source: ABdhPJyDPgj1bpzZUTk4KjswObk5No9EPvj8b0QOeIWi79Nmj66BCnZeJ/ho+nARiGJ5Fjs5k/EC4A==
X-Received: by 2002:a17:902:ba8a:b029:ec:b04c:451d with SMTP id
 k10-20020a170902ba8ab02900ecb04c451dmr9292990pls.67.1618963931920; 
 Tue, 20 Apr 2021 17:12:11 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 b21sm141564pfl.82.2021.04.20.17.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 17:12:11 -0700 (PDT)
Date: Wed, 21 Apr 2021 09:12:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jeff Law <jeffreyalaw@gmail.com>
Message-ID: <20210421001209.GO3288043@lianli.shorne-pla.net>
References: <20210419001034.3626375-1-shorne@gmail.com>
 <9b45b7ef-fce1-84dc-3a86-76801b26de08@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b45b7ef-fce1-84dc-3a86-76801b26de08@gmail.com>
Subject: Re: [OpenRISC] [PATCH] or1k: Add mcmodel option to handle large GOTs
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
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBBcHIgMjAsIDIwMjEgYXQgMDU6MjA6MzlQTSAtMDYwMCwgSmVmZiBMYXcgd3JvdGU6
Cj4gCj4gT24gNC8xOC8yMDIxIDY6MTAgUE0sIFN0YWZmb3JkIEhvcm5lIHZpYSBHY2MtcGF0Y2hl
cyB3cm90ZToKPiA+IFdoZW4gYnVpbGRpbmcgbGliZ2VvcyB3ZSBnZXQgYW4gZXJyb3Igd2l0aDoK
PiA+IAo+ID4gICAgICBsaW51eC11Y2xpYmMvOS4zLjAvY3J0YmVnaW5TLm86IGluIGZ1bmN0aW9u
IGBfX2RvX2dsb2JhbF9kdG9yc19hdXgnOgo+ID4gICAgICBjcnRzdHVmZi5jOigudGV4dCsweDEx
OCk6IHJlbG9jYXRpb24gdHJ1bmNhdGVkIHRvIGZpdDogUl9PUjFLX0dPVDE2IGFnYWluc3Qgc3lt
Ym9sIGBfX2N4YV9maW5hbGl6ZScgZGVmaW5lZCBpbiAudGV4dCBzZWN0aW9uIGluCj4gPiAgICAg
IC9ob21lL3Nob3JuZS93b3JrL29wZW5yaXNjLzNlYjlmOWQwZjZkODI3NGIyZDE5NzUzYzAwNmJk
ODNmN2Q1MzZlM2Mvb3V0cHV0L2hvc3Qvb3Ixay1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jv
b3QvbGliL2xpYmMuc28uCj4gPiAKPiA+IFRoaXMgaXMgY2F1c2VkIGJ5IEdPVCBjb2RlIGhhdmlu
ZyBhIGxpbWl0IG9mIDY0ay4gIEluIE9wZW5SSVNDIHRoaXMKPiA+IGxvb2tzIHRvIGJlIHRoZSBv
bmx5IHJlbG9jYXRpb24gY29kZSBwYXR0ZXJuIHRvIGJlIGxpbWl0ZWQgdG8gNjRrLgo+ID4gCj4g
PiBUaGlzIHBhdGNoIGFsbG93cyBzcGVjaWZ5aW5nIGEgbmV3IG9wdGlvbiAtbWNtb2RlbD1sYXJn
ZSB3aGljaCBjYW4gYmUKPiA+IHVzZWQgdG8gZ2VuZXJhdGUgMiBtb3JlIGluc3RydWN0aW9ucyB0
byBjb25zdHJ1Y3QgMzItYml0IGFkZHJlc3NlcyBmb3IKPiA+IHVwIHRvIDRHIEdPVHMuCj4gPiAK
PiA+IGdjYy9DaGFuZ2VMb2c6Cj4gPiAKPiA+IAlQUiA5OTc4Mwo+ID4gCSogY29uZmlnL29yMWsv
b3Ixay1vcHRzLmg6IE5ldyBmaWxlLgo+ID4gCSogY29uZmlnL29yMWsvb3Ixay5jIChvcjFrX2xl
Z2l0aW1pemVfYWRkcmVzc18xLCBwcmludF9yZWxvYyk6Cj4gPiAJU3VwcG9ydCBnZW5lcmF0aW5n
IGdvdGhhIHJlbG9jYXRpb25zIGlmIC1tY21vZGVsPWxhcmdlIGlzCj4gPiAJc3BlY2lmaWVkLgo+
ID4gCSogY29uZmlnL29yMWsvb3Ixay5oIChUQVJHRVRfQ01PREVMX1NNQUxMLCBUQVJHRVRfQ01P
REVMX0xBUkdFKToKPiA+IAlOZXcgbWFjcm9zLgo+ID4gCSogY29uZmlnL29yMWsvb3Ixay5vcHQg
KG1jbW9kZWw9KTogTmV3IG9wdGlvbi4KPiA+IAkqIGRvYy9pbnZva2UudGV4dCAoT3BlblJJU0Mg
T3B0aW9ucyk6IERvY3VtZW50IG1jbW9kZWwuCj4gCj4gTm90ZSB5b3UncmUgdGhlIHBvcnQgbWFp
bnRhaW5lciwgc28geW91IGRvbid0IG5lZWQgYXBwcm92YWwgdG8gY29tbWl0IHRoaXMKPiB0byBH
Q0MuCgpUaGFua3MgZm9yIGNvbmZpcm1pbmcsIEkga25vdyB0aGF0IGFmdGVyIFNlZ2hlciB0b2xk
IG1lIHdpdGggc29tZSBwcmV2aW91cwpwYXRjaGVzLiA6KQoKRm9yIHRoaXMgc2VyaWVzIEdpdWxp
byBwaWNrZWQgaXQgdXAgYW5kIHRlc3RlZCBpdC4gIFdlIGZvdW5kIHNvbWUgaXNzdWVzIGFuZCBJ
CmFtIGdvaW5nIHRvIGZpeCB3aXRoIGEgVjIuICBJIHNob3VsZCBjb21taXQgdGhhdCB2ZXJzaW9u
LCBhZnRlciB0aGUgYmludXRpbHMKY2hhbmdlcyBhcmUgaW4uCgotU3RhZmZvcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
