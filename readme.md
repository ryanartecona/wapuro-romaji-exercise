# Wāpuro Rōmaji

https://gist.github.com/grantovich/4aa38233fb3862301cb1285e18ce57ee

This exercise is an interesting real-world text conversion problem involving
English and Japanese characters. No advance knowledge of Japanese is required!

* [Background](#background)
* [Base Requirements](#base-requirements)
* [Extra: Geminates](#extra-geminates)
* [Extra: Digraphs](#extra-digraphs)
* [Extra: Obsolete](#extra-obsolete)
* [Appendix: Conversion Table](#appendix-conversion-table)


## Background

_(this is only context; you can skip this section entirely if you want)_

The English alphabet has separate letters for consonant sounds (like `k`) and
vowel sounds (like `a`). The Japanese "alphabet" instead has characters called
**kana** that represent whole syllables (like `か`, which is pronounced "ka").
Kana come in two flavors, hiragana and katakana — in this exercise we'll only be
using **hiragana**.

To help English-speakers pronounce Japanese words without knowing kana, systems
of "romanization" were developed to express them using the English alphabet. The
result is called **rōmaji** (fun fact: the `ji` is the same one as in "emoji" —
it means "characters" or "writing"). For example, the greeting "こんにちは" can be
rendered in rōmaji as `konnichiwa`.

English-speakers interested in *writing* kana have a related problem: how do you
compose Japanese text using an English QWERTY keyboard? You can't "write rōmaji"
— it's only a pronunciation guide, so it can't be cleanly converted back into
kana. For example, the は above is actually the kana for `ha`, but is sometimes
*pronounced* `wa`, despite `wa` having its own kana. If you type `w` followed by
`a`, which character did you mean?

**Wāpuro rōmaji** solves this problem by providing a one-to-one mapping of
English letters to kana. For example, with a wāpuro rōmaji input system, if you
want は you must type an `h` followed by an `a` on a QWERTY keyboard. This lack
of ambiguity makes it easier for machines, and humans, to process.


## Base Requirements

At the bottom of this document you'll find a table of hiragana and their
corresponding wāpuro rōmaji. This can be easily copied into your project by
viewing the source of this file (the **Raw** button in the upper-right).

* Your program should accept valid strings of wāpuro rōmaji as input. A string
  is valid when it consists only of spaces and letter sequences that appear in
  the **rōmaji** column of the conversion table.

* If the input is valid, your program should output its hiragana conversion.
  Output should consist only of spaces and characters in the **hiragana** column
  of the conversion table.

* If the input is not valid, your program should output an error saying so (it
  doesn't need to explain why).

* Spaces act as word breaks in the input. Your output doesn't have to preserve
  the spaces, but they may change the conversion — see the examples below.

### Examples

Input | Output | Notes
-- | -- | --
`konnichiha` | こんいちは | `ko`+`n`+`ni`+`chi`+`ha`
`oyasuminasai` | おやすみなさい | `o`+`ya`+`su`+`mi`+`na`+`sa`+`i`
`yoroshiku ne` | よろしくね | preserving spaces is optional
`kana` | かな | `ka`+`na`, however...
`kan a` | かんあ | ...adding a space makes it `ka`+`n`+`a`
`exodia` | error | `x` is not a valid letter
`cheese` | error | `che` is not a valid syllable


## Extra: Geminates

*(extras can be done in any order)*

Some consonants in Japanese can be "held" for an extra syllable-length (like the
"k" sound in "bookkeeper"). These are called *geminate consonants*, and they are
spelled differently from their "short" counterparts.

Geminate consonants are represented in rōmaji by doubling the first letter of a
syllable, like the `pp` in the word `ippai`. To convert these to hiragana, look
up the kana for the "short" version of the syllable (`pa` in this example), then
add the special character "small tsu" (**っ**) before it.

Geminate consonants have some restrictions:

1. They cannot appear in the first syllable of a word
2. They can only appear in syllables starting with `k`, `s`, `t`, `p`, or `ch`

### Examples

Input | Output | Notes
-- | -- | --
`matte` | まって | `ma` + (small tsu) + `te`
`hippu` | ひっぷ | `hi` + (small tsu) + `pu`
`kocchi` | こっち | only the `c` is doubled for `ch`
`summo` | error | `m` is not one of the allowed consonants
`ma tte` | error | cannot be in the first syllable of a word


## Extra: Digraphs

*(extras can be done in any order)*

Our conversion table only covers the *monographs* of hiragana — syllables
represented by a single character. There is another category called *digraphs*,
which require two characters. `kya`, `ju`, and `cho` are examples of digraphs.

Digraphs are represented in rōmaji as:

1. Consonant (must have an `i` kana, cannot be `w`)
2. `y` (except when the consonant is `sh`, `ch`, or `j`)
3. Vowel (must be `a`, `u`, or `o`)

To convert these to hiragana, look up the `i` kana for the consonant (1), then
append one of the special characters "small ya" (**ゃ**), "small yu" (**ゅ**), or
"small yo" (**ょ**), according to the vowel sound (3).

### Examples

Input | Output | Notes
-- | -- | --
`kya` | きゃ | `ki` + (small ya)
`ju` | じゅ | `ji` + (small yu)
`cho` | ちょ | `chi` + (small yo)
`wya` | error | `w` is not allowed in digraphs
`nye` | error | `e` is not one of the allowed vowels
`tya` | error | although `t` exists as a consonant, it has no `i` kana
`shyo` | error | correct spelling is `sho`, since the `y` is omitted with `sh`


## Extra: Obsolete

*(extras can be done in any order)*

There are two extra syllables not present in the conversion table that are
considered *obsolete*, and rarely seen outside of old place names or family
names: `wi` (**ゐ**) and `we` (**ゑ**).

Add an **option** to your program that allows and converts `wi` and `we`. When
the option is not enabled, obsolete syllables in the input should result in an
error, consistent with the base requirements.

With this option enabled, you can convert the ancient poem
[*Iroha*](https://en.wikipedia.org/wiki/Iroha): a "perfect pangram" that uses
every monographic syllable, including `wi` and `we`, exactly once.

### Input

```
iro ha nihoheto
chirinuru wo
wa ka yo tare so
tsune naramu
uwi no okuyama
kefu koete
asaki yume mishi
wehi mo sesu
```

### Output

```
いろはにほへと
ちりぬるを
わかよたれそ
つねならむ
うゐのおくやま
けふこえて
あさきゆめみし
ゑひもせす
```


## Appendix: Conversion Table

hiragana|rōmaji
--|--
ん|n
あ|a
い|i
う|u
え|e
お|o
か|ka
き|ki
く|ku
け|ke
こ|ko
さ|sa
し|shi
す|su
せ|se
そ|so
た|ta
ち|chi
つ|tsu
て|te
と|to
な|na
に|ni
ぬ|nu
ね|ne
の|no
は|ha
ひ|hi
ふ|fu
へ|he
ほ|ho
ま|ma
み|mi
む|mu
め|me
も|mo
や|ya
ゆ|yu
よ|yo
ら|ra
り|ri
る|ru
れ|re
ろ|ro
わ|wa
ゐ|wi
ゑ|we
を|wo
が|ga
ぎ|gi
ぐ|gu
げ|ge
ご|go
ざ|za
じ|ji
ず|zu
ぜ|ze
ぞ|zo
だ|da
ぢ|di
づ|du
で|de
ど|do
ば|ba
び|bi
ぶ|bu
べ|be
ぼ|bo
ぱ|pa
ぴ|pi
ぷ|pu
ぺ|pe
ぽ|po