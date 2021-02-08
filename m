Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAAF3131FD
	for <lists+openrisc@lfdr.de>; Mon,  8 Feb 2021 13:16:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C926221127;
	Mon,  8 Feb 2021 13:16:55 +0100 (CET)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mail.librecores.org (Postfix) with ESMTPS id B0B572107E
 for <openrisc@lists.librecores.org>; Mon,  8 Feb 2021 13:16:53 +0100 (CET)
Received: by mail-pg1-f171.google.com with SMTP id b21so10084079pgk.7
 for <openrisc@lists.librecores.org>; Mon, 08 Feb 2021 04:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nvKYGI+xvfojVfmLQ6vxfRm0bbo4wYo1zSw/r2soehY=;
 b=DlIcNfDmHtyqTWIKhDUKdjYcK0/BJ5lmTEkJi4T8ILexrsDfD0nUInfI2jz+RwUAEN
 drKR/01CZZxr9KBjE7CK4jf3VS+Gi2bqymQTF6K5HBpCKzCYnI0Lz2lzvYLDM3Ht1cKu
 F9cxI8khb5Pu/dyvTUlQiyGF9Qq4vL6TfEu7i85XDcHiq2hQeOPmyp7YpycTusOwqt4P
 94eFl7YhNSlEaueGzQ7jW5kc7beik52AbKkL+jNzduaRkLv6Mdusyt9d4f5y0PqbNYNu
 2+TQAyqhCSiU4wWaR17NoDnPvgDom9PfaWWE3NBWYg28Ehs7v5C+ThvMV0E100629mVA
 78bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nvKYGI+xvfojVfmLQ6vxfRm0bbo4wYo1zSw/r2soehY=;
 b=mU5fYf1TctiM1RZtJ5tNMX8nmwcE08l4b09zBtTNShePuQoFRy1mbFMuARtcActnIj
 ccnEmfjiTetwO2M/YlG0rXNFKDQ4E7PmjJeB4cb0O8JRtzJsWfmn16IKhlFlKruBY1m9
 KEuQzjPOhsB1FsaezsiSJGJcEt2csLUe+hH+7aSnoww6I0kvcLW3D5D5qghWSK9sclgf
 vKX3IJXMkvDOBMltwdo8FnkiUyIwQomaji4m3EmR/kT/gRQjylkV2ts23GTuTBWf/hEV
 1BO/p01waQ7YijX37xymtUKuhDowllDrFQFgqWmx77gh489sjur5TZTwMvYevCoXhi0F
 VTOg==
X-Gm-Message-State: AOAM532fL/j0taO0wvyaNSuKLEnnk2xdX36tC91WOp7BLk7/QyiZBw4S
 /6UNQtcIZaJFwPF/Cd/geac=
X-Google-Smtp-Source: ABdhPJxfZtLm2LYtINNoUDbgTVD2RHn01gW6tlqfv2CNCUdWHk3PlF8jgj4NgUZ3g0mx1YItzIxunA==
X-Received: by 2002:a65:620f:: with SMTP id d15mr16541973pgv.218.1612786611865; 
 Mon, 08 Feb 2021 04:16:51 -0800 (PST)
Received: from localhost (g186.222-224-165.ppp.wakwak.ne.jp. [222.224.165.186])
 by smtp.gmail.com with ESMTPSA id p7sm17458438pfn.52.2021.02.08.04.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:16:51 -0800 (PST)
