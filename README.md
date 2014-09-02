[SeaSponge](https://github.com/mozilla/seasponge)
=========

[![Gitter chat](https://badges.gitter.im/mozilla/seasponge.png)](https://gitter.im/mozilla/seasponge)
[![Build Status](https://travis-ci.org/mozilla/seasponge.svg)](https://travis-ci.org/mozilla/seasponge)

> SeaSponge is an accessible web-based threat modelling tool developed for [Mozilla Winter of Security 2014](https://wiki.mozilla.org/Security/Automation/WinterOfSecurity2014).

-----

## About

This web-based application is being developed with three characteristics in mind:

- **Accessibility**: We want everyone to be able to map out their infastructures and generate security reports on any operating-system and on any browser.
- **Aesthetics**: We're tired of clunky, boring interfaces - we want to bring the pizazz into threat-modeling.
- **Intuitive User-Experience**: We hate manuals, and we want you to be able to use this software without one.

## Authors

- [Mathew Kallada](https://github.com/kallada)
- [Glavin Wiechert](https://github.com/Glavin001)
- [Joel Kuntz](https://github.com/Frozenfire92)
- [Sarah MacDonald](https://github.com/rainbee2214)

With Mozilla Advisor [Curtis Koenig](https://mozillians.org/en-US/u/curtisk/)
and Professor [Dr. Pawan Lingras](http://cs.stmarys.ca/~pawan/)

## Contributing

#### Coding Conventions

- Please use issue branches and submit [Pull Requests](https://help.github.com/articles/using-pull-requests) for review.  
- Your commit messages should follow [AngularJS Git Commit Message Conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit).

#### Dependencies

You may need to prefix commands with `sudo`

- [Node.js](http://nodejs.org/) 
  - [Bower](http://bower.io/) `npm install -g bower`
  - [Grunt](http://gruntjs.com/) `npm install -g grunt-cli`
  - [Yeoman](http://yeoman.io/) `npm install -g yo`
    - [AngularJS Generator](https://github.com/yeoman/generator-angular) `npm install -g generator-angular`
- [Ruby](https://www.ruby-lang.org/en/installation/)
  - Linux users may also need `ruby-dev` via `sudo apt-get install ruby-dev`
  - [Sass](http://sass-lang.com/install) `gem install sass`
  - [Compass](http://compass-style.org/install/) >=0.12.2 `gem install compass`

After forking and cloning the repository in the location of your choice run the following commands to install your [Node.js](http://nodejs.org/) and [Bower](http://bower.io/) dependencies.

```bash
npm install
bower install
```

#### Building

Once you have the application and dependencies installed you can start building the app.

```bash
grunt build # builds the application to /dist
grunt serve # previews the app on a local server
```

#### Developing

We recommend you use the [sub-generators provided](https://github.com/yeoman/generator-angular#generators)
by [generator-angular](https://github.com/yeoman/generator-angular).

## Links

- [Mozilla Wiki Page](https://wiki.mozilla.org/Security/Mentorships/MWoS/2014/online_threat_modeling_tool)
- [GitHub Project Wiki](https://github.com/mozilla/seasponge/wiki)
