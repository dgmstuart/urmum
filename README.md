# Urmum
[![Gem Version](https://badge.fury.io/rb/urmum.png)](http://badge.fury.io/rb/urmum)
[![Dependency Status](https://gemnasium.com/dgmstuart/urmum.png)](https://gemnasium.com/dgmstuart/urmum)


A gem which responds to text with insults according to the "You're a/Your mum's a" meme - 
not to be confused with the "Yo mamma" meme which is a different thing entirely.

A demo can be found at https://urmum.herokuapp.com/

## Installation

Add this line to your application's Gemfile:

    gem 'urmum'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urmum

## Usage

On the command line:

    urmum [Some text]
   
In your ruby code:

    require 'urmum'
    Insulter.new.insult_with("Your mum is a fish")
   
The gem responds to insults about itself, it's face, it's mum or it's mum's face,
but also responds to any string you care to throw at it

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
