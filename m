Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76853504627
	for <lists+openrisc@lfdr.de>; Sun, 17 Apr 2022 04:44:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 12114248E6;
	Sun, 17 Apr 2022 04:44:54 +0200 (CEST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mail.librecores.org (Postfix) with ESMTPS id 43B6424317
 for <openrisc@lists.librecores.org>; Sun, 17 Apr 2022 04:44:52 +0200 (CEST)
Received: by mail-qk1-f177.google.com with SMTP id b189so9136348qkf.11
 for <openrisc@lists.librecores.org>; Sat, 16 Apr 2022 19:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7mdFWtuENoyEeQKLi9pz/FoEj4NZtEiJmOWjGV0tYyw=;
 b=dq9RfRoU07XvXAS4D2QXJeExVcMH++x+jD0rOvPn+fZOcqFnSkifPsgNtsCo826T2O
 OAcFw7c47C7wo2kzuuLa5Vw12VFv2OcoMu9qPqfCozZp6tt2r5UXZQqAJp5btXYNKtaF
 0eS3GqdPcEiqOIvf05yDughS2acWXE2JR2l0k89BtdlFUk6EqKX9grPnDmd2+dhw5fbC
 fzUZV/Cy63E1zCoRFbQ5j2x4wy6lsGmxmT8yPnBjjm8AxWJzsURM4vaOSSle00+g54lm
 W1ATYnOlyvuPYB9SrLwwDM9inZ1VZVQNpmhVpdWqzf0XfAKvhE2fO1FG5nGabX+XMRvX
 /O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7mdFWtuENoyEeQKLi9pz/FoEj4NZtEiJmOWjGV0tYyw=;
 b=ZMLAOMTA+Iq4gOooEvkVflttOk2OwpTe5z2/SOFLebv4i4M/0RD/IAeFxSEW/eoq84
 zF3qR2PrgLrthTvmSo8XJczMwVmJmy+7bI1UowSD4Q1CjOWXN9QSphxfXqksHyc94O8w
 NCyQA1DscFVW2xnuN+QMxsnPQ7VssQMtQzvlTrPDGz1fRieumK6FHqfB7k/7sB5gk4JL
 EG/Q5I1PlTjgyPm3JAo4i2kfr5t9lBwxP7bS200965//yUCcimrMHOajlqFgLz5Xqz/H
 pC/j6KkHdw+EA20MG2C01Sii4AdynyO1v+Z47Oz8xpaRqkmJ4o6J3LC5c+LmhCGFsFLl
 074A==
X-Gm-Message-State: AOAM532GAmIEtPrjejm/4o/0UVVUyunHgOGJp72xv2GJt5OOKpVMPPBH
 t9RBDAZL0vRbWaD4Jicdd9Y=
X-Google-Smtp-Source: ABdhPJz6oSZlRnLl8WKyhx9BIW+lU1hM8aOw9Y3ybSzNsRupCKwp5nrPtxY0rF3CVYcXl6KvW0qs0A==
X-Received: by 2002:a37:aec7:0:b0:69b:f27b:8784 with SMTP id
 x190-20020a37aec7000000b0069bf27b8784mr3422770qke.464.1650163491097; 
 Sat, 16 Apr 2022 19:44:51 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 r7-20020ac85c87000000b002e234014a1fsm5570726qta.81.2022.04.16.19.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 19:44:50 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id 5040527C0054;
 Sat, 16 Apr 2022 22:44:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 16 Apr 2022 22:44:49 -0400
X-ME-Sender: <xms:H39bYgD82w7KnuskfhJMaZtiRteaDAeGofpwMPtq-l4RjgIHdf9Reg>
 <xme:H39bYihoCJAc9YyR_pZqvi4O5X-lkvO6-3VMkPJCqst2JkTlxL1GNEtj9MLCK0d9S
 M_Y7aCSEuwcwKABfQ>
X-ME-Received: <xmr:H39bYjmhaI13nH4jM6CSFQ7g_bw7YC1D31bokWWOABPaTX-RbZ-uKRBc8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelkedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepueehjeejieevueeuteeileeuvddvvedvieeltddtudekgeegueelvddtkeet
 tdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
 vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
 hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:H39bYmxH1Ym3XKaAk4bLIWpjNBQmYqf5CmDkxgEIsHS9zE4-h5vQDA>
 <xmx:H39bYlQ1zgn78rWrTn0MFA2E-TdqPdRfxVnVWgBARWlHgkeSuGt5Iw>
 <xmx:H39bYhbJDPPvwOoOg3gGVzOUDtZRW-VgUylpxR4uHaYmp8GAvlBLtw>
 <xmx:IX9bYkAWf4QBuQqGV30YOxDixOI_Do6kOzPt6slF1NWQacX1vhcv8Mrl07w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Apr 2022 22:44:45 -0400 (EDT)
Date: Sun, 17 Apr 2022 10:44:25 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <Ylt/CdbB9vF9dXjo@tardis>
References: <YljFyY7acyRDBmK7@tardis>
 <mhng-78fec320-bd16-4774-9e24-2e5c0ce33121@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-78fec320-bd16-4774-9e24-2e5c0ce33121@palmer-ri-x1c9>
Subject: Re: [OpenRISC] [PATCH v3 1/7] asm-generic: ticket-lock: New generic
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
Cc: wangkefeng.wang@huawei.com, heiko@sntech.de, peterz@infradead.org,
 guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, jonas@southpole.se, linux-csky@vger.kernel.org,
 mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 sudipm.mukherjee@gmail.com, macro@orcam.me.uk
Content-Type: multipart/mixed; boundary="===============9071562694025002909=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


--===============9071562694025002909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ytG0UcqI/Y9WwWb"
Content-Disposition: inline


--8ytG0UcqI/Y9WwWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 10:20:04PM -0700, Palmer Dabbelt wrote:
> On Thu, 14 Apr 2022 18:09:29 PDT (-0700), boqun.feng@gmail.com wrote:
> > Hi,
> >=20
> > On Thu, Apr 14, 2022 at 03:02:08PM -0700, Palmer Dabbelt wrote:
> > > From: Peter Zijlstra <peterz@infradead.org>
> > >=20
> > > This is a simple, fair spinlock.  Specifically it doesn't have all the
> > > subtle memory model dependencies that qspinlock has, which makes it m=
ore
> > > suitable for simple systems as it is more likely to be correct.  It is
> > > implemented entirely in terms of standard atomics and thus works fine
> > > without any arch-specific code.
> > >=20
> > > This replaces the existing asm-generic/spinlock.h, which just errored
> > > out on SMP systems.
> > >=20
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > >  include/asm-generic/spinlock.h       | 85 +++++++++++++++++++++++++-=
--
> > >  include/asm-generic/spinlock_types.h | 17 ++++++
> > >  2 files changed, 94 insertions(+), 8 deletions(-)
> > >  create mode 100644 include/asm-generic/spinlock_types.h
> > >=20
> > > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spi=
nlock.h
> > > index adaf6acab172..ca829fcb9672 100644
> > > --- a/include/asm-generic/spinlock.h
> > > +++ b/include/asm-generic/spinlock.h
> > > @@ -1,12 +1,81 @@
> > >  /* SPDX-License-Identifier: GPL-2.0 */
> > > -#ifndef __ASM_GENERIC_SPINLOCK_H
> > > -#define __ASM_GENERIC_SPINLOCK_H
> > > +
> > >  /*
> > > - * You need to implement asm/spinlock.h for SMP support. The generic
> > > - * version does not handle SMP.
> > > + * 'Generic' ticket-lock implementation.
> > > + *
> > > + * It relies on atomic_fetch_add() having well defined forward progr=
ess
> > > + * guarantees under contention. If your architecture cannot provide =
this, stick
> > > + * to a test-and-set lock.
> > > + *
> > > + * It also relies on atomic_fetch_add() being safe vs smp_store_rele=
ase() on a
> > > + * sub-word of the value. This is generally true for anything LL/SC =
although
> > > + * you'd be hard pressed to find anything useful in architecture spe=
cifications
> > > + * about this. If your architecture cannot do this you might be bett=
er off with
> > > + * a test-and-set.
> > > + *
> > > + * It further assumes atomic_*_release() + atomic_*_acquire() is RCp=
c and hence
> > > + * uses atomic_fetch_add() which is SC to create an RCsc lock.
> > > + *
> > > + * The implementation uses smp_cond_load_acquire() to spin, so if the
> > > + * architecture has WFE like instructions to sleep instead of poll f=
or word
> > > + * modifications be sure to implement that (see ARM64 for example).
> > > + *
> > >   */
> > > -#ifdef CONFIG_SMP
> > > -#error need an architecture specific asm/spinlock.h
> > > -#endif
> > > -#endif /* __ASM_GENERIC_SPINLOCK_H */
> > > +#ifndef __ASM_GENERIC_TICKET_LOCK_H
> > > +#define __ASM_GENERIC_TICKET_LOCK_H
> > > +
> > > +#include <linux/atomic.h>
> > > +#include <asm-generic/spinlock_types.h>
> > > +
> > > +static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
> > > +{
> > > +	u32 val =3D atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> > > +	u16 ticket =3D val >> 16;
> > > +
> > > +	if (ticket =3D=3D (u16)val)
> > > +		return;
> > > +
> > > +	atomic_cond_read_acquire(lock, ticket =3D=3D (u16)VAL);
> >=20
> > Looks like my follow comment is missing:
> >=20
> > 	https://lore.kernel.org/lkml/YjM+P32I4fENIqGV@boqun-archlinux/
> >=20
> > Basically, I suggested that 1) instead of "SC", use "fully-ordered" as
> > that's a complete definition in our atomic API ("RCsc" is fine), 2)
> > introduce a RCsc atomic_cond_read_acquire() or add a full barrier here
> > to make arch_spin_lock() RCsc otherwise arch_spin_lock() is RCsc on
> > fastpath but RCpc on slowpath.
>=20
> Sorry about that, now that you mention it I remember seeing that comment =
but
> I guess I dropped it somehow -- I've been down a bunch of other RISC-V
> memory model rabbit holes lately, so I guess this just got lost in the
> shuffle.
>=20
> I'm not really a memory model person, so I'm a bit confused here, but IIUC
> the issue is that there's only an RCpc ordering between the store_release
> that publishes the baker's ticket and the customer's spin to obtain a
> contested lock.  Thus we could see RCpc-legal accesses before the
> atomic_cond_read_acquire().
>=20
> That's where I get a bit lost: the atomic_fetch_add() is RCsc, so the
> offending accesses are bounded to remain within arch_spin_lock().  I'm not
> sure how that lines up with the LKMM requirements, which I always see
> expressed in terms of the entire lock being RCsc (specifically with
> unlock->lock reordering weirdness, which the fully ordered AMO seems to
> prevent here).
>=20

The case that I had in mind is as follow:

	CPU 0 			CPU 1
	=3D=3D=3D=3D=3D			=3D=3D=3D=3D=3D
	arch_spin_lock();
	// CPU 0 owns the lock
				arch_spin_lock():
				  atomic_fetch_add(); // fully-ordered
				  if (ticket =3D=3D (u16)val) // didn't get the ticket yet.=20
				  ...
				  atomic_cond_read_acquire():
				    while (true) {
	arch_spin_unlock(); // release
				    	atomic_read_acquire(); // RCpc
					// get the ticket
				    }

In that case the lock is RCpc not RCsc because our atomics are RCpc. So
you will need to enfore the ordering if you want to make generic ticket
lock RCsc.

> That's kind of just a curiosity, though, so assuming we need some stronger
> ordering here I sort of considered this
>=20
>    diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spin=
lock.h
>    index ca829fcb9672..bf4e6050b9b2 100644
>    --- a/include/asm-generic/spinlock.h
>    +++ b/include/asm-generic/spinlock.h
>    @@ -14,7 +14,7 @@
>      * a test-and-set.
>      *
>      * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc=
 and hence
>    - * uses atomic_fetch_add() which is SC to create an RCsc lock.
>    + * uses atomic_fetch_add_rcsc() which is RCsc to create an RCsc lock.
>      *
>      * The implementation uses smp_cond_load_acquire() to spin, so if the
>      * architecture has WFE like instructions to sleep instead of poll fo=
r word
>    @@ -30,13 +30,13 @@
>     static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>     {
>    	u32 val =3D atomic_fetch_add(1<<16, lock);
>     	u16 ticket =3D val >> 16;
>     	if (ticket =3D=3D (u16)val)
>     		return;
>    -	atomic_cond_read_acquire(lock, ticket =3D=3D (u16)VAL);
>    +	atomic_cond_read_rcsc(lock, ticket =3D=3D (u16)VAL);
>     }
>     static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
>=20
> but that smells a bit awkward: it's not really that the access is RCsc, i=
t's

Yeah, agreed.

> that the whole lock is, and the RCsc->branch->RCpc is just kind of scream=
ing
> for arch-specific optimizations.  I think we either end up with some sort=
 of
> "atomic_*_for_tspinlock" or a "mb_*_for_tspinlock", both of which seem ve=
ry
> specific.
>=20
> That, or we just run with the fence until someone has a concrete way to do
> it faster.  I don't know OpenRISC or C-SKY, but IIUC the full fence is fr=
ee
> on RISC-V: our smp_cond_read_acquire() only emits read accesses, ends in a
> "fence r,r", and is proceeded by a full smp_mb() from atomic_fetch_add().
> So I'd lean towards the much simpler
>=20
>    diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spin=
lock.h
>    index ca829fcb9672..08e3400a104f 100644
>    --- a/include/asm-generic/spinlock.h
>    +++ b/include/asm-generic/spinlock.h
>    @@ -14,7 +14,9 @@
>      * a test-and-set.
>      *
>      * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc=
 and hence
>    - * uses atomic_fetch_add() which is SC to create an RCsc lock.
>    + * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, =
along with
>    + * a full fence after the spin to upgrade the otherwise-RCpc
>    + * atomic_cond_read_acquire().
>      *
>      * The implementation uses smp_cond_load_acquire() to spin, so if the
>      * architecture has WFE like instructions to sleep instead of poll fo=
r word
>    @@ -30,13 +32,22 @@
>     static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>     {
>    -	u32 val =3D atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
>    +	u32 val =3D atomic_fetch_add(1<<16, lock);
>     	u16 ticket =3D val >> 16;
>     	if (ticket =3D=3D (u16)val)
>     		return;
>    +	/*
>    +	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
>    +	 * custom cond_read_rcsc() here we just emit a full fence.  We only
>    +	 * need the prior reads before subsequent writes ordering from
>    +	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and =
we
>    +	 * have no outstanding writes due to the atomic_fetch_add() the extra
>    +	 * orderings are free.
>    +	 */
>     	atomic_cond_read_acquire(lock, ticket =3D=3D (u16)VAL);
>    +	smp_mb();
>     }
>     static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
>=20

I like this version ;-)