Date: Mon, 8 Feb 2021 21:16:48 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20210208121648.GN2002709@lianli.shorne-pla.net>
References: <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
 <20210131212752.GG2002709@lianli.shorne-pla.net>
 <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
 <20210205144317.GK2002709@lianli.shorne-pla.net>
 <CAMuHMdXzr4c4=Cg1_Lmw41cmxmMrG4P=dV0yVjuXvuR5pqyh0Q@mail.gmail.com>
 <20210205223651.GL2002709@lianli.shorne-pla.net>
 <CAMuHMdV5M2X+zC9e2VidEt6vNdnP1j3yeB4tJTRgkCCDCwV8hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5M2X+zC9e2VidEt6vNdnP1j3yeB4tJTRgkCCDCwV8hQ@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v2] openrisc: use device tree to determine
 present cpus
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 06, 2021 at 10:33:24AM +0100, Geert Uytterhoeven wrote:
> Hi Stafford,
> 
> On Fri, Feb 5, 2021 at 11:36 PM Stafford Horne <shorne@gmail.com> wrote:
> > On Fri, Feb 05, 2021 at 05:07:51PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Feb 5, 2021 at 3:43 PM Stafford Horne <shorne@gmail.com> wrote:
> > > > On Mon, Feb 01, 2021 at 12:49:31PM +0100, Jan Henrik Weinstock wrote:
> > > > > Use the device tree to determine the present cpus instead of assuming all
> > > > > CONFIG_NRCPUS are actually present in the system.
> > > > >
> > > > > Signed-off-by: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
> > > >
> > > > I cannot apply this patch, it seems you somehow sent it signed as a multipart
> > > > message via Thunderbird.
> > > >
> > > > This causes errors when trying to apply, even after I tried to manually fix the
> > > > patch mail:
> > > >
> > > >     Applying: openrisc: use device tree to determine present cpus
> > > >     error: sha1 information is lacking or useless (arch/openrisc/kernel/smp.c).
> > > >     error: could not build fake ancestor
> > > >     Patch failed at 0001 openrisc: use device tree to determine present cpus
> > > >
> > > > Can you send this using 'git send-email?'
> > > >
> > > > If not I can get it applied with some work, otherwise you can point me to a git
> > > > repo which I can pull it from.
> > >
> > > "b4 am 6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de" works
> > > fine for me.
> > >
> > > git://git.kernel.org/pub/scm/utils/b4/b4.git
> >
> > Did it work?  For me I got, base not found.
> >
> >     Looking up
> >     https://lore.kernel.org/r/6dbc27f8-5261-59c5-acba-70f6c6a74ba1%40rwth-aachen.de
> >     Grabbing thread from lore.kernel.org/lkml
> >     Analyzing 9 messages in the thread
> >     Will use the latest revision: v2
> >     You can pick other revisions using the -vN flag
> >     ---
> >     Writing
> >     ./v2_20210201_jan_weinstock_openrisc_use_device_tree_to_determine_present_cpus.mbx
> >       [PATCH v2] openrisc: use device tree to determine present cpus
> >     ---
> >     Total patches: 1
> >     ---
> >      Link:
> >     https://lore.kernel.org/r/6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de
> >      Base: not found
> 
> That just means the patch contains no information w.r.t. its base, i.e.
> against which tree/commit it applies to.  To be ignored.
> 
> >            git am
> >     ./v2_20210201_jan_weinstock_openrisc_use_device_tree_to_determine_present_cpus.mbx
> 
> Just run the above command ;-)
> 
> In addition, you can run "formail -s scripts/checkpatch.pl < *mbx" first, to
> run the mbox (which could contain multiple patches) through checkpatch.

Hi Geert,

Thanks for your help, but this is still not working.  See that attached patch.
If your patch doesn't have this corruption then please forward it.  If Jan could
point to a git repo or reset with 'git send-email' that would be great too.

It seems that the mailer has corrupted the patch by adding and removing
whitespace to each line.

