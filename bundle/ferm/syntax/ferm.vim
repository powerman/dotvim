"============================================================================
" ferm syntax highlighter
"
" Language:    ferm; "For Easy Rule Making", a frontend for iptables
" Ferm Info:   http://ferm.foo-projects.org/
" Version:     0.03
" Date:        2013-01-09
" Maintainer:  Benjamin Leopold <benjamin-at-cometsong-dot-net>
" URL:         http://github.com/cometsong/ferm.vim
" Credits:     Modeled after Eric Haarbauer's iptables syntax file.
"
"============================================================================
" Section:  Initialization  {{{1
"============================================================================

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists('main_syntax')
  if v:version < 600
    syntax clear
  elseif exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'ferm'
endif

" Don't use standard HiLink, it will not work with included syntax files
if v:version < 508
  command! -nargs=+ FermHiLink highlight link <args>
else
  command! -nargs=+ FermHiLink highlight default link <args>
endif

syntax case match

if v:version < 600
    set iskeyword+=-,@-@
else
    syntax iskeyword @,48-57,_,192-255,-,@-@
endif

" Initialize global public variables:  {{{2

" Support deprecated variable name used prior to release 1.07.
if exists('g:fermSpecialDelimiters') &&
\ !exists('g:Ferm_SpecialDelimiters')

    let   g:Ferm_SpecialDelimiters = g:fermSpecialDelimiters
    unlet g:fermSpecialDelimiters
    " echohl WarningMsg | echo "Warning:" | echohl None
    " echo "The g:fermSpecialDelimiters variable is deprecated."
    " echo "Please use g:Ferm_SpecialDelimiters in your .vimrc instead"

endif

if exists('g:Ferm_SpecialDelimiters')
    let s:Ferm_SpecialDelimiters = g:Ferm_SpecialDelimiters
else
    let s:Ferm_SpecialDelimiters = 0
endif

"============================================================================
" Section:  Syntax Definitions  {{{1
"============================================================================

syntax keyword fermMatch protocol proto fragment syn
syntax keyword fermMatchSrc interface saddr sport
syntax keyword fermMatchDst outerface daddr dport

syntax match fermMatchModule contains=fermModuleName "mod\(ule\)\?\s\+\w\+"

syntax keyword fermBuiltinChain
    \ INPUT OUTPUT FORWARD PREROUTING POSTROUTING

syntax match fermInterface "\<lo\>\|\<\(eth\|ppp\|wlan\|tun\|wg\|br\|docker\|vboxnet\)[._0-9-][._0-9a-zA-Z]*"

syntax keyword fermTable filter nat mangle raw security

" TODO: check the use of duplicate terms in two syntax defs; then enable (arp|eb) tables.
"syntax keyword fermArpTables source-ip destination-ip source-mac destination-mac
    "\ interface outerface h-length opcode h-type proto-type
    "\ mangle-ip-s mangle-ip-d mangle-mac-s mangle-mac-d mangle-target
"syntax keyword fermEbTables proto interface outerface logical-in logical-out saddr daddr
    "\ 802.3 arp ip mark_m pkttype stp vlan log

syntax keyword fermTarget ACCEPT DROP REJECT RETURN NOP
    \ AUDIT CHECKSUM CLASSIFY CLUSTERIP CONNMARK CONNSECMARK CT
    \ DNAT DNPT DSCP ECN HL HMARK IDLETIMER LED LOG MARK MASQUERADE
    \ NETMAP NFLOG NFQUEUE NOTRACK RATEEST REDIRECT SECMARK SET
    \ SNAT SNPT SYNPROXY TCPMSS TCPOPTSTRIP TEE TOS TPROXY TRACE TTL ULOG
syntax match fermTarget /\<jump\s\+[a-zA-Z0-9_-]\+/hs=s+4

syntax keyword fermModuleName contained
    \ account addrtype ah bpf cgroup comment condition connbytes connlabel
    \ connlimit connmark conntrack cpu dccp dscp dst ecn esp eui64 fuzzy
    \ geoip hbh hl helper icmp iprange ipv4options ipv6header hashlimit ipvs
    \ length limit mac mark mh multiport nth osf owner physdev pkttype policy
    \ psd quota random realm recent rpfilter rt sctp set state statistic
    \ string tcp tcpmss time tos ttl u32 unclean

