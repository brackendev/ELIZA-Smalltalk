ELIZA-Smalltalk
===============

**Smalltalk ([Pharo](https://www.pharo.org/)) implementation of [ELIZA](https://en.wikipedia.org/wiki/ELIZA), an early natural language processing computer program created from 1964 to 1966 at the [MIT Artificial Intelligence Laboratory](https://www.csail.mit.edu) by [Joseph Weizenbaum](https://en.wikipedia.org/wiki/Joseph_Weizenbaum).**

This implementation is based on [this Python implementation](https://web.archive.org/web/20200424191830/https://www.smallsurething.com/implementing-the-famous-eliza-chatbot-in-python/) and [elizabot.js](http://www.masswerk.at/elizabot/) (for the welcome messages). There are similar implementations for [Go](https://github.com/kennysong/goeliza) and [Swift](https://github.com/kennysong/SwiftEliza).

* [Pharo 9.0](https://www.pharo.org/) reference platform.
* Examples and tests included.

## Installation

In a Playground, _Do it_:

```smalltalk
Metacello new 
  repository: 'github://brackendev/ELIZA-Smalltalk/src';
  baseline: 'ELIZA';
  load.
```

## Example Usage

In a Playground, _Do it_:

```smalltalk
"Start the ELIZA chat interface"
ELIZAGUI open.
```

...or _Do it_:

```smalltalk
"Retrieve an ELIZA response"
ELIZA respondTo: 'Time for small talk'.
```

## Screenshot

<img src="https://github.com/brackendev/ELIZA-Smalltalk/raw/master/screenshot.png" alt="Screenshot" width="400"/>

Note: "You" dialog taken from Joseph Weizenbaum's [ELIZA--A Computer Program For the Study of Natural Language Communication Between Man and Machine](http://www.universelle-automation.de/1966_Boston.pdf).

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Twitter](https://twitter.com/brackendev)

## License

ELIZA-Smalltalk is released under the MIT license. See the LICENSE file for more info.

- - -

## Useful Links

* [ELIZA](https://en.wikipedia.org/wiki/ELIZA)
* [ELIZA effect](https://en.wikipedia.org/wiki/ELIZA_effect)
* [Implementing the Famous ELIZA Chatbot in Python](https://www.smallsurething.com/implementing-the-famous-eliza-chatbot-in-python/)
* [The Genealogy of Eliza](http://elizagen.org/index.html)
* [elizabot.js](http://www.masswerk.at/elizabot/)
