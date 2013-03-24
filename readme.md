# autographd #
E-mail signatures, you know ... they can be: boring, too fancy, and absolutely tiresome to make. But don't worry, autographd is a solution to that problem. Autographd allows you to easilly create a beautiful and very personal signature in a few seconds.

Currently there are not too many templates, but that's exactly why it's here... and open-source. Create a simple [Handlebars](http://handlebarsjs.com/) template, with the parameters that autographd supports. Thanks to [Node.js](http://nodejs.org/) and [Handlebars](http://handlebarsjs.com/), it was possible to create the very powerful and flexible tool.

## Install ##
1. Make sure you got Node.js and NPM installed.
2. Fork [the main autographd project](http://handlebarsjs.com/) *this is required in order to host the images used by your signature, and to store your personal templates*
3. After you've pulled your forked copy of autographd, then run `make all`, and autographd will check for dependencies and guide you through the process.
4. When you've finished step 3, autographd will have created a directory named "signatures", which is your compiled signature.
5. Yeah, this is really it!

In order to compile new templates, just use `make compile`, this will skip the questioning process and use previously given values. *(which is stored in the `my_autographed.json`)*

## Making your own template ##
Just make a handlebars template (and remember .handlebars-extension) and put it into the templates directory, and run `make compile`, and woah la!

## Paramaters ##
*This section is coming, for now just get inspiration from the `aau_signature.handlebars`-template.*