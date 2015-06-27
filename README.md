SeaSponge
=========

[![Build Status](https://travis-ci.org/mozilla/seasponge.svg)](https://travis-ci.org/mozilla/seasponge)

SeaSponge is an accessible web-based [threat modeling tool](https://en.wikipedia.org/wiki/Threat_model). Please see http://mozilla.github.io/seasponge/ for a live demo of the application. 

This project was born with three characteristics in mind:

- **Accessibility**: We want everyone to be able to map out their infrastructures and generate security reports on any operating-system and on any browser.
- **Aesthetics**: We're tired of clunky, boring interfaces - we want to bring the pizazz into threat-modeling.
- **Intuitive User-Experience**: We hate manuals, and we want you to be able to use this software without one.

This is a project currently under heavy construction, pull-requests would be appreciated. 

#### Dependencies

You will need to install the following dependencies! But to make your life easier, you can run `sudo bin/setup`

- [Node.js](http://nodejs.org/)
  - [Bower](http://bower.io/)
  - [Grunt](http://gruntjs.com/)
  - [Yeoman](http://yeoman.io/)
    - [AngularJS Generator](https://github.com/yeoman/generator-angular)
- [Ruby](https://www.ruby-lang.org/en/installation/)
  - Linux users may also need `ruby-dev`
  - [Sass](http://sass-lang.com/install)
  - [Compass](http://compass-style.org/install/) >=0.12.2

#### Running the App!

Once you have the application and dependencies installed you can start the application locally using:

> bin/server

which will run on `http://localhost:9000/`

#### Building the Docs

```bash
# Build docs to docs/
grunt docs

# Build docs and serve docs/ for web browser
grunt serve:docs
```
