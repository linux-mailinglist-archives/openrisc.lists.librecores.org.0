Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D3D0C4ED608
	for <lists+openrisc@lfdr.de>; Thu, 31 Mar 2022 10:43:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7CEB9248BE;
	Thu, 31 Mar 2022 10:43:53 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by mail.librecores.org (Postfix) with ESMTPS id 937F824847
 for <openrisc@lists.librecores.org>; Thu, 31 Mar 2022 10:43:52 +0200 (CEST)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MxmFk-1nxZlJ47OI-00zGj0 for <openrisc@lists.librecores.org>; Thu, 31 Mar
 2022 10:43:52 +0200
Received: by mail-wr1-f53.google.com with SMTP id h4so32655412wrc.13
 for <openrisc@lists.librecores.org>; Thu, 31 Mar 2022 01:43:51 -0700 (PDT)
X-Gm-Message-State: AOAM5339yNTkMqDn+4u1nTuGQfciimyYqp6rlEiJBvngrqSoGxpWEw/e
 +NV/nc1X0+pqWW2lua9A6RHCpAALHGvc1X1+me4=
X-Google-Smtp-Source: ABdhPJyrtpQlBduGdImQtwl3TfY7OVK8ndVvnJ/5XRBmxDFBRN2DthMS2Ieu+gTrPWm1ExwDF53U+Xfq7QQVJM2Ifeo=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr3269024wrh.407.1648716231569; Thu, 31
 Mar 2022 01:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <202203281004.InhLOFxn-lkp@intel.com>
In-Reply-To: <202203281004.InhLOFxn-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 10:43:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ShMf+QCHWishO9DbvRrJ5x9f=9cS9kwm_tkBqwyWtEw@mail.gmail.com>
Message-ID: <CAK8P3a0ShMf+QCHWishO9DbvRrJ5x9f=9cS9kwm_tkBqwyWtEw@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
X-Provags-ID: V03:K1:ZiYEkvfqiORZ/vksXhPoB+9VwZCheAZ9NIiBYjjYjNjhwo4rXFn
 XrLxfGeybQW2UM6b4qV4sGrrU4TEBL9DnxEzLXBUvMMLJLzAm7Xtq9w414RB4qjp0UA8ACZ
 GWfJCO3OX3dKfaFtmW+jeHT6Joa+10hWR6rrSW8gdiB6UNXUXJFIY/VLxXeNMcB1hwmt0LV
 zVgI94Q4Sw30y6pe93ZQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u2f6iZMTt2E=:3/vM31ashN1WgnzJwh5IV6
 4Fdi85iuWHB40nKxs1Kn7VeioZ8roU5M7oUgJqVTFADVChqt2W8ArIbuCVASH8MLcculvdziO
 6Qme21xg5SHbF2w2pBnxaXhlNoZUQNB/FQPzW73nyIw/FW8HqN8O8Kw/FbVPmORmv346UK9+x
 JjKVCnOaGduw2Ig9SW39aPLHyvh9Ng1+G4rW8hxTKU6zQJUIbI5jFO/n2iFuiYFzT0i32DQin
 dEPH6aYdiJwbaDg7kwiqHuLxpU8JjKKAFqkRyd7ODOO6mDzztG4AIt5XrZYS3MBtBdN6G3w5T
 4ku5a/qMkflBJA/nCThMeWVpzNw0El6T6LUecP9jzodSL2D/RuGUQ8aA7vbdjNswXo5uItlDU
 s8++gWoHusJ67xXCrQMIs3IPaK8G0Y+LyoqAfCMkb1J+ZOd/1vT1/tZOtdpeP0Yiz9h3yNMTZ
 X59/PPcJOS1yNEsHKVQ+TYkdKT3RJa2XgGdvdYbUIwr1RTTOp1S0ip0h/cDAkhjm4hSv+Bap6
 T2esVNv4oUnoAy2gY+/RLoPPS/jXrEgXUtvNOz9z6+BKy18Kpyeu6LANf6rzsjmMA2w6DaExH
 DCygkXZrTPBls6wSJxFQ1f4HASGULvkgJG3Peat8xWAOAOIoNHc9YMe94+cVcL/S0JvHlBGhy
 vs9V5zXUxwtnix/W26JIF/iFWfCNrHRuI2RvrdoK25UvUoZzGoEMKkh777JTZPgRv8is=