I don't have a 'formail' command, but I did try 'git am' and 'checkpatch.pl' and
it shows:

    < shorne@lianli ~/work/linux > git am v2_20210201_jan_weinstock_openrisc_use_device_tree_to_determine_present_cpus.mbx
    Applying: openrisc: use device tree to determine present cpus
    error: corrupt patch at line 62
    Patch failed at 0001 openrisc: use device tree to determine present cpus
    hint: Use 'git am --show-current-patch=diff' to see the failed patch
    When you have resolved this problem, run "git am --continue".
    If you prefer to skip this patch, run "git am --skip" instead.
    To restore the original branch and stop patching, run "git am --abort".

    < shorne@lianli ~/work/linux > ./scripts/checkpatch.pl  v2_20210201_jan_weinstock_openrisc_use_device_tree_to_determine_present_cpus.mbx
    ERROR: "foo* bar" should be "foo *bar"
    #38: FILE: arch/openrisc/kernel/smp.c:64:
    +       struct device_node* cpu;

    WARNING: usage of NR_CPUS is often wrong - consider using cpu_possible(), num_possible_cpus(), for_each_possible_cpu(), etc
    #49: FILE: arch/openrisc/kernel/smp.c:73:
    +               if (cpu_id < NR_CPUS)

    ERROR: patch seems to be corrupt (line wrapped?)
    #81: FILE: arch/openrisc/kernel/smp.c:90:
    2.17.1

    total: 2 errors, 1 warnings, 49 lines checked

    NOTE: For some of the reported defects, checkpatch may be able to
	  mechanically convert to the typical style using --fix or --fix-inplace.

    v2_20210201_jan_weinstock_openrisc_use_device_tree_to_determine_present_cpus.mbx has style problems, please review.

-Stafford

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename*0=v2_20210201_jan_weinstock_openrisc_use_device_tree_to_determi;
	filename*1="ne_present_cpus.mbx"

From MAILER-DAEMON Mon Feb  8 12:02:46 2021
Subject: [PATCH v2] openrisc: use device tree to determine present cpus
To: Stafford Horne <shorne@gmail.com>, <geert@linux-m68k.org>
CC: <jonas@southpole.se>, <stefan.kristiansson@saunalahti.fi>, <openrisc@lists.librecores.org>, <linux-kernel@vger.kernel.org>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de> <20210129221643.GZ2002709@lianli.shorne-pla.net> <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de> <20210130230310.GC2002709@lianli.shorne-pla.net> <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de> <20210131212752.GG2002709@lianli.shorne-pla.net>
From: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
Date: Mon, 01 Feb 2021 12:49:31 +0100
In-Reply-To: <20210131212752.GG2002709@lianli.shorne-pla.net>
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Use the device tree to determine the present cpus instead of assuming 
all CONFIG_NRCPUS are actually present in the system.

Signed-off-by: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
---
Changes since v1:
  1. use for_each_of_cpu_node
  2. possible_cpus is now what is in the devicetree, up to NR_CPUS
  3. present_cpus is now all possible cpus, up to max_cpus

  arch/openrisc/kernel/smp.c | 31 +++++++++++++++----------------
  1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index 75be7e34f..83cbf43d4 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -61,32 +61,31 @@ void __init smp_prepare_boot_cpu(void)

  void __init smp_init_cpus(void)
  {
-	int i;
+	struct device_node* cpu;
+	u32 cpu_id;
+
+	for_each_of_cpu_node(cpu) {
+		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
+			pr_warn("%s missing reg property", cpu->full_name);
+			continue;
+		}

-	for (i = 0; i < NR_CPUS; i++)
-		set_cpu_possible(i, true);
+		if (cpu_id < NR_CPUS)
+			set_cpu_possible(cpu_id, true);
+	}
  }

  void __init smp_prepare_cpus(unsigned int max_cpus)
  {
-	u32 cpu_id;
-	struct device_node *cpu, *cpus;
+	unsigned int cpu;

  	/*
  	 * Initialise the present map, which describes the set of CPUs
  	 * actually populated at the present time.
  	 */
-	cpus = of_find_node_by_path("/cpus");
-	for_each_child_of_node(cpus, cpu) {
-		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
-			pr_warn("%s missing reg property", cpu->full_name);
-			continue;
-		}
-
-		if (cpu_id >= max_cpus)
-			continue;
-
-		set_cpu_present(cpu_id, true);
+	for_each_possible_cpu(cpu) {
+		if (cpu < max_cpus)
+			set_cpu_present(cpu, true);
  	}
  }
-- 
2.17.1


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--G4iJoqBmSsgzjUCe--