> I'm also now worried about trylock, but am too far down this rabbit hole =
to
> try and figure out how try maps between locks and cmpxchg.  This is all w=
ay
> too complicated to squash in, though, so I'll definitely plan on a v4.
>=20

trylock should be fine, since no one will use a failed trylock to
ordering something (famous last word though ;-)).

Regards,
Boqun

> > Regards,
> > Boqun
> >=20
> > > +}
> > > +
> > > +static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
> > > +{
> > > +	u32 old =3D atomic_read(lock);
> > > +
> > > +	if ((old >> 16) !=3D (old & 0xffff))
> > > +		return false;
> > > +
> > > +	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RC=
sc */
> > > +}
> > > +
> > [...]

--8ytG0UcqI/Y9WwWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmJbfwYACgkQSXnow7UH
+rguVQgAl40ofgshQ0i+SHItgMtdovBr8xhK/HC+Fu1GrbgpJ9bnUeNWRf6koiVW
2m04qNU4n2inQVqG8QntgoKIBduqtn+uk4jbCw65pcU+1vfcb4/SS2Yi0gfpPpUM
CSlkkxkgOUMu/IUkIqeSesRCE4TjeKsEkNokgBOvbmXttc7QKFcRPjsbBn/ZPWTp
01cLz/1gvcpa73rmloFa5cjcLDu3se1OeV1o8d0aSfcJHfEL4ugg7qdKO38Lx/tU
j5ZrMYl0kAPUl7yMfOtfDWHo41cA57ZAjj556XYO27PTY3vXLCCfi3ECMCtYvaQy
3wqYE0+KODnRUwJJNE4iJ3W7NNUiSA==
=sBlA
-----END PGP SIGNATURE-----

--8ytG0UcqI/Y9WwWb--

--===============9071562694025002909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============9071562694025002909==--
