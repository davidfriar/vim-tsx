"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: TSX (JavaScript)
" Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>
" Depends: leafgarland/typescript-vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif

syn include @XMLSyntax syntax/xml.vim

if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
endif

syn region embeddedTs
      \ matchgroup=NONE
      \ start=+{+
      \ end=+}+
      \ contains=@Spell,@typescriptAll,xmlEntity, embeddedTsStart, embeddedTsEnd, tsxRegion
      \ contained
      \ keepend

syn match embeddedTsStart +{+ contained
syn match embeddedTsEnd +}+ contained


" Add embeddedTs to everything where xmlString is used to allow for
" both string highlighting and @typescriptAll highlighting
syn region   xmlTag
      \ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
      \ matchgroup=xmlTag end=+>+
      \ contained
      \ contains=xmlError,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook,embeddedTs

syn region xmlProcessing
      \ matchgroup=xmlProcessingDelim
      \ start="<?"
      \ end="?>"
      \ contains=xmlAttrib,xmlEqual,xmlString,embeddedTs


if exists('g:xml_syntax_folding')
  " DTD -- we use dtd.vim here
  syn region  xmlDocType matchgroup=xmlDocTypeDecl
        \ start="<!DOCTYPE"he=s+2,rs=s+2
        \ end=">"
        \ fold
        \ contains=xmlDocTypeKeyword,xmlInlineDTD,xmlString,embeddedTs
else
  syn region  xmlDocType matchgroup=xmlDocTypeDecl
        \ start="<!DOCTYPE"he=s+2,rs=s+2
        \ end=">"
        \ contains=xmlDocTypeKeyword,xmlInlineDTD,xmlString,embeddedTs
endif


if exists('g:xml_syntax_folding')
  syn region xmlTag
        \ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
        \ matchgroup=xmlTag end=+>+
        \ contained
        \ contains=xmlError,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook,embeddedTs
else
  syn region xmlTag
        \ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
        \ matchgroup=xmlTag end=+>+
        \ contains=xmlError,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook,embeddedTs
endif


syn region tsxRegion
      \ contains=@Spell,@XMLSyntax,tsxRegion,embeddedTs
      \ start=+\%(<\|\w\)\@<!<\z([a-zA-Z][a-zA-Z0-9:\-.]*\)+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</\z1\_\s\{-}>+
      \ end=+/>+
      \ keepend
      \ extend

hi def link embeddedTs NONE

syn cluster xmlTagHook add=tsxComponent
syn match tsxComponent /[A-Z][A-Za-z0-9]*/


syn cluster xmlTagHook add=tsxIntrinsicElement
syn keyword tsxIntrinsicElement display contained a abbr address area article aside audio b base bdi
syn keyword tsxIntrinsicElement display contained bdo big blockquote body br button canvas caption cite code
syn keyword tsxIntrinsicElement display contained col colgroup data datalist dd del details dfn dialog div
syn keyword tsxIntrinsicElement display contained dl dt em embed fieldset figcaption figure footer form h1
syn keyword tsxIntrinsicElement display contained h2 h3 h4 h5 h6 head header hgroup hr html
syn keyword tsxIntrinsicElement display contained i iframe img input ins kbd keygen label legend li
syn keyword tsxIntrinsicElement display contained link main map mark menu menuitem meta meter nav noindex
syn keyword tsxIntrinsicElement display contained noscript object ol optgroup option output p param picture pre
syn keyword tsxIntrinsicElement display contained progress q rp rt ruby s samp script section select
syn keyword tsxIntrinsicElement display contained small source span strong style sub summary sup table tbody
syn keyword tsxIntrinsicElement display contained td textarea tfoot th thead time title tr track u
syn keyword tsxIntrinsicElement display contained ul video wbr webview svg animate animateTransform circle clipPath defs
syn keyword tsxIntrinsicElement display contained desc ellipse feBlend feColorMatrix feComponentTransfer feComposite
syn keyword tsxIntrinsicElement display contained feConvolveMatrix feDiffuseLighting feDisplacementMap feDistantLight
syn keyword tsxIntrinsicElement display contained feFlood feFuncA feFuncB feFuncG feFuncR feGaussianBlur feImage feMerge
syn keyword tsxIntrinsicElement display contained feMergeNode feMorphology
syn keyword tsxIntrinsicElement display contained feOffset fePointLight feSpecularLighting feSpotLight feTile feTurbulence
syn keyword tsxIntrinsicElement display contained filter foreignObject g image
syn keyword tsxIntrinsicElement display contained line linearGradient marker mask metadata path pattern polygon polyline
syn keyword tsxIntrinsicElement display contained radialGradient rect stop switch symbol text textPath tspan use view


syn cluster @typescriptAll add=tsxRegion
