Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 30088C4717
	for <lists+openrisc@lfdr.de>; Wed,  2 Oct 2019 07:44:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8E2602062B;
	Wed,  2 Oct 2019 07:44:05 +0200 (CEST)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by mail.librecores.org (Postfix) with ESMTPS id A07B92042B
 for <openrisc@lists.librecores.org>; Wed, 25 Sep 2019 17:17:20 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id e17so6060715ljf.13
 for <openrisc@lists.librecores.org>; Wed, 25 Sep 2019 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=eghD7xF1O36vsBrF3R1Ol+O9tfU+0jO9JXTPAGDQj/eD9TEB4fS0VQFijoygPStgr3
 10lJjOrWc1bicRYqBtncYZdXUVZQzGo/mCRUFcwwwv+kexKbN1ES5l5Ac30Iyy/VSy6b
 zUdkmBZi6iQtLRd1ksj9hb1AR/76sVMVefmq8BgklCKkDi+tVqaxFM4AvBWSG3sKDCRC
 NPA4lDaeoCpS8CsgLxRZg802nWrQPQecGCdXqYctiynPyMIAzYncAW7BXnLuqZdmqiq7
 lmNY1mZLDVoPD5SAcNNPdqQCcypDkXcAg+PaiFPMbfZqC2X+xM6M1pHyx+WOo3XdPYs0
 eCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=thenFlXV+IiD8AwHNM30LU9vpfY08KsMsEjg+S9DJ3A7TYSMVfKYmrfRfklBcqJ2rL
 /eJ5gENPiixiSb/b29DpTppTzj/H8sSzuPE0YglQLPhVM56jD0UlcM9/S+b6T42YCDXC
 8rnvPNXU+zY/v157dmzOWOQCWpey84pds6sG3bmU/Kf09Mk3iIqbBaKLAQlK1CM1rWIM
 paHH2trBKEPColeF+w7S7VknZ+QnX4+Nhg6Kh3wDKBxLEC8VCAu1EFCmCs4vrp1NCYtd
 AGddeB3/F81JyZ0FyQ/l0EPj1mLMlpvt/fVpYnn03bmYhnOq77YlL/Dml8wtyqrCmbFj
 0bUg==
X-Gm-Message-State: APjAAAVzqcqA2i0sMmWsujqbpgBj1loypqwerYuhMn37ntIYS1iTzMtV
 SOq6sVq7pBCwofDn0CMuZJVgfscWmULTeAHUrTo=
X-Google-Smtp-Source: APXvYqzF1RqhBAB47TPrTDl3zKUBxVzKbXcvNvcrU2oxqh5sJKOV3USfSG9GeeJJkpUMrG8FnoJZki1WHtkUnydqfw8=
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr1893730ljl.10.1569424639817; 
 Wed, 25 Sep 2019 08:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
In-Reply-To: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 12:17:28 -0300
Message-ID: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:44:03 +0200
Subject: Re: [OpenRISC] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Guan Xuetao <gxt@pku.edu.cn>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBkdW1w
IGF0IHRoZSBiZWdpbm5pbmcgZGlkbid0Cj4gY2hhbmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBh
IHJlc2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiBpbXg2dWwtY2NpbXg2dWxzb20uZHRzaSBkaWQ/
CgpJIGRvbid0IHRoaW5rIHNvLgoKV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0
aGUgZXhhY3QgY29tbWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