Subject: Re: [OpenRISC] drivers/pci/proc.c:150:17: sparse: sparse:
 restricted __le16 degrades to integer
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
Cc: kbuild-all@lists.01.org, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXIgMjgsIDIwMjIgYXQgNTowNCBBTSBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4gd3JvdGU6Cj4KPiB0cmVlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBtYXN0ZXIKPiBoZWFkOiAgIGY4
MmRhMTYxZWE3NWRjNGRiMjFiMjQ5OWU0YjFmYWNkMzZkYWIyNzUKPiBjb21taXQ6IGE5N2I2OTNj
MzcxMmYwNDBjNTgwMmYzMmIyZDY4NTM1MmUwOGNlZmEgdWFjY2VzczogZml4IG5pb3MyIGFuZCBt
aWNyb2JsYXplIGdldF91c2VyXzgoKQo+IGRhdGU6ICAgNCB3ZWVrcyBhZ28KPiBjb25maWc6IG1p
Y3JvYmxhemUtcmFuZGNvbmZpZy1zMDMyLTIwMjIwMzI4IChodHRwczovL2Rvd25sb2FkLjAxLm9y
Zy8wZGF5LWNpL2FyY2hpdmUvMjAyMjAzMjgvMjAyMjAzMjgxMDA0LkluaExPRnhuLWxrcEBpbnRl
bC5jb20vY29uZmlnKQo+IGNvbXBpbGVyOiBtaWNyb2JsYXplLWxpbnV4LWdjYyAoR0NDKSAxMS4y
LjAKPiByZXByb2R1Y2U6Cj4gICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250
ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9t
YWtlLmNyb3NzCj4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICAj
IGFwdC1nZXQgaW5zdGFsbCBzcGFyc2UKPiAgICAgICAgICMgc3BhcnNlIHZlcnNpb246IHYwLjYu
NC1kaXJ0eQo+ICAgICAgICAgIyBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1hOTdiNjkzYzM3MTJmMDQw
YzU4MDJmMzJiMmQ2ODUzNTJlMDhjZWZhCj4gICAgICAgICBnaXQgcmVtb3RlIGFkZCBsaW51cyBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQKPiAgICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXMgbWFzdGVyCj4gICAg
ICAgICBnaXQgY2hlY2tvdXQgYTk3YjY5M2MzNzEyZjA0MGM1ODAyZjMyYjJkNjg1MzUyZTA4Y2Vm
YQo+ICAgICAgICAgIyBzYXZlIHRoZSBjb25maWcgZmlsZSB0byBsaW51eCBidWlsZCB0cmVlCj4g
ICAgICAgICBta2RpciBidWlsZF9kaXIKPiAgICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0k
SE9NRS8wZGF5IENPTVBJTEVSPWdjYy0xMS4yLjAgbWFrZS5jcm9zcyBDPTEgQ0Y9Jy1mZGlhZ25v
c3RpYy1wcmVmaXggLURfX0NIRUNLX0VORElBTl9fJyBPPWJ1aWxkX2RpciBBUkNIPW1pY3JvYmxh
emUgU0hFTEw9L2Jpbi9iYXNoIGRyaXZlcnMvcGNpLwo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUs
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZQo+IFJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPgo+Cj4gc3BhcnNlIHdhcm5pbmdzOiAo
bmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCj4gPj4gZHJpdmVycy9wY2kvcHJvYy5jOjE1MDoxNzog
c3BhcnNlOiBzcGFyc2U6IHJlc3RyaWN0ZWQgX19sZTE2IGRlZ3JhZGVzIHRvIGludGVnZXIKPiA+
PiBkcml2ZXJzL3BjaS9wcm9jLmM6MTUwOjE3OiBzcGFyc2U6IHNwYXJzZTogcmVzdHJpY3RlZCBf
X2xlMTYgZGVncmFkZXMgdG8gaW50ZWdlcgo+ICAgIGRyaXZlcnMvcGNpL3Byb2MuYzoxNTA6MTc6
IHNwYXJzZTogc3BhcnNlOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19sZTE2Cj4gPj4gZHJpdmVycy9w
Y2kvcHJvYy5jOjE1OToxNzogc3BhcnNlOiBzcGFyc2U6IHJlc3RyaWN0ZWQgX19sZTMyIGRlZ3Jh
ZGVzIHRvIGludGVnZXIKPiA+PiBkcml2ZXJzL3BjaS9wcm9jLmM6MTU5OjE3OiBzcGFyc2U6IHNw
YXJzZTogcmVzdHJpY3RlZCBfX2xlMzIgZGVncmFkZXMgdG8gaW50ZWdlcgo+ICAgIGRyaXZlcnMv
cGNpL3Byb2MuYzoxNTk6MTc6IHNwYXJzZTogc3BhcnNlOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19s
ZTMyCj4gICAgZHJpdmVycy9wY2kvcHJvYy5jOjE2ODoxNzogc3BhcnNlOiBzcGFyc2U6IHJlc3Ry
aWN0ZWQgX19sZTE2IGRlZ3JhZGVzIHRvIGludGVnZXIKPiAgICBkcml2ZXJzL3BjaS9wcm9jLmM6
MTY4OjE3OiBzcGFyc2U6IHNwYXJzZTogcmVzdHJpY3RlZCBfX2xlMTYgZGVncmFkZXMgdG8gaW50
ZWdlcgo+ICAgIGRyaXZlcnMvcGNpL3Byb2MuYzoxNjg6MTc6IHNwYXJzZTogc3BhcnNlOiBjYXN0
IHRvIHJlc3RyaWN0ZWQgX19sZTE2CgpPbiBUdWUsIE1hciAyOSwgMjAyMiBhdCA4OjU2IEFNIENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPgo+IExvb2tzIGxpa2UgbmV3IHVh
Y2Nlc3MgY29kZSBkb2Vzbid0IGhhbmRsZSBzcGFyc2UgX19iaXR3aXNlIGFubm90YXRpb25zLgoK
UmlnaHQuIEkgY29waWVkIHRoZSBsaW5lIHRoYXQgY2F1c2VkIHRoaXMgZnJvbSAzMi1iaXQgcmlz
Y3YsIHdoaWNoIGhhcyB0aGUgc2FtZQppc3N1ZSwgc2FtZSBvbiBvcGVucmlzYyBhZnRlciBkODc3
MzIyYmMxYWQgKCJvcGVucmlzYzogRml4IGlzc3VlIHdpdGgKZ2V0X3VzZXIgZm9yCjY0LWJpdCB2
YWx1ZXMiKS4KCkl0IHNvdW5kcyBsaWtlIHdlIHNob3VsZCBmaXggYWxsIHRocmVlIG9mIHRoZXNl
IHRoZSBzYW1lIHdheSwgYW55CnN1Z2dlc3Rpb24gd2hpY2gKYXJjaGl0ZWN0dXJlIHRvIGNvcHkg
ZnJvbT8KCiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