syntax keyword fermModuleType
    \ UNSPEC UNICAST LOCAL BROADCAST ANYCAST MULTICAST BLACKHOLE UNREACHABLE
    \ PROHIBIT THROW NAT XRESOLVE
    \ INVALID NEW ESTABLISHED RELATED UNTRACKED
    \ NONE EXPECTED SEEN_REPLY ASSURED CONFIRMED
    \ SYN ACK FIN RST URG PSH ALL
    \ ip icmp tcp udp ipv6 gre esp ah ipv6-icmp

" From --reject-with option
syntax keyword fermModuleType
    \ icmp-net-unreachable
    \ icmp-host-unreachable
    \ icmp-port-unreachable
    \ icmp-proto-unreachable
    \ icmp-net-prohibited
    \ icmp-host-prohibited
    \ icmp-admin-prohibited

" From --icmp-type option
syntax keyword fermModuleType
    \ any
    \ echo-reply
    \ destination-unreachable
    \    network-unreachable
    \    host-unreachable
    \    protocol-unreachable
    \    port-unreachable
    \    fragmentation-needed
    \    source-route-failed
    \    network-unknown
    \    host-unknown
    \    network-prohibited
    \    host-prohibited
    \    TOS-network-unreachable
    \    TOS-host-unreachable
    \    communication-prohibited
    \    host-precedence-violation
    \    precedence-cutoff
    \ source-quench
    \ redirect
    \    network-redirect
    \    host-redirect
    \    TOS-network-redirect
    \    TOS-host-redirect
    \ echo-request
    \ router-advertisement
    \ router-solicitation
    \ time-exceeded
    \    ttl-zero-during-transit
    \    ttl-zero-during-reassembly
    \ parameter-problem
    \    ip-header-bad
    \    required-option-missing
    \ timestamp-request
    \ timestamp-reply
    \ address-mask-request
    \ address-mask-reply

syntax keyword fermLocation
    \ domain table chain policy @subchain @gotosubchain @preserve

syntax match fermVariable "\$[_A-Za-z0-9]\+"
syntax keyword fermDefine @def
syntax keyword fermInclude @include
syntax keyword fermCond @if @else
syntax match fermHook "@hook\s\+\(pre\|post\|flush\)"
syntax keyword fermFunction
    \ @defined @eq @ne @not @resolve @cat @join @substr @length
    \ @basename @dirname @glob @ipfilter

syntax match fermUserFunction "&[_A-Za-z0-9]\+"

syntax region fermString start=+'+ skip=+\\'+ end=+'+
syntax region fermStringDQ start=+"+ skip=+\\"+ end=+"+ contains=fermVariable

syntax match fermInterfaceGroup /'[a-z][._0-9a-zA-Z-]*+'/hs=s+1,he=e-1

syntax region fermCommand start=+`+ skip=+\\'+ end=+`+

syntax match fermNumber "[./]\@<!\<[0-9]\+\>[./]\@!"
syntax match fermNumber "\<0x[0-9a-fA-F]\+\>"
syntax match fermAddr "\<[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\(/[0-9]\+\)\?\>"

syntax region fermComment start="#" end="$" contains=@Spell

"============================================================================
" Section:  Group Linking  {{{1
"============================================================================

FermHiLink  fermMatch           Conditional
FermHiLink  fermMatchSrc        fermMatch
FermHiLink  fermMatchDst        fermMatch
" FermHiLink  fermMatchModule     Keyword
FermHiLink  fermBuiltinChain    Constant
FermHiLink  fermInterface       StorageClass
FermHiLink  fermTable           SpecialKey
FermHiLink  fermTarget          Operator
FermHiLink  fermModuleName      Type
FermHiLink  fermModuleType      Constant
FermHiLink  fermLocation        Title
FermHiLink  fermVariable        Identifier
FermHiLink  fermDefine          Define
FermHiLink  fermInclude         Include
FermHiLink  fermCond            PreCondit
FermHiLink  fermHook            PreProc
FermHiLink  fermFunction        Macro
FermHiLink  fermUserFunction    Function
FermHiLink  fermString          String
FermHiLink  fermStringDQ        fermString
FermHiLink  fermInterfaceGroup  fermInterface
FermHiLink  fermCommand         PreProc
FermHiLink  fermNumber          Number
FermHiLink  fermAddr            Constant
FermHiLink  fermComment         Comment

"============================================================================
" Section:  Clean Up    {{{1
"============================================================================

delcommand FermHiLink

let b:current_syntax = 'ferm'

if main_syntax ==# 'ferm'
  unlet main_syntax
endif

" Autoconfigure vim indentation settings
" vim:ts=4:sw=4:sts=4:fdm=marker:iskeyword+=-

